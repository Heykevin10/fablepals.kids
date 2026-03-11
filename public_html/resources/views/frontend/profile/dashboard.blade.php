@extends('frontend.layouts.master')

@section('meta_title', __('Dashboard') . ' || ' . $setting->app_name)

@section('header')
    @include('frontend.layouts.header-layout.three')
@endsection

@section('contents')
    <!-- Breadcumb Area -->
    <x-breadcrumb :title="__('Dashboard')" />

    <!--  Dashboard Area -->
    <section class="wsus__dashboard_profile wsus__dashboard">
        <div class="container">
            <div class="row">
                <!--  Sidebar Area -->
                @include('frontend.profile.partials.sidebar')
                <!--  Main Content Area -->
                <div class="col-lg-8 col-xl-9">
                    <div class="wsus__dashboard_main_contant">
                        <div class="row">
                            @if ($setting->is_shop == 1)
                            <div class="col-md-6 col-xl-4 mb_25">
                                <div class="wsus__profile_overview">
                                    <p><i class="fas fa-file-invoice-dollar"></i></p>
                                    <h4>{{ $user?->orders_sum_product_qty ?? 0 }}</h4>
                                    <p class="name">{{ __('Total Purchase Item') }}</p>
                                </div>
                                </div>
                                <div class="col-md-6 col-xl-4 mb_25">
                                    <div class="wsus__profile_overview green">
                                        <p><i class="fas fa-file-invoice-dollar"></i></p>
                                        <h4>{{ currency($user?->orders_sum_amount_usd) }}</h4>
                                        <p class="name">{{ __('Total Payment') }}</p>
                                    </div>
                                </div>
                                <div class="col-md-6 col-xl-4 mb_25">
                                    <div class="wsus__profile_overview orange">
                                        <p><i class="fas fa-bahai"></i></p>
                                        <h4>{{ $user?->product_reviews_count }}</h4>
                                        <p class="name">{{ __('Total Review') }}</p>
                                    </div>
                                </div>
                            @endif
                        </div>
                        <div class="wsus__profile_info">
                            <div class="wsus__profile_info_top">
                                <h4 >{{ __('Personal Information') }}</h4>
                                <a href="{{ route('user.profile.edit') }}" class="btn">
                                    <span class="link-effect">
                                        <span class="effect-1">{{ __('Edit Info') }}</span>
                                        <span class="effect-1">{{ __('Edit Info') }}</span>
                                    </span>
                                </a>
                            </div>

                            <div class="pi_grid">
        <div class="pi_col">
            <div class="pi_row">
                <span class="pi_label">{{ __('Name') }}:</span>
                <span class="pi_value">{{ $user?->name ?? '-' }}</span>
            </div>

            <div class="pi_row">
                <span class="pi_label">{{ __('Phone') }}:</span>
                <span class="pi_value">{{ $user?->phone ?? '-' }}</span>
            </div>

            <div class="pi_row">
                <span class="pi_label">{{ __('Email') }}:</span>
                <span class="pi_value text-lowercase">{{ $user?->email ?? '-' }}</span>
            </div>

            <div class="pi_row">
                <span class="pi_label">{{ __('Country') }}:</span>
                <span class="pi_value">{{ $user?->country?->name ?? '-' }}</span>
            </div>
        </div>

        <div class="pi_col">
            <div class="pi_row">
                <span class="pi_label">{{ __('Province') }}:</span>
                <span class="pi_value">{{ $user?->province ?? '-' }}</span>
            </div>

            <div class="pi_row">
                <span class="pi_label">{{ __('City') }}:</span>
                <span class="pi_value">{{ $user?->city ?? '-' }}</span>
            </div>

            <div class="pi_row">
                <span class="pi_label">{{ __('Zip code') }}:</span>
                <span class="pi_value">{{ $user?->zip_code ?? '-' }}</span>
            </div>

            <div class="pi_row">
                <span class="pi_label">{{ __('Address') }}:</span>
                <span class="pi_value">{{ $user?->address ?? '-' }}</span>
            </div>
        </div>
    </div>

</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	@php
		$show_name_modal = str_starts_with($user->name, 'User ');
	@endphp
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

    <!--  Marquee Area -->
    @include('frontend.partials.marquee')
@endsection
@section('footer')
    @include('frontend.layouts.footer-layout.two')
    
	@push('js')
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
	@endpush
@push('css')
<style>

