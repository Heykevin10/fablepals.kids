<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Modules\Shop\app\Models\Product;
use DB;
use Gloudemans\Shoppingcart\Facades\Cart;

class MobileOtpLoginController extends Controller
{
    public function loginPage()
    {
        return view('frontend.pages.login.index');
    }

    // SEND OTP
    public function sendOtp(Request $request)
    {
        $request->validate([
            'mobile' => 'required|digits:10'
        ]);

        $mobile = $request->mobile;
        $otp = rand(100000, 999999);

        // Save OTP (5 minutes)
        Cache::put('otp_'.$mobile, $otp, now()->addMinutes(5));

        $response = Http::withHeaders([
            'authorization' => env('FAST2SMS_API_KEY'),
            'accept' => 'application/json',
            'content-type' => 'application/json',
        ])->post('https://www.fast2sms.com/dev/bulkV2', [
            'route' => 'otp',
            'variables_values' => $otp,
            'numbers' => $mobile,
        ]);

        if (!$response->successful()) {
            return response()->json([
                'success' => false,
                'message' => 'OTP sending failed'
            ], 500);
        }

        return response()->json([
            'success' => true,
            'message' => 'OTP sent successfully'
        ]);
    }

    // VERIFY OTP & LOGIN
    public function verifyOtp(Request $request)
	{
		$request->validate([
			'mobile' => 'required|digits:10',
			'otp'    => 'required|digits:6',
		]);

		$cacheOtp = Cache::get('otp_' . $request->mobile);

		if (!$cacheOtp) {
			return response()->json([
				'success' => false,
				'message' => 'OTP expired',
			], 422);
		}

		if ($cacheOtp != $request->otp) {
			return response()->json([
				'success' => false,
				'message' => 'Invalid OTP',
			], 422);
		}

		/* -----------------------------------------
		 | AUTO REGISTER / LOGIN
		 -----------------------------------------*/
		$user = User::firstOrCreate(
			['phone' => $request->mobile],
			[
				'name'     => 'User ' . $request->mobile,
				'phone'     => $request->mobile,
				'password' => null,
			]
		);

		Auth::login($user);
		Cache::forget('otp_' . $request->mobile);

		/* -----------------------------------------
		 | CART-BASED REDIRECT LOGIC
		 -----------------------------------------*/
		$redirectUrl = Cart::count() > 0
			? route('cashfree.checkout') // cart has items → checkout
			: url('/dashboard');         // cart empty → dashboard

		return response()->json([
			'success'  => true,
			'redirect' => $redirectUrl,
		]);
	}
	
	public function userSave(Request $request){
		$modal = User::find(userAuth()->id);
		$modal->name = $request->name;
		$success = $modal->save();
		return response()->json(['success' => $success]);
	}
	
	public function userUpdate(Request $request){
		$modal = User::find(userAuth()->id);
		$modal->name = $request->name;
		$modal->phone = $request->phone;
		$modal->email = $request->email;
		$modal->country_id = $request->country_id;
		$modal->province = $request->province;
		$modal->city = $request->city;
		$modal->zip_code = $request->zip_code;
		$modal->address = $request->address;
		$success = $modal->save();
		return response()->json(['success' => $success]);
	}
	
	public function digitalFiles(Request $request)
	{
		$files = DB::table('product_files')
			->where('product_id', $request->id)
			->get();

		$html = '';

		if ($files->isEmpty()) {
			$html = '<p class="text-muted mb-0">No digital files available.</p>';
		} else {
			$html .= '<ul class="list-group list-group-flush">';

			foreach ($files as $file) {
				$fileUrl  = asset($file->file_path);
				$fileName = basename($file->file_path);
				$icon     = $file->file_type === 'pdf'
							? 'bi-file-earmark-pdf-fill text-danger'
							: 'bi-image-fill text-primary';

				$html .= '
					<li class="list-group-item d-flex justify-content-between align-items-center">
						<div>
							<i class="bi '.$icon.' me-2"></i>
							'.$fileName.'
						</div>
						<a href="'.$fileUrl.'" download class="btn style2 py-2 px-3">
							<i class="fa fa-download"></i> Download
						</a>
					</li>
				';
			}

			$html .= '</ul>';
		}
		
		$zipFile = DB::table('products')
			->where('id', $request->id)
			->value('slug');
			
		if(!empty($zipFile)){
			$fileUrl  = route('user.product.file-download', $zipFile);
			$fileName = basename($zipFile);
			$html .= '<ul class="list-group list-group-flush">';
			$html .= '
					<li class="list-group-item d-flex justify-content-between align-items-center">
						<div>
							
							'.$fileName.'
						</div>
						<a href="'.$fileUrl.'" download class="btn style2 py-2 px-3">
							<i class="fa fa-download"></i> Download
						</a>
					</li>
				';
			$html .= '</ul>';
		}

		return response()->json([
			'html' => $html
		]);
	}
	
	public function download($slug) {
        try {
            $product = Product::whereSlug($slug)->firstOrFail();
            $response = $product->download();
            if (isset($response->type) && $response->type == "error") {
                throw new Exception($response->message);
            }
            return $response;
        } catch (Exception $e) {
            info($e->getMessage());
            return back();
        }
    }
	
}