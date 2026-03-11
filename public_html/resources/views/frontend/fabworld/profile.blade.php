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
.weapon_image{
	height: 100px!important;
	animation: rotate 4s linear infinite;
}
@keyframes rotate {
        from {
            transform: rotate(0deg);
        }
        to {
            transform: rotate(360deg);
        }
    }
.storyline{
	background: #000000!important;
	text-align: center;
	position: relative;
    overflow: visible;
}
.flying-superhero {
	position: absolute;
	top: 0;
	right: 0;
	max-height: 150px; /* Mini version */
	transform: translateX(0);
	transition: transform 0.1s ease-out;
	z-index: 1;
}
h1, h2, h3{
	font-size: 45px!important;
}
.storyline h1, .storyline h2, .storyline h3{
	color: #ffffff;
}
.hero-text {
  background: transparent !important;
  margin-top: 9em;
}
@media only screen and (max-width: 768px){
	.mob-hide{display: none!important}
}
 
.arsenal-section {
    background-color: #000;
    padding: 4rem 0;
    color: #fff;
}

.arsenal-section .section-title {
    color: #fff;
    margin-bottom: 2rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1px;
    position: relative;
    padding-bottom: 1rem;
}

.arsenal-section .section-title::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 3px;
    background: linear-gradient(90deg, {{$color_one}}, {{$color_two}});
}

.nav-tabs {
    border-bottom: 0;
    margin-bottom: 2.5rem;
}

.nav-tabs .nav-link {
    background-color: transparent;
    border: 2px solid rgba(255, 255, 255, 0.1);
    border-radius: 30px;
    color: rgba(255, 255, 255, 0.7);
    font-weight: 600;
    padding: 0.75rem 2rem;
    margin: 0 0.5rem;
    transition: all 0.4s ease;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    position: relative;
    overflow: hidden;
}

.nav-tabs .nav-link::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, {{$color_four}}, transparent);
    transition: all 0.6s ease;
}

.nav-tabs .nav-link:hover {
    color: #fff;
    border-color: {{$color_three}};
}

.nav-tabs .nav-link:hover::before {
    left: 100%;
}

.nav-tabs .nav-link.active {
    background-color: rgba(0, 123, 255, 0.1);
    color: #fff;
    border-color: {{$color_one}};
    box-shadow: 0 0 15px {{$color_three}};
}

.tab-content {
    background-color: rgba(30, 30, 30, 0.7);
    border-radius: 10px;
    padding: 2rem;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    position: relative;
}

.carousel-item {
    padding: 1rem;
}

.arsenal-card {
    display: flex;
    flex-direction: column;
    height: 100%;
}

.arsenal-card .row {
    align-items: center;
}

.arsenal-card h3 {
    color: #fff;
    font-weight: 700;
    margin-bottom: 1.5rem;
    position: relative;
    padding-bottom: 0.5rem;
}

.arsenal-card h3::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 50px;
    height: 2px;
    background: linear-gradient(90deg, {{$color_one}}, {{$color_two}});
}

.arsenal-card p {
    color: rgba(255, 255, 255, 0.8);
    line-height: 1.8;
    margin-bottom: 1.5rem;
}

.color-border{
	/*border: 1px solid {{$color_one}};*/
	box-shadow: 0 0 21px {{$color_one}};
}

.arsenal-card img {
	float: right;
    border-radius: 8px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    transition: transform 0.3s ease;
    max-height: 350px;
    object-fit: contain;
}

.arsenal-card img:hover {
    transform: scale(1.02);
}

/* Updated carousel controls */
.carousel-control-prev,
.carousel-control-next {
    width: 40px;
    height: 40px;
    background-color: rgba(0, 123, 255, 0.7);
    border-radius: 50%;
    top: 50%;
    transform: translateY(-50%);
    opacity: 0.8;
    z-index: 10;
}

.carousel-control-prev {
    left: -20px;
}

.carousel-control-next {
    right: -20px;
}

.carousel-control-prev-icon,
.carousel-control-next-icon {
    background-size: 60%;
    width: 100%;
    height: 100%;
}

