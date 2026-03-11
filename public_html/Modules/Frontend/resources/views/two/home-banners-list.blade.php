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
                                    <a href="{{ route('home_banners.create') }}" class="btn btn-primary">Add New</a>
                                </div>
                            </div>
                            <div class="card-body">
                                @if(session('success'))
									<div class="alert alert-success">{{ session('success') }}</div>
								@endif
								<div class="table-responsive">
									<table class="table table-bordered table-striped align-middle">
										<thead class="table-dark">
											<tr>
												<th class="text-light">ID</th>
												<th class="text-light">Title</th>
												<th class="text-light">Sub Title</th>
												<th class="text-light">Button Text</th>
												<th class="text-light">Image</th>
												<th width="150" class="text-light">Actions</th>
											</tr>
										</thead>
										<tbody>
											@forelse($banners as $banner)
												<tr>
													<td>{{ $banner->id }}</td>
													<td>{{ $banner->title }}</td>
													<td>{{ $banner->sub_title }}</td>
													<td>{{ $banner->action_button_text }}</td>
													<td>
														@if($banner->image)
															<img src="{{ asset('uploads/home_banners/'.$banner->image) }}" 
																 alt="Banner Image" style="max-height:60px;">
														@endif
													</td>
													<td>
														<a href="{{ route('home_banners.edit', $banner->id) }}" 
														   class="btn btn-sm btn-primary">Edit</a>

														<form action="{{ route('home_banners.delete', $banner->id) }}" 
															  method="POST" class="d-inline"
															  onsubmit="return confirm('Are you sure you want to delete this banner?');">
															@csrf
															@method('DELETE')
															<button type="submit" class="btn btn-sm btn-danger">
																Delete
															</button>
														</form>
													</td>
												</tr>
											@empty
												<tr>
													<td colspan="6" class="text-center">No banners found.</td>
												</tr>
											@endforelse
										</tbody>
									</table>
								</div>

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
