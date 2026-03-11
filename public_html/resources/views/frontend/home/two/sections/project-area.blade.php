<style>
.bg-black {
    background: #000 !important;
}
.bg-black h1, .bg-black h2, .bg-black h3{
	color: #fff;
}
	</style>
<div class="mb-3">
<!--portfolio-area-1 space overflow-hidden bg-black-->
    <div class="container">
        
    </div>
    <div class="container-fluid p-0">
        <div class="row global-carousel gx-60 portfolio-slider" data-slide-show="1" data-center-mode="true"
            data-xl-center-mode="true" data-ml-center-mode="true" data-lg-center-mode="true"
            data-center-padding="600px" data-xl-center-padding="400px" data-ml-center-padding="400px"
            data-lg-center-padding="300px" data-dots="true" data-xl-dots="true" data-ml-dots="true">
            @foreach ($projects as $index => $project)
            <div class="col-lg-4">
                <a href="{{ route('single.portfolio', $project?->slug) }}" class="portfolio-wrap style2">
                    <div class="portfolio-thumb">
                        <img src="{{ asset($project?->image) }}" alt="{{ $project?->title }}">
                    </div>
                    <div class="portfolio-details">
                        <ul class="portfolio-meta">
                            <li>{{ $project?->project_category }}</li>
                        </ul>
                        <h3 class="portfolio-title">{{ $project?->title }}</h3>
                    </div>
                </a>
            </div>
            @endforeach
        </div>
    </div>
</div>