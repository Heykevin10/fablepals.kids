<!--==============================
    Feature Area
    ==============================-->
	<style>
	/* Remove Bootstrap's default big overlay */
.carousel-control-prev,
.carousel-control-next {
    width: auto;              /* no large overlay */
    height: auto;
    background: none;
    opacity: 1;
}

/* Custom arrow buttons */
.carousel-control-prev.custom-arrow,
.carousel-control-next.custom-arrow {
    width: 45px;
    height: 45px;
    background: #fff;
    border-radius: 50%;
    top: 50%;
    transform: translateY(-50%);
    opacity: 0.9;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    z-index: 5;
}

/* Hover effect */
.carousel-control-prev.custom-arrow:hover,
.carousel-control-next.custom-arrow:hover {
    background: #e3ff04; /* change to your theme color */
    opacity: 1;
}

.carousel-control-prev .arrow-icon,
.carousel-control-next .arrow-icon {
    font-size: 20px;
    font-weight: bold;
    color: #333;
    transition: color 0.3s ease;
}

.carousel-control-prev:hover .arrow-icon,
.carousel-control-next:hover .arrow-icon {
    color: #fff;
}

/* Position them a little inside */
.carousel-control-prev {
    left: 15px;
}

.carousel-control-next {
    right: 15px;
}
/* Full section background */
#servicesCarousel {
    padding: 60px 0;  /* Top-bottom spacing */
}

/* Make cards pop on dark background */
.servicesCarousel .feature-card {
    background: #111; /* Dark grey card */
    border-radius: 12px;
    padding: 25px;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    height: 100%;
    color: #f5f5f5; /* Light text */
}

.servicesCarousel .feature-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.6);
}

/* Card icon */
.servicesCarousel .feature-card-icon img {
    width: 100%;
    height: auto;
    max-height: 200px;
    object-fit: cover;
    margin-bottom: 20px;
    filter: none !important;  /* Remove the white filter */
    border-radius: 8px;       /* Optional: rounded edges */
}

/* Card title */
.servicesCarousel .feature-card-title a {
    color: #fff;
    font-size: 20px;
    font-weight: 600;
    text-decoration: none;
    transition: color 0.3s;
}

.servicesCarousel .feature-card-title a:hover {
    color: #e3ff04; /* Theme accent */
}

/* Card text */
.servicesCarousel .feature-card-text {
    color: #bbb;
    font-size: 15px;
    margin: 15px 0 20px;
}

/* Link button */
.servicesCarousel .link-btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    color: #e3ff04;
    font-weight: 500;
    text-decoration: none;
    transition: color 0.3s;
}

.servicesCarousel .link-btn:hover {
    color: #fff;
}

/* Custom arrows */
.carousel-control-prev.custom-arrow,
.carousel-control-next.custom-arrow {
    width: 45px;
    height: 45px;
    background: rgba(255, 255, 255, 0.15); /* subtle transparent circle */
    border-radius: 50%;
    top: 50%;
    transform: translateY(-50%);
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 10;
}

.carousel-control-prev.custom-arrow:hover,
.carousel-control-next.custom-arrow:hover {
    background: #e3ff04; /* theme blue on hover */
}

.carousel-control-prev .arrow-icon,
.carousel-control-next .arrow-icon {
    font-size: 20px;
    font-weight: bold;
    color: #fff;
    transition: color 0.3s ease;
}

.carousel-control-prev:hover .arrow-icon,
.carousel-control-next:hover .arrow-icon {
    color: #000;
}

.carousel-control-prev {
    left: 20px;
}

.carousel-control-next {
    right: 20px;
}
.bg-black {
    background: #000 !important;
}
.bg-black h1, .bg-black h2, .bg-black h3{
	color: #fff;
}
	</style>
<div class="feature-area-1 space bg-black" style="padding-bottom: 0;padding-top: 6em;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-6 col-lg-8">
                <div class="title-area text-center">
                    <h2 class="sec-title">{{ __('Discover our Fabworld') }}</h2>
                </div>
            </div>
        </div>
        <div class="row gy-4 align-items-center justify-content-center">
          {{-- Desktop / Tablet Carousel (3 per slide) --}}
<div id="servicesCarouselDesktop" class="servicesCarousel carousel slide d-none d-md-block" data-bs-ride="carousel">
    <div class="carousel-inner">
        @foreach ($services->chunk(3) as $chunkIndex => $chunk)
            <div class="carousel-item {{ $chunkIndex === 0 ? 'active' : '' }}">
                <div class="row justify-content-center">
                    @foreach ($chunk as $service)
                        <div class="col-md-4 p-4">
                            <div class="feature-card"
                                @if(!empty($service?->line_color)) style="box-shadow: 0 0 21px {{ $service?->line_color }}" @endif>
                                <div class="feature-card-icon">
                                    <img src="{{ asset($service?->icon) }}" alt="{{ $service?->title }}">
                                </div>
                                <h4 class="feature-card-title">
                                    <a href="{{ route('fabworld.category', $service?->slug) }}">{{ $service?->title }}</a>
                                </h4>
                                <p class="feature-card-text">{{ $service?->short_description }}</p>
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
        @endforeach
    </div>

    <!-- Controls -->
    <button class="carousel-control-prev custom-arrow" type="button" data-bs-target="#servicesCarouselDesktop" data-bs-slide="prev">
        <span class="arrow-icon">&larr;</span>
    </button>
    <button class="carousel-control-next custom-arrow" type="button" data-bs-target="#servicesCarouselDesktop" data-bs-slide="next">
        <span class="arrow-icon">&rarr;</span>
    </button>
</div>


{{-- Mobile Carousel (1 per slide) --}}
<div id="servicesCarouselMobile" class="servicesCarousel carousel slide d-md-none" data-bs-ride="carousel">
    <div class="carousel-inner">
        @foreach ($services as $index => $service)
            <div class="carousel-item {{ $index === 0 ? 'active' : '' }}">
                <div class="row justify-content-center">
                    <div class="col-12 p-4">
                        <div class="feature-card"
                            @if(!empty($service?->line_color)) style="box-shadow: 0 0 21px {{ $service?->line_color }}" @endif>
                            <div class="feature-card-icon">
                                <img src="{{ asset($service?->icon) }}" alt="{{ $service?->title }}">
                            </div>
                            <h4 class="feature-card-title">
                                <a href="{{ route('fabworld.category', $service?->slug) }}">{{ $service?->title }}</a>
                            </h4>
                            <p class="feature-card-text">{{ $service?->short_description }}</p>
                            <a href="{{ route('fabworld.category', $service?->slug) }}" class="link-btn">
                                <span class="link-effect">
                                    <span class="effect-1">{{ $service?->btn_text ?? 'View Details' }}</span>
                                    <span class="effect-1">{{ $service?->btn_text ?? 'View Details' }}</span>
                                </span>
                                <img src="{{ asset('frontend/images/arrow-left-top.svg') }}" alt="arrow-left">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    </div>

    <!-- Controls -->
    <button class="carousel-control-prev custom-arrow" type="button" data-bs-target="#servicesCarouselMobile" data-bs-slide="prev">
        <span class="arrow-icon">&larr;</span>
    </button>
    <button class="carousel-control-next custom-arrow" type="button" data-bs-target="#servicesCarouselMobile" data-bs-slide="next">
        <span class="arrow-icon">&rarr;</span>
    </button>
</div>





        </div>
    </div>
</div>