@props([
    'image' => 'uploads/website-images/breadcrumb-image.jpg',
    'title' => cache('setting.app_name') ?? config('app.name'),
])

<div class="breadcumb-wrapper" data-bg-src="{{ url('uploads/website-images/breadcrumb-image.jpg') }}?v={{ time() }}">
    <div class="container">
        <div class="breadcumb-content">
            <h1 class="breadcumb-title">{{ $title }}</h1>
        </div>
    </div>
</div>