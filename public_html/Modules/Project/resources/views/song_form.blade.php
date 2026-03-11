@extends('admin.master_layout')
@section('title')
    <title>{{ __('Create Project') }}</title>
@endsection
@section('admin-content')
    <div class="main-content">
        <section class="section">
            <x-admin.breadcrumb title="{{ __('Save Song') }}" :list="[
                __('Dashboard') => route('admin.dashboard'),
                __('Song List') => route('admin.song.list'),
                __('Save Song') => '#',
            ]" />
            <div class="section-body">
                <div class="mt-4 row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between">
                                <x-admin.form-title :text="__('Save Song')" />
                                <div>
                                    <x-admin.back-button :href="route('admin.song.list')" />
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="{{ route('admin.song.save') }}" method="POST" enctype="multipart/form-data">
									@csrf
									<input type="hidden" name="id" value="{{ $section->id ?? '' }}">
									<input type="hidden" name="file_path" value="{{ $section->file ?? '' }}">

									<div class="row">
										<div class="col-md-6 mb-3">
											<label class="form-label">Title</label>
											<input type="text" name="title" class="form-control"
												   value="{{ old('title', $section->title ?? '') }}" required>
										</div>
										<div class="col-md-6 mb-3">
											<label class="form-label">Artist</label>
											<select class="form-control" name="artist_id" required>
												<option value="">Select</option>
												@foreach($artists as $item)
													<option value="{{$item->id}}" @if(!empty($section->artist_id)) {{$section->artist_id==$item->id?'selected':''}} @endif>{{$item->name}}</option>
												@endforeach
											</select>
										</div>
										<div class="col-md-4 mb-3">
											<label for="minutes" class="form-label">Minutes</label>
											<input type="number" 
												   class="form-control" 
												   id="minutes" 
												   name="minutes" 
												   min="0" 
												   max="59" 
												   value="{{ old('minutes', $section->minutes ?? '') }}"
												   required>
										</div>
										<div class="col-md-4 mb-3">
											<label for="seconds" class="form-label">Seconds</label>
											<input type="number" 
												   class="form-control" 
												   id="seconds" 
												   name="seconds" 
												   min="0" 
												   max="59" 
												   value="{{ old('seconds', $section->seconds ?? '') }}"
												   required>
										</div>
										<div class="col-md-4 mb-3">
											<label class="form-label">Total Duration</label>
											<div class="form-control bg-light" id="duration-display">
											{{!empty($section->minutes)?$section->minutes:''}}:{{!empty($section->seconds)?$section->seconds:''}}
											</div>
											<input type="hidden" name="duration_seconds" id="duration_seconds" value="225">
										</div>
										<div class="col-md-6 mb-3">
											<label class="form-label">Playlist</label>
											<select class="form-control" name="playlist_id" required>
												<option value="">Select</option>
												@foreach($playlists as $item)
													<option value="{{$item->id}}" @if(!empty($section->playlist_id)) {{$section->playlist_id==$item->id?'selected':''}} @endif>{{$item->name}}</option>
												@endforeach
											</select>
										</div>
										<div class="col-md-6 mb-3">
											<label class="form-label">Song</label>
											<input type="file" name="song" class="form-control" @if(empty($section->id)) required @endif>
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
    <script>
	document.addEventListener('DOMContentLoaded', function() {
		const minutesInput = document.getElementById('minutes');
		const secondsInput = document.getElementById('seconds');
		const durationDisplay = document.getElementById('duration-display');
		const durationSeconds = document.getElementById('duration_seconds');
		
		function updateDuration() {
			const minutes = parseInt(minutesInput.value) || 0;
			const seconds = parseInt(secondsInput.value) || 0;
			const totalSeconds = (minutes * 60) + seconds;
			
			durationDisplay.textContent = `${minutes}:${seconds.toString().padStart(2, '0')}`;
			durationSeconds.value = totalSeconds;
		}
		
		minutesInput.addEventListener('input', updateDuration);
		secondsInput.addEventListener('input', updateDuration);
	});
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
