@extends('admin.master_layout')
@section('title')
    <title>{{ __('Hero Section') }}</title>
@endsection
@php
    $current_theme_title = collect(App\Enums\ThemeList::themes())->firstWhere('name', DEFAULT_HOMEPAGE)?->title
@endphp
@section('admin-content')
    <div class="main-content">
        <section class="section">
            <x-admin.breadcrumb title="{{ __('Hero Section') }} ( {{$current_theme_title}} )" :list="[
                __('Dashboard') => route('admin.dashboard'),
                __('Hero Section') => '#',
            ]" />
            
            <div class="section-body">
                <div class="mt-4 row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between">
                                <x-admin.form-title :text="__('Hero Section')" />
                                <div>
                                    <x-admin.back-button :href="route('admin.dashboard')" />
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="{{ route('home_banners.save') }}" method="POST" enctype="multipart/form-data">
									@csrf
									<input type="hidden" name="id" value="{{ $banner->id ?? '' }}">

									<div class="row">
										<div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">Desktop/Mobile</label>
												<select class="form-control" name="desktop">
													<option value="1" @if(!empty($banner->id)) {{$banner->desktop==true?'selected':''}} @endif>Desktop</option>
													<option value="0" @if(!empty($banner->id)) {{$banner->desktop==false?'selected':''}} @endif>Mobile</option>
												</select>
                                            </div>
                                        </div>
										<div class="col-md-6 mb-3">
											<label class="form-label">Title <span class="text-danger">*</span></label>
											<input type="text" name="title" class="form-control" 
												   value="{{ old('title', $banner->title ?? '') }}" required>
										</div>
										<div class="col-md-6 mb-3">
											<label class="form-label">Title Part Two</label>
											<input type="text" name="title_two" class="form-control" 
												   value="{{ old('title_two', $banner->title_two ?? '') }}">
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 mb-3">
											<label class="form-label">Title Part three</label>
											<input type="text" name="title_three" class="form-control" 
												   value="{{ old('title_three', $banner->title_three ?? '') }}">
										</div>
										<div class="col-md-6 mb-3">
											<label class="form-label">Sub Title</label>
											<input type="text" name="sub_title" class="form-control" 
												   value="{{ old('sub_title', $banner->sub_title ?? '') }}">
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 mb-3">
											<label class="form-label">Button Text </label>
											<input type="text" name="action_button_text" class="form-control" 
												   value="{{ old('action_button_text', $banner->action_button_text ?? '') }}">
										</div>
										<div class="col-md-6 mb-3">
											<label class="form-label">Button url</label>
											<input type="text" name="action_button_url" class="form-control" 
												   value="{{ old('action_button_url', $banner->action_button_url ?? '') }}">
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 mb-3">
											<label class="form-label">Image <span class="text-danger">*</span></label>
											<input type="file" name="image" class="form-control" {{ isset($banner) ? '' : 'required' }}>
											@if(isset($banner) && $banner->image)
												<img src="{{ asset('uploads/home_banners/'.$banner->image) }}" 
													 alt="Banner Image" class="mt-2" style="max-height:100px;">
											@endif
										</div>
									</div>

									<button type="submit" class="btn btn-primary">
										{{ isset($banner) ? 'Update' : 'Submit' }}
									</button>
								</form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
@push('js')
    <script src="{{ asset('backend/js/jquery.uploadPreview.min.js') }}"></script>

@endpush
