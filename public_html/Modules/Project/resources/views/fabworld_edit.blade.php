@extends('admin.master_layout')
@section('title')
    <title>{{ __('Edit Project') }}</title>
@endsection
@section('admin-content')
    <div class="main-content">
        <section class="section">
            <x-admin.breadcrumb title="{{ __('Edit Project') }}" :list="[
                __('Dashboard') => route('admin.dashboard'),
                __('Project List') => route('admin.fabworld.list'),
                __('Edit Project') => '#',
            ]" />
            <div class="section-body row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header gap-3 justify-content-between align-items-center">
                            
                           
                        </div>
                        <div class="card-body">
                           

                            
                        </div>
                    </div>
                </div>
            </div>
           
            <div class="section-body">
                <div class="mt-4 row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between">
                                <h4>{{ __('Edit Project') }}</h4>
                                <div>
                                    <a href="{{ route('admin.fabworld.list') }}" class="btn btn-primary"><i
                                            class="fa fa-arrow-left"></i>{{ __('Back') }}</a>
                                </div>
                            </div>
                            <div class="card-body">
                                <form
                                    action="{{ route('admin.fabworld.update', [
                                        'project' => $project->id
                                    ]) }}"
                                    method="POST" enctype="multipart/form-data">
                                    @csrf
                                    @method('PUT')

                                    <div class="row">
                                        <div
                                            class="form-group col-md-12">
                                            <x-admin.form-image-preview :image="$project->banner" required="0"/>
                                        </div>
										<div class="form-group col-md-12">
                                            <label>{{ __('Category') }} <span class="text-danger">*</span></label>
                                            <select class="form-control" name="category_id">
												<option value="">Select</option>
												@foreach($categories as $item)
													<option value="{{$item->id}}" {{$item->id == $project->category_id?'selected':''}}>{{$item->name}}</option>
												@endforeach
											</select>
                                        </div>
										<div class="form-group col-md-12">
                                            <label>{{ __('Menu Title') }} <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" name="title"
                                                value="{{ $project?->title }}">
                                            @error('title')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label>{{ __('Banner Title') }} <span class="text-danger">*</span></label>
                                            <input data-translate="true" type="text" id="title" class="form-control"
                                                name="banner_heading" value="{{ $project?->banner_heading }}">
                                        </div>
										<div class="form-group col-md-12">
                                            <label>{{ __('Banner Description') }} <span class="text-danger">*</span></label>
                                            <input type="text" id="banner_sub_heading" class="form-control" name="banner_sub_heading"
                                                value="{{ $project?->banner_sub_heading }}">
                                            @error('banner_sub_heading')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>
										
										<div class="form-group col-md-12">
											<label>Line Color</label>
											<input type="text" class="form-control" name="line_color" value="{{ old('line_color', $project->line_color) }}">
											<small>You can single or gradient. 1) #007bff 2) #007bff, #00ffff</small>
										</div>

										
										{{-- Mystic Forms --}}
										<div class="form-group col-md-12">
											<label>{{ __('Mystic Forms') }}</label>
											<div id="mystic_forms_container">
												@foreach ($project->fabworldSlides as $index => $form)
													<div class="mystic-form-group mb-3 border p-3">
														<div class="form-group">
															<label>{{ __('Title') }}</label>
															<input type="text" class="form-control" name="mystic_forms[{{ $index }}][title]" value="{{ old('mystic_forms.' . $index . '.title', $form->title) }}">
															@error('mystic_forms.' . $index . '.title')
																<span class="text-danger error-message">{{ $message }}</span>
															@enderror
														</div>
														<div class="form-group">
															<label>{{ __('Description') }}</label>
															<textarea class="form-control text-area-5" name="mystic_forms[{{ $index }}][description]">{{ old('mystic_forms.' . $index . '.description', $form->description) }}</textarea>
															@error('mystic_forms.' . $index . '.description')
																<span class="text-danger error-message">{{ $message }}</span>
															@enderror
														</div>
														<div class="form-group">
															<label>{{ __('Image') }}</label>
															<input type="hidden" name="mystic_forms[{{ $index }}][image_path]" value="{{ $form->image ?? '' }}">
															<input type="file" class="form-control" name="mystic_forms[{{ $index }}][image]" accept="image/avif,image/png,image/jpeg,image/jpg,image/webp">
															@if($form->image)
																<div class="mt-2">
																	<img src="{{ asset($form->image) }}" class="img-thumbnail" style="max-height: 150px; object-fit: cover;" alt="Mystic Form Image">
																</div>
															@endif
															@error('mystic_forms.' . $index . '.image')
																<span class="text-danger error-message">{{ $message }}</span>
															@enderror
														</div>
														<button type="button" class="btn btn-danger btn-sm remove-mystic-form">{{ __('Remove') }}</button>
													</div>
												@endforeach
											</div>
											<button type="button" class="btn btn-primary btn-sm" id="add_mystic_form">{{ __('Add Mystic Form') }}</button>
										</div>

									</div>

                                        <div class="form-group col-md-12">
                                            <x-admin.form-editor-with-image id="description" name="description"
                                                label="{{ __('Description') }}" value="{!! replaceImageSources($project->description) !!}"
                                                required="true" data-translate="true" />
                                        </div>
										
										{{-- Gallery Images Upload --}}
										<div class="form-group col-md-12  ">
											<label>{{ __('Gallery Images') }}</label>
											<input type="file" name="gallery_images[]" class="form-control" multiple accept="image/avif,image/jpeg,image/png,image/webp,image/jpg">
										</div>

										{{-- Show existing gallery images (optional) --}}
										@if($project->galleryImages && $project->galleryImages->count())
											<div class="form-group col-md-12 mt-2">
												<label>{{ __('Existing Gallery') }}</label>
												<div class="row">
													@foreach ($project->galleryImages as $gallery)
														<div class="col-md-3 mb-2">
															<div class="position-relative border rounded p-1 gallery-image-wrapper" data-id="{{ $gallery->id }}" style="height: 100%;">

																<img src="{{ asset($gallery->image) }}"
																	 class="img-thumbnail w-100"
																	 style="max-height: 150px; object-fit: cover;">

																<button type="button"
																		class="btn btn-danger btn-sm position-absolute top-0 end-0 m-1 delete-gallery-image"
																		data-id="{{ $gallery->id }}"
																		title="Delete Image">
																	&times;
																</button>

															</div>
														</div>
													@endforeach
												</div>
											</div>
										@endif

                                        <div
                                            class="form-group col-md-12  ">
                                            <label>{{ __('Tags') }}</label>
                                            <input type="text" class="form-control tags" name="tags"
                                                value="{{ $project->tags }}">
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label>{{ __('SEO Title') }}</label>
                                            <input data-translate="true" type="text" class="form-control"
                                                name="seo_title"
                                                value="{{ $project?->seo_title }}">
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label>{{ __('SEO Description') }}</label>
                                            <textarea maxlength="1000" data-translate="true" name="seo_description" id="" cols="30"
                                                rows="10" class="form-control text-area-5">{{ $project?->seo_description }}</textarea>
                                        </div>

                                        <div
                                            class="form-group col-md-12  ">
                                            <label>
                                                <input {{ $project->status == 1 ? 'checked' : '' }} type="checkbox"
                                                    value="1" name="status" class="custom-switch-input">
                                                <span class="custom-switch-indicator"></span>
                                                <span class="custom-switch-description">{{ __('Status') }}</span>
                                            </label>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="text-center col-md-12">
                                            <x-admin.update-button :text="__('Update')"></x-admin.update-button>
                                        </div>
                                    </div>
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
<script>
document.addEventListener('DOMContentLoaded', function () {

    // Utility function to find the next unused index for a section
    function getNextIndex(containerSelector, inputPrefix) {
        const groups = document.querySelectorAll(containerSelector + ' [name^="' + inputPrefix + '["]');
        let usedIndexes = new Set();
        groups.forEach(function(input) {
            const match = input.name.match(new RegExp('^' + inputPrefix + '\\[(\\d+)\\]'));
            if (match) usedIndexes.add(Number(match[1]));
        });
        let i = 0; // start from 0
        while (usedIndexes.has(i)) i++;
        return i;
    }

    // ---- Mystic Forms ----
    document.getElementById('add_mystic_form').addEventListener('click', function () {
        const container = document.getElementById('mystic_forms_container');
        const nextIndex = getNextIndex('#mystic_forms_container', 'mystic_forms');
        const newFormGroup = document.createElement('div');
        newFormGroup.className = 'mystic-form-group mb-3 border p-3';
        newFormGroup.innerHTML = `
            <div class="form-group">
                <label>Title</label>
                <input type="text" class="form-control" name="mystic_forms[${nextIndex}][title]">
            </div>
            <div class="form-group">
                <label>Description</label>
                <textarea class="form-control text-area-5" name="mystic_forms[${nextIndex}][description]"></textarea>
            </div>
            <div class="form-group">
                <label>Image</label>
                <input type="hidden" name="mystic_forms[${nextIndex}][image_path]" value="">
                <input type="file" class="form-control" name="mystic_forms[${nextIndex}][image]" accept="image/avif,image/png,image/jpeg,image/jpg,image/webp">
            </div>
            <button type="button" class="btn btn-danger btn-sm remove-mystic-form">Remove</button>
        `;
        container.appendChild(newFormGroup);
    });

    document.getElementById('mystic_forms_container').addEventListener('click', function (e) {
        if (e.target.classList.contains('remove-mystic-form')) {
            e.target.closest('.mystic-form-group').remove();
        }
    });

    // ---- Gadgets & Attacks ----
    document.getElementById('add_gadget_attack').addEventListener('click', function () {
        const container = document.getElementById('gadgets_attacks_container');
        const nextIndex = getNextIndex('#gadgets_attacks_container', 'gadgets_attacks');
        const newGadgetGroup = document.createElement('div');
        newGadgetGroup.className = 'gadget-attack-group mb-3 border p-3';
        newGadgetGroup.innerHTML = `
            <div class="form-group">
                <label>Title</label>
                <input type="text" class="form-control" name="gadgets_attacks[${nextIndex}][title]">
            </div>
            <div class="form-group">
                <label>Description</label>
                <textarea class="form-control text-area-5" name="gadgets_attacks[${nextIndex}][description]"></textarea>
            </div>
            <div class="form-group">
                <label>Image</label>
                <input type="hidden" name="gadgets_attacks[${nextIndex}][image_path]" value="">
                <input type="file" class="form-control" name="gadgets_attacks[${nextIndex}][image]" accept="image/avif,image/png,image/jpeg,image/jpg,image/webp">
            </div>
            <button type="button" class="btn btn-danger btn-sm remove-gadget-attack">Remove</button>
        `;
        container.appendChild(newGadgetGroup);
    });

    document.getElementById('gadgets_attacks_container').addEventListener('click', function (e) {
        if (e.target.classList.contains('remove-gadget-attack')) {
            e.target.closest('.gadget-attack-group').remove();
        }
    });

});
</script>

