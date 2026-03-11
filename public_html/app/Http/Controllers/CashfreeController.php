<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Gloudemans\Shoppingcart\Facades\Cart;
use App\Models\User;
use Modules\Shop\app\Models\Product;

class CashfreeController extends Controller
{
    public function showCheckout(Request $request)
	{
		if (!userAuth()) {
			return redirect()->route('sign-in');
		}
		$rawSubtotal = Cart::subtotal(); // USD (string)

		$amount = $this->usdToInr($rawSubtotal); // ✅ INR float

		$currency = 'INR';
		$user = User::where('id', userAuth()->id)->first();
		$show_name_modal = str_starts_with($user->name, 'User ');
		
		$orderId = DB::table('orders')->where('user_id', userAuth()->id)->orderBy('id', 'desc')->value('id');
		$address = DB::table('order_addresses')->where('order_id', $orderId)->orderBy('id', 'desc')->first();

		return view('cashfree.checkout', compact('amount', 'currency', 'show_name_modal', 'user', 'address'));
	}
	
	public function buyNow(Request $request, $slug)
	{
		$qty = (int) $request->query('qty', 1);

		$product = Product::whereSlug($slug)
			->active()
			->withCount(['reviews as average_rating' => function ($query) {
				$query->select(DB::raw('coalesce(avg(rating), 0) as average_rating'))
					  ->where('status', 1);
			}])
			->firstOrFail();

		// ?? DIGITAL PRODUCT CHECK
		if ($product->type == Product::DIGITAL_TYPE) {
			if (checkPurchased($product->id)) {
				return redirect()->back()->with('error', __('Already purchased'));
			}
		}

		// ?? PHYSICAL PRODUCT STOCK CHECK
		if ($product->type == Product::PHYSICAL_TYPE && $this->stockCheck($product, $qty)) {
			return redirect()->back()->with('error', __('Product stock out'));
		}

		/* =========================
		 | CHECK IF ALREADY IN CART
		 ========================= */

		$existingItem = Cart::content()->where('id', $product->id)->first();

		if ($existingItem) {
			// ? Product already in cart ? go directly to checkout
			return redirect()->route('cashfree.checkout');
		}

		/* =========================
		 | BUY NOW FLOW
		 ========================= */

		// ?? Clear cart
		Cart::destroy();

		// ?? Price
		$price = $product->sale_price ?? $product->price;

		// ?? Options (same as addToCart)
		$options = [
			'image'          => $product->image,
			'slug'           => $product->slug,
			'type'           => $product->type,
			'regular_price'  => $product->price,
			'sale_price'     => $product->sale_price,
			'average_rating' => $product->average_rating,
		];

		// ?? Add to cart
		Cart::add(
			$product->id,
			$product->title,
			$qty,
			$price,
			0,
			$options
		);

		// ?? Checkout
		return redirect()->route('cashfree.checkout');
	}

	
	private function stockCheck(Product $product, $quantity): bool {
        $cartContents = Cart::content();
        foreach ($cartContents as $cartContent) {
            if ($cartContent?->id == $product?->id && ($cartContent?->qty + $quantity) > $product->qty) {
                return true;
            }
        }
        if ($product?->qty == 0 || $quantity > $product->qty) {
            return true;
        }
        return false;
    }
         // ✅ 🔥 add new function donation 🔥 ✅
    public function createDonationOrder(\App\Models\Donation $donation)
    {
        $orderId = 'DON_' . time() . '_' . $donation->id;

        // Save order id
        $donation->update(['order_id' => $orderId]);

        /* CASHFREE CONFIG (SAME AS createOrder) */
        $appId  = config('services.cashfree.app_id');
        $secret = config('services.cashfree.secret');
        $env    = config('services.cashfree.env', 'production');
        $baseUrl = $env === 'production' 
            ? 'https://api.cashfree.com/pg/orders'
            : 'https://sandbox.cashfree.com/pg/orders';

        $payload = [
            "order_id" => $orderId,
            "order_amount" => (float) $donation->amount,
            "order_currency" => "INR",
            "customer_details" => [
                "customer_id" => "DONOR_" . $donation->id,
                "customer_name" => $donation->name ?? 'Anonymous',
                "customer_phone" => $donation->mobile,
                "customer_email" => $donation->email ?? 'donor@fablepals.com',
            ],
            "order_meta" => [
                "return_url" => route('donation.callback') . "?order_id={order_id}",
            ],
            "cart_details" => [
                "cart_items" => [[
                    "item_id" => "DON_" . $donation->id,
                    "item_name" => "Donation",
                    "item_original_unit_price" => (float) $donation->amount,
                    "item_discounted_unit_price" => (float) $donation->amount,
                    "item_quantity" => 1,
                    "item_currency" => "INR"
                ]]
            ],

        ];

        $response = Http::withHeaders([
            'x-client-id' => $appId,
            'x-client-secret' => $secret,
            'x-api-version' => '2023-08-01',
        ])->post($baseUrl, $payload);

        if (!$response->successful()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Donation payment failed',
                'data' => $response->json(),
            ], 422);
        }

        $cfData = $response->json();

        return response()->json([
            'status' => 'ok',
            'order_id' => $cfData['order_id'],
            'payment_session' => $cfData['payment_session_id']
        ]);
    }
    
    // Donation success callback add//
    public function donationCallback(Request $request)
{
    $orderId = $request->query('order_id');

    $appId  = config('services.cashfree.app_id');
    $secret = config('services.cashfree.secret');
    $env    = config('services.cashfree.env', 'production');

    $baseUrl = $env === 'production'
        ? 'https://api.cashfree.com/pg/orders/'
        : 'https://sandbox.cashfree.com/pg/orders/';

    $response = Http::withHeaders([
        'x-client-id'     => $appId,
        'x-client-secret' => $secret,
        'x-api-version'   => '2023-08-01',
    ])->get($baseUrl . $orderId);

    if (!$response->successful()) {
        return redirect()->route('donation.failed', ['order_id' => $orderId]);
    }

    $data = $response->json();
    $paymentStatus = $data['order_status'] ?? 'FAILED';
    $payments = $data['payments'] ?? [];
    $cfPaymentId = $payments[0]['payment_id'] ?? null;

    $donation = \App\Models\Donation::where('order_id', $orderId)->first();

    if ($donation) {
        $donation->update([
            'payment_status' => ($paymentStatus === 'PAID') ? 'success' : 'failed',
            'payment_id' => $cfPaymentId,
        ]);
    }

    if ($paymentStatus === 'PAID') {
        return redirect()->route('donation.thankyou', ['order_id' => $orderId]);
    }

    return redirect()->route('donation.failed', ['order_id' => $orderId]);
}
public function donationThankyou(Request $request)
{
    $orderId = $request->query('order_id');
    $donation = \App\Models\Donation::where('order_id', $orderId)->firstOrFail();

    return view('frontend.pages.donation_thankyou', compact('donation'));
}

