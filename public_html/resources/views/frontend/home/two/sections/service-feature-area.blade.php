@php
$skillsSections  = DB::table('skills_sections')->get();
@endphp
<style>
/* Apply only to skills slider */
#skillsCarousel .carousel-control-prev,
#skillsCarousel .carousel-control-next {
    width: 60px;
    height: 60px;
    top: 50%;
    transform: translateY(-50%);
    background: rgba(0, 0, 0, 0.5);
    border-radius: 50%;
    z-index: 10;
}

#skillsCarousel .carousel-control-prev:hover,
#skillsCarousel .carousel-control-next:hover {
    background: rgba(0, 0, 0, 0.8);
}

/* Custom arrow icons */
#skillsCarousel .carousel-control-prev-icon,
#skillsCarousel .carousel-control-next-icon {
    background-image: none; /* remove Bootstrap default arrow */
    width: 20px;
    height: 20px;
    border: solid #fff;
    border-width: 0 3px 3px 0;
    padding: 5px;
}

/* Left arrow */
#skillsCarousel .carousel-control-prev-icon {
    transform: rotate(135deg);
    margin-left: 4px;
}

/* Right arrow */
#skillsCarousel .carousel-control-next-icon {
    transform: rotate(-45deg);
    margin-right: 4px;
}
.skill-feature .progress .progress-bar{
	background: #ffffff;
}

</style>
<div id="skillsCarousel" class="carousel slide service-area-1 space bg-black" data-bs-ride="carousel" style="margin-top: 0;">
<div class="row justify-content-center">
            <div class="col-xl-6 col-lg-8">
                <div class="title-area text-center">
                    <h2 class="sec-title text-white">{{ __('Discover Our Heroes') }}</h2>
                </div>
            </div>
        </div>
    <div class="carousel-inner">

        @foreach($skillsSections as $index => $section)
            <div class="carousel-item {{ $index === 0 ? 'active' : '' }}">
                <div class="container">
                    <div class="row align-items-center">
                        <!-- Left Image Column -->
                        <div class="col-lg-6">
                            @if($section->image)
                                    <img src="{{ asset('uploads/skills_sections/'.$section->image) }}" alt="img" class="img-fluid w-100" style="max-height: 520px;width: auto !important;">
                                @endif
                        </div>

                        <!-- Right Content Column -->
                        <div class="col-lg-6">
                            <div class="about-content-wrap">
                                <div class="title-area mb-0">
                                    <h2 class="sec-title text-white">{{ $section->title }}</h2>
                                    <div class="sec-text mt-35 mb-40 text-white">
                                        {!! clean(processText($section->sub_title)) !!}
                                    </div>

                                    @if($section->skill_title_one)
                                        <div class="skill-feature">
                                            <h3 class="skill-feature_title text-white">{{ $section->skill_title_one }}</h3>
                                            <div class="progress">
                                                <div class="progress-bar" style="width: {{ $section->skill_percentage_one }}%;"></div>
                                                <div class="progress-value"><span class="counter-number text-white">{{ $section->skill_percentage_one }}</span>%</div>
                                            </div>
                                        </div>
                                    @endif

                                    @if($section->skill_title_two)
                                        <div class="skill-feature">
                                            <h3 class="skill-feature_title text-white">{{ $section->skill_title_two }}</h3>
                                            <div class="progress">
                                                <div class="progress-bar" style="width: {{ $section->skill_percentage_two }}%;"></div>
                                                <div class="progress-value"><span class="counter-number text-white">{{ $section->skill_percentage_two }}</span>%</div>
                                            </div>
                                        </div>
                                    @endif

                                    @if($section->skill_title_three)
                                        <div class="skill-feature">
                                            <h3 class="skill-feature_title text-white">{{ $section->skill_title_three }}</h3>
                                            <div class="progress">
                                                <div class="progress-bar" style="width: {{ $section->skill_percentage_three }}%;"></div>
                                                <div class="progress-value"><span class="counter-number text-white">{{ $section->skill_percentage_three }}</span>%</div>
                                            </div>
                                        </div>
                                    @endif

                                    @if($section->skill_title_four)
                                        <div class="skill-feature">
                                            <h3 class="skill-feature_title text-white">{{ $section->skill_title_four }}</h3>
                                            <div class="progress">
                                                <div class="progress-bar" style="width: {{ $section->skill_percentage_four }}%;"></div>
                                                <div class="progress-value"><span class="counter-number text-white">{{ $section->skill_percentage_four }}</span>%</div>
                                            </div>
                                        </div>
                                    @endif

                                </div>
                            </div>
                        </div>
                    </div>
					<div class="text-center">
						<a href="{{ $section->link }}" class="btn btn-dark wow img-custom-anim-left mt-3" style="visibility: visible; animation-name: img-anim-left;background:#e3ff04; color: #000000;">
							<span class="link-effect text-uppercase">
								<span class="effect-1">View More</span>
								<span class="effect-1">View More</span>
							</span>
						</a>
					</div>
                </div>
            </div>
        @endforeach

    </div>

    <!-- Controls -->
    <button class="carousel-control-prev" type="button" data-bs-target="#skillsCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#skillsCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