<script>
document.addEventListener('DOMContentLoaded', function () {
    const deleteButtons = document.querySelectorAll('.delete-gallery-image');

    deleteButtons.forEach(btn => {
        btn.addEventListener('click', function () {
            const imageId = this.getAttribute('data-id');

            if (confirm('Are you sure you want to delete this gallery image?')) {
                fetch("{{ url('admin/fabworld-gallery/image') }}/" + imageId, {
                    method: 'DELETE',
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}',
                        'Accept': 'application/json',
                    },
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        document.querySelector(`.gallery-image-wrapper[data-id='${imageId}']`).remove();
                    } else {
                        alert('Failed to delete image.');
                    }
                });
            }
        });
    });
});
</script>
    {{-- Image preview --}}
    @if (!empty($code))
        <script src="{{ asset('backend/js/jquery.uploadPreview.min.js') }}"></script>
        <script>
            $.uploadPreview({
                input_field: "#image-upload",
                preview_box: "#image-preview",
                label_field: "#image-label",
                label_default: "{{ __('Choose Image') }}",
                label_selected: "{{ __('Change Image') }}",
                no_label: false,
                success_callback: null
            });
        </script>
    @else
        <script>
            'use strict';
            $('#translate-btn').on('click', function() {
                translateAllTo("{{ $code }}");
            })
        </script>
    @endif
@endpush
