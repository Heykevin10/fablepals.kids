@extends('frontend.layouts.master')

@section('meta_title', $seo_setting['shop_page']['seo_title'])
@section('meta_description', $seo_setting['shop_page']['seo_description'])
@push('custom_meta')
    <meta property="og:title" content="{{ $seo_setting['shop_page']['seo_title'] }}" />
    <meta property="og:description" content="{{ $seo_setting['shop_page']['seo_description'] }}" />
    <meta property="og:image" content="{{ asset($setting?->shop_page_breadcrumb_image) }}" />
    <meta property="og:URL" content="{{ url()->current() }}" />
    <meta property="og:type" content="website" />
@endpush

@section('header')
    @include('frontend.layouts.header-layout.two')
@endsection

@section('contents')
    <!-- Breadcumb 
    <x-breadcrumb :image="$setting?->shop_page_breadcrumb_image" :title="__('Songs')" />-->

	<style>
        :root {
            --primary-color: #6c5ce7;
            --dark-bg: #121212;
            --card-bg: #1e1e1e;
            --text-primary: #ffffff;
            --text-secondary: #b3b3b3;
        }

        body {
            background-color: var(--dark-bg);
            color: var(--text-primary);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .playlist-section {
            padding: 2rem 1rem;
        }
        
        .section-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            padding-left: 0.5rem;
        }
        
        .playlist-card {
            background-color: var(--card-bg);
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 1.5rem;
            transition: all 0.3s ease;
            border: none;
            height: 100%;
            position: relative;
            overflow: hidden;
        }
        
        .playlist-card:hover {
            background-color: var(--card-hover);
            transform: translateY(-5px);
            cursor: pointer;
        }
        
        .playlist-image {
            width: 100%;
            aspect-ratio: 1;
            border-radius: 4px;
            margin-bottom: 1rem;
            object-fit: cover;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        }
        
        .playlist-title {
            font-size: 1.1rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            line-height: 1.3;
        }
        
        .playlist-subtitle {
            font-size: 0.85rem;
            color: var(--text-secondary);
            margin-bottom: 0;
        }
        
        .tidal-logo {
            color: var(--tidal-cyan);
            font-weight: 700;
        }
        
        .play-button {
            position: absolute;
            bottom: 5rem;
            right: 1.5rem;
            background-color: var(--tidal-cyan);
            border-radius: 50%;
            width: 45px;
            height: 45px;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transform: translateY(10px);
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
        }
        
        .play-button i {
            color: #000;
            font-size: 1.2rem;
            margin-left: 3px;
        }
        
        .playlist-card:hover .play-button {
            opacity: 1;
            transform: translateY(0);
        }
        
        @media (max-width: 768px) {
            .section-title {
                font-size: 1.7rem;
            }
            
            .playlist-title {
                font-size: 1rem;
            }
        }
    </style>
	
    <!-- Main Area -->
    <section class="shop__area space top-baseline">
        <div class="container mt-4">
			<div class="row">
				<div class="col-md-6">
					<h2 class="section-title mt-5 text-white">Our Playlists</h2>
				</div>
				<div class="col-md-6 text-end">
                <a href="{{route('donation')}}"class="btn style2 wow img-custom-anim-left mt-4">Support Fablepals</a>					
                <a href="{{route('artists')}}" class="btn style2 wow img-custom-anim-left mt-4">All Songs</a>
				</div>
			</div>
            
            <div class="row">
                @foreach($playlists as $item)
                <div class="col-md-6 col-lg-3 mb-3">
                    <div class="playlist-card">
						<a href="{{route('songs', $item->slug)}}">
							<img src="{{$item->file}}" alt="POP HITS" class="playlist-image">
						</a>
                        <div class="playlist-title">{{$item->name}}</div>
                        <div class="playlist-subtitle">
                            <!--<span class="tidal-logo">TIDAL</span>--> • {{!empty($item->count)?$item->count:'0'}} TRACKS
                        </div>
                        <div class="play-button">
                            <i class="fas fa-play"></i>
                        </div>
                    </div>
                </div>
				@endforeach
            </div>
        </div>
    </section>


    <!--  Marquee Area -->
    @include('frontend.partials.marquee')

@endsection

@section('footer')
    @include('frontend.layouts.footer-layout.two')
@endsection

@push('js')

	
@endpush
