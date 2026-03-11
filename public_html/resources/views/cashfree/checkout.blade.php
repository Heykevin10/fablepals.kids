@extends('frontend.layouts.master')

@section('meta_title', $seo_setting['shop_page']['seo_title'])
@section('meta_description', $seo_setting['shop_page']['seo_description'])
@push('custom_meta')
    <meta property="og:title" content="{{ $seo_setting['shop_page']['seo_title'] }}" />
    <meta property="og:description" content="{{ $seo_setting['shop_page']['seo_description'] }}" />
    <meta property="og:image" content="{{ asset($setting?->shop_page_breadcrumb_image) }}" />
    <meta property="og:URL" content="{{ url()->current() }}" />
    <meta property="og:type" content="website" />
	
	<style>
		.btn.add-to-cart-btn {
		  padding: 11px 16px;
		  right: 65px !important;
		  width: 182px !important;
		  background: #000 !important;
		  color: #fff !important;
		  border-color: #000 !important;
		}
		input{
			border: 1px solid #cccccc!important;
		}
	<!-- Add this CSS for better form styling -->

    .form-control, .form-select {
        border-radius: 10px;
        border: 2px solid #e9ecef;
        padding: 0.75rem 1rem;
        font-size: 1rem;
        transition: all 0.2s ease;
    }
    
    .form-control-lg {
        min-height: 56px;
    }
    
    .form-control:focus, .form-select:focus {
        border-color: #0d6efd;
        box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.15);
        transform: translateY(-1px);
    }
    
    .form-label {
        font-size: 0.875rem;
        font-weight: 500;
        margin-bottom: 0.5rem;
        display: block;
    }
    
    .card {
        border-radius: 16px;
        overflow: hidden;
    }
    
    .border-bottom {
        border-bottom: 2px solid #f1f3f5 !important;
    }
    
    .sticky-top {
        z-index: 1020;
    }
    
    .input-group-text {
        border-radius: 10px 0 0 10px !important;
        font-weight: 500;
    }
    
    .alert-light {
        background-color: #f8f9fa;
        border-color: #e9ecef;
    }
    
    /* Improve spacing for better readability */
    .row.g-3 > [class*="col-"] {
        margin-bottom: 1rem;
    }
    
    /* Better scrollbar for cart items */
    .checkout-cart-items::-webkit-scrollbar {
        width: 6px;
    }
    
    .checkout-cart-items::-webkit-scrollbar-track {
        background: #f1f1f1;
        border-radius: 10px;
    }
    
    .checkout-cart-items::-webkit-scrollbar-thumb {
        background: #c1c1c1;
        border-radius: 10px;
    }
    
    .checkout-cart-items::-webkit-scrollbar-thumb:hover {
        background: #a8a8a8;
    }
    
    @media (max-width: 992px) {
        .sticky-top {
            position: static !important;
        }
        
        .card-body {
            padding: 1.5rem !important;
        }
        
        .form-control-lg {
            min-height: 50px;
        }
    }
    
    @media (max-width: 768px) {
        .container {
            padding-left: 15px;
            padding-right: 15px;
        }
        
        .form-control, .form-select {
            padding: 0.625rem 0.875rem;
        }
    }
</style>
	
@endpush

@section('header')
    @include('frontend.layouts.header-layout.three')
@endsection

@section('contents')
    <!-- Breadcumb -->
    <x-breadcrumb :image="$setting?->shop_page_breadcrumb_image" :title="__('Checkout')" />

