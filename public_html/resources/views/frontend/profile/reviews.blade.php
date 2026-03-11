@extends('frontend.layouts.master')

@section('meta_title', __('Your Review') . ' || ' . $setting->app_name)

@section('header')
    @include('frontend.layouts.header-layout.three')
@endsection

@section('contents')
    <!-- Breadcumb Area -->
    <x-breadcrumb :title="__('Your Review')" />

    <!--  Dashboard Area -->
    <section class="wsus__dashboard_profile wsus__dashboard">
        <div class="container">
            <div class="row">
                <!--  Sidebar Area -->
                @include('frontend.profile.partials.sidebar')
                <!--  Main Content Area -->
                <div class="col-lg-8 col-xl-9 ">
                    <div class="wsus__dashboard_main_contant ">
                        <h4>{{ __('Your Review') }}</h4>
                        <div class="wsus__dashboard_review">
                            <div class="row">
                                @forelse ($reviews as $key => $review)
                                    <div class="col-xl-12 wow fadeInUp">
                                        <div class="wsus__blog_single_comment wsus__product_review">
                                            <div class="img">
                                                <img src="{{ asset($review?->user?->image) }}" alt="{{ $review?->name }}"
                                                    class="img-fluid w-100">
                                            </div>
                                            <div class="text">
                                                <h5>{{ $review?->name }}
                                                    <span class="review_icon">
                                                        @for ($i = 0; $i < 5; $i++)
                                                            <i
                                                                class="{{ $i < $review?->rating ? 'fas fa-star' : 'far fa-star' }}"></i>
                                                        @endfor
                                                    </span>
                                                </h5>
                                                <span class="date"> {{ formattedDate($review?->created_at) }}</span>
                                                <p>{{ $review?->review }}</p>
                                            </div>
                                        </div>
                                    </div>
                                @empty
                                    <tr>
                                        <x-data-not-found />
                                    </tr>
                                @endforelse
                            </div>
                        </div>

                        @if ($reviews->hasPages())
                            {{ $reviews->onEachSide(0)->links('frontend.pagination.custom') }}
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--  Marquee Area -->
    @include('frontend.partials.marquee')
@endsection
@section('footer')

@push('css')
<style>

/* ===== DARK BACKGROUND ===== */
.wsus__dashboard_profile{
    background: radial-gradient(circle at 20% 30%, #001a2e, #000814 50%, #000 100%) !important;
    position: relative;
    overflow: hidden;
}
.wsus__dashboard_profile::before{
    content:"";
    position:absolute;
    width:600px;height:600px;
    background: radial-gradient(circle, rgba(0,255,255,0.15), transparent 70%);
    top:-200px;left:-200px;
    animation: floatGlow 8s infinite alternate ease-in-out;
    pointer-events:none;
}
@keyframes floatGlow{
    0%{transform:translate(0,0)}
    100%{transform:translate(100px,100px)}
}

/* ===== MAIN CARD STYLE ===== */
.wsus__dashboard_main_contant{
    background: linear-gradient(145deg,#111,#181818) !important;
    border-radius: 25px !important;
    padding: 40px !important;
    color:#fff !important;
    box-shadow: 0 30px 70px rgba(0,0,0,0.7) !important;
    position: relative;
    overflow:hidden;
}
.wsus__dashboard_main_contant::before{
    content:"";
    position:absolute;
    top:-100%;left:-50%;
    width:200%;height:200%;
    background: linear-gradient(
        120deg,
        transparent 40%,
        rgba(0,255,255,0.1) 50%,
        transparent 60%
    );
    transform: rotate(25deg);
    animation: shineMove 6s infinite;
    pointer-events:none;
}
@keyframes shineMove{
    0%{top:-100%}
    100%{top:100%}
}

/* ===== REVIEW CARD ===== */
.wsus__product_review{
    background: rgba(255,255,255,0.05) !important;
    border-radius: 18px !important;
    padding: 25px !important;
    border:1px solid rgba(255,255,255,0.08) !important;
    transition:.3s;
}
.wsus__product_review:hover{
    background: rgba(0,245,255,0.08) !important;
    transform: translateY(-4px);
}

/* Avatar */
.wsus__product_review .img img{
    border-radius:50% !important;
    width:70px !important;
    height:70px !important;
    object-fit:cover;
    box-shadow:0 0 15px rgba(0,255,255,.4);
}

/* Name */
.wsus__product_review h5{
    color:#fff !important;
    font-weight:700;
}

/* Stars */
.review_icon i{
    color:#00f5ff !important;
    text-shadow:0 0 8px #00f5ff;
}

/* Date */
.wsus__product_review .date{
    font-size:13px;
    color:#aaa !important;
}
.wsus__dashboard_main_contant h4{
  font-weight:800 !important;
  background: linear-gradient(45deg,#00f5ff,#ff00ff) !important;
  -webkit-background-clip:text !important;
  -webkit-text-fill-color:transparent !important;
}


/* Review text */
.wsus__product_review p{
    color:#ddd !important;
    margin-top:8px;
}

/* Pagination center */
.pagination{
    justify-content:center !important;
}

</style>
@endpush

    @include('frontend.layouts.footer-layout.two')
@endsection