/* =========================
   ULTRA DARK BACKGROUND
========================= */
.wsus__dashboard_profile {
    background: radial-gradient(circle at 20% 30%, #001a2e, #000814 50%, #000 100%);
    padding: 80px 0 100px 0 !important;
    position: relative;
    overflow: hidden;
}

/* Animated light glow background */
.wsus__dashboard_profile::before {
    content: "";
    position: absolute;
    width: 600px;
    height: 600px;
    background: radial-gradient(circle, rgba(0,255,255,0.15), transparent 70%);
    top: -200px;
    left: -200px;
    animation: floatGlow 8s infinite alternate ease-in-out;
}

@keyframes floatGlow {
    0% { transform: translate(0,0); }
    100% { transform: translate(100px,100px); }
}

/* =========================
   CARD PREMIUM STYLE
========================= */
.wsus__profile_overview {
    background: linear-gradient(145deg, #111, #1c1c1c);
    border-radius: 30px;
    padding: 50px 40px !important;
    text-align: center;
    color: #fff;
    position: relative;
    transition: 0.4s ease;
    box-shadow: 0 25px 50px rgba(0,0,0,0.7);
    overflow: hidden;
}

/* Strong Neon Border */
.wsus__profile_overview::before {
    content: "";
    position: absolute;
    inset: -2px;
    border-radius: 20px;
    padding: 2px;
    background: linear-gradient(45deg, #00f5ff, #ff00ff, #00ff88);
    -webkit-mask: 
        linear-gradient(#000 0 0) content-box, 
        linear-gradient(#000 0 0);
    -webkit-mask-composite: xor;
    mask-composite: exclude;
    opacity: 0;
    transition: 0.4s ease;
}

.wsus__profile_overview:hover::before {
    opacity: 1;
}

/* Floating effect */
.wsus__profile_overview:hover {
    transform: translateY(-15px) scale(1.04);
    box-shadow: 0 40px 80px rgba(0,255,255,0.3);
}

/* Icon glow */
.wsus__profile_overview i {
    font-size: 32px;
    color: #00f5ff;
    text-shadow: 0 0 25px #00f5ff;
    margin-bottom: 18px;
}

/* Number highlight */
.wsus__profile_overview h4 {
    font-size: 36px;
    font-weight: 800;
    letter-spacing: 1px;
}

/* =========================
   PERSONAL INFO PREMIUM
========================= */
.wsus__profile_info {
    background: linear-gradient(145deg, #111, #181818);
    border-radius: 30px;
    padding: 60px 60px;
    margin-top: 40px;
    color: #fff;
    box-shadow: 0 30px 70px rgba(0,0,0,0.7);
    position: relative;
    overflow: hidden;
}

/* Shine effect */
.wsus__profile_info::before {
    content: "";
    position: absolute;
    top: -100%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: linear-gradient(
        120deg,
        transparent 40%,
        rgba(0,255,255,0.1) 50%,
        transparent 60%
    );
    transform: rotate(25deg);
    animation: shineMove 6s infinite;
}

@keyframes shineMove {
    0% { top: -100%; }
    100% { top: 100%; }
}

.wsus__profile_info_top h4 {
    font-size: 32px;
    font-weight: 700;
    background: linear-gradient(45deg, #00f5ff, #ff00ff);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* Info list styling */
.wsus__profile_info ul li {
    padding: 16px 0;
    border-bottom: 1px solid rgba(255,255,255,0.1);
}

.wsus__profile_info ul li span {
    color: #00f5ff;
    font-weight: 600;
}

/* Edit button glow */
.wsus__profile_info .btn {
    background: linear-gradient(45deg, #00f5ff, #ff00ff);
    border-radius: 30px;
    padding: 12px 30px !important;
    font-weight: 600;
    color: #fff;
    transition: 0.3s;
}

.wsus__profile_info .btn:hover {
    box-shadow: 0 0 30px #00f5ff;
    transform: translateY(-3px);
}

/* Sidebar glow */
.wsus__dashboard_sidebar {
    background: #0e0e0e;
    border-radius: 25px;
    box-shadow: 0 0 50px rgba(0,255,255,0.2);
}
/* GREEN card (Total Payment) */
.wsus__profile_overview.green{
    background:linear-gradient(145deg,#40FF8D,#0b4d1f)!important;
    
}
.wsus__profile_overview.green::before{
    background:linear-gradient(45deg,#00ff88,#00f5ff,#00ff88)!important;
    
}

/* ORANGE card (Total Review) */
.wsus__profile_overview.orange{
    background:linear-gradient(145deg,#3a1f00,#ff7a00)!important;
    
}
.wsus__profile_overview.orange::before{
    background:linear-gradient(45deg,#ffb300,#ff5e00,#ff00ff)!important;
    
}
/* ===== PERSONAL INFO (IMAGE LIKE) ===== */
.pi_title{
    color:#fff !important;                 /* ✅ CHANGED: white heading */
    -webkit-text-fill-color: unset !important;
    background: none !important;
    font-size: 24px !important;
    font-weight: 700 !important;
}

/* 2 column grid */
.pi_grid{
    margin-top: 18px;
    display: grid;
    grid-template-columns: 1fr 1fr;        /* ✅ CHANGED: 2 columns */
    gap: 22px;
}

/* mobile single column */
@media (max-width: 768px){
    .pi_grid{ grid-template-columns: 1fr; }
}

.pi_col .pi_row{
    display:flex;
    gap: 14px;
    padding: 10px 0;
    border-bottom: 1px solid rgba(255,255,255,.08);
}

.pi_label{
    min-width: 90px;                       /* label fixed width (Name:, Phone:) */
    color:#eaeaea !important;
    font-weight: 600;
}

.pi_value{
    color:#fff !important;
    font-weight: 500;
    opacity: .95;
}

/* Edit button like image */
.pi_btn{
    background: rgba(0,0,0,0.25) !important;
    border: 1px solid rgba(255,255,255,0.12) !important;
    box-shadow: 0 0 0 rgba(0,0,0,0) !important;
    border-radius: 14px !important;
    padding: 10px 18px !important;
    color:#fff !important;
}

.pi_btn:hover{
    box-shadow: 0 0 22px rgba(0,245,255,.35) !important;
    transform: translateY(-2px);
}
/* =========================
   REQUIRED DETAIL MODAL (PREMIUM DARK)
========================= */

/* modal overlay darker */
#userModal.modal{
  backdrop-filter: blur(6px);
}
.modal-backdrop.show{
  opacity: .75 !important;
  background: #000 !important;
}

/* modal box */
#userModal .modal-content{
  background: linear-gradient(145deg, #0f0f0f, #1a1a1a) !important;
  border: 1px solid rgba(255,255,255,0.10) !important;
  border-radius: 22px !important;
  box-shadow: 0 30px 80px rgba(0,0,0,0.80) !important;
  overflow: hidden;
}

/* top glow border line */
#userModal .modal-content::before{
  content:"";
  position:absolute;
  inset:0;
  padding:1px;
  border-radius:22px;
  background: linear-gradient(45deg, rgba(0,245,255,.7), rgba(255,0,255,.6), rgba(0,255,136,.6));
  -webkit-mask: linear-gradient(#000 0 0) content-box, linear-gradient(#000 0 0);
  -webkit-mask-composite: xor;
  mask-composite: exclude;
  pointer-events:none;
  opacity:.65;
}

/* header */
#userModal .modal-header{
  border-bottom: 1px solid rgba(255,255,255,0.08) !important;
  padding: 18px 22px !important;
  background: rgba(255,255,255,0.02) !important;
}

/* title gradient */
#userModal .modal-title{
  font-weight: 800 !important;
  font-size: 20px !important;
  background: linear-gradient(45deg, #00f5ff, #ff00ff) !important;
  -webkit-background-clip: text !important;
  -webkit-text-fill-color: transparent !important;
}

/* body */
#userModal .modal-body{
  padding: 18px 22px 10px 22px !important;
}

/* label */
#userModal label{
  display:block;
  color:#00f5ff !important;
  font-weight: 700 !important;
  margin-bottom: 8px !important;
}

/* input */
#userModal .form-control{
  background: rgba(255,255,255,0.06) !important;
  border: 1px solid rgba(255,255,255,0.12) !important;
  color:#fff !important;
  border-radius: 14px !important;
  padding: 14px 16px !important;
  height: 50px !important;
  outline: none !important;
  box-shadow: none !important;
}

/* placeholder */
#userModal .form-control::placeholder{
  color: rgba(255,255,255,0.55) !important;
}

/* focus glow */
#userModal .form-control:focus{
  border-color: rgba(0,245,255,0.75) !important;
  box-shadow: 0 0 18px rgba(0,245,255,0.25) !important;
}

/* footer */
#userModal .modal-footer{
  border-top: 1px solid rgba(255,255,255,0.08) !important;
  padding: 14px 22px 20px 22px !important;
  justify-content: flex-end !important;
  gap: 10px;
}

/* primary button (Save changes) */
#userModal .btn.btn-primary{
  background: linear-gradient(45deg, #00f5ff, #ff00ff) !important;
  border: none !important;
  color:#fff !important;
  font-weight: 800 !important;
  border-radius: 40px !important;
  padding: 12px 22px !important;
  transition: .2s ease;
}

#userModal .btn.btn-primary:hover{
  box-shadow: 0 0 30px rgba(0,245,255,.55) !important;
  transform: translateY(-2px);
}




</style>
@endpush

@endsection