<div class="container py-4 py-lg-5">
    <div class="row justify-content-center">
        <div class="col-xl-12">
            <!-- Page Header -->
            <div class="mb-4 mb-md-5">
                <h2 class="fw-bold mb-2">Complete Your Purchase</h2>
                <p class="text-muted mb-0">Review your items and enter your details to proceed with payment</p>
            </div>

            <div class="row g-4 g-lg-5">
                <!-- Left Column: Checkout Form (Wider Column) -->
                <div class="col-lg-8">
                    <div class="card border-0 shadow-sm mb-4">
                        <div class="card-body p-4 p-md-5">
                            <!-- Form Header -->
                            <div class="mb-5">
                                <h4 class="fw-semibold mb-3">
                                    <i class="bi bi-person-circle me-2"></i>Customer Information
                                </h4>
                                <div class="alert alert-light border py-3 mb-0" role="alert">
                                    <div class="d-flex align-items-center">
                                        <i class="bi bi-info-circle-fill text-primary me-2"></i>
                                        <small class="fw-medium">Please fill in your details carefully. All fields marked with * are required.</small>
                                    </div>
                                </div>
                            </div>

                            <!-- Checkout Form -->
                            <form id="payment-form">
                                @csrf

                                <!-- Contact Details Section -->
                                <div class="mb-5">
                                    <h5 class="fw-semibold mb-4 pb-2 border-bottom">Contact Details</h5>
                                    
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <label class="form-label fw-medium mb-2">First Name <span class="text-danger">*</span></label>
                                            @php
                                                $userName = explode(' ', $user->name);
                                            @endphp
                                            <input type="text"
                                                   class="form-control form-control-lg"
                                                   name="first_name"
                                                   value="{{ $userName[0] }}"
                                                   required
                                                   placeholder="Enter your first name">
                                        </div>
                                        
                                        <div class="col-md-6">
                                            <label class="form-label fw-medium mb-2">Last Name <span class="text-danger">*</span></label>
                                            <input type="text"
                                                   class="form-control form-control-lg"
                                                   name="last_name"
                                                   value="{{ !empty($userName[1]) ? $userName[1] : '' }}"
                                                   required
                                                   placeholder="Enter your last name">
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label fw-medium mb-2">Mobile Number <span class="text-danger">*</span></label>
                                            <div class="input-group input-group-lg">
                                                <span class="input-group-text bg-light border-end-0">+91</span>
                                                <input type="tel"
                                                       class="form-control"
                                                       name="customer_phone"
                                                       value="{{ $user->phone }}"
                                                       required
                                                       placeholder="Enter 10-digit mobile number">
                                            </div>
                                            <small class="text-muted mt-1 d-block">We'll send order updates to this number</small>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label fw-medium mb-2">Email Address <span class="text-danger">*</span></label>
                                            <input type="email"
                                                   class="form-control form-control-lg"
                                                   name="customer_email"
                                                   value="{{ !empty($user->email) ? $user->email : '' }}"
                                                   required
                                                   placeholder="Enter your email address">
                                            <small class="text-muted mt-1 d-block">Order confirmation will be sent here</small>
                                        </div>
                                    </div>
                                </div>

                                <!-- Shipping Address Section -->
                                <div class="mb-5">
                                    <h5 class="fw-semibold mb-4 pb-2 border-bottom">Shipping Address</h5>
                                    
                                    <div class="row g-3">
                                        <div class="col-12">
                                            <label class="form-label fw-medium mb-2">Address Line 1 <span class="text-danger">*</span></label>
                                            <input type="text"
                                                   class="form-control form-control-lg"
                                                   name="address_line1"
                                                   value="{{ !empty($address->shipping_address) ? $address->shipping_address : '' }}"
                                                   required
                                                   placeholder="House no., Building, Street, Area">
                                        </div>

                                        <div class="col-12">
                                            <label class="form-label fw-medium mb-2">Address Line 2 (Optional)</label>
                                            <input type="text"
                                                   class="form-control form-control-lg"
                                                   name="address_line2"
                                                   placeholder="Landmark, Floor, Suite, etc.">
                                        </div>

                                        <div class="col-md-4">
                                            <label class="form-label fw-medium mb-2">City <span class="text-danger">*</span></label>
                                            <input type="text"
                                                   class="form-control form-control-lg"
                                                   name="city"
                                                   value="{{ !empty($address->shipping_city) ? $address->shipping_city : '' }}"
                                                   required
                                                   placeholder="Enter city">
                                        </div>

                                        <div class="col-md-4">
                                            <label class="form-label fw-medium mb-2">State <span class="text-danger">*</span></label>
                                            <input type="text"
                                                   class="form-control form-control-lg"
                                                   name="state"
                                                   value="{{ !empty($address->shipping_state) ? $address->shipping_state : '' }}"
                                                   required
                                                   placeholder="Enter state">
                                        </div>

                                        <div class="col-md-4">
                                            <label class="form-label fw-medium mb-2">Pincode <span class="text-danger">*</span></label>
                                            <input type="text"
                                                   class="form-control form-control-lg"
                                                   name="pincode"
                                                   value="{{ !empty($address->shipping_zip_code) ? $address->shipping_zip_code : '' }}"
                                                   required
                                                   placeholder="6-digit pincode">
                                        </div>
                                    </div>
                                </div>

                                <!-- Order Notes -->
                                <div class="mb-5">
                                    <h5 class="fw-semibold mb-4 pb-2 border-bottom">Additional Information</h5>
                                    <div class="col-12">
                                        <label class="form-label fw-medium mb-2">Order Notes (Optional)</label>
                                        <textarea name="order_note"
                                                  class="form-control"
                                                  rows="4"
                                                  placeholder="Any special instructions for delivery, preferred delivery time, gift wrapping requests, etc."></textarea>
                                        <small class="text-muted mt-1 d-block">Maximum 500 characters</small>
                                    </div>
                                </div>

                                <!-- Hidden Fields -->
                                <input type="hidden" name="country" value="India">
                                <input type="hidden" name="billing_same_as_shipping" value="1">

                                <!-- Form Divider -->
                                <div class="border-top pt-5"></div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Right Column: Order Summary (Narrower Column) -->
                <div class="col-lg-4">
                    <div class="card border-0 shadow-sm order-summary-sticky">
                        <div class="card-body p-4">
                            <!-- Order Summary Header -->
                            <h5 class="fw-semibold mb-4">
                                <i class="bi bi-receipt me-2"></i>Order Summary
                            </h5>

                            <!-- Cart Items Preview -->
                            <div class="mb-4">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <span class="text-muted">{{ Cart::count() }} items in cart</span>
                                    <a href="{{ route('cart') }}" class="btn btn-sm btn-outline-primary">
                                        <i class="bi bi-pencil-square me-1"></i>Edit
                                    </a>
                                </div>
                                
                                <div class="checkout-cart-items" style="max-height: 300px; overflow-y: auto;">
                                    @forelse (Cart::content() as $item)
                                        <div class="d-flex align-items-center mb-3 pb-3 border-bottom">
                                            <img src="{{ asset($item?->options?->image) }}"
                                                 alt="{{ $item?->name }}"
                                                 class="rounded-2 me-3"
                                                 style="width: 60px; height: 60px; object-fit: cover;">
                                            
                                            <div class="flex-grow-1">
                                                <div class="fw-medium mb-1">{{ Str::limit($item->name, 40) }}</div>
                                                <div class="small text-muted">
                                                    Qty: {{ $item->qty }}
                                                    @if ($item?->options?->sale_price)
                                                        <span class="ms-2 fw-medium">{{ currency($item->price) }} each</span>
                                                    @endif
                                                </div>
                                            </div>
                                            
                                            <div class="text-end">
                                                <div class="fw-semibold">{{ currency($item->price * $item->qty) }}</div>
                                            </div>
                                        </div>
                                    @empty
                                        <div class="text-center py-4">
                                            <i class="bi bi-cart-x text-muted display-6 mb-3"></i>
                                            <p class="text-muted mb-0">Your cart is empty</p>
                                        </div>
                                    @endforelse
                                </div>
                            </div>

                            <!-- Order Total -->
                            <div class="bg-light rounded-3 p-4 mb-4">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="text-muted">Subtotal</span>
                                    <span class="fw-medium">₹ {{ number_format($amount, 2) }}</span>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="text-muted">Shipping</span>
                                    <span class="fw-medium text-success">FREE</span>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="text-muted">Tax</span>
                                    <span class="fw-medium">Included</span>
                                </div>
                                <hr class="my-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="fw-bold fs-5">Total Amount</span>
                                    <span class="fw-bold fs-4 text-primary">₹ {{ number_format($amount, 2) }}</span>
                                </div>
                            </div>

                            <!-- Security Assurance -->
                            <div class="alert alert-success border-0 mb-4" role="alert">
                                <div class="d-flex">
                                    <i class="bi bi-shield-check display-6 me-3"></i>
                                    <div>
                                        <h6 class="alert-heading fw-bold mb-1">Secure Payment</h6>
                                        <small class="d-block mb-1">Your payment information is encrypted</small>
                                        <small class="text-muted">256-bit SSL secured connection</small>
                                    </div>
                                </div>
                            </div>

                            <!-- Payment Button -->
                            <button type="submit"
                                    form="payment-form"
                                    id="pay-btn"
                                    class="btn btn-primary btn-lg w-100 py-3 fw-bold mb-3">
                                <i class="bi bi-lock-fill me-2"></i>
                                Pay ₹ {{ number_format($amount, 2) }}
                            </button>

                            <div class="text-center">
                                <small class="text-muted">
                                    By completing your purchase, you agree to our 
                                    <a href="#" class="text-decoration-none">Terms & Conditions</a>
                                </small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Error Message Container -->
            <div id="msg" class="mt-4"></div>
        </div>
    </div>
