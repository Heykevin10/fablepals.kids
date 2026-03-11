@extends('frontend.layouts.master')

@section('meta_title', 'Support Fable Pals')
@section('meta_description', 'Donate to support Fable Pals')

@section('header')
    @include('frontend.layouts.header-layout.two')
@endsection

@section('contents')

<style>
    body { background-color: #000 !important; }

    .donation-wrapper{
        background: #000000;
        padding: 60px 15px;
        display: flex;
        justify-content: center;
        position: relative;
        z-index: 1;
        gap: 16px;
        flex-wrap: wrap;
    }

    .donation-card{
        width: 100%;
        max-width: 540px;
        background: linear-gradient(145deg,#0f0f0f,#1a1a1a);
        border-radius: 18px;
        padding: 26px;
        box-shadow: 0 20px 40px rgba(0,0,0,.35);
        color: #fff;
    }

    .donation-card h1{
        text-align: center;
        font-size: 26px;
        margin-bottom: 4px;
        color: #ffcc4d;
    }

    .donation-card .heart{
        text-align: center;
        font-size: 22px;
        margin-bottom: 6px;
    }

    .donation-card p{
        text-align: center;
        font-size: 13px;
        opacity: .8;
        margin-bottom: 18px;
    }

    label{
        font-size: 12px;
        margin-bottom: 4px;
        display: block;
        opacity: .9;
    }

    input{
        width: 100%;
        height: 40px;
        border-radius: 10px;
        border: 1px solid #2c2c2c;
        background: #111;
        color: #fff;
        padding: 0 12px;
        margin-bottom: 10px;
        outline: none;
    }

    input::placeholder{
        color: #777;
        font-size: 13px;
    }

    .amount-box{
        display: flex;
        gap: 8px;
        margin-bottom: 10px;
    }

    .amount-box button{
        flex: 1;
        height: 38px;
        border-radius: 10px;
        border: 1px solid #333;
        background: #161616;
        color: #fff;
        cursor: pointer;
        font-size: 14px;
    }

    .amount-box button.active{
        background: #ffcc4d;
        color: #000;
        font-weight: 600;
    }

    .submit-btn{
        width: 100%;
        height: 44px;
        margin-top: 12px;
        background: linear-gradient(90deg,#ffcc4d,#ffb703);
        border: none;
        border-radius: 12px;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        display: block;
        text-align: center;
        line-height: 44px;
        text-decoration: none;
        color: #000;
    }

    .footer-note{
        text-align: center;
        font-size: 11px;
        margin-top: 10px;
        opacity: .6;
    }

    .success-card{
        max-width: 520px;
        background:#0b2f1a;
        border:1px solid #00ff88;
    }
    .success-card h2{
        margin:0;
        color:#00ff88;
        text-align:center;
        font-size: 24px;
    }
    .success-card p{
        text-align:left;
        margin: 10px 0 0;
        opacity: 1;
        font-size: 14px;
    }
    .logo-wrap{
    text-align: center;
    margin-bottom: 12px;
   }

  .logo-wrap img{
    width: 100px !important;
    max-width: 150px !important;
    height: auto !important;
    display: block;
    margin: 0 auto;
}

</style>

<section class="shop__area space top-baseline">
    <div class="container">
        <div class="donation-wrapper">

            {{-- ✅ ERROR MESSAGE --}}
            @if(session('error'))
                <div class="donation-card" style="max-width:520px;background:#2a0b0b;border:1px solid #ff4d4d;">
                    <h1 style="color:#ff4d4d;">Payment Failed</h1>
                    <p style="opacity:1;">{{ session('error') }}</p>
                    <a class="submit-btn" href="{{ route('donation') }}" style="background:linear-gradient(90deg,#ff6b6b,#ff4d4d);color:#000;">
                        Try Again
                    </a>
                </div>
            @endif

            {{-- ✅ SUCCESS: ONLY THANK YOU CARD (FORM HIDE) --}}
            @if(session('success') && session('donation'))
                @php($donation = session('donation'))

                <div class="donation-card success-card">
                    <h2>🙏 Thank You for Your Donation</h2>

                    <p><b>Amount:</b> ₹{{ $donation->amount }}</p>
                    <p><b>Payment Status:</b> {{ strtoupper($donation->payment_status ?? 'success') }}</p>
                    @if(!empty($donation->order_id))
                        <p><b>Order ID:</b> {{ $donation->order_id }}</p>
                    @endif

                    <a class="submit-btn" href="{{ route('home') }}">
                        Go to Home
                    </a>

                    <a class="submit-btn" href="{{ route('donation') }}"
                       style="margin-top:10px;background:transparent;border:1px solid #00ff88;color:#00ff88;line-height:42px;">
                        Make Another Donation
                    </a>
                </div>

            @else
                {{-- ✅ NORMAL DONATION FORM --}}
                <form id="donationForm" class="donation-card" method="POST" action="{{ route('donation.submit') }}">
                    @csrf
                     <div class="logo-wrap">
                        <img src="{{ asset($setting?->logo) }}" alt="{{ $setting?->app_name }}">
                    </div>

                    <h1>Support Fable Pals</h1>
                    <div class="heart">💛</div>
                    <p>Your small help creates big smiles</p>

                    <label>Name *</label>
                    <input type="text" name="name" placeholder="Enter your name" required>

                    <label>Mobile Number *</label>
                    <input type="tel" name="mobile" placeholder="10 digit mobile number" required>

                    <label>Email (optional)</label>
                    <input type="email" name="email" placeholder="Enter email">

                    <label>Donation Amount *</label>
                    <div class="amount-box">
                        <button type="button" onclick="setAmount(this,100)">₹10</button>
                        <button type="button" onclick="setAmount(this,300)">₹50</button>
                        <button type="button" onclick="setAmount(this,500)">₹100</button>
                    </div>

                    <input type="number" id="amount" name="amount" placeholder="Enter custom amount" required>

                    <label>Purpose *</label>
                    <input type="text" name="purpose" placeholder="Children welfare / Education" required>

                    <button class="submit-btn" type="submit">Donate Now</button>

                    <div class="footer-note">
                        100% secure & trusted payment
                    </div>
                </form>
            @endif

        </div>
    </div>
</section>

@endsection

@section('footer')
    @include('frontend.layouts.footer-layout.two')
@endsection

@push('js')
<script src="https://sdk.cashfree.com/js/v3/cashfree.js"></script>
<script>
    function setAmount(btn,val){
        document.getElementById('amount').value = val;
        document.querySelectorAll('.amount-box button').forEach(b=> b.classList.remove('active'));
        btn.classList.add('active');
    }

    const donationForm = document.getElementById('donationForm');
    if (donationForm) {
        donationForm.addEventListener('submit', async function(e){
            e.preventDefault();

            const form = e.target;
            const formData = new FormData(form);

            const res = await fetch(form.action, {
                method: "POST",
                headers: {
                    "X-Requested-With": "XMLHttpRequest",
                    "X-CSRF-TOKEN": "{{ csrf_token() }}"
                },
                body: formData
            });

            const data = await res.json();

            if(data.status !== "ok"){
                alert(data.message ?? "Something went wrong");
                return;
            }

            // ✅ Cashfree checkout open
            const cashfree = Cashfree({
                mode: "{{ config('services.cashfree.env') === 'production' ? 'production' : 'sandbox' }}"
            });

            cashfree.checkout({
                paymentSessionId: data.payment_session,
                redirectTarget: "_self"
            });
        });
    }
</script>
@endpush
