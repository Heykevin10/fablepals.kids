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
                                <form action="{{ route('hero.save') }}" method="POST" enctype="multipart/form-data">
									@csrf
									<input type="hidden" name="id" value="{{ $section->id ?? '' }}">

									<div class="row">
										<div class="col-md-6 mb-3">
											<label class="form-label">Title <span class="text-danger">*</span></label>
											<input type="text" name="title" class="form-control"
												   value="{{ old('title', $section->title ?? '') }}" required>
										</div>
										<div class="col-md-6 mb-3">
											<label class="form-label">Sub Title</label>
											<input type="text" name="sub_title" class="form-control"
												   value="{{ old('sub_title', $section->sub_title ?? '') }}">
										</div>
									</div>

									<!-- Skill 1 -->
									<div class="row">
										<div class="col-md-8 mb-3">
											<label class="form-label">Skill Title One</label>
											<input type="text" name="skill_title_one" class="form-control"
												   value="{{ old('skill_title_one', $section->skill_title_one ?? '') }}">
										</div>
										<div class="col-md-4 mb-3">
											<label class="form-label">Skill Percentage One</label>
											<input type="number" name="skill_percentage_one" class="form-control" min="0" max="100"
												   value="{{ old('skill_percentage_one', $section->skill_percentage_one ?? '') }}">
										</div>
									</div>

									<!-- Skill 2 -->
									<div class="row">
										<div class="col-md-8 mb-3">
											<label class="form-label">Skill Title Two</label>
											<input type="text" name="skill_title_two" class="form-control"
												   value="{{ old('skill_title_two', $section->skill_title_two ?? '') }}">
										</div>
										<div class="col-md-4 mb-3">
											<label class="form-label">Skill Percentage Two</label>
											<input type="number" name="skill_percentage_two" class="form-control" min="0" max="100"
												   value="{{ old('skill_percentage_two', $section->skill_percentage_two ?? '') }}">
										</div>
									</div>

									<!-- Skill 3 -->
									<div class="row">
										<div class="col-md-8 mb-3">
											<label class="form-label">Skill Title Three</label>
											<input type="text" name="skill_title_three" class="form-control"
												   value="{{ old('skill_title_three', $section->skill_title_three ?? '') }}">
										</div>
										<div class="col-md-4 mb-3">
											<label class="form-label">Skill Percentage Three</label>
											<input type="number" name="skill_percentage_three" class="form-control" min="0" max="100"
												   value="{{ old('skill_percentage_three', $section->skill_percentage_three ?? '') }}">
										</div>
									</div>

									<!-- Skill 4 -->
									<div class="row">
										<div class="col-md-8 mb-3">
											<label class="form-label">Skill Title Four</label>
											<input type="text" name="skill_title_four" class="form-control"
												   value="{{ old('skill_title_four', $section->skill_title_four ?? '') }}">
										</div>
										<div class="col-md-4 mb-3">
											<label class="form-label">Skill Percentage Four</label>
											<input type="number" name="skill_percentage_four" class="form-control" min="0" max="100"
												   value="{{ old('skill_percentage_four', $section->skill_percentage_four ?? '') }}">
										</div>
									</div>

									<!-- Image -->
									<div class="row">
										<div class="col-md-6 mb-3">
											<label class="form-label">Image <span class="text-danger">*</span></label>
											<input type="file" name="image" class="form-control" {{ isset($section) ? '' : 'required' }}>
											@if(isset($section) && $section->image)
												<img src="{{ asset('uploads/skills_sections/'.$section->image) }}" 
													 alt="Skill Image" class="mt-2" style="max-height:100px;">
											@endif
										</div>
										<div class="col-md-6 mb-3">
											<label class="form-label">Link</label>
											<input type="url" name="link" class="form-control"
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
