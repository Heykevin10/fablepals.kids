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
            <x-admin.breadcrumb title="{{ __('Video Section') }} ( {{$current_theme_title}} )" :list="[
                __('Dashboard') => route('admin.dashboard'),
                __('Hero Section') => '#',
            ]" />
            
            <div class="section-body">
                <div class="mt-4 row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between">
                                <x-admin.form-title :text="__('Video Section')" />
                                <div>
                                    <x-admin.back-button :href="route('admin.dashboard')" />
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="{{ route('video.save') }}" method="POST">
									@csrf
									<input type="hidden" name="id" value="{{ $section->id ?? '' }}">

									<div class="row">
										<div class="col-md-6 mb-3">
											<label class="form-label">Title <span class="text-danger">*</span></label>
											<input type="text" name="title" class="form-control"
												   value="{{ old('title', $section->title ?? '') }}" required>
										</div>
										<div class="col-md-6 mb-3">
												<label class="form-label">Link</label>
												<input type="text" name="link" class="form-control"
													   value="{{ old('link', $section->link ?? '') }}">
											</div>
										</div>

									<button type="submit" class="btn btn-primary">
										{{ isset($section) ? 'Update' : 'Submit' }}
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
