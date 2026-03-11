<!-- Header Area -->
<header class="nav-header header-layout2" style="top: 0!important;">
    <div class="sticky-wrapper">
        <!-- Main Menu Area -->
        <div class="menu-area">
            <div class="container-fluid">
                <div class="row align-items-center justify-content-between">
                    <div class="col-auto">
                        <div class="header-logo">
                            <a href="{{ route('home') }}"><img src="{{ asset($setting?->logo_white) }}" alt="{{$setting?->app_name}}"></a>
                        </div>
                    </div>
                    <div class="col-auto ms-auto">
                        <nav class="main-menu d-none d-lg-inline-block">
                            @include('frontend.partials.main-menu')
                        </nav>
                        <div class="navbar-right d-inline-flex align-items-center d-lg-none">

                            @include('frontend.partials.cart-menu')
                        
                            {{-- Mobile Login / Dashboard --}}
                            @auth('web')
                                <a href="{{ route('dashboard') }}" class="mobile-auth-link">
                                    {{ __('Dashboard') }}
                                </a>
                            @else
                                <a href="{{ route('login') }}" class="mobile-auth-link">
                                    {{ __('Sign In') }}
                                </a>
                            @endauth
                        
                            <button type="button" class="menu-toggle sidebar-btn ms-2" aria-label="hamburger">
                                <span class="line"></span>
                                <span class="line"></span>
                                <span class="line"></span>
                            </button>
                        
                        </div>
                    </div>
                    <div class="col-auto d-none d-lg-block">
                        <div class="header-button">
                            @include('frontend.partials.cart-menu')
                            @auth('web')
                                <a href="{{ route('dashboard') }}" class="btn">
                                    <span class="link-effect text-uppercase">
                                        <span class="effect-1">{{ __('Dashboard') }}</span>
                                        <span class="effect-1">{{ __('Dashboard') }}</span>
                                    </span>
                                </a>
                            @else
                                <a href="{{ route('login') }}" class="btn">
                                    <span class="link-effect text-uppercase">
                                        <span class="effect-1">{{ __('Sign In') }}</span>
                                        <span class="effect-1">{{ __('Sign In') }}</span>
                                    </span>
                                </a>
                            @endauth
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<style>
    /* =========================
   MOBILE HEADER FIX (Layout2)
   Logo | Cart | SignIn/Dashboard | Hamburger
========================= */
@media (max-width: 991px){

  /* header row one-line */
  .nav-header.header-layout2 .menu-area .row{
    display:flex !important;
    align-items:center !important;
    justify-content:space-between !important;
    flex-wrap:nowrap !important;       /* wrap band */
    gap:10px !important;
  }

  /* logo column fixed */
  .nav-header.header-layout2 .header-logo{
    flex:0 0 auto !important;
    max-width:140px !important;        /* logo limit */
  }

  .nav-header.header-layout2 .header-logo img{
    max-height:80px !important;        /* mobile logo size */
    width:auto !important;
    display:block !important;
  }

  /* right column width */
  .nav-header.header-layout2 .col-auto.ms-auto{
    flex:1 1 auto !important;
    display:flex !important;
    justify-content:flex-end !important;
    align-items:center !important;
    min-width:0 !important;            /* overflow fix */
  }

  /* right items row */
  .nav-header.header-layout2 .navbar-right{
    display:flex !important;
    align-items:center !important;
    gap:12px !important;
    flex-wrap:nowrap !important;       /* items line */
    min-width:0 !important;
  }

  /* cart + auth link never shrink into logo */
  .nav-header.header-layout2 .navbar-right a,
  .nav-header.header-layout2 .navbar-right button{
    flex:0 0 auto !important;
    white-space:nowrap !important;
  }

  /* auth link typography same as cart */
  .nav-header.header-layout2 .mobile-auth-link{
    font-family: inherit !important;
    font-size: 14px !important;
    font-weight: 600 !important;
    letter-spacing: .5px !important;
    text-transform: uppercase !important;
    color:#fff !important;
    line-height:1 !important;
  }

  /* hamburger always visible */
  .nav-header.header-layout2 .menu-toggle{
    flex:0 0 auto !important;
    opacity:1 !important;
    visibility:visible !important;
  }
  

  /* ✅ ultra small screens: cart text hide, icon only (overlap stop) */
  @media (max-width: 420px){
    .nav-header.header-layout2 .header-cart-text{
      display:none !important;
    }
  }
  
  
}
</style>
