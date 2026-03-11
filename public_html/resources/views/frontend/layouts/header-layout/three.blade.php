<!-- Header Area -->
<header class="nav-header header-layout3 header-sticky" style="background:#000 !important;">
    <style>
.header-layout3 .main-menu ul li a { color:#fff !important; }
.header-layout3 .header-button * { color:#fff !important; }
.header-layout3 .header-button .btn,
.header-layout3 .header-button .btn * { color:#fff !important; }
.sticky-wrapper.is-sticky .menu-area,
.header-layout3 .sticky-wrapper.header-sticky,
.header-layout3 .menu-area,
.header-layout3 .container-fluid{
    background:#000!important;
}

/* ✅ icons row visible on all screens */
.header-layout3 .header-icons{
  display:flex;
  align-items:center;
  gap:12px;
}

/* ✅ mobile */
@media (max-width: 991px){
  .header-layout3 .header-icons{
    display:flex !important;
  }
}

/* ✅ cart-menu */
@media (max-width: 991px){
  .header-layout3 .header-icons .d-none.d-lg-block{
    display:inline-flex !important;
  }
}

/* ✅ icon color white on black header */
.header-layout3 .header-icons i,
.header-layout3 .header-icons a{
  color:#fff !important;
}

/* ✅ hamburger lines visible */
.menu-toggle .line{
  background:#fff !important;
}



  /* ✅ cart button force show */
  .header-layout3 .navbar-right .header-cart{
    display:inline-flex !important;
    align-items:center !important;
    opacity:1 !important;
    visibility:visible !important;
    pointer-events:auto !important;
    position:relative !important;
    z-index:9999 !important;
  }

  /* ✅ cart icon white + visible */
  .header-layout3 .navbar-right .header-cart img{
    display:block !important;
    width:22px !important;
    height:22px !important;
    filter: brightness(0) invert(1) !important;
  }

  /* ✅ "Cart  */
  .header-layout3 .navbar-right .header-cart-text{
    display:inline-block !important;
    color:#fff !important;
  }


.header-layout3 .header-cart{
  opacity:1 !important;
  visibility:visible !important;
}

/* ✅ Drawer icon circle (mobile + desktop both) */
.header-layout3 .menu-toggle{
  width: 44px !important;
  height: 44px !important;
  border-radius: 50% !important;
  border: 2px solid #fff !important;
  background: rgba(255,255,255,0.08) !important;

  display: inline-flex !important;
  align-items: center !important;
  justify-content: center !important;

  padding: 0 !important;
  line-height: 1 !important;
  z-index: 9999 !important;

  /* ✅ FIX: hamburger lines properly stacked */
  flex-direction: column !important;
}

/* ✅ Lines spacing inside circle */
.header-layout3 .menu-toggle .line{
  position: relative !important;
  display:block !important;
  width: 18px !important;
  height: 2px !important;
  margin: 3px 0 !important;
  background:#fff !important;
}

/* ✅ if any theme CSS removes border/background on mobile */
@media (max-width: 991px){
  .header-layout3 .navbar-right .menu-toggle{
    opacity: 1 !important;
    visibility: visible !important;
  }
}

/* Desktop normal */
.header-layout3 .main-menu-mobile { display: block; }

@media (max-width: 991px){
  .header-layout3 .main-menu-mobile{
    display:block !important;
    width:100% !important;
    margin-top:10px;
  }

 

  /* scrollbar hide (optional) */
  .header-layout3 .main-menu-mobile > ul::-webkit-scrollbar{ display:none; }
  .header-layout3 .main-menu-mobile > ul{ scrollbar-width:none; }

  .header-layout3 .main-menu-mobile > ul > li > a{
    font-size:12px;
    padding:6px 8px !important;
  }
}

/* ✅ header right wrapper layout */
.header-layout3 .header-right-wrap{
  display:flex;
  align-items:center;
  justify-content:flex-end;
  gap:12px;
  width:100%;
}

@media (max-width: 991px){
  .header-layout3 .header-right-wrap{
    justify-content:space-between !important;
    gap:10px !important;
  }

  /* ✅ menu width */
  .header-layout3 .main-menu-mobile{
    flex: 1 1 auto !important;
    max-width: calc(100% - 90px) !important; 
  }

  .header-layout3 .main-menu-mobile > ul{
    display:flex !important;
    flex-wrap:nowrap !important;
    overflow-x:auto !important;
    white-space:nowrap !important;
    gap:14px;
  }

  /* ✅ icons fix width */
  .header-layout3 .navbar-right{
    flex: 0 0 auto !important;
  }
}
/* ==============================
   MOBILE: LOGO + CART SAME ROW
============================== */
@media (max-width: 991px){

  /* Row flex force  */
  .header-layout3 .menu-area .row{
    display:flex !important;
    align-items:center !important;
    flex-wrap:nowrap !important;   /* ❗ wrap band */
  }
  @media (max-width: 991px){
  .header-layout3 .main-menu-mobile{
    display:none !important;
  }
}

  /* Logo left fixed */
  .header-layout3 .header-logo{
    flex:0 0 auto !important;
  }

  /* Right wrapper push right */
  .header-layout3 .col-12.col-lg-auto.ms-lg-auto{
    flex:1 1 auto !important;
    display:flex !important;
    justify-content:flex-end !important;
    align-items:center !important;
  }

  /* Icons (cart + hamburger) */
  .header-layout3 .navbar-right{
    display:flex !important;
    align-items:center !important;
    gap:12px !important;
    margin-left:auto !important;
    position:relative !important;
    top:0 !important;
  }

  /* Menu bottom full width */
  .header-layout3 .main-menu-mobile{
    position:absolute !important;
    left:0;
    right:0;
    top:100%;
    width:100% !important;
    margin-top:8px !important;
  }

}
/* ===== Mobile Header Layout Fix (Logo | Cart+Hamburger) then Menu then Banner ===== */
@media (max-width: 991px){

  /* header row wrap allow */
  .header-layout3 .menu-area .row{
    display: flex !important;
    flex-wrap: wrap !important;
    align-items: center !important;
  }

  /* Right wrap full width but first line align */
  .header-layout3 .header-right-wrap{
    width: 100% !important;
    display: flex !important;
    flex-wrap: wrap !important;
    align-items: center !important;
    justify-content: flex-end !important;
    gap: 12px !important;
  }

  /* ✅ Row-1: cart + hamburger TOP RIGHT */
  .nav-header .navbar-right {
  display:flex !important;
  align-items:center !important;
  gap:12px !important;
}

.nav-header .menu-toggle{
  width:44px !important;
  height:44px !important;
  border-radius:50% !important;
  border:2px solid #fff !important;
  display:flex !important;
  align-items:center !important;
  justify-content:center !important;
}


  /* ✅ Banner/breadcrumb overlap */
  .breadcrumb-wrapper,
  .breadcumb-wrapper{
    margin-top: 14px !important;
  }
}
/* ✅ MOBILE: top row => LOGO left, CART + hamburger right */
@media (max-width: 991px){

  /* menu hide on mobile (Home/Characters ) */
  .header-layout3 .main-menu-mobile{
    display:none !important;
  }

  /* row should not wrap */
  .header-layout3 .menu-area .row{
    display:flex !important;
    align-items:center !important;
    flex-wrap:nowrap !important;
  }

  /* logo fixed */
  .header-layout3 .header-logo{
    flex:0 0 auto !important;
  }

  /* right side fixed */
  .header-layout3 .col-12.col-lg-auto.ms-lg-auto{
    flex:1 1 auto !important;
    display:flex !important;
    justify-content:flex-end !important;
    align-items:center !important;
  }

  /* cart + hamburger */
  .header-layout3 .navbar-right{
    display:flex !important;
    align-items:center !important;
    gap:12px !important;
    margin-left:auto !important;
  }
}
@media (max-width: 991px){

  .breadcrumb-wrapper{
    padding: 10px 0 !important;
  }

  .wsus__dashboard_profile{
    padding-top: 5px !important;
  }

}
/* ✅ MOBILE: header overlap fix + banner image/text proper */
@media (max-width: 991px){

  /* 1) Sticky header  */
  .breadcrumb-wrapper,
  .breadcumb-wrapper{
    margin-top: 70px !important;   /* header height approx */
  }

  /* 2) Banner image height  */
  .breadcrumb-wrapper.background-image,
  .breadcumb-wrapper.background-image{
    min-height: 160px !important;   /* image visible */
    padding: 18px 0 !important;     /* text space */
    background-size: cover !important;
    background-position: center top !important;
    background-repeat: no-repeat !important;
    display: flex !important;
    align-items: flex-end !important; /* text bottom stable */
  }

  /* 3) Breadcrumb text spacing */
  .breadcrumb-wrapper .container,
  .breadcumb-wrapper .container{
    padding-top: 0 !important;
    padding-bottom: 0 !important;
  }

  /* 4) Dashboard section  */
  .wsus__dashboard_profile{
    padding-top: 10px !important;
    margin-top: 0 !important;
  }
}
@media (max-width: 991px){
  .breadcrumb-wrapper,
  .breadcumb-wrapper{ margin-top: 90px !important; }
}
@media (max-width: 575px){

  .breadcrumb-title{
    font-size: 22px !important;
  }

}
/* ✅ mobile auth button (Dashboard/Sign In) */
@media (max-width: 991px){
  .m-auth-btn{
    display:inline-flex !important;
    align-items:center;
    justify-content:center;
    height:36px;
    padding:0 12px;
    background:#dfff00;   /* same yellow */
    color:#000 !important;
    
    font-weight: 600;
    font-family: var(--title-font);
    border-radius:6px;
    font-size:12px;
    line-height:1;
    text-transform:uppercase;
    white-space:nowrap;
  }
}
@media (max-width: 991px){

  .nav-header.header-layout3 .menu-area .row{
    display:flex !important;
    align-items:center !important;
    justify-content:space-between !important;
    flex-wrap:nowrap !important;
    gap:10px !important;
  }

  .nav-header.header-layout3 .header-logo{
    flex:0 0 auto !important;
    max-width:140px !important;
  }

  .nav-header.header-layout3 .header-logo img{
    max-height:60px !important;
    width:auto !important;
    display:block !important;
  }

  .nav-header.header-layout3 .navbar-right{
    display:flex !important;
    align-items:center !important;
    gap:12px !important;
    flex-wrap:nowrap !important;
  }

  .nav-header.header-layout3 .navbar-right a,
  .nav-header.header-layout3 .navbar-right button{
    flex:0 0 auto !important;
    white-space:nowrap !important;
  }

  @media (max-width: 420px){
    .nav-header.header-layout3 .header-cart-text{
      display:none !important;
    }
  }
  
  
}
</style>

    <div class="sticky-wrapper">
        <!-- Main Menu Area -->
        <div class="menu-area">
            <div class="container-fluid">
                <div class="row align-items-center justify-content-between">

                    <div class="col-auto">
                        <div class="header-logo">
                            <a href="{{ route('home') }}">
                                <img src="{{ asset($setting?->logo) }}" alt="{{ $setting?->app_name }}">
                            </a>
                        </div>
                    </div>

                    <!-- ✅ FIXED: proper column wrapper close -->
                    <div class="col-12 col-lg-auto ms-lg-auto">
                        <div class="header-right-wrap">

                            <nav class="main-menu main-menu-mobile">
                                @include('frontend.partials.main-menu')
                            </nav>

                            <div class="navbar-right d-inline-flex d-lg-none">
                                @include('frontend.partials.cart-menu')
                                {{-- ✅ Mobile Dashboard / SignIn --}}
    @auth
    <a href="{{ route('dashboard') }}" class="btn" style="background:#000; font-weight:600;">
        <span class="link-effect text-uppercase">
            <span class="effect-1">Dashboard</span>
            <span class="effect-1">Dashboard</span>
        </span>
    </a>
@else
    <a href="{{ route('login') }}" class="btn">
        <span class="link-effect text-uppercase">
            <span class="effect-1">Sign In</span>
            <span class="effect-1">Sign In</span>
        </span>
    </a>
@endauth

                                <button type="button" class="menu-toggle sidebar-btn" aria-label="hamburger">
                                    <span class="line"></span>
                                    <span class="line"></span>
                                    <span class="line"></span>
                                </button>
                            </div>

                        </div>
                    </div>
                    <!-- ✅ FIXED: proper column wrapper close end -->

                    <div class="col-auto d-none d-lg-block">
                        <div class="header-button">
                            @include('frontend.partials.cart-menu')

                           @auth('web')
    <a href="{{ route('dashboard') }}" class="header-cart header-cart-btn">
        <span class="header-cart-text">Dashboard</span>
    </a>
@else
    <a href="{{ route('login') }}" class="header-cart header-cart-btn">
        <span class="header-cart-text">Sign In</span>
    </a>
@endauth
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</header>