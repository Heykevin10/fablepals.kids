@extends('admin.master_layout')
@section('title')
    <title>{{ __('Create Project') }}</title>
@endsection
@section('admin-content')
    <div class="main-content">
        <section class="section">
            <x-admin.breadcrumb title="{{ __('Create Character') }}" :list="[
                __('Dashboard') => route('admin.dashboard'),
                __('Project List') => route('admin.character.list'),
                __('Create Project') => '#',
            ]" />
            <div class="section-body">
                <div class="mt-4 row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between">
                                <x-admin.form-title :text="__('Create Character')" />
                                <div>
                                    <x-admin.back-button :href="route('admin.character.list')" />
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="{{ route('admin.character.store') }}" method="POST"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <x-admin.form-image-preview />
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label>{{ __('Title') }} <span class="text-danger">*</span></label>
                                            <input type="text" id="title" class="form-control" name="title"
                                                value="{{ old('title') }}">
                                            @error('title')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label>{{ __('Slug') }} <span class="text-danger">*</span></label>
                                            <input type="text" id="slug" class="form-control" name="slug"
                                                value="{{ old('slug') }}">
                                            @error('slug')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>
										
										<div class="form-group col-md-6">
											<label>{{ __('Gadget Image') }}</label>
											<input type="file" class="form-control" name="image_two" accept="image/avif,image/png,image/jpeg,image/jpg,image/webp">
											@error('image_two')
												<span class="text-danger error-message">{{ $message }}</span>
											@enderror
										</div>

										<div class="form-group col-md-6">
											<label>{{ __('Animated Image') }}</label>
											<input type="file" class="form-control" name="image_three" accept="image/avif,image/png,image/jpeg,image/jpg,image/webp">
											@error('image_three')
												<span class="text-danger error-message">{{ $message }}</span>
											@enderror
										</div>

										
										{{-- Mystic Element --}}
										<div class="form-group col-md-6">
											<label>Mystic Element</label>
											<input type="text" class="form-control" name="mystic_element" value="{{ old('mystic_element') }}">
										</div>

										{{-- Signature Gadget --}}
										<div class="form-group col-md-6">
											<label>Signature Gadget</label>
											<input type="text" class="form-control" name="signature_weapon" value="{{ old('signature_weapon') }}">
										</div>

										{{-- Mystic Planet --}}
										<div class="form-group col-md-6">
											<label>Mystic Planet</label>
											<input type="text" class="form-control" name="mystic_planet" value="{{ old('mystic_planet') }}">
										</div>

										{{-- Signature Rider --}}
										<div class="form-group col-md-6">
											<label>Signature Rider</label>
											<input type="text" class="form-control" name="signature_rider" value="{{ old('signature_rider') }}">
										</div>

										{{-- Mystic Guardian --}}
										<div class="form-group col-md-6">
											<label>Mystic Guardian</label>
											<input type="text" class="form-control" name="mystic_guardian" value="{{ old('mystic_guardian') }}">
										</div>
										
										<div class="form-group col-md-6">
											<label>Line Color</label>
											<input type="text" class="form-control" name="line_color" value="{{ old('line_color') }}">
											<small>You can single or gradient. 1) #007bff 2) #007bff, #00ffff</small>
										</div>
										
										{{-- Mystic Forms --}}
										<div class="form-group col-md-12">
											<label>{{ __('Mystic Forms') }}</label>
											<div id="mystic_forms_container">
												<div class="mystic-form-group mb-3 border p-3">
													<div class="form-group">
														<label>{{ __('Title') }}</label>
														<input type="text" class="form-control" name="mystic_forms[0][title]" value="{{ old('mystic_forms.0.title') }}">
														@error('mystic_forms.0.title')
															<span class="text-danger error-message">{{ $message }}</span>
														@enderror
													</div>
													<div class="form-group">
														<label>{{ __('Description') }}</label>
														<textarea class="form-control text-area-5" name="mystic_forms[0][description]">{{ old('mystic_forms.0.description') }}</textarea>
														@error('mystic_forms.0.description')
															<span class="text-danger error-message">{{ $message }}</span>
														@enderror
													</div>
													<div class="form-group">
														<label>{{ __('Image') }}</label>
														<input type="file" class="form-control" name="mystic_forms[0][image]" accept="image/avif,image/png,image/jpeg,image/jpg,image/webp">
														@error('mystic_forms.0.image')
															<span class="text-danger error-message">{{ $message }}</span>
														@enderror
													</div>
													<button type="button" class="btn btn-danger btn-sm remove-mystic-form">{{ __('Remove') }}</button>
												</div>
											</div>
											<button type="button" class="btn btn-primary btn-sm" id="add_mystic_form">{{ __('Add Mystic Form') }}</button>
										</div>

										{{-- Gadgets & Attacks --}}
										<div class="form-group col-md-12">
											<label>{{ __('Gadgets & Attacks') }}</label>
											<div id="gadgets_attacks_container">
												<div class="gadget-attack-group mb-3 border p-3">
													<div class="form-group">
														<label>{{ __('Title') }}</label>
														<input type="text" class="form-control" name="gadgets_attacks[0][title]" value="{{ old('gadgets_attacks.0.title') }}">
														@error('gadgets_attacks.0.title')
															<span class="text-danger error-message">{{ $message }}</span>
														@enderror
													</div>
													<div class="form-group">
														<label>{{ __('Description') }}</label>
														<textarea class="form-control text-area-5" name="gadgets_attacks[0][description]">{{ old('gadgets_attacks.0.description') }}</textarea>
														@error('gadgets_attacks.0.description')
															<span class="text-danger error-message">{{ $message }}</span>
														@enderror
													</div>
													<div class="form-group">
														<label>{{ __('Image') }}</label>
														<input type="file" class="form-control" name="gadgets_attacks[0][image]" accept="image/avif,image/png,image/jpeg,image/jpg,image/webp">
														@error('gadgets_attacks.0.image')
															<span class="text-danger error-message">{{ $message }}</span>
														@enderror
													</div>
													<button type="button" class="btn btn-danger btn-sm remove-gadget-attack">{{ __('Remove') }}</button>
												</div>
											</div>
											<button type="button" class="btn btn-primary btn-sm" id="add_gadget_attack">{{ __('Add Gadget/Attack') }}</button>
										</div>

                                        
                                        <div class="form-group col-md-12">
                                            <x-admin.form-editor-with-image id="description" name="description" label="{{ __('Description') }}" value="{!! old('description') !!}" required="true"/>
                                        </div>
										
										<div class="form-group col-md-12">
											<label>{{ __('Gallery Images') }}</label>
											<input type="file" class="form-control" name="gallery_images[]" multiple accept="image/avif,image/png,image/jpeg,image/jpg,image/webp">
											@error('gallery_images')
												<span class="text-danger error-message">{{ $message }}</span>
											@enderror
											@error('gallery_images.*')
												<span class="text-danger error-message">{{ $message }}</span>
											@enderror
										</div>

                                        <div class="form-group col-md-12">
                                            <label>{{ __('Tags') }}</label>
                                            <input type="text" class="form-control tags" name="tags"
                                                value="{{ old('tags') }}">
                                            @error('tags')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label>{{ __('SEO Title') }}</label>
                                            <input type="text" class="form-control" name="seo_title"
                                                value="{{ old('seo_title') }}">
                                            @error('seo_title')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label>{{ __('SEO Description') }}</label>
                                            <textarea maxlength="1000" name="seo_description" id="" cols="30" rows="10"
                                                class="form-control text-area-5">{{ old('seo_description') }}</textarea>
                                            @error('seo_description')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label>
                                                <input type="hidden" value="0" name="status"
                                                    class="custom-switch-input">
                                                <input type="checkbox" value="1" name="status"
                                                    class="custom-switch-input" {{ old('status') == 1 ? 'checked' : '' }}>
                                                <span class="custom-switch-indicator"></span>
                                                <span class="custom-switch-description">{{ __('Status') }}</span>
                                            </label>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="text-center col-md-12">
                                            <x-admin.save-button :text="__('Save')"></x-admin.save-button>
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
    <script src="{{ asset('backend/js/jquery.uploadPreview.min.js') }}"></script>
    <script>
	// Mystic Forms
        let mysticFormIndex = 0;
        document.getElementById('add_mystic_form').addEventListener('click', function () {
            mysticFormIndex++;
            const container = document.getElementById('mystic_forms_container');
            const newFormGroup = document.createElement('div');
            newFormGroup.className = 'mystic-form-group mb-3 border p-3';
            newFormGroup.innerHTML = `
                <div class="form-group">
                    <label>{{ __('Title') }}</label>
                    <input type="text" class="form-control" name="mystic_forms[${mysticFormIndex}][title]">
                    @error('mystic_forms.${mysticFormIndex}.title')
                        <span class="text-danger error-message">{{ $message }}</span>
                    @enderror
                </div>
                <div class="form-group">
                    <label>{{ __('Description') }}</label>
                    <textarea class="form-control text-area-5" name="mystic_forms[${mysticFormIndex}][description]"></textarea>
                    @error('mystic_forms.${mysticFormIndex}.description')
                        <span class="text-danger error-message">{{ $message }}</span>
                    @enderror
                </div>
                <div class="form-group">
                    <label>{{ __('Image') }}</label>
                    <input type="file" class="form-control" name="mystic_forms[${mysticFormIndex}][image]" accept="image/avif,image/png,image/jpeg,image/jpg,image/webp">
                    @error('mystic_forms.${mysticFormIndex}.image')
                        <span class="text-danger error-message">{{ $message }}</span>
                    @enderror
                </div>
                <button type="button" class="btn btn-danger btn-sm remove-mystic-form">{{ __('Remove') }}</button>
            `;
            container.appendChild(newFormGroup);
        });

        document.getElementById('mystic_forms_container').addEventListener('click', function (e) {
            if (e.target.classList.contains('remove-mystic-form')) {
                e.target.closest('.mystic-form-group').remove();
            }
        });

        // Gadgets & Attacks
        let gadgetAttackIndex = 0;
        document.getElementById('add_gadget_attack').addEventListener('click', function () {
            gadgetAttackIndex++;
            const container = document.getElementById('gadgets_attacks_container');
            const newGadgetGroup = document.createElement('div');
            newGadgetGroup.className = 'gadget-attack-group mb-3 border p-3';
            newGadgetGroup.innerHTML = `
                <div class="form-group">
                    <label>{{ __('Title') }}</label>
                    <input type="text" class="form-control" name="gadgets_attacks[${gadgetAttackIndex}][title]">
                    @error('gadgets_attacks.${gadgetAttackIndex}.title')
                        <span class="text-danger error-message">{{ $message }}</span>
                    @enderror
                </div>
                <div class="form-group">
                    <label>{{ __('Description') }}</label>
                    <textarea class="form-control text-area-5" name="gadgets_attacks[${gadgetAttackIndex}][description]"></textarea>
                    @error('gadgets_attacks.${gadgetAttackIndex}.description')
                        <span class="text-danger error-message">{{ $message }}</span>
                    @enderror
                </div>
                <div class="form-group">
                    <label>{{ __('Image') }}</label>
                    <input type="file" class="form-control" name="gadgets_attacks[${gadgetAttackIndex}][image]" accept="image/avif,image/png,image/jpeg,image/jpg,image/webp">
                    @error('gadgets_attacks.${gadgetAttackIndex}.image')
                        <span class="text-danger error-message">{{ $message }}</span>
                    @enderror
                </div>
                <button type="button" class="btn btn-danger btn-sm remove-gadget-attack">{{ __('Remove') }}</button>
            `;
            container.appendChild(newGadgetGroup);
        });

        document.getElementById('gadgets_attacks_container').addEventListener('click', function (e) {
            if (e.target.classList.contains('remove-gadget-attack')) {
                e.target.closest('.gadget-attack-group').remove();
            }
        });
		
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
    <script>
        (function($) {
            "use strict";
            $(document).ready(function() {
                $("#title").on("keyup", function(e) {
                    $("#slug").val(convertToSlug($(this).val()));
                })
            });
        })(jQuery);

        function convertToSlug(Text) {
            return Text
                .toLowerCase()
                .replace(/[^\w ]+/g, '')
                .replace(/ +/g, '-');
        }
    </script>
@endpush
