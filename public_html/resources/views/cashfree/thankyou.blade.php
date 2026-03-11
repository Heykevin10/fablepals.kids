@extends('frontend.layouts.master')

@section('meta_title', $seo_setting['shop_page']['seo_title'])
@section('meta_description', $seo_setting['shop_page']['seo_description'])
@push('custom_meta')
    <meta property="og:title" content="{{ $seo_setting['shop_page']['seo_title'] }}" />
    <meta property="og:description" content="{{ $seo_setting['shop_page']['seo_description'] }}" />
    <meta property="og:image" content="{{ asset($setting?->shop_page_breadcrumb_image) }}" />
    <meta property="og:URL" content="{{ url()->current() }}" />
    <meta property="og:type" content="website" />
	

	<style>
    .bg-success {
        background-color: #28a745 !important;
    }
    .bg-info {
        background-color: #17a2b8 !important;
    }
    .card {
        border-radius: 10px;
        overflow: hidden;
    }
    .list-unstyled li {
        padding: 3px 0;
    }
    @media (max-width: 768px) {
        .d-flex.flex-wrap div {
            flex: 0 0 100%;
        }
    }
</style>
	
@endpush

@section('header')
    @include('frontend.layouts.header-layout.three')
@endsection

@section('contents')
    <!-- Breadcumb -->
    <x-breadcrumb :image="$setting?->shop_page_breadcrumb_image" :title="__('Success')" />

<div class="container my-5 py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8 text-center">
            <!-- Success Icon -->
            <div class="mb-4">
                <div class="d-inline-flex bg-success bg-opacity-10 p-4 rounded-circle">
                    <i class="fas fa-check-circle text-success" style="font-size: 3rem;"></i>
                </div>
            </div>

            <!-- Thank You Message -->
            <h1 class="mb-3">Thank You For Your Purchase!</h1>
            <p class="lead text-muted mb-4">Your order has been received and is being processed.</p>


            <!-- Next Steps -->
            <div class="mb-5">
                <h4 class="mb-3">What's Next?</h4>
                <div class="d-flex flex-wrap justify-content-center">
                    <div class="px-3 py-2 mb-2">
                        <i class="fas fa-envelope text-primary me-2"></i> You'll receive an order confirmation email
                    </div>
                    <div class="px-3 py-2 mb-2">
                        <i class="fas fa-truck text-primary me-2"></i> We'll notify you when items ship
                    </div>
                    
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="d-flex justify-content-center flex-wrap">
                <a href="{{route('shop')}}" class="btn btn-outline-primary mx-2 mb-2">
                    <i class="fas fa-shopping-bag me-2"></i> Continue Shopping
                </a> &nbsp; 
				<a href="{{url('user/order')}}" class="btn btn-outline-primary mx-2 mb-2">
                    <i class="fas fa-shopping-bag me-2"></i> View Order
                </a>
            </div>
			
        </div>
    </div>
</div>
    @include('frontend.partials.marquee')

@endsection

@section('footer')
    @include('frontend.layouts.footer-layout.two')
@endsection

