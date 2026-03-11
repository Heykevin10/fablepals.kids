@extends('admin.master_layout')
@section('title')
    <title>{{ __('Edit Project') }}</title>
@endsection
@section('admin-content')
    <div class="main-content">
        <section class="section">
            <x-admin.breadcrumb title="{{ __('Edit Project') }}" :list="[
                __('Dashboard') => route('admin.dashboard'),
                __('Project List') => route('admin.character.list'),
                __('Edit Project') => '#',
            ]" />
            <div class="section-body row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header gap-3 justify-content-between align-items-center">
                            <h5 class="m-0 service_card">{{ __('Available Translations') }}</h5>
                            @if ($code !== $languages->first()->code)
                                <x-admin.button id="translate-btn" :text="__('Translate')" />
                            @endif
                        </div>
                        <div class="card-body">
                            <div class="lang_list_top">
                                <ul class="lang_list">
                                    @foreach ($languages = allLanguages() as $language)
                                        <li><a id="{{ request('code') == $language->code ? 'selected-language' : '' }}"
                                                href="{{ route('admin.project.edit', ['project' => $project->id, 'code' => $language->code]) }}"><i
                                                    class="fas {{ request('code') == $language->code ? 'fa-eye' : 'fa-edit' }}"></i>
                                                {{ $language->name }}</a></li>
                                    @endforeach
                                </ul>
                            </div>

                            <div class="mt-2 alert alert-danger" role="alert">
                                @php
                                    $current_language = $languages->where('code', request()->get('code'))->first();
                                @endphp
                                <p>{{ __('Your editing mode') }}:<b> {{ $current_language?->name }}</b></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @if ($code == $languages->first()->code)
			{{--@include('project::utilities.navbar')--}}
            @endif
            <div class="section-body">
                <div class="mt-4 row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between">
                                <h4>{{ __('Edit Project') }}</h4>
                                <div>
                                    <a href="{{ route('admin.character.list') }}" class="btn btn-primary"><i
                                            class="fa fa-arrow-left"></i>{{ __('Back') }}</a>
                                </div>
                            </div>
                            <div class="card-body">
                                <form
                                    action="{{ route('admin.character.update', [
                                        'project' => $project->id,
                                        'code' => $code,
                                    ]) }}"
                                    method="POST" enctype="multipart/form-data">
                                    @csrf
                                    @method('PUT')

                                    <div class="row">
                                        <div
                                            class="form-group col-md-12 {{ $code == $languages->first()->code ? '' : 'd-none' }}">
                                            <x-admin.form-image-preview :image="$project->image" required="0"/>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label>{{ __('Title') }} <span class="text-danger">*</span></label>
                                            <input data-translate="true" type="text" id="title" class="form-control"
                                                name="title" value="{{ $project?->getTranslation($code)?->title }}">
                                        </div>
										
										{{-- Image Two (Gadget Image) --}}
										<div class="form-group col-md-6 {{ $code == $languages->first()->code ? '' : 'd-none' }}">
											<label>Gadget Image</label>
											<input type="hidden" name="image_two_path" value="{{ $project->image_two ?? '' }}">
											<input type="file" class="form-control" name="image_two" accept="image/avif,image/png,image/jpeg,image/jpg,image/webp">
											@if($project->image_two)
												<div class="mt-2">
													<img src="{{ asset($project->image_two) }}" class="img-thumbnail" style="max-height: 150px; object-fit: cover;" alt="Weapon Image">
												</div>
											@endif
											@error('image_two')
												<span class="text-danger error-message">{{ $message }}</span>
											@enderror
										</div>

										{{-- Image Three (Animation Image) --}}
										<div class="form-group col-md-6 {{ $code == $languages->first()->code ? '' : 'd-none' }}">
											<label>Animation Image</label>
											<input type="hidden" name="image_three_path" value="{{ $project->image_three ?? '' }}">
											<input type="file" class="form-control" name="image_three" accept="image/avif,image/png,image/jpeg,image/jpg,image/webp">
											@if($project->image_three)
												<div class="mt-2">
													<img src="{{ asset($project->image_three) }}" class="img-thumbnail" style="max-height: 150px; object-fit: cover;" alt="Animation Image">
												</div>
											@endif
											@error('image_three')
												<span class="text-danger error-message">{{ $message }}</span>
											@enderror
										</div>

										{{-- Mystic Element --}}
										<div class="form-group col-md-6 {{ $code == $languages->first()->code ? '' : 'd-none' }}">
											<label>Mystic Element</label>
											<input type="text" class="form-control" name="mystic_element" value="{{ old('mystic_element', $project->mystic_element) }}">
										</div>

										{{-- Signature Gadget --}}
										<div class="form-group col-md-6 {{ $code == $languages->first()->code ? '' : 'd-none' }}">
											<label>Signature Gadget</label>
											<input type="text" class="form-control" name="signature_weapon" value="{{ old('signature_weapon', $project->signature_weapon) }}">
										</div>

										{{-- Mystic Planet --}}
										<div class="form-group col-md-6 {{ $code == $languages->first()->code ? '' : 'd-none' }}">
											<label>Mystic Planet</label>
											<input type="text" class="form-control" name="mystic_planet" value="{{ old('mystic_planet', $project->mystic_planet) }}">
										</div>

										{{-- Signature Rider --}}
										<div class="form-group col-md-6 {{ $code == $languages->first()->code ? '' : 'd-none' }}">
											<label>Signature Rider</label>
											<input type="text" class="form-control" name="signature_rider" value="{{ old('signature_rider', $project->signature_rider) }}">
										</div>

										{{-- Mystic Guardian --}}
										<div class="form-group col-md-6 {{ $code == $languages->first()->code ? '' : 'd-none' }}">
											<label>Mystic Guardian</label>
											<input type="text" class="form-control" name="mystic_guardian" value="{{ old('mystic_guardian', $project->mystic_guardian) }}">
										</div>
										
										<div class="form-group col-md-6">
											<label>Line Color</label>
											<input type="text" class="form-control" name="line_color" value="{{ old('line_color', $project->line_color) }}">
											<small>You can single or gradient. 1) #007bff 2) #007bff, #00ffff</small>
										</div>
										
										{{-- Mystic Forms --}}
										<div class="form-group col-md-12 {{ $code == $languages->first()->code ? '' : 'd-none' }}">
											<label>{{ __('Mystic Forms') }}</label>
											<div id="mystic_forms_container">
												@foreach ($project->mysticForms as $index => $form)
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

										{{-- Gadgets & Attacks --}}
										<div class="form-group col-md-12 {{ $code == $languages->first()->code ? '' : 'd-none' }}">
											<label>{{ __('Gadgets & Attacks') }}</label>
											<div id="gadgets_attacks_container">
												@foreach ($project->gadgets as $index => $gadget)
													<div class="gadget-attack-group mb-3 border p-3">
														<div class="form-group">
															<label>{{ __('Title') }}</label>
															<input type="text" class="form-control" name="gadgets_attacks[{{ $index }}][title]" value="{{ old('gadgets_attacks.' . $index . '.title', $gadget->title) }}">
															@error('gadgets_attacks.' . $index . '.title')
																<span class="text-danger error-message">{{ $message }}</span>
															@enderror
														</div>
														<div class="form-group">
															<label>{{ __('Description') }}</label>
															<textarea class="form-control text-area-5" name="gadgets_attacks[{{ $index }}][description]">{{ old('gadgets_attacks.' . $index . '.description', $gadget->description) }}</textarea>
															@error('gadgets_attacks.' . $index . '.description')
																<span class="text-danger error-message">{{ $message }}</span>
															@enderror
														</div>
														<div class="form-group">
															<label>{{ __('Image') }}</label>
															<input type="hidden" name="gadgets_attacks[{{ $index }}][image_path]" value="{{ $gadget->image ?? '' }}">
															<input type="file" class="form-control" name="gadgets_attacks[{{ $index }}][image]" accept="image/avif,image/png,image/jpeg,image/jpg,image/webp">
															@if($gadget->image)
																<div class="mt-2">
																	<img src="{{ asset($gadget->image) }}" class="img-thumbnail" style="max-height: 150px; object-fit: cover;" alt="Gadget/Attack Image">
																</div>
															@endif
															@error('gadgets_attacks.' . $index . '.image')
																<span class="text-danger error-message">{{ $message }}</span>
															@enderror
														</div>
														<button type="button" class="btn btn-danger btn-sm remove-gadget-attack">{{ __('Remove') }}</button>
													</div>
												@endforeach
											</div>
											<button type="button" class="btn btn-primary btn-sm" id="add_gadget_attack">{{ __('Add Gadget/Attack') }}</button>
										</div>
									</div>

                                        <div class="form-group col-md-12">
                                            <x-admin.form-editor-with-image id="description" name="description"
                                                label="{{ __('Description') }}" value="{!! replaceImageSources($project->getTranslation($code)->description) !!}"
                                                required="true" data-translate="true" />
                                        </div>
										
										{{-- Gallery Images Upload --}}
										<div class="form-group col-md-12 {{ $code == $languages->first()->code ? '' : 'd-none' }}">
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
                                            class="form-group col-md-12 {{ $code == $languages->first()->code ? '' : 'd-none' }}">
                                            <label>{{ __('Tags') }}</label>
                                            <input type="text" class="form-control tags" name="tags"
                                                value="{{ $project->tags }}">
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label>{{ __('SEO Title') }}</label>
                                            <input data-translate="true" type="text" class="form-control"
                                                name="seo_title"
                                                value="{{ $project?->getTranslation($code)?->seo_title }}">
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label>{{ __('SEO Description') }}</label>
                                            <textarea maxlength="1000" data-translate="true" name="seo_description" id="" cols="30"
                                                rows="10" class="form-control text-area-5">{{ $project?->getTranslation($code)?->seo_description }}</textarea>
                                        </div>

                                        <div
                                            class="form-group col-md-12 {{ $code == $languages->first()->code ? '' : 'd-none' }}">
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
                fetch("{{ url('admin/project-gallery/image') }}/" + imageId, {
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
    @if ($code == $languages->first()->code)
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