{{--<div class="service-area-1 space bg-theme">
    <div class="service-img-1-1 shape-mockup wow img-custom-anim-left" data-wow-duration="1.5s" data-wow-delay="0.2s"
        data-left="0" data-top="-100px" data-bottom="140px">
        <img src="{{ asset($servicefeatureSection?->global_content?->image) }}" alt="img">
    </div>
    <div class="container">
        <div class="row align-items-center justify-content-end">
            <div class="col-lg-6">
                <div class="about-content-wrap">
                    <div class="title-area mb-0">
                        <h2 class="sec-title">{{$servicefeatureSection?->content?->title}}</h2>
                        <div class="sec-text mt-35 mb-40">
                            {!! clean(processText($servicefeatureSection?->content?->sub_title)) !!}
                        </div>
                        <div class="skill-feature">
                            <h3 class="skill-feature_title">{{$servicefeatureSection?->content?->skill_title_one}}</h3>
                            <div class="progress">
                                <div class="progress-bar" style="width: {{$servicefeatureSection?->global_content?->skill_percentage_one}}%;">
                                </div>
                                <div class="progress-value"><span class="counter-number">{{$servicefeatureSection?->global_content?->skill_percentage_one}}</span>%</div>
                            </div>
                        </div>
                        <div class="skill-feature">
                            <h3 class="skill-feature_title">{{$servicefeatureSection?->content?->skill_title_two}}</h3>
                            <div class="progress">
                                <div class="progress-bar" style="width: {{$servicefeatureSection?->global_content?->skill_percentage_two}}%;">
                                </div>
                                <div class="progress-value"><span class="counter-number">{{$servicefeatureSection?->global_content?->skill_percentage_two}}</span>%</div>
                            </div>
                        </div>
                        <div class="skill-feature">
                            <h3 class="skill-feature_title">{{$servicefeatureSection?->content?->skill_title_three}}</h3>
                            <div class="progress">
                                <div class="progress-bar" style="width: {{$servicefeatureSection?->global_content?->skill_percentage_three}}%;">
                                </div>
                                <div class="progress-value"><span class="counter-number">{{$servicefeatureSection?->global_content?->skill_percentage_three}}</span>%</div>
                            </div>
                        </div>
                        <div class="skill-feature">
                            <h3 class="skill-feature_title">{{$servicefeatureSection?->content?->skill_title_four}}</h3>
                            <div class="progress">
                                <div class="progress-bar" style="width: {{$servicefeatureSection?->global_content?->skill_percentage_four}}%;">
                                </div>
                                <div class="progress-value"><span class="counter-number">{{$servicefeatureSection?->global_content?->skill_percentage_four}}</span>%</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>--}}