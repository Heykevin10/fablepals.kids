<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Modules\Shop\app\Models\Product;
use Modules\Shop\app\Models\ProductCategory;

class ShiprocketProductController extends Controller
{
    /**
     * Fetch all products
     */
    public function products()
    {
        $products = Product::select('products.*','product_category_translations.title as category_name', 'product_translations.title as name', 'product_translations.short_description', 'product_translations.description')
        ->join('product_category_translations', 'product_category_translations.id', '=', 'products.product_category_id')
        ->where('product_translations.lang_code', 'en')
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
        $products = Product::with('category')
            ->where('product_category_id', $id)
            ->where('status', 1)
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
            'category' => $product->category->name ?? null,
            'image' => asset($product->image),
            //'stock' => $product->stock,
            //'weight' => $product->weight ?? 0.5,
        ];
    }
}