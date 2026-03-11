@extends('frontend.layouts.master')

@section('meta_title', $seo_setting['shop_page']['seo_title'])
@section('meta_description', $seo_setting['shop_page']['seo_description'])
@push('custom_meta')
    <meta property="og:title" content="{{ $seo_setting['shop_page']['seo_title'] }}" />
    <meta property="og:description" content="{{ $seo_setting['shop_page']['seo_description'] }}" />
    <meta property="og:image" content="{{ asset($setting?->shop_page_breadcrumb_image) }}" />
    <meta property="og:URL" content="{{ url()->current() }}" />
    <meta property="og:type" content="website" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
@endpush

@section('header')
    @include('frontend.layouts.header-layout.two')
@endsection

@section('contents')
    <!-- Breadcumb 
    <x-breadcrumb :image="$setting?->shop_page_breadcrumb_image" :title="__('Songs')" />-->

		<style>
        :root {
            --primary-color: #6c5ce7;
            --dark-bg: #121212;
            --card-bg: #1e1e1e;
            --text-primary: #ffffff;
            --text-secondary: #b3b3b3;
        }

        body {
            background-color: var(--dark-bg);
            color: var(--text-primary);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .music-player-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem 1rem;
        }

input{
	border: 1px solid #ccc!important;
}

.card {
        border-radius: 16px;
    }
    
    .input-group-text {
        border-radius: 8px 0 0 8px;
    }
    
    .form-control {
        border-radius: 0 8px 8px 0;
        padding: 12px 16px;
    }
    
    .form-control:focus {
        box-shadow: 0 0 0 3px rgba(13, 110, 253, 0.1);
        border-color: #86b7fe;
    }
    
    .btn-primary {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border: none;
        border-radius: 10px;
        transition: all 0.3s ease;
    }
    
    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 7px 14px rgba(50, 50, 93, 0.1), 0 3px 6px rgba(0, 0, 0, 0.08);
    }
    
    .btn-primary:disabled {
        background: #6c757d;
        transform: none;
        box-shadow: none;
    }
    
    .otp-input {
        width: 50px;
        height: 50px;
        text-align: center;
        font-size: 1.5rem;
        font-weight: bold;
        border: 2px solid #dee2e6;
        border-radius: 10px;
        transition: all 0.3s ease;
    }
    
    .otp-input:focus {
        border-color: #667eea;
        box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        transform: scale(1.05);
    }
    
    #messageContainer .alert {
        border-radius: 10px;
        border: none;
    }
	
	.btn-theme, .btn-theme:hover{
		background: #e3ff04;
		color: #212121;
	}
	
	.text-theme{
		color: #e3ff04;
	}
    
    @media (max-width: 768px) {
        .otp-input {
            width: 45px;
            height: 45px;
        }
    }
    /* ✅ OTP perfect on mobile */
@media (max-width: 575px) {

  /* container padding thoda kam */
  .shop__area .container{
    padding-left: 12px !important;
    padding-right: 12px !important;
  }

  /* otp container: no overflow, proper center */
  #otpContainer{
    width: 100% !important;
    justify-content: center !important;
    gap: 8px !important;              /* gap reduce */
    flex-wrap: nowrap !important;     /* same line */
    overflow: hidden !important;
  }

  /* otp inputs size smaller */
  .otp-input{
    width: 40px !important;
    height: 42px !important;
    font-size: 18px !important;
    padding: 0 !important;
  }
}

