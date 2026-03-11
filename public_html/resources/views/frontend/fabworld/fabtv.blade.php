@extends('frontend.layouts.master')

@section('meta_title', $seo_setting['home_page']['seo_title'])
@section('meta_description', $seo_setting['home_page']['seo_description'])

@section('header')
    @include('frontend.layouts.header-layout.two')
@endsection

@section('contents')




<style>
.header-layout2, .header-layout3 {
  position: relative;
  background: #000;
}
.hover-scale {
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.hover-scale:hover {
  transform: translateY(-6px) scale(1.03);
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
}

.card-body h6 {
  font-size: 0.95rem;
}

@media (max-width: 767px) {
  .card-body h6 {
    font-size: 0.9rem;
  }
}

.bg-black{
	background: #000000!important;
}


</style>

<section class="py-5 bg-black">
    <div class="container">
        <h2 class="text-center mb-5 fw-bold text-uppercase text-white">Welcome to Fabtv</h2>

        <div class="row g-4">
            <!-- Highlighted Video -->
            @if($highlightedVideo)
                <div class="row">
					<!-- Left: Video -->
					<div class="col-lg-8 col-12 mb-3">
						<div style="box-shadow: 0 0 21px #ff0033; margin-bottom: 1em;">
							<div class="position-relative shadow-lg rounded-4 overflow-hidden">
								<div class="ratio ratio-16x9">
									<iframe width="100%" height="100%"
										src="{{ $highlightedVideo->embed_link }}"
										title="{{ $highlightedVideo->title }}"
										frameborder="0"
										allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
										allowfullscreen>
									</iframe>
								</div>
								<div class="video-overlay position-absolute bottom-0 start-0 w-100 p-4 text-white"
									 style="background: linear-gradient(to top, rgba(0,0,0,0.8), transparent);">
									<h4 class="fw-bold mb-1">{{ $highlightedVideo->title }}</h4>
								</div>
							</div>
						</div>
					</div>

					<!-- Right: Stats -->
					<div class="col-lg-4 col-12 d-flex align-items-center justify-content-center">
						<div class="card text-center shadow rounded-4" style="background: transparent; color: #fff; min-width:280px;">
							<div class="card-body">
								<div class="mb-4">
									<i class="bi bi-youtube" style="font-size: 2.5rem;"></i>
									<h5 class="card-title mt-2 mb-0" style="font-weight: bold;color: #fff;">YouTube Channel</h5>
								</div>
								<div class="mb-3">
									<div class="fs-1 fw-bold">
										<i class="bi bi-person-check"></i>
										<span id="subscribersCount">{{ number_format($youtubeStats->subscribers ?? 0) }}</span>+
									</div>
									<small>Subscribers</small>
								</div>
								<div class="mb-3">
									<div class="fs-1 fw-bold mt-3">
										<i class="bi bi-eye"></i>
										<span id="viewsCount">{{ number_format($youtubeStats->views ?? 0) }}</span>+
									</div>
									<small>Views</small>
								</div>

								<!-- Red button linking to YouTube channel -->
								<a href="https://www.youtube.com/@FablePalsTV" target="_blank" class="btn btn-danger mt-3 px-4" style=" background: #FF0000!important;">
									Visit Channel
								</a>
								<div class="fabtv-btn-group">

							
								<a href="{{ route('donation') }}" class="fabtv-btn">
                                    Support FablePals
                                </a>
							</div>

						</div>
					</div>
				</div>
            @endif

            <!-- Other Videos -->
            <div class="col-12 mt-4">
                <div class="row g-4">
                    @foreach($otherVideos as $video)
                        <div class="col-md-3 col-sm-6">
                            <div class="card border-0 shadow-sm rounded-3 overflow-hidden h-100 hover-scale">
                                <div class="ratio ratio-16x9">
                                    <iframe width="100%" height="100%"
                                        src="{{ $video->embed_link }}"
                                        title="{{ $video->title }}"
                                        frameborder="0"
                                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                        allowfullscreen>
                                    </iframe>
                                </div>
                                <div class="card-body bg-white">
                                    <h6 class="fw-semibold mb-0 text-dark">{{ $video->title }}</h6>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>

<script>
function animateCount(id, targetValue, duration = 2000) {
    let element = document.getElementById(id);
    if (!element) return;

    let startValue = 0;
    let increment = targetValue / (duration / 16); // ~60fps

    let counter = setInterval(() => {
        startValue += increment;

        if (startValue >= targetValue) {
            startValue = targetValue;
            clearInterval(counter);
        }

        element.textContent = Math.floor(startValue).toLocaleString();
    }, 16);
}

document.addEventListener("DOMContentLoaded", function () {
    animateCount("subscribersCount", {{ $youtubeStats->subscribers ?? 0 }});
    animateCount("viewsCount", {{ $youtubeStats->views ?? 0 }});
});
</script>


@endsection
@section('footer')
<style>
/* ====== FABTV SECTION THEME FIX ====== */
.bg-black{
    background:#000 !important;
}

/* Right-side stats card */
.fabtv-stats-card{
    background: rgba(255,255,255,0.03) !important;
    border: 1px solid rgba(227,255,4,0.15);
    border-radius: 22px;
    padding: 26px 22px;
    box-shadow: 0 20px 60px rgba(0,0,0,0.65);
    backdrop-filter: blur(8px);
}

/* Headings white */
.fabtv-stats-card h5,
.fabtv-stats-card small,
.fabtv-stats-card .card-title{
    color:#fff !important;
}

/* Counts */
.fabtv-stats-card .fs-1{
    color:#fff !important;
    line-height: 1.05;
}

/* ====== BUTTON GROUP (SAME ROW) ====== */
.fabtv-btn-group{
    display:flex;
    gap:16px;
    margin-top:22px;
    width:100%;
    align-items:stretch;
}

/* SAME SIZE, BIGGER, #e3ff04 */
.fabtv-btn{
    flex:1;
    height:58px;                 /* increased */
    display:flex;
    align-items:center;
    justify-content:center;

    background:#e3ff04 !important;
    color:#000 !important;
    font-weight:800;
    font-size:16px;              /* increased */
    letter-spacing:.2px;

    border-radius:12px;
    text-decoration:none !important;
    border:1px solid rgba(227,255,4,0.45) !important;

    box-shadow: 0 0 0 rgba(227,255,4,0);
    transition:.25s ease;
    white-space:nowrap;
}

/* Hover glow */
.fabtv-btn:hover{
    transform:translateY(-2px);
    box-shadow:0 0 26px rgba(227,255,4,0.45);
}

/* Mobile: stack buttons */
@media (max-width: 575px){
    .fabtv-btn-group{
        flex-direction:column;
    }
}


</style>
    @include('frontend.layouts.footer-layout.two')
@endsection
