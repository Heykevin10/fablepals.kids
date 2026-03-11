@extends('frontend.layouts.master')

@section('meta_title', __('Wishlist') . ' || ' . $setting->app_name)

@section('header')
    @include('frontend.layouts.header-layout.three')
@endsection

@section('contents')
    <!-- Breadcumb Area -->
    <x-breadcrumb :title="__('Wishlist')" />

    <!--  Dashboard Area -->
    <section class="wsus__dashboard_profile wsus__dashboard">
        <div class="container">
            <div class="row">
                <!--  Sidebar Area -->
                @include('frontend.profile.partials.sidebar')
                <!--  Main Content Area -->
                <div class="col-lg-8 col-xl-9 ">
                    <div class="wsus__dashboard_main_contant wishlist-content">
                        @include('frontend.profile.partials.wishlist-card')
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--  Marquee Area -->
    @include('frontend.partials.marquee')
@endsection
@section('footer')
@push('css')
<style>
/* ===== WISHLIST: DARK + GLOW + PREMIUM ===== */

/* Background same as dashboard */
.wsus__dashboard_profile{
  background: radial-gradient(circle at 20% 30%, #001a2e, #000814 50%, #000 100%) !important;
  position: relative;
  overflow: hidden;
}
.wsus__dashboard_profile::before{
  content:"";
  position:absolute;
  width:600px;height:600px;
  background: radial-gradient(circle, rgba(0,255,255,0.15), transparent 70%);
  top:-200px;left:-200px;
  animation: floatGlow 8s infinite alternate ease-in-out;
  pointer-events:none;
}
@keyframes floatGlow{0%{transform:translate(0,0)}100%{transform:translate(100px,100px)}}

/* Main card wrapper */
.wsus__dashboard_main_contant.wishlist-content{
  background: linear-gradient(145deg, #111, #181818) !important;
  border-radius: 25px !important;
  padding: 40px !important;
  color:#fff !important;
  box-shadow: 0 30px 70px rgba(0,0,0,0.7) !important;
  position: relative;
  overflow: hidden;
}
.wishlist-content h2,
.wishlist-content h3,
.wishlist-content h4{
    color: #00f5ff !important;
    background: transparent !important;
    padding: 0 !important;
    margin: 0 0 18px 0 !important;
    display: block !important;
    font-weight: 700 !important;
    text-decoration: none !important;
    box-shadow: none !important;
}
.wsus__dashboard_main_contant.wishlist-content::before{
  content:"";
  position:absolute;
  top:-100%;left:-50%;
  width:200%;height:200%;
  background: linear-gradient(120deg, transparent 40%, rgba(0,245,255,0.18) 50%, transparent 60%);
  transform: rotate(25deg);
  animation: shineMove 6s infinite;
  pointer-events:none;
}
@keyframes shineMove{0%{top:-100%}100%{top:100%}}

/* Table wrapper (works if wishlist-card uses table) */
.wishlist-content .table-responsive{
  border-radius: 18px;
  overflow:hidden;
}

/* Premium table look */
.wishlist-content table.table{
  width:100% !important;
  margin:0 !important;
  border-collapse: separate !important;
  border-spacing: 0 12px !important;
}

/* Header row */
.wishlist-content table.table thead th,
.wishlist-content table.table tbody tr:first-child th{
  color:#00f5ff !important;
  font-weight:700 !important;
  border:none !important;
  padding:14px 16px !important;
  background: transparent !important;
  text-align:center !important;
}

/* Row cards */
.wishlist-content table.table tbody tr{
  transition:.25s;
}
.wishlist-content table.table tbody tr:not(:first-child){
  background: rgba(255,255,255,0.04) !important;
  border: 1px solid rgba(255,255,255,0.08) !important;
  border-radius: 14px !important;
}
.wishlist-content table.table tbody tr:not(:first-child):hover{
  background: rgba(0,245,255,0.08) !important;
}

/* Cells */
.wishlist-content table.table td{
  border:none !important;
  color:#fff !important;
  padding:16px !important;
  vertical-align: middle !important;
  text-align:center;
}

/* Images inside wishlist */
.wishlist-content img{
  border-radius:14px !important;
  box-shadow: 0 10px 25px rgba(0,0,0,.45);
}

/* Titles / prices */
.wishlist-content h5,
.wishlist-content .product_name,
.wishlist-content .title{
  color:#fff !important;
  font-weight:700;
}
.wishlist-content h6,
.wishlist-content .price,
.wishlist-content .amount{
  color:#00f5ff !important;
  font-weight:700;
}

/* Buttons (add to cart / remove etc.) */
.wishlist-content .btn,
.wishlist-content a.btn,
.wishlist-content button.btn{
  border-radius: 40px !important;
  font-weight: 600 !important;
}

/* Neon primary */
.wishlist-content .btn.style2,
.wishlist-content .btn-primary{
  background: linear-gradient(45deg, #00f5ff, #ff00ff) !important;
  border:none !important;
  color:#fff !important;
}
.wishlist-content .btn.style2:hover,
.wishlist-content .btn-primary:hover{
  box-shadow: 0 0 30px rgba(0,245,255,.55) !important;
  transform: translateY(-2px);
}

/* Remove / danger */
.wishlist-content .btn-danger{
  background: linear-gradient(45deg, #ff4d4d, #ff00aa) !important;
  border:none !important;
  color:#fff !important;
}
.wishlist-content .btn-danger:hover{
  box-shadow: 0 0 30px rgba(255,77,77,.45) !important;
  transform: translateY(-2px);
}

/* Pagination center */
.pagination{ justify-content:center !important; }
@media (max-width: 991px){

  /* Card padding compact */
  .wsus__dashboard_main_contant.wishlist-content{
    padding: 14px !important;
  }

  /* Table row compact */
  .wishlist-content table.table tbody tr{
    padding: 10px !important;
    margin-bottom: 12px !important;
  }

  /* All table text small */
  .wishlist-content table.table td{
    font-size: 13px !important;
    padding: 6px 4px !important;
    line-height: 1.4 !important;
  }

  /* Label (data-title) smaller */
  .wishlist-content table.table td::before{
    font-size: 11px !important;
    flex: 0 0 35%;
    max-width: 35%;
  }

  /* Value area */
  .wishlist-content table.table td > *{
    max-width: 65% !important;
  }

  /* Product title smaller */
  .wishlist-content h5,
  .wishlist-content .product_name,
  .wishlist-content .title{
    font-size: 13px !important;
    line-height: 1.3 !important;
  }

  /* Price smaller */
  .wishlist-content .price,
  .wishlist-content .amount{
    font-size: 13px !important;
  }

  /* Rating text */
  .wishlist-content .rating,
  .wishlist-content small{
    font-size: 11px !important;
  }

  /* Image smaller */
  .wishlist-content img{
    max-width: 55px !important;
    height: 55px !important;
  }

  /* Buttons compact */
  .wishlist-content .btn{
    font-size: 12px !important;
    padding: 8px 10px !important;
    border-radius: 10px !important;
  }

  /* Action buttons side compact */
  .wishlist-content td.actions .btn{
    min-width: auto !important;
    flex: 1 1 48% !important;
  }

}
</style>
@endpush

    @include('frontend.layouts.footer-layout.two')
@endsection
