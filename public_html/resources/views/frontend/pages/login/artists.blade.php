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
        
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            padding: 0 0.5rem;
        }
        
        .section-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0;
        }
        
        .view-all {
            color: var(--text-secondary);
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 500;
            transition: color 0.2s ease;
        }
        
        .view-all:hover {
            color: var(--text-primary);
        }
        
        .artist-card {
            background-color: var(--card-bg);
            border-radius: 8px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            transition: all 0.3s ease;
            border: none;
            display: flex;
            align-items: center;
            text-decoration: none;
            color: inherit;
        }
        
        .artist-card:hover {
            background-color: var(--card-hover);
            transform: translateY(-3px);
            cursor: pointer;
        }
        
        .artist-avatar {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 1.5rem;
            border: 2px solid var(--border-color);
        }
        
        .artist-info {
            flex: 1;
        }
        
        .artist-name {
            font-size: 1.2rem;
            font-weight: 700;
            margin-bottom: 0.3rem;
        }
        
        .artist-genre {
            font-size: 0.9rem;
            color: var(--text-secondary);
            margin-bottom: 0.5rem;
        }
        
        .artist-stats {
            display: flex;
            gap: 1rem;
        }
        
        .stat {
            display: flex;
            align-items: center;
            font-size: 0.85rem;
            color: var(--text-secondary);
        }
        
        .stat i {
            margin-right: 0.4rem;
            font-size: 0.8rem;
        }
        
        .follow-btn {
            background-color: transparent;
            border: 1px solid var(--text-secondary);
            color: var(--text-primary);
            border-radius: 20px;
            padding: 0.4rem 1.2rem;
            font-size: 0.85rem;
            font-weight: 500;
            transition: all 0.2s ease;
        }
        
        .follow-btn:hover {
            border-color: var(--text-primary);
            transform: scale(1.05);
        }
        
        .follow-btn.following {
            background-color: var(--tidal-cyan);
            border-color: var(--tidal-cyan);
            color: #000;
        }
        
        .alphabet-nav {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin-bottom: 2rem;
            padding: 0.5rem;
            border-bottom: 1px solid var(--border-color);
        }
        
        .alphabet-link {
            color: var(--text-secondary);
            text-decoration: none;
            font-weight: 500;
            font-size: 0.9rem;
            padding: 0.3rem 0.6rem;
            border-radius: 4px;
            transition: all 0.2s ease;
        }
        
        .alphabet-link:hover, .alphabet-link.active {
            color: var(--text-primary);
            background-color: var(--card-hover);
        }
        
        .search-box {
            background-color: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 25px;
            padding: 0.7rem 1.2rem;
            color: var(--text-primary);
            width: 100%;
            max-width: 400px;
            margin: 0 auto 2rem;
            display: flex;
            align-items: center;
        }
        
        .search-box i {
            color: var(--text-secondary);
            margin-right: 0.7rem;
        }
        
        .search-box input {
            background: transparent;
            border: none;
            color: var(--text-primary);
            width: 100%;
            outline: none;
        }
        
        .search-box input::placeholder {
            color: var(--text-secondary);
        }
        
        @media (max-width: 768px) {
            .section-title {
                font-size: 1.7rem;
            }
            
            .artist-avatar {
                width: 60px;
                height: 60px;
                margin-right: 1rem;
            }
            
            .artist-name {
                font-size: 1.1rem;
            }
            
            .artist-stats {
                flex-direction: column;
                gap: 0.3rem;
            }
        }
    </style>
	
    <!-- Main Area -->
    <section class="shop__area space top-baseline">
        <div class="container mt-5">
			<div class="section-header">
                <h2 class="section-title">Artists</h2>
                <a href="#" class="view-all">View All <i class="fas fa-chevron-right ms-1"></i></a>
            </div>


            
            <!-- Artists List -->
            <div class="artists-list">
                
                <!-- Artist 2 -->
				@foreach($artists as $item)
                <a href="{{route('artist.songs', $item->slug)}}" class="artist-card">
                    <img src="{{$item->file}}" alt="{{$item->name}}" class="artist-avatar">
                    <div class="artist-info">
                        <h3 class="artist-name text-white">{{$item->name}}</h3>
                        <!--<p class="artist-genre">Hip-Hop • R&B</p>-->
                        <div class="artist-stats">
                            <span class="stat"><i class="fas fa-music"></i> {{!empty($item->count)?$item->count:'0'}} songs</span>
                            <!--<span class="stat"><i class="fas fa-users"></i> 76.1M followers</span>-->
                        </div>
                    </div>
                </a>
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
<script>
        // Toggle follow button state
        document.querySelectorAll('.follow-btn').forEach(button => {
            button.addEventListener('click', function(e) {
                e.preventDefault();
                e.stopPropagation();
                
                if (this.classList.contains('following')) {
                    this.classList.remove('following');
                    this.textContent = 'Follow';
                } else {
                    this.classList.add('following');
                    this.textContent = 'Following';
                }
            });
        });
        
        // Alphabet navigation
        document.querySelectorAll('.alphabet-link').forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                
                document.querySelectorAll('.alphabet-link').forEach(l => {
                    l.classList.remove('active');
                });
                
                this.classList.add('active');
                
                // In a real app, you would filter artists by the selected letter here
                console.log('Filtering artists by:', this.textContent);
            });
        });
    </script>
	
@endpush