/* extra small phones */
@media (max-width: 360px){
  #otpContainer{ gap: 6px !important; }
  .otp-input{ width: 36px !important; height: 40px !important; font-size: 16px !important; }
}
    </style>
	
    <!-- Main Area -->
    <section class="shop__area space top-baseline">
    <div class="container pt-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-lg border-0">
                    <div class="card-body p-4 p-md-5">
                        <!-- Logo/Header Section -->
                        <div class="text-center mb-4">
                            <div class="bg-dark rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 80px; height: 80px;">
                                <a href="{{ route('home') }}"><img src="{{ asset($setting?->logo_white) }}" alt="{{$setting?->app_name}}"></a>
                            </div>
                            <h2 class="text-dark mb-2" style="font-size: 25px;">Welcome to Fablepals</h2>
                            <p class="text-muted">Enter your mobile number to receive a one time password</p>
                        </div>

                        <!-- Mobile Input Section -->
                        <div id="mobileSection">
                            <div class="mb-4">
                                <label for="mobile" class="form-label fw-semibold">Mobile Number</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0">
                                        <i class="fas fa-mobile-alt text-black"></i>
                                    </span>
                                    <input type="tel" 
                                           id="mobile" 
                                           class="form-control border-start-0 ps-0" 
                                           placeholder="Enter 10-digit mobile number"
                                           maxlength="10"
                                           oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                </div>
                                <div class="form-text">We'll send an OTP to this number</div>
                            </div>

                            <button id="sendOtpBtn" 
                                    class="btn-theme btn btn-primary btn-lg w-100 py-2 fw-semibold"
                                    onclick="sendOtp()"
                                    disabled>
                                <span class="spinner-border spinner-border-sm d-none" role="status" id="sendSpinner"></span>
                                <span id="sendText">Send OTP</span>
                            </button>

                            <div class="text-center mt-3">
                                <p class="text-muted small mb-0">By continuing, you agree to our Terms & Privacy Policy</p>
                            </div>
                        </div>

                        <!-- OTP Input Section (Hidden Initially) -->
                        <div id="otpSection" class="d-none">
                            <div class="text-center mb-4">
                                <div class="mb-3">
                                    <i class="fas fa-sms fa-3x text-primary"></i>
                                </div>
                                <h4 class="fw-bold">Enter OTP</h4>
                                <p class="text-muted mb-4">
                                    We've sent a 6-digit code to 
                                    <span id="mobileDisplay" class="fw-semibold text-dark"></span>
                                </p>
                                
                                <div class="mb-4">
                                    <div class="d-flex justify-content-center gap-2 gap-md-3" id="otpContainer">
                                        <!-- OTP inputs will be generated here -->
                                    </div>
                                    <input type="hidden" id="otp" name="otp">
                                </div>

                                <div class="mb-3">
                                    <button id="verifyOtpBtn" 
                                            class="btn-theme btn btn-primary btn-lg w-100 py-2 fw-semibold"
                                            onclick="verifyOtp()"
                                            disabled>
                                        <span class="spinner-border spinner-border-sm d-none" role="status" id="verifySpinner"></span>
                                        <span id="verifyText">Verify & Login</span>
                                    </button>
                                </div>

                                <div class="text-center mt-3">
                                    <p class="text-muted small" id="resendText">
                                        Didn't receive code? 
                                        <a href="javascript:void(0);" class="text-primary fw-semibold" id="resendLink" onclick="resendOtp()">Resend OTP</a>
                                        <span id="resendTimer" class="d-none"> in <span id="timer">30</span>s</span>
                                    </p>
                                    
                                    <a href="javascript:void(0);" 
                                       class="text-decoration-none text-primary fw-semibold"
                                       onclick="goBackToMobile()">
                                        <i class="fas fa-arrow-left me-1"></i> Change Mobile Number
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Message Display -->
                        <div id="messageContainer" class="mt-3"></div>
                    </div>
                </div>

                <!-- Features/Info Section -->
                <div class="card border-0 shadow-sm mt-4">
                    <div class="card-body p-4">
                        <div class="row text-center">
                            <div class="col-md-4 mb-3 mb-md-0">
                                <div class="d-flex flex-column align-items-center">
                                    <div class="bg-light rounded-circle p-3 mb-2">
                                        <i class="fas fa-shield-alt text-dark fa-lg"></i>
                                    </div>
                                    <h6 class="fw-semibold mb-1">Secure Login</h6>
                                    <p class="text-muted small mb-0">Your data is protected</p>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3 mb-md-0">
                                <div class="d-flex flex-column align-items-center">
                                    <div class="bg-light rounded-circle p-3 mb-2">
                                        <i class="fas fa-bolt text-dark fa-lg"></i>
                                    </div>
                                    <h6 class="fw-semibold mb-1">Instant OTP</h6>
                                    <p class="text-muted small mb-0">Receive code in seconds</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="d-flex flex-column align-items-center">
                                    <div class="bg-light rounded-circle p-3 mb-2">
                                        <i class="fas fa-headset text-dark fa-lg"></i>
                                    </div>
                                    <h6 class="fw-semibold mb-1">24/7 Support</h6>
                                    <p class="text-muted small mb-0">We're here to help</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


    <!--  Marquee Area -->
    @include('frontend.partials.marquee')

