@extends('frontend.layouts.master')

@section('meta_title', $seo_setting['home_page']['seo_title'])
@section('meta_description', $seo_setting['home_page']['seo_description'])

@section('header')
    @include('frontend.layouts.header-layout.two')
@endsection

<style>
@media only screen and (max-width: 767px){
	.nav-header {
	  top: 0!important;
	}
	 .header-layout1 .sticky-wrapper, .header-layout2 .sticky-wrapper, .header-layout3 .sticky-wrapper {
		padding-top: 0!important;
	  }
}
</style>

@section('contents')
    @if ($sectionSetting?->hero_section)
		<div class="d-none d-lg-block">
			@include('frontend.home.two.sections.hero-area') {{-- desktop slider --}}
		</div>

		<div class="d-block d-lg-none">
			@include('frontend.home.two.sections.hero-area-mobile') {{-- mobile slider --}}
		</div>
	@endif
    @if ($sectionSetting?->marquee_section)
        <!-- marquee-area -->
        @include('frontend.partials.marquee')
        <!-- marquee-area-end -->
    @endif
    @if ($sectionSetting?->service_section)
        <!-- service-area -->
        @include('frontend.home.two.sections.service-area')
        <!-- service-area-end -->
    @endif
    @if ($sectionSetting?->service_feature_section)
        <!-- service feature-area -->
        @include('frontend.home.two.sections.service-feature-area')
        <!-- service feature-area-end -->
    @endif
    @if ($sectionSetting?->project_section)
        <!-- project-area -->
        @include('frontend.home.two.sections.project-area')
        <!-- project-area-end -->
    @endif
    @if ($sectionSetting?->award_section)
        <!-- award-area -->
        @include('frontend.home.two.sections.award-area')
        <!-- award-area-end -->
    @endif
    @if ($sectionSetting?->banner_section)
        <!-- banner-area -->
        @include('frontend.home.two.sections.banner-area')
        <!-- banner-area-end -->
    @endif
    @if ($sectionSetting?->latest_blog_section)
        <!-- blog-area -->
        @include('frontend.home.two.sections.blog-area')
        <!-- blog-area-end -->
    @endif
    @if ($sectionSetting?->brands_section)
        <!-- brand-area -->
        @include('frontend.home.two.sections.brand-area')
        <!-- brand-area-end -->
    @endif
    @if ($sectionSetting?->call_to_action_section)
        <!-- cta-area -->
        @include('frontend.home.two.sections.cta-area')
        <!-- cta-area-end -->
    @endif
@endsection
@section('footer')
    @include('frontend.layouts.footer-layout.two')
@endsection