public function donationFailed(Request $request)
{
    $orderId = $request->query('order_id');
    $donation = \App\Models\Donation::where('order_id', $orderId)->first();

    return view('frontend.pages.donation_failed', compact('donation'));
}


       // ✅ 🔥 end🔥 ✅

	
	public function usdToInr($amount)
	{
		// Use your existing currency helper
		$converted = currency($amount);

		// Remove ₹, commas etc.
		return (float) preg_replace('/[^\d\.]/', '', $converted);
	}

    public function createOrder(Request $request)
	{
		/* -------------------------------------------------
		 | 1. VALIDATION
		 -------------------------------------------------*/
		$request->validate([
			'first_name'  => 'required|string|max:150',
			'last_name'  => 'required|string|max:150',
			'customer_email' => 'required|email|max:150',
			'customer_phone' => 'required|string|max:15',

			'address_line1'  => 'required|string|max:255',
			'address_line2'  => 'nullable|string|max:255',
			'city'           => 'required|string|max:100',
			'state'          => 'required|string|max:100',
			'pincode'        => 'required|string|max:10',
		]);
		
		$rawSubtotalUsd = (float) Cart::subtotal();
		$grandTotalInr  = $this->usdToInr($rawSubtotalUsd);

		if (Cart::count() === 0) {
			return response()->json([
				'status' => 'error',
				'message' => 'Cart is empty'
			], 422);
		}

		/* -------------------------------------------------
		 | 2. CASHFREE CONFIG
		 -------------------------------------------------*/
		$appId  = config('services.cashfree.app_id');
		$secret = config('services.cashfree.secret');
		$env    = config('services.cashfree.env', 'production');

		$baseUrl = $env === 'production'
			? 'https://api.cashfree.com/pg/orders'
			: 'https://sandbox.cashfree.com/pg/orders';

		$cashfreeOrderId = 'ORD_' . now()->timestamp;

		$customerId = Auth::check()
			? 'USER_' . Auth::id()
			: 'GUEST_' . md5($request->customer_phone);

		/* -------------------------------------------------
		 | 3. CART ITEMS (FOR CASHFREE)
		 -------------------------------------------------*/
		$cartItems = [];
		foreach (Cart::content() as $item) {

			$unitPriceInr = $this->usdToInr($item->price);

			$cartItems[] = [
				'item_id'                    => (string) $item->id,
				'item_name'                  => $item->name,
				'item_original_unit_price'   => $this->usdToInr($item->options->regular_price ?? $item->price),
				'item_discounted_unit_price' => $unitPriceInr,
				'item_quantity'              => (int) $item->qty,
				'item_currency'              => 'INR',
			];
		}

		/* -------------------------------------------------
		 | 4. CASHFREE PAYLOAD
		 -------------------------------------------------*/
		$payload = [
			'order_id'       => $cashfreeOrderId,
			'order_amount'   => $grandTotalInr,
			'order_currency' => 'INR',

			'customer_details' => [
				'customer_id'    => $customerId,
				'customer_name'  => $request->first_name.' '.$request->last_name,
				'customer_email' => $request->customer_email,
				'customer_phone' => $request->customer_phone,
			],

			'order_meta' => [
				'return_url' => route('cashfree.callback') . '?order_id={order_id}',
			],

			'cart_details' => [
				'cart_items' => $cartItems,
			],
		];

		/* -------------------------------------------------
		 | 5. CREATE CASHFREE ORDER
		 -------------------------------------------------*/
		$response = Http::withHeaders([
			'x-client-id'     => $appId,
			'x-client-secret' => $secret,
			'x-api-version'   => '2023-08-01',
		])->post($baseUrl, $payload);

		if (!$response->successful()) {
			return response()->json([
				'status'  => 'error',
				'message' => 'Unable to create Cashfree order',
				'data'    => $response->json(),
			], 422);
		}

		$cfData = $response->json();

		/* -------------------------------------------------
		 | 6. SAVE ORDER / PRODUCTS / ADDRESS
		 -------------------------------------------------*/
		DB::beginTransaction();

		try {

			

			/* -------- orders table -------- */
			$orderId = DB::table('orders')->insertGetId([
				'user_id'          => Auth::id(),
				'order_id'         => $cfData['order_id'], // Cashfree order id

				'product_qty'      => Cart::count(),

				'sub_total_usd'    => $rawSubtotalUsd,
				'amount_usd'       => $rawSubtotalUsd,

				'sub_total'        => $grandTotalInr,
				'paid_amount'      => $grandTotalInr,

				'payable_currency' => 'INR',
				'payment_method'   => 'cashfree',
				'payment_status'   => 'pending',
				'order_status'     => 'draft',

				'payment_details'  => json_encode($cfData),

				'created_at'       => now(),
				'updated_at'       => now(),
			]);

			/* -------- order_products table -------- */
			foreach (Cart::content() as $item) {

				$unitInr  = $this->usdToInr($item->price);
				$totalInr = $unitInr * $item->qty;

				DB::table('order_products')->insert([
					'order_id'       => $orderId,
					'product_id'     => $item->id,
					'product_name'   => $item->name,

					'unit_price_usd' => (float) $item->price,
					'total_usd'      => (float) ($item->price * $item->qty),

					'unit_price'     => $unitInr,
					'total'          => $totalInr,
					'qty'            => $item->qty,

					'created_at'     => now(),
					'updated_at'     => now(),
				]);
			}

			/* -------- order_addresses table -------- */
			DB::table('order_addresses')->insert([
				'order_id'            => $orderId,

				'billing_first_name'  => $request->first_name,
				'billing_last_name'   => $request->last_name,
				'billing_email'       => $request->customer_email,
				'billing_phone'       => $request->customer_phone,
				'billing_address'     => $request->address_line1,
				'billing_country'     => 'India',
				'billing_state'       => $request->state,
				'billing_city'        => $request->city,
				'billing_zip_code'    => $request->pincode,

				'shipping_first_name' => $request->first_name,
				'shipping_last_name'  => $request->last_name,
				'shipping_email'      => $request->customer_email,
				'shipping_phone'      => $request->customer_phone,
				'shipping_address'    => $request->address_line1,
				'shipping_country'    => 'India',
				'shipping_state'      => $request->state,
				'shipping_city'       => $request->city,
				'shipping_zip_code'   => $request->pincode,

				'created_at'          => now(),
				'updated_at'          => now(),
			]);

			DB::commit();

		} catch (\Exception $e) {
			DB::rollBack();

			return response()->json([
				'status'  => 'error',
				'message' => 'Order saving failed',
				'error'   => $e->getMessage()
			], 500);
		}

		/* -------------------------------------------------
		 | 7. RESPONSE
		 -------------------------------------------------*/
		return response()->json([
			'status'          => 'ok',
			'order_id'        => $cfData['order_id'],
			'payment_session' => $cfData['payment_session_id'],
		]);
	}


    public function callback(Request $request)
    {
        $orderId = $request->query('order_id');

        $appId  = config('services.cashfree.app_id');
        $secret = config('services.cashfree.secret');
        $env    = config('services.cashfree.env', 'production');

        $baseUrl = $env === 'production'
            ? 'https://api.cashfree.com/pg/orders/'
            : 'https://sandbox.cashfree.com/pg/orders/';

		$response = Http::withHeaders([
			'x-client-id'     => $appId,
			'x-client-secret' => $secret,
			'x-api-version'   => '2023-08-01',
		])
		->get($baseUrl . $orderId);

        if (!$response->successful()) {
            DB::table('payment_orders')
                ->where('cashfree_order_id', $orderId)
                ->update([
                    'status'          => 'FAILED',
                    'cf_order_status' => 'FAILED',
                    'updated_at'      => now(),
                ]);

            return redirect()->route('cashfree.checkout')->with('error', 'Payment verification failed.');
        }

        $data          = $response->json();
        $paymentStatus = $data['order_status'] ?? 'FAILED';
        $payments      = $data['payments'] ?? [];
        $cfPaymentId   = $payments[0]['payment_id'] ?? null;

        $localStatus = $paymentStatus === 'PAID' ? 'PAID' : 'FAILED';

        DB::table('payment_orders')
            ->where('cashfree_order_id', $orderId)
            ->update([
                'status'          => $localStatus,
                'cf_order_status' => $paymentStatus,
                'cf_payment_id'   => $cfPaymentId,
                'updated_at'      => now(),
            ]);

        if ($localStatus === 'PAID') {

			// ✅ Update orders table
			DB::table('orders')
				->where('order_id', $orderId)
				->update([
					'payment_status' => 'success',
					'order_status'   => 'success',
					'updated_at'     => now(),
				]);

			// (Optional but recommended)
			Cart::destroy();

			return redirect()->route('thankyou')->with('success', 'Payment successful!');
		}

        return redirect()->route('cashfree.checkout')->with('error', 'Payment failed or cancelled.');
    }
	
	public function thankyou(Request $request)
	{
		return view('cashfree.thankyou');
	}
}