</div>


	@if($show_name_modal)
	<div class="modal fade"
     id="userModal"
     tabindex="-1"
     aria-labelledby="userModalLabel"
     aria-hidden="true"
     data-bs-backdrop="static"
     data-bs-keyboard="false">

	  <div class="modal-dialog">
		<div class="modal-content">

		  <div class="modal-header">
			<h1 class="modal-title fs-5" id="userModalLabel">
			  Fill the required detail
			</h1>
		  </div>

		  <form id="userForm">
			@csrf

			<div class="modal-body">
			  <div class="mb-3">
				<label>Full Name</label>
				<input name="name"
					   class="form-control"
					   placeholder="Enter full name"
					   style="border: 1px solid #ccc"
					   required>
			  </div>
			</div>

			<div class="modal-footer">
			  <button type="submit" class="btn btn-primary">
				Save changes
			  </button>
			</div>

		  </form>

		</div>
	  </div>
	</div>

	@endif

    @include('frontend.partials.marquee')

@endsection

@section('footer')
    @include('frontend.layouts.footer-layout.two')
@endsection

@push('js')
<script src="https://sdk.cashfree.com/js/v3/cashfree.js"></script>
@if($show_name_modal)
			<script>
				$(document).ready(function(){
					$('#userModal').modal('show');
				});
				$('#userForm').submit(function(e){
					e.preventDefault();

					let formData = new FormData(this);

					$.ajax({
						url: "{{ route('user.save') }}",
						type: "POST",
						data: formData,
						processData: false,
						contentType: false,
						success: function (res) {
							if (res.success) {
								location.reload();
							}
						},
						error: function () {
							alert('Something went wrong');
						}
					});
				});
			</script>
		@endif
<script>
const cashfree = Cashfree({
    mode: "{{ config('services.cashfree.env') === 'production' ? 'production' : 'sandbox' }}"
});

$('#payment-form').on('submit', function (e) {
	e.preventDefault();
    let btn = $('#pay-btn');
    btn.prop('disabled', true).text('Processing...');

    $('#msg').text('');

    $.ajax({
        url: "{{ route('cashfree.createOrder') }}",
        type: "POST",
        data: $('#payment-form').serialize(),
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        success: function (res) {
            if (res.status === 'ok') {
                cashfree.checkout({
                    paymentSessionId: res.payment_session,
                    redirectTarget: "_self"
                });
            } else {
                $('#msg').text(res.message || 'Unable to create order.');
                btn.prop('disabled', false).text('Pay Securely');
            }
        },
        error: function (xhr) {
            $('#msg').text('Something went wrong. Please try again.');
            btn.prop('disabled', false).text('Pay Securely');
        }
    });
});
</script>

	
@endpush

