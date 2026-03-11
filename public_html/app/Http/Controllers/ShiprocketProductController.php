<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Modules\Shop\app\Models\Product;
use Modules\Shop\app\Models\ProductCategory;
use App\Services\ShiprocketService;
use App\Models\PaymentOrder;

class ShiprocketProductController extends Controller
{
	public function create(Request $request)
    {
        $request->validate([
            'customer_name'  => 'required',
            'customer_phone' => 'required',
            'customer_email' => 'required|email',
            'items'          => 'required|array'
        ]);

        // Calculate amount securely on backend
        $amount = collect($request->items)->sum(function ($item) {
            return $item['price'] * $item['qty'];
        });

        $orderId = 'ORD_' . time();

        // Save order locally
        PaymentOrder::create([
            'order_id' => $orderId,
            'amount'   => $amount,
            'payload'  => json_encode($request->all())
        ]);

        $token = ShiprocketService::getToken();

        // 🔥 CREATE OCC ORDER
        $response = Http::withToken($token)
            ->post(config('shiprocket.base_url') . '/v1/external/checkout/create', [
                'order_id'     => $orderId,
                'order_amount' => $amount,
                'customer'     => [
                    'name'  => $request->customer_name,
                    'phone' => $request->customer_phone,
                    'email' => $request->customer_email
                ]
            ]);

        if (!$response->successful()) {
            return response()->json([
                'error' => 'Shiprocket OCC not enabled or API error',
                'details' => $response->json()
            ], 400);
        }

        return response()->json([
            'checkout_url' => $response->json('checkout_url')
        ]);
    }
	
	public function handle(Request $request)
    {
        $orderId = $request->order_id ?? null;
        $status  = $request->status ?? null;

        if (!$orderId || !$status) {
            return response()->json(['error' => 'Invalid webhook'], 400);
        }

        PaymentOrder::where('order_id', $orderId)->update([
            'status' => $status
        ]);

        return response()->json(['success' => true]);
    }
	
    /**
     * Fetch all products
     */
    public function products()
    {
        $products = Product::select('products.*','product_category_translations.title as category_name', 'product_translations.title as name', 'product_translations.short_description', 'product_translations.description')
        ->join('product_category_translations', 'product_category_translations.product_category_id', '=', 'products.product_category_id')
        ->join('product_translations', 'product_translations.product_id', '=', 'products.id')
        ->where('product_translations.lang_code', 'en')
        ->where('product_category_translations.lang_code', 'en')
        ->where('products.status', 1)
        ->get();

        return response()->json([
            'success' => true,
            'data' => $products->map(fn($product) => $this->formatProduct($product))
        ]);
    }

    /**
     * Fetch products by category
     */
    public function productsByCategory($id)
    {
		
		$products = Product::select('products.*','product_category_translations.title as category_name', 'product_translations.title as name', 'product_translations.short_description', 'product_translations.description')
        ->join('product_category_translations', 'product_category_translations.product_category_id', '=', 'products.product_category_id')
        ->join('product_translations', 'product_translations.product_id', '=', 'products.id')
        ->where('product_translations.lang_code', 'en')
		->where('product_category_translations.lang_code', 'en')
		->where('products.product_category_id', $id)
        ->where('products.status', 1)
        ->get();

        return response()->json([
            'success' => true,
            'data' => $products->map(fn($product) => $this->formatProduct($product))
        ]);
    }

    /**
     * Fetch all categories
     */
    public function categories()
    {
        $categories = ProductCategory::select('product_categories.*', 'product_category_translations.title as name')
		->join('product_category_translations', 'product_category_translations.product_category_id', '=', 'product_categories.id')
		->where('product_category_translations.lang_code', 'en')
		->where('product_categories.status', 1)
		->get();

        return response()->json([
            'success' => true,
            'data' => $categories->map(fn($category) => [
                'id' => $category->id,
                'name' => $category->name,
                'slug' => $category->slug,
            ])
        ]);
    }

    /**
     * Product format expected by Shiprocket
     */
    private function formatProduct($product)
    {
        return [
            'id' => $product->id,
            'name' => $product->name,
            'sku' => $product->sku,
            'price' => (float) $product->price,
            'sale_price' => (float) $product->sale_price ?? (float) $product->price,
            'short_description' => $product->short_description,
            'description' => strip_tags($product->description),
            'category' => $product->category_name ?? null,
            'image' => asset($product->image),
            //'stock' => $product->stock,
            //'weight' => $product->weight ?? 0.5,
        ];
    }
}