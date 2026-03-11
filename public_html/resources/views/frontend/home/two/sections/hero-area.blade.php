@php
$home_banners = DB::table('home_banners')->where('desktop', true)->get();

@endphp
<style>
#heroCarousel .carousel-control-prev,
#heroCarousel .carousel-control-next {
    z-index: 10;
    width: 5%; /* make clickable area wider */
}

#heroCarousel .carousel-control-prev-icon,
#heroCarousel .carousel-control-next-icon {
    background-size: 100% 100%;
    filter: invert(1); /* makes arrows white (works better on dark background) */
}
#heroCarousel .carousel-control-prev-icon,
#heroCarousel .carousel-control-next-icon {
    background-color: rgba(0,0,0,0.5);
    border-radius: 50%;
    background-size: 60% 60%;
}
/* Apply only to home banner slider */
#heroCarousel .carousel-control-prev,
#heroCarousel .carousel-control-next {
    width: 60px;
    height: 60px;
    top: 50%;
    transform: translateY(-50%);
    background: rgba(0, 0, 0, 0.5); /* semi-transparent background */
    border-radius: 50%;
    z-index: 10;
}

#heroCarousel .carousel-control-prev:hover,
#heroCarousel .carousel-control-next:hover {
    background: rgba(0, 0, 0, 0.8);
}

/* Custom arrow icons */
#heroCarousel .carousel-control-prev-icon,
#heroCarousel .carousel-control-next-icon {
    background-image: none; /* remove default Bootstrap arrow */
    width: 20px;
    height: 20px;
    border: solid #fff;
    border-width: 0 3px 3px 0;
    padding: 5px;
}

/* Left arrow */
#heroCarousel .carousel-control-prev-icon {
    transform: rotate(135deg);
    margin-left: 4px;
}

/* Right arrow */
#heroCarousel .carousel-control-next-icon {
    transform: rotate(-45deg);
    margin-right: 4px;
}
.hero-style2 .hero-title, .hero-style3 .hero-title {
  font-size: 92px;
}
.hero-2 .hero-2-thumb img, .hero-2 .hero-2-thumb {
  height: auto;
}
</style>

<div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">

        @foreach($home_banners as $index => $banner)
            <div class="carousel-item {{ $index === 0 ? 'active' : '' }}">
                <div class="hero-wrapper hero-2" id="hero">
                    <div class="hero-2-thumb wow img-custom-anim-right" data-wow-duration="1.5s" data-wow-delay="0.2s">
                        <img src="{{ asset('uploads/home_banners/'.$banner->image) }}" alt="img">
                    </div>
                    <div class="container">
                        <div class="hero-style2">
                            <div class="row">
                                <div class="col-lg-9">
                                    <h1 class="hero-title wow img-custom-anim-right text-white" style="font-size: 92px;">{{ $banner->title }}</h1>
                                    <h1 class="hero-title wow img-custom-anim-left text-white" style="font-size: 92px;">{{ $banner->title_two }}</h1>
                                </div>
                                <div class="col-lg-10">
                                    <h1 class="hero-title wow img-custom-anim-right text-white" style="font-size: 92px;">{{ $banner->title_three }}</h1>
                                </div>
                                <div class="col-xxl-6 col-xl-6 col-lg-6 hero-two-sub-title wow img-custom-anim-left">
                                    {!! clean(processText($banner->sub_title)) !!}
                                    @if($banner->action_button_text && $banner->action_button_url)
                                        <div class="btn-group fade_left">
                                            <a href="{{ $banner->action_button_url }}" class="btn style2 wow img-custom-anim-left mt-3">
                                                <span class="link-effect text-uppercase">
                                                    <span class="effect-1">{{ $banner->action_button_text }}</span>
                                                    <span class="effect-1">{{ $banner->action_button_text }}</span>
                                                </span>
                                            </a>
											<a href="{{ asset('public/Fablepals_India.pdf') }}" class="btn btn-black" target="_blank" style="margin-top: 1.2em;">
                                                <span class="link-effect text-uppercase">
                                                    <span class="effect-1">Guide</span>
                                                    <span class="effect-1">Guide</span>
                                                </span>
                                            </a>
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="row justify-content-end">
                                <div class="col-xxl-6 col-xl-7 col-lg-9">
                                    <div class="wow img-custom-anim-right">
                                        <div class="hero-contact-wrap">
                                            {{ $contactSection?->address }}
                                        </div>
                                        <div class="hero-contact-wrap">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach

    </div>

    <!-- Carousel controls -->
    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
        <span class="arrow-icon">&larr;</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
		<span class="arrow-icon">&rarr;</span>
    </button>

	
	
</div>
