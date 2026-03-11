@extends('admin.master_layout')
@section('title')
    <title>{{ __('Create Project') }}</title>
@endsection
@section('admin-content')
    <div class="main-content">
        <section class="section">
            <x-admin.breadcrumb title="{{ __('Save Playlist') }}" :list="[
                __('Dashboard') => route('admin.dashboard'),
                __('Song List') => route('admin.song.list'),
                __('Save Song') => '#',
            ]" />
            <div class="section-body">
                <div class="mt-4 row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between">
                                <x-admin.form-title :text="__('Save Playlist')" />
                                <div>
                                    <x-admin.back-button :href="route('admin.song.playlist.list')" />
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="{{ route('admin.song.playlist.save') }}" method="POST" enctype="multipart/form-data">
									@csrf
									<input type="hidden" name="id" value="{{ $section->id ?? '' }}">
									<input type="hidden" name="file_path" value="{{ $section->file ?? '' }}">

									<div class="row">
										<div class="col-md-6 mb-3">
											<label class="form-label">Playlist Name</label>
											<input type="text" name="name" class="form-control"
												   value="{{ old('name', $section->name ?? '') }}" required>
										</div>
										<div class="col-md-6 mb-3">
											<label class="form-label">Image</label>
											<input type="file" name="playlist" class="form-control" @if(empty($section->id)) required @endif>
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
