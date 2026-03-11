@foreach($banners as $index => $banner)
    <div class="carousel-item {{ $index === 0 ? 'active' : '' }}">
        <div class="hero-wrapper hero-2">
            <div class="hero-2-thumb">
                <img src="{{ asset('uploads/home_banners/'.$banner->image) }}" alt="">
            </div>
            <div class="container">
                <div class="hero-style2">
                    <h1 class="hero-title text-white">{{ $banner->title }}</h1>
                    <h1 class="hero-title text-white">{{ $banner->title_two }}</h1>
                    <h1 class="hero-title text-white">{{ $banner->title_three }}</h1>

                    {!! clean(processText($banner->sub_title)) !!}

                    @if($banner->action_button_text && $banner->action_button_url)
                        <a href="{{ $banner->action_button_url }}" class="btn style2 mt-3">
                            {{ $banner->action_button_text }}
                        </a>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endforeach
