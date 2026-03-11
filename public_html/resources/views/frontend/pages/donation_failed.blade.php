@extends('frontend.layouts.master')

@section('meta_title', 'Payment Failed')
@section('meta_description', 'Donation Payment Failed')

@section('header')
    @include('frontend.layouts.header-layout.two')
@endsection

@section('contents')
<style>
    body{ background:#0f0f10 !important; }

    .failed-page{
        padding: 140px 15px 70px; /* navbar overlap fix */
        min-height: 70vh;
        display:flex;
        justify-content:center;
        align-items:flex-start;
        background: radial-gradient(circle at top, #3a2a2a 0%, #141010 55%, #0b0b0b 100%);
    }

    .pf-card{
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

    .pf-card:before{
        content:"";
        position:absolute;
        inset:-2px;
        background: linear-gradient(135deg, rgba(255,77,77,.30), rgba(255,204,77,.12), rgba(255,77,77,.18));
        filter: blur(22px);
        opacity: .85;
        z-index:0;
    }
    .pf-card > *{ position: relative; z-index: 1; }

    .pf-badge{
        display:inline-flex;
        align-items:center;
        gap:10px;
        padding:10px 14px;
        border-radius:999px;
        background: rgba(255,77,77,.12);
        border: 1px solid rgba(255,77,77,.25);
        color:#ff9b9b;
        font-weight:800;
        letter-spacing:.4px;
        margin-bottom: 14px;
    }

    .pf-title{
        font-size: 44px;
        line-height: 1.05;
        margin: 8px 0 18px;
        color: #ff4d4d;
        text-shadow: 0 10px 25px rgba(255,77,77,.22);
        font-weight: 900;
        text-align:center;
    }

    .pf-sub{
        text-align:center;
        opacity:.9;
        margin-bottom: 22px;
        font-size: 14px;
    }

    .pf-grid{
        display:grid;
        grid-template-columns: 1fr 1fr;
        gap: 12px;
        margin-top: 14px;
    }

    .pf-item{
        background: rgba(0,0,0,.22);
        border: 1px solid rgba(255,255,255,.10);
        border-radius: 14px;
        padding: 12px 14px;
    }

    .pf-item .label{
        font-size: 11px;
        opacity: .75;
        margin-bottom: 6px;
        letter-spacing:.3px;
        text-transform: uppercase;
    }

    .pf-item .value{
        font-size: 14px;
        font-weight: 800;
        word-break: break-word;
    }

    .pf-status{
        display:inline-flex;
        align-items:center;
        gap:8px;
        padding: 8px 12px;
        border-radius: 999px;
        font-weight: 900;
        margin-top: 8px;
        background: rgba(255,77,77,.14);
        border: 1px solid rgba(255,77,77,.28);
        color:#ff4d4d;
    }

    .pf-actions{
        margin-top: 22px;
        display:flex;
        gap: 12px;
        justify-content:center;
        flex-wrap: wrap;
    }

    .pf-btn{
        width:100%;
        max-width: 300px;
        padding: 14px 18px;
        border-radius: 14px;
        text-decoration:none;
        font-weight: 900;
        text-align:center;
        transition: transform .15s ease;
        display:inline-block;
    }
    .pf-btn:hover{ transform: translateY(-2px); }

    .pf-btn-primary{
        background: linear-gradient(90deg,#ff4d4d,#ff7b7b);
        color:#000;
        box-shadow: 0 14px 30px rgba(255,77,77,.18);
    }

    .pf-btn-secondary{
        background: rgba(255,255,255,.08);
        border:1px solid rgba(255,255,255,.14);
        color:#fff;
    }

    @media(max-width: 576px){
        .failed-page{ padding-top: 120px; }
        .pf-title{ font-size: 34px; }
        .pf-grid{ grid-template-columns: 1fr; }
    }
</style>

<div class="failed-page">
    <div class="pf-card">
        <div class="pf-badge">❌ Payment Failed</div>

        <div class="pf-title">Payment Failed</div>
        <div class="pf-sub">
            Donation payment failed or cancelled. Don’t worry — you can try again.
        </div>

        <div class="pf-grid">
            <div class="pf-item">
                <div class="label">Order ID</div>
                <div class="value">{{ request('order_id') ?? 'N/A' }}</div>
            </div>
            <div class="pf-item">
                <div class="label">Status</div>
                <div class="value">FAILED</div>
            </div>
        </div>

        <div style="text-align:center;">
            <div class="pf-status">❌ FAILED</div>
        </div>

        <div class="pf-actions">
            <a class="pf-btn pf-btn-primary" href="{{ route('donation') }}">Try Again</a>
            <a class="pf-btn pf-btn-secondary" href="{{ route('home') }}">Go Home</a>
        </div>
    </div>
</div>
@endsection

@section('footer')
    @include('frontend.layouts.footer-layout.two')
@endsection
