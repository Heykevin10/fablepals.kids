@extends('admin.master_layout')
@section('title')
    <title>{{ __('Edit Product') }}</title>
@endsection
@section('admin-content')
    <div class="main-content">
        <section class="section">
            <x-admin.breadcrumb title="{{ __('Edit Product') }}" :list="[
                __('Dashboard') => route('admin.dashboard'),
                __('Product List') => route('admin.product.index'),
                __('Edit Product') => '#',
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
                                                href="{{ route('admin.product.edit', ['product' => $product->id, 'code' => $language->code]) }}"><i
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
                @include('shop::Product.utilities.navbar')
            @endif

            <div class="section-body">
                <div class="mt-4 row">
                    <form class="col-12"
                        action="{{ route('admin.product.update', [
                            'product' => $product->id,
                            'code' => $code,
                        ]) }}"
                        method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            <div class="@if ($code == $languages->first()->code) col-md-8 @else col-12 @endif">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>{{ __('Title') }} <span class="text-danger">*</span></label>
                                            <input data-translate="true" type="text" id="title" class="form-control"
                                                name="title" value="{{ $product?->getTranslation($code)?->title }}">
                                            @error('title')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label>{{ __('Short Description') }}</label>
                                            <textarea maxlength="500" name="short_description" id="" cols="30" rows="10"
                                                class="form-control text-area-5" data-translate="true">{{ $product?->getTranslation($code)?->short_description }}</textarea>
                                            @error('short_description')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label>{{ __('Description') }} <span class="text-danger">*</span></label>
                                            <textarea name="description" data-translate="true" cols="30" rows="10" class="summernote">{{ $product?->getTranslation($code)?->description }}</textarea>
                                            @error('description')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label>{{ __('SEO Title') }}</label>
                                            <input data-translate="true" type="text" class="form-control"
                                                name="seo_title"
                                                value="{{ $product?->getTranslation($code)?->seo_title }}">
                                            @error('seo_title')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group">
                                            <label>{{ __('SEO Description') }}</label>
                                            <textarea maxlength="1000" data-translate="true" name="seo_description" id="" cols="30" rows="10"
                                                class="form-control text-area-5">{{ $product?->getTranslation($code)?->seo_description }}</textarea>
                                            @error('seo_description')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <a class="btn btn-primary collapsed" data-bs-toggle="collapse"
                                                href="#collapseExample" role="button" aria-expanded="false"
                                                aria-controls="collapseExample">
                                                {{ __('Additional Information') }} <i class="fa fa-plus"></i>
                                            </a>
                                            <div class="collapse mt-3" id="collapseExample">
                                                <div class="form-group">
                                                    <label>{{ __('Information') }} <span
                                                            class="text-danger">*</span></label>
                                                    <textarea name="additional_description" id="" cols="20" rows="8" class="summernote"
                                                        data-translate="true">{{ $product?->getTranslation($code)?->additional_description }}</textarea>
                                                    @error('additional_description')
                                                        <span class="text-danger error-message">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 {{ $code == $languages->first()->code ? '' : 'd-none' }}">
                                <div class="card">
                                    <div class="card-body">
                                        <input type="hidden" name="type" value="{{ $product->type }}">
                                        <div class="form-group {{ $is_digital ? '' : 'd-none' }}">
                                            <label for="myDropzone">{{ __('File') }} </label>
                                            <div class="dropzone mb-2" id="myDropzone">
                                                <div class="dz-message d-flex flex-column">
                                                    <div class="img">
                                                        <img src="{{ asset('frontend/images/upload_2.png') }}"
                                                            alt="{{ __('Upload') }}" width="60px"
                                                            class="img-fluid h-auto">
                                                    </div>
                                                    <label>{{ __('Only .zip file is allowed. Drag & drop to upload.') }}
                                                    </label>
                                                </div>
                                            </div>
                                            <input type="text" id="file_path" class="form-control" name="file_path"
                                                value="{{ old('file_path', $product->file_path) }}" readonly>
												@if(!empty($product->file_path))
												<button type="button" class="btn btn-sm btn-danger mt-2 delete-zip" 
														data-id="{{ $product->id }}">
													Delete Zip
												</button>
												@endif
                                            @error('file_path')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>
										
										<div class="form-group">
											<label>{{ __('Files') }}</label>
											<input type="file" class="form-control" name="product_files[]" 
												   accept="image/*,.pdf" multiple>
											@error('product_files')
												<span class="text-danger error-message">{{ $message }}</span>
											@enderror
										</div>
										
										<!-- Existing Files Preview -->
										<div class="form-group">
											<label>{{ __('Uploaded Files') }}</label>
											<div class="row">
												@php
													$files = DB::table('product_files')->where('product_id', $product->id)->get();
												@endphp

												@foreach ($files as $file)
													<div class="col-md-3 mb-3 file-item" id="file-{{ $file->id }}">
														@if ($file->file_type == 'image')
															<a href="{{ asset($file->file_path) }}" target="_blank">
																<img src="{{ asset($file->file_path) }}" 
																	 class="img-thumbnail" style="max-height:120px;">
															</a>
														@else
															<a href="{{ asset($file->file_path) }}" target="_blank">
																<i class="fa fa-file-pdf-o fa-3x text-danger"></i><br>
																{{ basename($file->file_path) }}
															</a>
														@endif
														<button type="button" class="btn btn-sm btn-danger mt-2 delete-file" 
																data-id="{{ $file->id }}">
															Delete
														</button>
													</div>
												@endforeach
											</div>
										</div>
										
                                        <div class="form-group">
                                            <x-admin.form-image-preview :image="$product->image" required="0" />
                                        </div>

                                        <div class="form-group">
                                            <label>{{ __('SKU') }} <span class="text-danger">*</span></label>
                                            <input type="text" id="sku" class="form-control" name="sku"
                                                value="{{ $product->sku }}">
                                            @error('sku')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        @if (!$is_digital)
                                            <div class="form-group">
                                                <label>{{ __('Quantity') }} <span class="text-danger">*</span></label>
                                                <input type="number" id="qty" class="form-control" name="qty"
                                                    value="{{ $product->qty }}">
                                            </div>
                                        @endif
                                        <div class="form-group">
                                            <label>{{ __('Regular Price') }} <span class="text-danger">*</span></label>
                                            <input type="number" step="0.1" id="price" class="form-control"
                                                name="price" value="{{ $product->price }}">
                                            @error('price')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label>{{ __('Sale Price') }}</label>
                                            <input type="number" step="0.1" id="sale_price" class="form-control"
                                                name="sale_price" value="{{ $product?->sale_price }}">
                                            @error('sale_price')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group">
                                            <label>{{ __('Category') }} <span class="text-danger">*</span></label>
                                            <select name="product_category_id" class="form-control select2"
                                                id="category">
                                                <option value="">{{ __('Select Category') }}</option>
                                                @foreach ($categories as $category)
                                                    <option
                                                        {{ $category->id == old('product_category_id', $product->product_category_id) ? 'selected' : '' }}
                                                        value="{{ $category->id }}">{{ $category->title }}</option>
                                                @endforeach
                                            </select>
                                            @error('product_category_id')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>
										
										
										<div class="form-group">
											<label>{{ __('Fabworld') }}</label>
											<select name="fabworld_id" class="form-control select2">
												<option value="">{{ __('Select Category') }}</option>
												@foreach ($fabworlds as $fabworld)
													<option value="{{ $fabworld->id }}" 
														{{ $fabworld->id == $product->fabworld_id ? 'selected' : '' }}>
														{{ $fabworld->title }}
													</option>
												@endforeach
											</select>
											@error('fabworld_id')
												<span class="text-danger error-message">{{ $message }}</span>
											@enderror
										</div>

										<div class="form-group">
											<label>{{ __('Characters') }}</label>
											<select name="character_id" class="form-control select2">
												<option value="">{{ __('Select Category') }}</option>
												@foreach ($characters as $character)
													<option value="{{ $character->id }}" 
														{{ $character->id == $product->character_id ? 'selected' : '' }}>
														{{ $character->title }}
													</option>
												@endforeach
											</select>
											@error('character_id')
												<span class="text-danger error-message">{{ $message }}</span>
											@enderror
										</div>

                                        <div class="form-group">
                                            <label>
                                                <input {{ $product->is_popular == 0 ? 'checked' : '' }} type="hidden"
                                                    value="0" name="is_popular" class="custom-switch-input">
                                                <input {{ $product->is_popular == 1 ? 'checked' : '' }} type="checkbox"
                                                    value="1" name="is_popular" class="custom-switch-input">
                                                <span class="custom-switch-indicator"></span>
                                                <span
                                                    class="custom-switch-description">{{ __('Mark as a Popular') }}</span>
                                            </label>
                                        </div>

                                        <div class="form-group">
                                            <label>
                                                <input {{ $product->is_new == 0 ? 'checked' : '' }} type="hidden"
                                                    value="0" name="is_new" class="custom-switch-input">
                                                <input type="checkbox" value="1" name="is_new"
                                                    class="custom-switch-input"
                                                    {{ $product->is_new == 1 ? 'checked' : '' }}>
                                                <span class="custom-switch-indicator"></span>
                                                <span class="custom-switch-description">{{ __('Mark as a New') }}</span>
                                            </label>
                                        </div>

                                        <div class="form-group">
                                            <label>
                                                <input type="hidden" value="0" name="status"
                                                    class="custom-switch-input">
                                                <input {{ $product->status == 1 ? 'checked' : '' }} type="checkbox"
                                                    value="1" name="status" class="custom-switch-input">
                                                <span class="custom-switch-indicator"></span>
                                                <span class="custom-switch-description">{{ __('Status') }}</span>
                                            </label>
                                        </div>

                                        <div class="form-group">
                                            <label>{{ __('Tags') }}</label>
                                            <input type="text" class="form-control tags" name="tags"
                                                value="{{ $product->tags }}">
                                            @error('tags')
                                                <span class="text-danger error-message">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="text-center col-md-12">
                                <x-admin.save-button :text="__('Update')" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </section>
    </div>
