<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ShiprocketProductController;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::prefix('data')->group(function () {
    Route::get('/products', [ShiprocketProductController::class, 'products']);
    Route::get('/products/category/{id}', [ShiprocketProductController::class, 'productsByCategory']);
    Route::get('/categories', [ShiprocketProductController::class, 'categories']);
});
Route::post('/shiprocket/checkout', [ShiprocketProductController::class, 'create']);
Route::post('/shiprocket/webhook', [ShiprocketProductController::class, 'handle']);