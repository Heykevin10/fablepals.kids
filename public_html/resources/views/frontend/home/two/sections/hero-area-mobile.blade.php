@php
$home_banners = DB::table('home_banners')->where('desktop', false)->get();

@endphp
<style>
#heroCarouselMobile .carousel-control-prev,
#heroCarouselMobile .carousel-control-next {
    z-index: 10;
    width: 5%; /* make clickable area wider */
}

#heroCarouselMobile .carousel-control-prev-icon,
#heroCarouselMobile .carousel-control-next-icon {
    background-size: 100% 100%;
    filter: invert(1); /* makes arrows white (works better on dark background) */
}
#heroCarouselMobile .carousel-control-prev-icon,
#heroCarouselMobile .carousel-control-next-icon {
    background-color: rgba(0,0,0,0.5);
    border-radius: 50%;
    background-size: 60% 60%;
}
/* Apply only to home banner slider */
#heroCarouselMobile .carousel-control-prev,
#heroCarouselMobile .carousel-control-next {
    width: 60px;
    height: 60px;
    top: 50%;
    transform: translateY(-50%);
    background: rgba(0, 0, 0, 0.5); /* semi-transparent background */
    border-radius: 50%;
    z-index: 10;
}

#heroCarouselMobile .carousel-control-prev:hover,
#heroCarouselMobile .carousel-control-next:hover {
    background: rgba(0, 0, 0, 0.8);
}

/* Custom arrow icons */
#heroCarouselMobile .carousel-control-prev-icon,
#heroCarouselMobile .carousel-control-next-icon {
    background-image: none; /* remove default Bootstrap arrow */
    width: 20px;
    height: 20px;
    border: solid #fff;
    border-width: 0 3px 3px 0;
    padding: 5px;
}

/* Left arrow */
#heroCarouselMobile .carousel-control-prev-icon {
    transform: rotate(135deg);
    margin-left: 4px;
}

/* Right arrow */
#heroCarouselMobile .carousel-control-next-icon {
    transform: rotate(-45deg);
    margin-right: 4px;
}
.hero-style2 .hero-title, .hero-style3 .hero-title {
  font-size: 36px;
}
.hero-2 .hero-2-thumb img, .hero-2 .hero-2-thumb {
  height: auto;
}
.hero-style2 {
    padding: 80px 0 0!important;
  }
</style>

<div id="heroCarouselMobile" class="carousel slide" data-bs-ride="carousel">
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
                                    <h1 class="hero-title wow img-custom-anim-right text-white">{{ $banner->title }}</h1>
                                    <h1 class="hero-title wow img-custom-anim-left text-white">{{ $banner->title_two }}</h1>
                                </div>
                                <div class="col-lg-10">
                                    <h1 class="hero-title wow img-custom-anim-right text-white">{{ $banner->title_three }}</h1>
                                </div>
                                <div class="col-xxl-4 col-xl-5 col-lg-6 hero-two-sub-title wow img-custom-anim-left">
                                    {!! clean(processText($banner->sub_title)) !!}
                                    @if($banner->action_button_text && $banner->action_button_url)
                                        <div class="btn-group fade_left">
                                            <a href="{{ $banner->action_button_url }}" class="btn style2 wow img-custom-anim-left mt-3">
                                                <span class="link-effect text-uppercase">
                                                    <span class="effect-1">{{ $banner->action_button_text }}</span>
                                                    <span class="effect-1">{{ $banner->action_button_text }}</span>
                                                </span>
                                            </a>
											<a href="{{ asset('public/Fablepals_India.pdf') }}" class="btn btn-black" target="_blank" style="margin-bottom: 17px;">
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
    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarouselMobile" data-bs-slide="prev">
        <span class="arrow-icon">&larr;</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#heroCarouselMobile" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
		<span class="arrow-icon">&rarr;</span>
    </button>

	
	
</div>

<style>
 #desktopViewModal .modal-dialog {
            max-width: 320px;
            margin: 1.75rem auto;
        }
        
        #desktopViewModal .modal-content {
            border-radius: 16px;
            border: none;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            overflow: hidden;
            background: #000000;
            color: white;
            padding: 0;
        }
		#desktopViewModal h5, #desktopViewModal p{
			color: #ffffff;
		}
        
        #desktopViewModal .modal-body {
            padding: 2rem 1.5rem;
            position: relative;
        }
        
        .modal-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
            display: block;
            color: rgba(255,255,255,0.9);
        }
        
        #desktopViewModal h5 {
            font-weight: 600;
            margin-bottom: 1rem;
            font-size: 1.25rem;
        }
        
        #desktopViewModal p {
            opacity: 0.9;
            margin-bottom: 1.5rem;
            font-size: 0.9rem;
            line-height: 1.5;
        }
        
        .btn-modal {
            background: white;
            color: #2575fc;
            border: none;
            border-radius: 50px;
            padding: 0.6rem 1.5rem;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        
        .btn-modal:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
        }
        
        .modal-close {
            position: absolute;
            top: 10px;
            right: 15px;
            background: rgba(255,255,255,0.2);
            border: none;
            color: white;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0.8;
            transition: all 0.2s ease;
        }
        
        .modal-close:hover {
            opacity: 1;
            background: rgba(255,255,255,0.3);
        }
        
        /* Animation */
        @keyframes modalAppear {
            0% {
                opacity: 0;
                transform: scale(0.8) translateY(20px);
            }
            100% {
                opacity: 1;
                transform: scale(1) translateY(0);
            }
        }
        
        .modal.show .modal-dialog {
            animation: modalAppear 0.3s ease-out;
        }
        
        /* Responsive adjustments */
        @media (max-width: 576px) {
            #desktopViewModal .modal-dialog {
                margin: 1rem;
            }
        }
</style>

 <div class="modal fade" id="desktopViewModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <button type="button" class="modal-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="fas fa-times"></i>
                    </button>
                    <i class="fas fa-desktop modal-icon"></i>
                    <h5 class="mb-3 text-center">Better Experience on Desktop</h5>
                    <p class="mb-4 text-center">For optimal viewing and interaction, we recommend switching to desktop view. The layout and features are designed to work best on larger screens.</p>
                    <button class="btn-modal" data-bs-dismiss="modal">
                        Got It
                    </button>
                </div>
            </div>
        </div>
    </div>

<script>
    document.addEventListener("DOMContentLoaded", function () {

        // Show modal only on mobile screen
        if (window.innerWidth < 768) {

            // Wait 3 seconds before opening the modal
            setTimeout(function () {
                var myModal = new bootstrap.Modal(document.getElementById('desktopViewModal'));
                myModal.show();

                // Auto-close after 3 seconds (you set 10 sec, adjust as needed)
                setTimeout(function () {
                    myModal.hide();
                }, 5000);

            }, 3000);
        }

    });
</script>