@endsection

@section('footer')
    @include('frontend.layouts.footer-layout.two')
@endsection

@push('js')

	
<script>
// Initialize when page loads
document.addEventListener('DOMContentLoaded', function() {
    const mobileInput = document.getElementById('mobile');
    const sendOtpBtn = document.getElementById('sendOtpBtn');
    
    // Enable/disable send button based on mobile input
    mobileInput.addEventListener('input', function() {
        sendOtpBtn.disabled = this.value.length !== 10;
    });
    
    // Create OTP input boxes
    createOtpInputs();
});

function createOtpInputs() {
    const otpContainer = document.getElementById('otpContainer');
    otpContainer.innerHTML = '';
    
    for (let i = 0; i < 6; i++) {
        const input = document.createElement('input');
        input.type = 'tel';
        input.maxLength = 1;
        input.className = 'otp-input form-control';
        input.setAttribute('autocomplete', 'off');
        input.setAttribute('inputmode', 'numeric');
        input.setAttribute('pattern', '[0-9]*');
        
        input.addEventListener('input', function(e) {
            handleOtpInput(e, i);
        });
        
        input.addEventListener('keydown', function(e) {
            handleOtpNavigation(e, i);
        });
        
        input.addEventListener('paste', handleOtpPaste);
        
        otpContainer.appendChild(input);
    }
    
    // Focus first input
    setTimeout(() => otpContainer.querySelector('.otp-input')?.focus(), 100);
}

function handleOtpInput(e, index) {
    const input = e.target;
    const value = input.value.replace(/[^0-9]/g, '');
    
    if (value) {
        input.value = value[0];
        
        // Move to next input
        const nextInput = input.nextElementSibling;
        if (nextInput && nextInput.classList.contains('otp-input')) {
            nextInput.focus();
        }
        
        // Update hidden OTP field
        updateHiddenOtp();
    }
}

function handleOtpNavigation(e, index) {
    const inputs = document.querySelectorAll('.otp-input');
    
    if (e.key === 'Backspace') {
        if (!e.target.value && index > 0) {
            inputs[index - 1].focus();
            inputs[index - 1].value = '';
        }
        updateHiddenOtp();
    } else if (e.key === 'ArrowLeft' && index > 0) {
        inputs[index - 1].focus();
    } else if (e.key === 'ArrowRight' && index < inputs.length - 1) {
        inputs[index + 1].focus();
    }
}

function handleOtpPaste(e) {
    e.preventDefault();
    const pasteData = e.clipboardData.getData('text').replace(/[^0-9]/g, '');
    const inputs = document.querySelectorAll('.otp-input');
    
    for (let i = 0; i < Math.min(pasteData.length, inputs.length); i++) {
        inputs[i].value = pasteData[i];
    }
    
    updateHiddenOtp();
    inputs[Math.min(pasteData.length, inputs.length - 1)]?.focus();
}

function updateHiddenOtp() {
    const inputs = document.querySelectorAll('.otp-input');
    let otpValue = '';
    inputs.forEach(input => otpValue += input.value);
    document.getElementById('otp').value = otpValue;
    
    // Enable/disable verify button
    document.getElementById('verifyOtpBtn').disabled = otpValue.length !== 6;
}

function showMessage(message, type = 'success') {
    const messageContainer = document.getElementById('messageContainer');
    const alertClass = type === 'success' ? 'alert-success' : 'alert-danger';
    
    messageContainer.innerHTML = `
        <div class="alert ${alertClass} alert-dismissible fade show" role="alert">
            <i class="fas ${type === 'success' ? 'fa-check-circle' : 'fa-exclamation-circle'} me-2"></i>
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    `;
}

