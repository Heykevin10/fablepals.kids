@extends('admin.master_layout')
@section('title')
    <title>{{ __('Song List') }}</title>
@endsection
@section('admin-content')
    <div class="main-content">
        <section class="section">
            <x-admin.breadcrumb title="{{ __('Artists') }}" :list="[
                __('Dashboard') => route('admin.dashboard'),
                __('Song List') => '#',
            ]" />
            <div class="section-body">
                <div class="mt-4 row">
                   

                    <div class="col-12">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between">
                                <x-admin.form-title :text="__('Artists')" />
                                <div>
                                    <x-admin.add-button :href="route('admin.song.artist.create')" />
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive max-h-400">
                                    <table class="table table-bordered align-middle">
										<thead class="table-dark">
											<tr>
												<th class="text-light">ID</th>
												<th class="text-light">Image</th>
												<th class="text-light">Title</th>
												<th width="160" class="text-light">Action</th>
											</tr>
										</thead>
										<tbody>
											@forelse($videos as $section)
												<tr>
													<td>{{ $section->id }}</td>
													<td>
														@if(!empty($section->file))
															<img class="rounded-circle my-2" src="{{ asset($section->file) }}">
														@endif
													</td>
													<td>{{ $section->name }}</td>
													<td>
														<a href="{{ route('admin.song.artist.edit', $section->id) }}" class="btn btn-warning btn-sm">Edit</a>
														<form action="{{ route('admin.song.artist.destroy', $section->id) }}" method="POST" class="d-inline"
															  onsubmit="return confirm('Are you sure you want to delete this section?');">
															@csrf
															@method('DELETE')
															<button class="btn btn-danger btn-sm">Delete</button>
														</form>
													</td>
												</tr>
											@empty
												<tr>
													<td colspan="6" class="text-center">No song found.</td>
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
    @adminCan('project.management')
        <x-admin.delete-modal />
    @endadminCan
@endsection