.carousel-control-prev:hover,
.carousel-control-next:hover {
    opacity: 1;
}

/* Carousel indicators */
.carousel-indicators {
    position: static;
    margin: 1.5rem 0 0;
    justify-content: center;
}

.carousel-indicators [data-bs-target] {
    width: 10px;
    height: 10px;
    border-radius: 50%;
    background-color: rgba(255, 255, 255, 0.3);
    border: none;
    margin: 0 5px;
    transition: all 0.3s ease;
}

.carousel-indicators .active {
    background-color: {{$color_one}};
    transform: scale(1.3);
}

@media (max-width: 768px) {
    .arsenal-card .row {
        flex-direction: column-reverse;
    }
    
    .arsenal-card .col-md-6 {
        margin-bottom: 1.5rem;
    }
    
    .nav-tabs .nav-link {
        padding: 0.5rem 1rem;
        margin: 0.25rem;
        font-size: 0.9rem;
    }
    
    .carousel-control-prev {
        left: 0;
    }
    
    .carousel-control-next {
        right: 0;
    }
}
.carousel-control-next, .carousel-control-prev{
	background: transparent;
  border: 0;
}



/* Gallery overlay styles */
    .gallery-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.9);
        z-index: 9999;
        display: none;
        align-items: center;
        justify-content: center;
        opacity: 0;
        transition: opacity 0.3s ease;
    }
    
    .gallery-overlay.active {
        display: flex;
        opacity: 1;
    }
    
    .gallery-container {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
    }
    
    .gallery-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px;
        color: white;
    }
    
    .gallery-close {
        background: none;
        border: none;
        color: white;
        font-size: 30px;
        cursor: pointer;
        padding: 5px 15px;
    }
    
    .gallery-content {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
    }
    
    .gallery-image {
        max-width: 90%;
        max-height: 80vh;
        object-fit: contain;
    }
    
    .gallery-nav {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        background: rgba(0, 0, 0, 0.5);
        color: white;
        border: none;
        border-radius: 50%;
        width: 50px;
        height: 50px;
        font-size: 20px;
        cursor: pointer;
        transition: background 0.3s;
    }
    
    .gallery-nav:hover {
        background: rgba(0, 0, 0, 0.8);
    }
    
    .prev-image {
        left: 20px;
    }
    
    .next-image {
        right: 20px;
    }
    
    .gallery-footer {
        padding: 15px;
        text-align: center;
        color: white;
    }
    
    #galleryCounter {
        font-size: 16px;
    }
    @media (max-width: 767px){

  /* ✅ Hero main title (banner_heading) */
  .hero-text .title{
    font-size: 28px !important;
    line-height: 1.15 !important;
  }

  /* ✅ Hero heading above title (project->title) */
  .hero-text .text-uppercase{
    font-size: 12px !important;
    letter-spacing: 0.5px !important;
  }

  /* ✅ Hero paragraph/subheading */
  .hero-text p{
    font-size: 14px !important;
    line-height: 1.55 !important;
  }

  /* ✅ Section headings: Storyline / Explore World / Gallery / Products */
  .storyline h2,
  .arsenal-section .section-title,
  section.storyline h2{
    font-size: 20px !important;
    line-height: 1.2 !important;
  }

  /* ✅ Fix: aglobal h1,h2,h3 (45px) override in mobile */
  h1, h2, h3{
    font-size: 22px !important;
    line-height: 1.25 !important;
  }

  /* ✅ Arsenal slider title (form->title) */
  .arsenal-card h3{
    font-size: 18px !important;
    margin-bottom: 10px !important;
  }

  /* ✅ Arsenal description (form->description) + storyline content */
  .arsenal-card p,
  .storyline p,
  .content p{
    font-size: 14px !important;
    line-height: 1.6 !important;
  }

  /* ✅ Tab content padding */
  .tab-content{
    padding: 16px !important;
  }

  /* ✅ Hero box spacing */
  .hero-text{
    margin-top: 3.5em !important;
    padding: 14px !important;
  }
}
</style>
	{{-- Hero Section --}}