function showOtpSection() {
    document.getElementById('mobileSection').classList.add('d-none');
    document.getElementById('otpSection').classList.remove('d-none');
    document.getElementById('mobileDisplay').textContent = document.getElementById('mobile').value;
    
    // Focus first OTP input
    setTimeout(() => {
        const firstOtpInput = document.querySelector('.otp-input');
        if (firstOtpInput) firstOtpInput.focus();
    }, 300);
    
    // Start resend timer
    startResendTimer();
}

function goBackToMobile() {
    document.getElementById('mobileSection').classList.remove('d-none');
    document.getElementById('otpSection').classList.add('d-none');
    document.getElementById('messageContainer').innerHTML = '';
}

function startResendTimer() {
    const resendLink = document.getElementById('resendLink');
    const resendTimer = document.getElementById('resendTimer');
    const timerElement = document.getElementById('timer');
    
    resendLink.classList.add('disabled');
    resendTimer.classList.remove('d-none');
    
    let timeLeft = 30;
    timerElement.textContent = timeLeft;
    
    const timer = setInterval(() => {
        timeLeft--;
        timerElement.textContent = timeLeft;
        
        if (timeLeft <= 0) {
            clearInterval(timer);
            resendLink.classList.remove('disabled');
            resendTimer.classList.add('d-none');
        }
    }, 1000);
}

async function sendOtp() {
    const mobile = document.getElementById('mobile').value;
    const sendBtn = document.getElementById('sendOtpBtn');
    const spinner = document.getElementById('sendSpinner');
    const sendText = document.getElementById('sendText');
    
    if (mobile.length !== 10) {
        showMessage('Please enter a valid 10-digit mobile number', 'error');
        return;
    }
    
    // Show loading state
    sendBtn.disabled = true;
    spinner.classList.remove('d-none');
    sendText.textContent = 'Sending...';
    
    try {
        const response = await fetch("{{url('send-otp')}}", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
            },
            body: JSON.stringify({ mobile: mobile })
        });
        
        const data = await response.json();
        
        if (data.success) {
            showMessage('OTP sent successfully!', 'success');
            showOtpSection();
        } else {
            showMessage(data.message || 'Failed to send OTP', 'error');
        }
    } catch (error) {
        showMessage('Network error. Please try again.', 'error');
    } finally {
        // Reset button state
        sendBtn.disabled = false;
        spinner.classList.add('d-none');
        sendText.textContent = 'Send OTP';
    }
}

async function verifyOtp() {
    const mobile = document.getElementById('mobile').value;
    const otp = document.getElementById('otp').value;
    const verifyBtn = document.getElementById('verifyOtpBtn');
    const spinner = document.getElementById('verifySpinner');
    const verifyText = document.getElementById('verifyText');
    
    if (otp.length !== 6) {
        showMessage('Please enter the 6-digit OTP', 'error');
        return;
    }
    
    // Show loading state
    verifyBtn.disabled = true;
    spinner.classList.remove('d-none');
    verifyText.textContent = 'Verifying...';
    
    try {
        const response = await fetch("{{url('verify-otp')}}", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
            },
            body: JSON.stringify({
                mobile: mobile,
                otp: otp
            })
        });
        
        const data = await response.json();
        
        if (data.success) {
            showMessage('Login successful! Redirecting...', 'success');
            setTimeout(() => {
                window.location.href = data.redirect;
            }, 1000);
        } else {
            showMessage(data.message || 'Invalid OTP. Please try again.', 'error');
            // Shake animation for OTP inputs
            const otpInputs = document.querySelectorAll('.otp-input');
            otpInputs.forEach(input => {
                input.classList.add('animate__shakeX');
                setTimeout(() => input.classList.remove('animate__shakeX'), 500);
            });
        }
    } catch (error) {
        showMessage('Network error. Please try again.', 'error');
    } finally {
        // Reset button state
        verifyBtn.disabled = false;
        spinner.classList.add('d-none');
        verifyText.textContent = 'Verify & Login';
    }
}

function resendOtp() {
    const resendLink = document.getElementById('resendLink');
    if (!resendLink.classList.contains('disabled')) {
        sendOtp();
        showMessage('OTP resent successfully!', 'success');
    }
}
</script>


	
@endpush