@endsection

@push('js')
    @if ($code == $languages->first()->code)
        <script src="{{ asset('backend/js/jquery.uploadPreview.min.js') }}"></script>
        <script>
            "use strict";
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
    @if ($is_digital)
        <script src="{{ asset('backend/dropzone/dropzone.min.js') }}"></script>
        <script>
            const csrfToken = $('meta[name="csrf-token"]').attr("content");
            var old_file_path = "{{ $product->file_path }}";
            Dropzone.autoDiscover = false;

            const dz = new Dropzone("#myDropzone", {
                url: "{{ route('admin.product.file-store') }}",
                method: "post",
                chunking: true,
                forceChunking: true,
                parallelUploads: 1,
                maxFiles: 1,
                acceptedFiles: ".zip",
                chunkSize: Math.min("{{ server_max_upload_size() }}", 2 * 1024 * 1024),
                retryChunks: true,
                retryChunksLimit: 3,
                addRemoveLinks: true,
                headers: {
                    'X-CSRF-TOKEN': csrfToken
                },
                init() {
                    this.on("success", (file, response) => handleUploadSuccess(file, response));
                    this.on("error", (file, errorMessage, xhr) => handleUploadError(file, errorMessage, xhr));
                    this.on("removedfile", () => deleteFile());
                },
                params(files, xhr, chunk) {
                    return {
                        dzuuid: chunk.file.upload.uuid,
                        dzchunkindex: chunk.index,
                        dztotalfilesize: chunk.file.size,
                        dzchunksize: this.options.chunkSize,
                        dztotalchunkcount: chunk.file.upload.totalChunkCount,
                        dzchunkbyteoffset: chunk.index * this.options.chunkSize,
                    };
                },
            });

            function handleUploadSuccess(file, response) {
                toastr[response.success ? "success" : "warning"](response.message);
                $('#file_path').val(response.filename);
            }

            function handleUploadError(file, errorMessage, xhr) {
                let message = "{{ __('Upload failed') }}";
                if (xhr?.response) {
                    try {
                        const response = JSON.parse(xhr.response);
                        message = response.message || "{{ __('Upload failed due to a server error.') }}";
                    } catch (e) {
                        message = errorMessage;
                    }
                }
                toastr.error(message);
                updateProgressBar(file.upload.uuid, false);
            }


            function deleteFile() {
                let filename = $('#file_path').val();
                filename = filename.split('/').pop();
                if (filename) {
                    $.ajax({
                        type: "delete",
                        headers: {
                            'X-CSRF-TOKEN': csrfToken
                        },
                        url: "{{ route('admin.product.file-remove', 'file_name') }}".replace('file_name',
                            encodeURIComponent(filename)),
                        success: function(response) {
                            $('#file_path').val(old_file_path);
                        },
                    });
                }
            }
			
        </script>
    @endif
	<script>
	$(document).on('click', '.delete-file', function () {
				var fileId = $(this).data('id');
				var token = "{{ csrf_token() }}";

				if(confirm("Are you sure you want to delete this file?")) {
					$.ajax({
						url: "{{ route('admin.product.deleteFile') }}",
						type: "POST",
						data: {
							_token: token,
							id: fileId
						},
						success: function (response) {
							if (response.success) {
								$("#file-" + fileId).remove();
							} else {
								alert("Error deleting file");
							}
						},
						error: function () {
							alert("Something went wrong!");
						}
					});
				}
			});
			
	$(document).on('click', '.delete-zip', function () {
				var fileId = $(this).data('id');
				var token = "{{ csrf_token() }}";

				if(confirm("Are you sure you want to delete this file?")) {
					$.ajax({
						url: "{{ route('admin.product.deleteZip') }}",
						type: "POST",
						data: {
							_token: token,
							id: fileId
						},
						success: function (response) {
							if (response.success) {
								location.reload();
							} else {
								alert("Error deleting file");
							}
						},
						error: function () {
							alert("Something went wrong!");
						}
					});
				}
			});
	</script>
@endpush
@if ($is_digital)
    @push('css')
        <link rel="stylesheet" href="{{ asset('backend/dropzone/dropzone.min.css') }}">
        <style>
            .dropzone {
                min-height: auto;
                padding: 0;
            }

            .dropzone label {
                font-size: 16px
            }

            .dropzone .dz-message {
                margin: .5rem 0;
            }
        </style>
    @endpush
@endif
