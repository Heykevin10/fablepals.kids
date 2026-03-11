<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Frontend\BlogController;
use App\Http\Controllers\Frontend\CartController;
use App\Http\Controllers\Frontend\ShopController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Frontend\HomePageController;
use App\Http\Controllers\CashfreeController;
use App\Http\Controllers\ShiprocketProductController;
use App\Http\Controllers\MobileOtpLoginController;
use Modules\Shop\app\Http\Controllers\ProductController;
use App\Http\Controllers\Frontend\DonationController;
use App\Http\Controllers\Admin\DonationController as AdminDonationController;



Route::get('/sign-in', [MobileOtpLoginController::class, 'loginPage'])->name('sign-in');
Route::post('/send-otp', [MobileOtpLoginController::class, 'sendOtp']);
Route::post('/verify-otp', [MobileOtpLoginController::class, 'verifyOtp']);
Route::post('/logout', function () {
    Auth::logout();
    return redirect('/sign-in');
});

Route::get('user/product/file-download/{slug}', [MobileOtpLoginController::class, 'download'])->name('user.product.file-download');

Route::post('/user/save', [MobileOtpLoginController::class, 'userSave'])->name('user.save');
Route::get('/user/info/update', [MobileOtpLoginController::class, 'userUpdate'])->name('user.info.update');
Route::get('user/buy/now/{slug}', [CashfreeController::class, 'buyNow'])->name('buy.now');
Route::get('/checkout', [CashfreeController::class, 'showCheckout'])->name('cashfree.checkout');
Route::post('/cashfree/create-order', [CashfreeController::class, 'createOrder'])->name('cashfree.createOrder');
Route::match(['get', 'post'], '/cashfree/callback', [CashfreeController::class, 'callback'])->name('cashfree.callback');
Route::match(['get', 'post'], '/success', [CashfreeController::class, 'thankyou'])->name('thankyou');

Route::post('/shiprocket/checkout', [ShiprocketProductController::class, 'create']);
Route::post('/shiprocket/webhook', [ShiprocketProductController::class, 'handle']);

Route::post('user/dashboard/digital/file', [MobileOtpLoginController::class, 'digitalFiles'])->name('user.digital.file');

Route::post('test-update-cart/{rowId}', [CartController::class, 'updateCart'])->name('cart.update.test');

Route::group(['middleware' => ['maintenance.mode', 'translation']], function () {

    Route::controller(HomePageController::class)->group(function () {
        Route::get('/', 'index')->name('home');
		Route::get('get-banners', 'homeBannerItems')->name('home.banner.items');
		Route::get('fabtv', 'videoLinks')->name('video.links');
		Route::get('playlist/{id}', 'songs')->name('songs');
		Route::get('artist/{id}', 'artistSongs')->name('artist.songs');
		Route::get('playlists', 'playlists')->name('playlists');
		Route::get('artists', 'artists')->name('artists');
		Route::get('character/{slug}', 'characterProfile')->name('character.profile');
		Route::get('characters', 'characters')->name('characters');
		Route::get('fabworlds', 'fabworlds')->name('fabworlds');
		Route::get('fabworld/category/{id}', 'fabworldList')->name('fabworld.category');
		Route::get('fabworld/{slug}', 'fabworldProfile')->name('fabworld.profile');
        Route::get('change-theme/{name}', 'changeTheme')->name('change-theme');
        Route::view('contact','frontend.pages.contact')->name('contact');
        Route::get('team', 'team')->name('team');
        Route::get('team/{slug}', 'singleTeam')->name('single.team');
        Route::post('contact/member/{slug}', 'contactTeamMember')->name('contact.team.member')->middleware('throttle:4,60');
        Route::get('about', 'about')->name('about');
        Route::get('faq', 'faq')->name('faq');
        Route::get('pricing', 'pricing')->name('pricing');
        
        Route::get('portfolios', 'portfolios')->name('portfolios');
        Route::get('portfolios/{slug}', 'singlePortfolio')->name('single.portfolio');
        Route::get('services', 'services')->name('services');
        Route::get('services/{slug}', 'singleService')->name('single.service');
        
        Route::get('privacy-policy', 'privacyPolicy')->name('privacy-policy');
        Route::get('terms-condition', 'termsCondition')->name('terms-condition');
        Route::get('page/{slug}', 'customPage')->name('custom-page');
        
        Route::get('donation', function () {return view('frontend.pages.donation');})->name('donation');
        
        Route::post('donation-submit', [DonationController::class, 'store'])->name('donation.submit');
        
        Route::get('donation-callback', [CashfreeController::class, 'donationCallback'])->name('donation.callback');
        
        Route::get('donation-success', [CashfreeController::class, 'donationThankyou'])->name('donation.thankyou');
        
        Route::get('donation-failed', [CashfreeController::class, 'donationFailed'])->name('donation.failed');
        
        Route::get('/admin/donations', [AdminDonationController::class, 'index'])->name('admin.donations.index');
    });
    Route::controller(BlogController::class)->group(function () {
        Route::get('blogs', 'index')->name('blogs');
        Route::get('blogs/{slug}', 'show')->name('single.blog');
        Route::post('blogs/{slug}', 'blogCommentStore')->name('blog.comment.store')->middleware(['auth:web', 'verified']);
    });

    Route::middleware('shop')->group(function () {
        //Route::view('shop', 'frontend.pages.shop.index')->name('shop');

        Route::controller(ShopController::class)->group(function(){
			Route::get('shop', 'shop')->name('shop');
            Route::get('fetch-products', 'fetchProducts')->name('fetch.products');
            Route::get('shop/{slug}', 'singleProduct')->name('single.product');
        });
        Route::controller(CartController::class)->group(function(){
            Route::view('cart', 'frontend.pages.shop.cart')->name('cart');
            Route::get('add-to-cart/{slug}', 'addToCart')->name('add.cart');
            Route::post('update-cart/{rowId}', 'updateCart')->name('cart.update');
            Route::get('remove-from-cart/{rowId}', 'removeFromCart')->name('remove-from.cart');
            Route::post('apply-coupon', 'apply_coupon')->name('apply-coupon');
        });
    });
});
Route::get('set-language', [DashboardController::class, 'setLanguage'])->name('set-language');
Route::get('set-currency', [DashboardController::class, 'setCurrency'])->name('set-currency');

//maintenance mode route
Route::get('maintenance-mode', function () {
    $setting = cache()->get('setting', null);
    return $setting?->maintenance_mode ? view('global.maintenance') : redirect()->route('home');
})->name('maintenance.mode');

require __DIR__ . '/auth.php';
require __DIR__ . '/user.php';
require __DIR__ . '/admin.php';

Route::fallback(function () {
    abort(404);
});