<section class="position-relative text-white" style="min-height: 700px;">
    @if ($project->banner)
        <div class="w-100 h-100 position-absolute top-0 start-0 z-n1"
             style="background: url('{{ asset($project->banner) }}') no-repeat center center; background-size: cover;">
        </div>
    @endif

    <div class="container py-5 h-100 d-flex align-items-center">
        <div class="row w-100 align-items-center">
            <!-- Left Content -->
            <div class="col-md-6">
                

                <div class="bg-dark bg-opacity-75 p-3 rounded hero-text" style="backdrop-filter: blur(5px);">
					<div class="text-uppercase fw-bold text-white">{{ $project->title }}</div>
					<p class="display-4 fw-bold text-white title">{{ $project->banner_heading }}</p>
					<p class="mb-1">{{ $project->banner_sub_heading }}</p>
					
                </div>
            </div>

            <!-- Right-side Image -->
            <div class="col-md-6 text-end position-relative">
               

            </div>
        </div>
    </div>
</section>

<section class="bg-dark text-white py-5 storyline arsenal-section">
    <div class="container">
        <h2 class="text-uppercase mb-4 storyline_title section-title">Storyline</h2>
        <div class="content">
            {!! $project->description !!}
        </div>
    </div>
</section>

@if(count($mystical_forms) || count($gadgets))
<section class="arsenal-section">
    <div class="container">
        <h2 class="text-center section-title">Explore World</h2>

        

        <!-- Tab panes -->
        <div class="tab-content color-border" id="arsenalTabsContent">
            @if(count($mystical_forms))
            <div class="tab-pane fade show active" id="mystical" role="tabpanel" aria-labelledby="mystical-tab">
                <div id="mysticalFormsCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        @foreach($mystical_forms as $index => $form)
                            <div class="carousel-item {{ $index === 0 ? 'active' : '' }}">
                                <div class="arsenal-card">
                                    <div class="row">
                                        <div class="col-md-5 ps-4">
                                            <h3>{{ $form->title }}</h3>
                                            <p>{{ $form->description }}</p>
                                        </div>
                                        <div class="col-md-7 text-end">
                                            @if($form->image)
                                                <img src="{{ asset($form->image) }}" class="d-block" alt="{{ $form->title }}">
                                            @else
                                                <div class="no-image-placeholder bg-dark d-flex align-items-center justify-content-center" style="height: 300px; border-radius: 8px;">
                                                    <p class="text-muted">No image available</p>
                                                </div>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                    @if(count($mystical_forms) > 1)
                    <button class="carousel-control-prev" type="button" data-bs-target="#mysticalFormsCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#mysticalFormsCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                    <div class="carousel-indicators">
                        @foreach($mystical_forms as $index => $form)
                            <button type="button" data-bs-target="#mysticalFormsCarousel" data-bs-slide-to="{{ $index }}" class="{{ $index === 0 ? 'active' : '' }}" aria-label="Slide {{ $index + 1 }}"></button>
                        @endforeach
                    </div>
                    @endif
                </div>
            </div>
            @endif

        </div>
    </div>
</section>
@endif

@if(count($project_gallery))
<section class="py-5 storyline">
    <div class="container">
        <h2 class="mb-4 text-center">Gallery</h2>
        <div class="row">
            @foreach ($project_gallery as $index => $gallery)
                <div class="col-6 col-md-4 col-lg-3 mb-3">
                    <a href="#" class="gallery-thumbnail" data-index="{{ $index }}">
                        <img src="{{ asset($gallery->image) }}" class="img-fluid rounded shadow-sm" alt="Gallery Image">
                    </a>
                </div>
            @endforeach
        </div>
    </div>
</section>

<!-- Full-screen gallery overlay -->
<div id="galleryOverlay" class="gallery-overlay">
    <div class="gallery-container">
        <div class="gallery-header">
            <span id="galleryCounter"></span>
            <button class="gallery-close">&times;</button>
        </div>
        <div class="gallery-content">
            <button class="gallery-nav prev-image">&larr;</button>
            <img src="" class="gallery-image" alt="Full Gallery Image">
            <button class="gallery-nav next-image">&rarr;</button>
        </div>
        <div class="gallery-footer">
            <p id="galleryCaption"></p>
        </div>
    </div>
