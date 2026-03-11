@extends('frontend.layouts.master')

@section('meta_title', $seo_setting['home_page']['seo_title'])
@section('meta_description', $seo_setting['home_page']['seo_description'])

@section('header')
    @include('frontend.layouts.header-layout.two')
@endsection

@section('contents')


<style>
.hero-text{
	background: transparent !important;
}
.hero-text p, .storyline p, .storyline h1, .storyline h2 {
  color: #fff !important;
}
.hero-text .title{
	font-size: 45px;
}
.storyline {
  background: #000000 !important;
  text-align: center;
  position: relative;
  overflow: visible;
}
.feature-card {
    background: #111; /* Dark grey card */
    border-radius: 12px;
    padding: 25px;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    height: 100%;
    color: #f5f5f5; /* Light text */
}

.feature-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.6);
}

/* Card icon */
.feature-card-icon img {
    width: 100%;
    height: auto;
    max-height: 200px;
    object-fit: cover;
    margin-bottom: 20px;
    filter: none !important;  /* Remove the white filter */
    border-radius: 8px;       /* Optional: rounded edges */
}

/* Card title */
.feature-card-title a {
    color: #fff;
    font-size: 20px;
    font-weight: 600;
    text-decoration: none;
    transition: color 0.3s;
}

.feature-card-title a:hover {
    color: #e3ff04; /* Theme accent */
}

/* Card text */
.feature-card-text {
    color: #bbb;
    font-size: 15px;
    margin: 15px 0 20px;
}

/* Link button */
.link-btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    color: #e3ff04;
    font-weight: 500;
    text-decoration: none;
    transition: color 0.3s;
}

.link-btn:hover {
    color: #fff;
}

</style>
	{{-- Hero Section --}}
@php
	foreach($projects as $item){
		$banner_image = asset($item->banner);
		break;
	}
	
	if(empty($banner_image)){
		$banner_image = '';
	}
@endphp
<section class="position-relative text-white" style="min-height: 700px;">
	<div class="w-100 h-100 position-absolute top-0 start-0 z-n1"
		 style="background: url('{{$banner_image}}') no-repeat center center; background-size: cover;">
	</div>

    <div class="container py-5 h-100 d-flex align-items-center">
        <div class="row w-100 align-items-center">
            <!-- Left Content -->
            <div class="col-md-6">
                

                
            </div>

            <!-- Right-side Image -->
            <div class="col-md-6 text-end position-relative">
               

            </div>
        </div>
    </div>
</section>

<section class="bg-dark text-white py-5 storyline arsenal-section">
    <div class="container">
	<h2 class="text-uppercase text-center mb-4 storyline_title section-title">Fabworld</h2>
			<div class="row justify-content-center">
				@foreach ($projects as $service)
				
					@php
					if (!empty($service->line_color)) {
						$color_one = $service->line_color;
					}else{
						$color_one = '';
					}
					@endphp
					<div class="col-md-4 p-4">
						<div class="feature-card"
							@if(!empty($color_one)) style="box-shadow: 0 0 21px {{ $color_one }}" @endif>
							<div class="feature-card-icon">
								<a href="{{ route('fabworld.category', $service?->slug) }}" class="link-btn"><img src="{{ asset($service?->banner) }}" alt="{{ $service?->banner_heading }}"></a>
							</div>
							<h4 class="feature-card-title">
								<a href="{{ route('fabworld.category', $service?->slug) }}">{{ $service?->name }}</a>
							</h4>
							<p class="feature-card-text"></p>
							<a href="{{ route('fabworld.category', $service?->slug) }}" class="link-btn">
								<span class="link-effect">
									<span class="effect-1">{{ $service?->btn_text ?? 'View Details' }}</span>
									<span class="effect-1">{{ $service?->btn_text ?? 'View Details' }}</span>
								</span>
								<img src="{{ asset('frontend/images/arrow-left-top.svg') }}" alt="arrow-left">
							</a>
						</div>
					</div>
						
				@endforeach
			</div>

    </div>
</section>




@endsection
@section('footer')
    @include('frontend.layouts.footer-layout.two')
@endsection
