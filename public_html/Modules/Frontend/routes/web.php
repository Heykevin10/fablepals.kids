<?php

use Illuminate\Support\Facades\Route;
use Modules\Frontend\app\Http\Controllers\HeroSectionController;
use Modules\Frontend\app\Http\Controllers\AboutSectionController;
use Modules\Frontend\app\Http\Controllers\BannerSectionController;
use Modules\Frontend\app\Http\Controllers\ContactSectionController;
use Modules\Frontend\app\Http\Controllers\CounterSectionController;
use Modules\Frontend\app\Http\Controllers\ChooseUsSectionController;
use Modules\Frontend\app\Http\Controllers\TestimonialSectionController;
use Modules\Frontend\app\Http\Controllers\ServiceFeatureSectionController;

Route::group(['middleware' => 'auth:admin', 'prefix' => 'admin', 'as' => 'admin.'], function () {
    Route::get('hero-section', [HeroSectionController::class, 'index'])->name('hero-section.index');
    Route::put('hero-section', [HeroSectionController::class, 'update'])->name('hero-section.update');
    Route::get('about-section', [AboutSectionController::class, 'index'])->name('about-section.index');
    Route::put('about-section', [AboutSectionController::class, 'update'])->name('about-section.update');
    Route::get('testimonial-section', [TestimonialSectionController::class, 'index'])->name('testimonial-section.index');
    Route::put('testimonial-section', [TestimonialSectionController::class, 'update'])->name('testimonial-section.update');
    Route::get('counter-section', [CounterSectionController::class, 'index'])->name('counter-section.index');
    Route::put('counter-section', [CounterSectionController::class, 'update'])->name('counter-section.update');
    Route::get('service-features-section', [ServiceFeatureSectionController::class, 'index'])->name('service-features-section.index');
    Route::put('service-features-section', [ServiceFeatureSectionController::class, 'update'])->name('service-features-section.update');
    Route::get('choose-us-section', [ChooseUsSectionController::class, 'index'])->name('choose-us-section.index');
    Route::put('choose-us-section', [ChooseUsSectionController::class, 'update'])->name('choose-us-section.update');
    Route::get('banner-section', [BannerSectionController::class, 'index'])->name('banner-section.index');
    Route::put('banner-section', [BannerSectionController::class, 'update'])->name('banner-section.update');
    Route::get('contact-section', [ContactSectionController::class,'index'])->name('contact-section.index');
    Route::put('contact-section', [ContactSectionController::class,'update'])->name('contact-section.update');
	
	
});
Route::get('admin/home-banners/create', [HeroSectionController::class, 'form'])->name('home_banners.create');
	Route::get('admin/home-banners/edit/{id}', [HeroSectionController::class, 'form'])->name('home_banners.edit');
	Route::post('admin/home-banners/save', [HeroSectionController::class, 'bannerSave'])->name('home_banners.save');
	Route::get('admin/home-banners', [HeroSectionController::class, 'bannerList'])->name('home_banners.index');
	Route::delete('admin/home-banners/delete/{id}', [HeroSectionController::class, 'bannerDelete'])->name('home_banners.delete');
	
	Route::get('admin/hero/create', [HeroSectionController::class, 'heroForm'])->name('hero.create');
	Route::get('admin/hero/edit/{id}', [HeroSectionController::class, 'heroForm'])->name('hero.edit');
	Route::post('admin/hero/save', [HeroSectionController::class, 'heroSave'])->name('hero.save');
	Route::get('admin/hero', [HeroSectionController::class, 'heroList'])->name('hero.index');
	Route::delete('admin/hero/delete/{id}', [HeroSectionController::class, 'heroDelete'])->name('hero.delete');
	
	Route::get('admin/video/create', [HeroSectionController::class, 'videoForm'])->name('video.create');
	Route::get('admin/video/edit/{id}', [HeroSectionController::class, 'videoForm'])->name('video.edit');
	Route::post('admin/video/save', [HeroSectionController::class, 'videoSave'])->name('video.save');
	Route::get('admin/video', [HeroSectionController::class, 'videoList'])->name('video.index');
	Route::delete('admin/video/delete/{id}', [HeroSectionController::class, 'videoDelete'])->name('video.delete');


	Route::post('/admin/youtube-stats', [HeroSectionController::class, 'saveStats'])
    ->name('youtube-stats.save');

