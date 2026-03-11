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
                                    <a href="{{ route('hero.create') }}" class="btn btn-primary">Add New</a>
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
												<th class="text-light">Sub Title</th>
												<th class="text-light">Image</th>
												<th class="text-light">Skills</th>
												<th width="160" class="text-light">Action</th>
											</tr>
										</thead>
										<tbody>
											@forelse($skillsSections as $section)
												<tr>
													<td>{{ $section->id }}</td>
													<td>{{ $section->title }}</td>
													<td>{{ Str::limit($section->sub_title, 50) }}</td>
													<td>
														@if($section->image)
															<img src="{{ asset('uploads/skills_sections/'.$section->image) }}" width="80" class="img-thumbnail">
														@endif
													</td>
													<td>
														@if($section->skill_title_one)
															<strong>{{ $section->skill_title_one }}</strong> - {{ $section->skill_percentage_one }}% <br>
														@endif
														@if($section->skill_title_two)
															<strong>{{ $section->skill_title_two }}</strong> - {{ $section->skill_percentage_two }}% <br>
														@endif
														@if($section->skill_title_three)
															<strong>{{ $section->skill_title_three }}</strong> - {{ $section->skill_percentage_three }}% <br>
														@endif
														@if($section->skill_title_four)
															<strong>{{ $section->skill_title_four }}</strong> - {{ $section->skill_percentage_four }}%
														@endif
													</td>
													<td>
														<a href="{{ route('hero.edit', $section->id) }}" class="btn btn-warning btn-sm">Edit</a>
														<form action="{{ route('hero.delete', $section->id) }}" method="POST" class="d-inline"
															  onsubmit="return confirm('Are you sure you want to delete this section?');">
															@csrf
															@method('DELETE')
															<button class="btn btn-danger btn-sm">Delete</button>
														</form>
													</td>
												</tr>
											@empty
												<tr>
													<td colspan="6" class="text-center">No skills sections found.</td>
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