</div>
@endif

@if(count($products))
<section class="py-5 storyline bg-dark text-light">
    <div class="container">
        <h2 class="mb-4 text-center text-light">Products</h2>
        <div class="row">
            @foreach ($products as $product)
                <div class="col-md-3">
                    <div class="card bg-dark text-light border-0 shadow-sm mb-3">
                        <a href="{{url('shop/'.$product->slug)}}">
                            <img src="{{ asset($product->image) }}" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <h6 class="card-title">
                                <a href="{{url('shop/'.$product->slug)}}" class="text-white">
                                    {{$product->title}}
                                </a>
                            </h6>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
@endif


<script>
document.addEventListener('DOMContentLoaded', function () {
        const galleryOverlay = document.getElementById('galleryOverlay');
        const galleryThumbnails = document.querySelectorAll('.gallery-thumbnail');
        const galleryImage = document.querySelector('.gallery-image');
        const galleryCounter = document.getElementById('galleryCounter');
        const galleryCaption = document.getElementById('galleryCaption');
        const closeButton = document.querySelector('.gallery-close');
        const prevButton = document.querySelector('.prev-image');
        const nextButton = document.querySelector('.next-image');
        
        let currentIndex = 0;
        let images = @json($project_gallery->map(function($item) {
            return [
                'src' => asset($item->image),
                'caption' => $item->caption ?? ''
            ];
        }));
        
        // Open gallery
        galleryThumbnails.forEach(thumbnail => {
            thumbnail.addEventListener('click', function(e) {
                e.preventDefault();
                currentIndex = parseInt(this.getAttribute('data-index'));
                openGallery();
            });
        });
        
        // Close gallery
        closeButton.addEventListener('click', closeGallery);
        
        // Click on overlay to close
        galleryOverlay.addEventListener('click', function(e) {
            if (e.target === this) {
                closeGallery();
            }
        });
        
        // Keyboard navigation
        document.addEventListener('keydown', function(e) {
            if (!galleryOverlay.classList.contains('active')) return;
            
            if (e.key === 'Escape') {
                closeGallery();
            } else if (e.key === 'ArrowLeft') {
                navigate(-1);
            } else if (e.key === 'ArrowRight') {
                navigate(1);
            }
        });
        
        // Navigation buttons
        prevButton.addEventListener('click', function(e) {
            e.stopPropagation();
            navigate(-1);
        });
        
        nextButton.addEventListener('click', function(e) {
            e.stopPropagation();
            navigate(1);
        });
        
        function openGallery() {
            updateGallery();
            galleryOverlay.classList.add('active');
            document.body.style.overflow = 'hidden'; // Prevent scrolling
        }
        
        function closeGallery() {
            galleryOverlay.classList.remove('active');
            document.body.style.overflow = ''; // Re-enable scrolling
        }
        
        function navigate(direction) {
            currentIndex = (currentIndex + direction + images.length) % images.length;
            updateGallery();
        }
        
        function updateGallery() {
            galleryImage.src = images[currentIndex].src;
            galleryCounter.textContent = `${currentIndex + 1} / ${images.length}`;
            galleryCaption.textContent = images[currentIndex].caption;
        }
    });
</script>
<script>
    window.addEventListener('scroll', function() {
        const superhero = document.querySelector('.flying-superhero');
        if (superhero) {
            const scrollPosition = window.scrollY;
            const maxScroll = 200; // Adjust this value to control the movement range
            const moveDistance = Math.min(scrollPosition / 10, maxScroll); // Smooth movement
            superhero.style.transform = `translateX(-${moveDistance}px)`;
        }
    });

    // Reset position when scrolling back to top
    window.addEventListener('scroll', function() {
        const superhero = document.querySelector('.flying-superhero');
        if (superhero && window.scrollY === 0) {
            superhero.style.transform = 'translateX(0)';
        }
    });
</script>
@endsection
@section('footer')
    @include('frontend.layouts.footer-layout.two')
@endsection
