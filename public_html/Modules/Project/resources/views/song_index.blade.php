@extends('admin.master_layout')
@section('title')
    <title>{{ __('Song List') }}</title>
@endsection
@section('admin-content')
    <div class="main-content">
        <section class="section">
            <x-admin.breadcrumb title="{{ __('Song List') }}" :list="[
                __('Dashboard') => route('admin.dashboard'),
                __('Song List') => '#',
            ]" />
            <div class="section-body">
                <div class="mt-4 row">
                   

                    <div class="col-12">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between">
                                <x-admin.form-title :text="__('Song List')" />
                                <div>
                                    <x-admin.add-button :href="route('admin.song.create')" />
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive max-h-400">
                                    <table class="table table-bordered align-middle">
										<thead class="table-dark">
											<tr>
												<th class="text-light">ID</th>
												<th class="text-light">Playlist</th>
												<th class="text-light">Title</th>
												<th class="text-light">Artist</th>
												<th width="160" class="text-light">Action</th>
											</tr>
										</thead>
										<tbody>
											@forelse($videos as $section)
												<tr>
													<td>{{ $section->id }}</td>
													<td>{{ !empty($section->name)?$section->name:'n/a' }}</td>
													<td>{{ $section->title }}</td>
													<td>{{ $section->artist }}</td>
													<td>
														<a href="{{ route('admin.song.edit', $section->id) }}" class="btn btn-warning btn-sm">Edit</a>
														<form action="{{ route('admin.song.destroy', $section->id) }}" method="POST" class="d-inline"
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
