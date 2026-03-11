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
            <x-admin.breadcrumb title="{{ __('Videos') }} ( {{$current_theme_title}} )" :list="[
                __('Dashboard') => route('admin.dashboard'),
                __('Hero Section') => '#',
            ]" />
			
			<div class="section-header">
				<form action="{{ route('youtube-stats.save') }}" method="POST">
					@csrf
	
					<div class="row">
					<div class="mb-3 col-md-4">
						<label for="subscribers" class="form-label">Subscribers</label>
						<input
							type="number"
							min="0"
							name="subscribers"
							id="subscribers"
							class="form-control @error('subscribers') is-invalid @enderror"
							value="{{ old('subscribers', optional($stats)->subscribers) }}"
							required
						>
					</div>

					<div class="mb-3 col-md-4">
						<label for="views" class="form-label">Views</label>
						<input
							type="number"
							min="0"
							name="views"
							id="views"
							class="form-control @error('views') is-invalid @enderror"
							value="{{ old('views', optional($stats)->views) }}"
							required
						>
					</div>

					<div class="mb-3 col-md-4 pt-2">
					<button type="submit" class="btn btn-primary mt-4">
						{{ $stats ? 'Update Stats' : 'Save Stats' }}
					</button>
					</div>
					</div>
				</form>
			</div>
            
            <div class="section-body">
                <div class="mt-4 row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between">
                                <x-admin.form-title :text="__('Hero Section')" />
                                <div>
                                    <a href="{{ route('video.create') }}" class="btn btn-primary">Add New</a>
                                </div>
                            </div>
                            <div class="card-body">
                                @if(session('success'))
									<div class="alert alert-success">{{ session('success') }}</div>
								@endif

								<div class="table-responsive">
									<table class="table table-bordered align-middle">
										<thead class="table-dark">
											<tr>
												<th class="text-light">ID</th>
												<th class="text-light">Title</th>
												<th class="text-light">Link</th>
												<th width="160" class="text-light">Action</th>
											</tr>
										</thead>
										<tbody>
											@forelse($videos as $section)
												<tr>
													<td>{{ $section->id }}</td>
													<td>{{ $section->title }}</td>
													<td>{{ $section->link }}</td>
													<td>
														<a href="{{ route('video.edit', $section->id) }}" class="btn btn-warning btn-sm">Edit</a>
														<form action="{{ route('video.delete', $section->id) }}" method="POST" class="d-inline"
															  onsubmit="return confirm('Are you sure you want to delete this section?');">
															@csrf
															@method('DELETE')
															<button class="btn btn-danger btn-sm">Delete</button>
														</form>
													</td>
												</tr>
											@empty
												<tr>
													<td colspan="6" class="text-center">No video found.</td>
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
