@extends('frontend.layouts.master')

@section('meta_title', 'Thank You')
@section('meta_description', 'Donation Successful')

@section('header')
    @include('frontend.layouts.header-layout.two')
@endsection

@section('contents')
<style>
    body{ background:#0f0f10 !important; }

    
    .thankyou-page{
        padding: 140px 15px 70px; 
        min-height: 70vh;
        display:flex;
        justify-content:center;
        align-items:flex-start;
        background: radial-gradient(circle at top, #2b2b2b 0%, #111 55%, #0b0b0b 100%);
    }

    .ty-card{
        width:100%;
        max-width:540px;
        background: rgba(40,40,40,.85);            
        border: 1px solid rgba(255,255,255,.10);
        border-radius: 22px;
        padding: 34px 26px;
        color:#fff;
        box-shadow: 0 20px 60px rgba(0,0,0,.55);
        position: relative;
        overflow: hidden;
        backdrop-filter: blur(8px);
    }

    
    .ty-card:before{
        content:"";
        position:absolute;
        inset:-2px;
        background: linear-gradient(135deg, rgba(0,255,136,.25), rgba(255,204,77,.18), rgba(0,150,255,.12));
        filter: blur(22px);
        opacity: .75;
        z-index:0;
    }

    .ty-card > *{ position: relative; z-index: 1; }

    .ty-badge{
        display:inline-flex;
        align-items:center;
        gap:10px;
        padding:10px 14px;
        border-radius:999px;
        background: rgba(0,255,136,.12);
        border: 1px solid rgba(0,255,136,.25);
        color:#8dffcf;
        font-weight:700;
        letter-spacing:.4px;
        margin-bottom: 14px;
    }

    .ty-title{
        font-size: 44px;
        line-height: 1.05;
        margin: 8px 0 18px;
        color: #00ff88;
        text-shadow: 0 10px 25px rgba(0,255,136,.20);
        font-weight: 800;
        text-align:center;
    }

    .ty-sub{
        text-align:center;
        opacity:.9;
        margin-bottom: 22px;
        font-size: 14px;
    }

    .ty-grid{
        display:grid;
        grid-template-columns: 1fr 1fr;
        gap: 12px;
        margin-top: 14px;
    }

    .ty-item{
        background: rgba(0,0,0,.22);
        border: 1px solid rgba(255,255,255,.10);
        border-radius: 14px;
        padding: 12px 14px;
    }

    .ty-item .label{
        font-size: 11px;
        opacity: .75;
        margin-bottom: 6px;
        letter-spacing:.3px;
        text-transform: uppercase;
    }

    .ty-item .value{
        font-size: 14px;
        font-weight: 700;
        word-break: break-word;
    }

    .ty-status{
        display:inline-flex;
        align-items:center;
        gap:8px;
        padding: 8px 12px;
        border-radius: 999px;
        font-weight: 800;
        margin-top: 8px;
        background: rgba(0,255,136,.14);
        border: 1px solid rgba(0,255,136,.28);
        color:#00ff88;
    }

    .ty-actions{
        margin-top: 22px;
        display:flex;
        justify-content:center;
    }

    .ty-btn{
        width:100%;
        max-width: 420px;
        padding: 14px 18px;
        border-radius: 14px;
        background: linear-gradient(90deg,#ffcc4d,#ffb703);
        color:#000;
        text-decoration:none;
        font-weight: 800;
        text-align:center;
        box-shadow: 0 14px 30px rgba(255,183,3,.18);
        transition: transform .15s ease;
    }
    .ty-btn:hover{ transform: translateY(-2px); }

    
    @media(max-width: 576px){
        .thankyou-page{ padding-top: 120px; }
        .ty-title{ font-size: 34px; }
        .ty-grid{ grid-template-columns: 1fr; }
    }
</style>

<div class="thankyou-page">
    <div class="ty-card">
        <div class="ty-badge">🙏 Donation Received</div>

        <div class="ty-title">Thank You<br/>for Your Donation</div>
        <div class="ty-sub">Your support helps us create more smiles for kids 💛</div>

        @if($donation)
            <div class="ty-grid">
                <div class="ty-item">
                    <div class="label">Name</div>
                    <div class="value">{{ $donation->name }}</div>
                </div>

                <div class="ty-item">
                    <div class="label">Amount</div>
                    <div class="value">₹{{ $donation->amount }}</div>
                </div>

                <div class="ty-item">
                    <div class="label">Purpose</div>
                    <div class="value">{{ $donation->purpose }}</div>
                </div>

                <div class="ty-item">
                    <div class="label">Order ID</div>
                    <div class="value">{{ $donation->order_id }}</div>
                </div>
            </div>

            <div style="text-align:center;">
                <div class="ty-status">✅ {{ strtoupper($donation->payment_status) }}</div>
            </div>
        @endif

        <div class="ty-actions">
            <a class="ty-btn" href="{{ route('home') }}">Go Home</a>
        </div>
    </div>
</div>

@endsection

@section('footer')
    @include('frontend.layouts.footer-layout.two')
@endsection
