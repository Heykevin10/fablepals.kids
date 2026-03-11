@extends('frontend.layouts.master')

@section('meta_title', __('Digital Product') . ' || ' . $setting->app_name)

@section('header')
    @include('frontend.layouts.header-layout.three')
@endsection

@section('contents')
    <!-- Breadcumb Area -->
    <x-breadcrumb :title="__('Digital Product')" />

    <!--  Dashboard Area -->
    <section class="wsus__dashboard_profile wsus__dashboard">
        <div class="container">
            <div class="row">
                <!--  Sidebar Area -->
                @include('frontend.profile.partials.sidebar')
                <!--  Main Content Area -->
                <div class="col-lg-8 col-xl-9 ">
                    <div class="wsus__dashboard_main_contant wishlist-content">
                        <h4>{{ __('Digital Product') }}</h4>
                        <div class="wsus__dashboard_wishlist">
                            <div class="row">
                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <th class="image text-center">
                                                        {{ __('Image') }}
                                                    </th>
                                                    <th class="details text-center">
                                                        {{ __('Details') }}
                                                    </th>
                                                    <th class="status text-center">
                                                        {{ __('Download') }}
                                                    </th>
                                                </tr>
                                                @forelse ($digital_products as $orderProduct)
                                                    <tr>
                                                        <td class="image">
                                                            <a href="{{ route('single.product', $orderProduct->slug) }}">
                                                                <img src="{{ asset($orderProduct->image) }}"
                                                                    alt="{{ $orderProduct->product_name }}" class="img-fluid w-100">
                                                            </a>
                                                        </td>
                                                        <td class="details text-center">
                                                            <h5>{{ $orderProduct->product_name }}</h5>
																{{--<p class="rating">
                                                                @for ($i = 1; $i <= 5; $i++)
                                                                    @if ($i <= floor($orderProduct?->product?->average_rating))
                                                                        <i class="fas fa-solid fa-star"></i>
                                                                    @elseif ($i - 0.5 <= $orderProduct?->product?->average_rating)
                                                                        <i class="fas fa-solid fa-star-half-alt"></i>
                                                                    @else
                                                                        <i class="far fa-star"></i>
                                                                    @endif
                                                                @endfor
                                                                <span>({{ $orderProduct?->product?->reviews_count }}
                                                                    {{ __('Reviews') }})</span>
                                                            </p>--}}
                                                            <h6>{{ currency($orderProduct->unit_price) }}</h6>
                                                        </td>
                                                        <td class="status text-center">
                                                            <a class="btn style2 py-2 px-3" href="javascript:void(0)" onclick="return fileFn({{ $orderProduct->product_id }})">{{__('Download')}} <i
                                                                class="fa fa-download"></i></a></a>
                                                        </td>
                                                    </tr>
                                                @empty
                                                    <tr>
                                                        <td colspan="5">
                                                            <x-data-not-found />
                                                        </td>
                                                    </tr>
                                                @endforelse
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @if ($digital_products->hasPages())
                            {{ $digital_products->onEachSide(0)->links('frontend.pagination.custom') }}
                        @endif

                    </div>
                </div>
            </div>
        </div>
    </section>
	
	
<!-- Modal -->
<div class="modal fade" id="fileModal" tabindex="-1" aria-labelledby="fileModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="fileModalLabel">Digital Files</h1>
<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>      </div>
      <div class="modal-body file_html">
        
      </div>
    </div>
  </div>
</div>

    <!--  Marquee Area -->
    @include('frontend.partials.marquee')
@endsection
@section('footer')
 @push('css')
<style>
/* ===== DIGITAL PRODUCT: SAME DASHBOARD PREMIUM THEME ===== */

/* Full dark background */
.wsus__dashboard_profile{
    background: radial-gradient(circle at 20% 30%, #001a2e, #000814 50%, #000 100%) !important;
    position: relative;
    overflow: hidden;
}

/* Glow background animation */
.wsus__dashboard_profile::before{
    content:"";
    position:absolute;
    width:600px;height:600px;
    background: radial-gradient(circle, rgba(0,255,255,0.15), transparent 70%);
    top:-200px; left:-200px;
    animation: floatGlow 8s infinite alternate ease-in-out;
    pointer-events:none;
}
@keyframes floatGlow{0%{transform:translate(0,0)}100%{transform:translate(100px,100px)}}

/* Main card */
.wsus__dashboard_main_contant.wishlist-content{
    background: linear-gradient(145deg, #111, #181818) !important;
    border-radius: 25px !important;
    padding: 40px !important;
    color: #fff !important;
    box-shadow: 0 30px 70px rgba(0,0,0,0.7) !important;
    position: relative;
    overflow: hidden;
}

/* Shine effect */
.wsus__dashboard_main_contant.wishlist-content::before{
    content:"";
    position:absolute;
    top:-100%; left:-50%;
    width:200%; height:200%;
    background: linear-gradient(120deg, transparent 40%, rgba(0,255,255,0.10) 50%, transparent 60%);
    transform: rotate(25deg);
    animation: shineMove 6s infinite;
    pointer-events:none;
}
@keyframes shineMove{0%{top:-100%}100%{top:100%}}

/* Heading gradient */
.wsus__dashboard_main_contant.wishlist-content > h4{
    font-size: 26px !important;
    font-weight: 700 !important;
    background: linear-gradient(45deg, #00f5ff, #ff00ff) !important;
    -webkit-background-clip: text !important;
    -webkit-text-fill-color: transparent !important;
}

/* Table wrapper */
.wsus__dashboard_wishlist .table-responsive{
    border-radius: 18px;
    overflow: hidden;
}

/* Table spacing */
.wsus__dashboard_wishlist table.table{
    margin:0 !important;
    border-collapse: separate !important;
    border-spacing: 0 12px !important;
    width:100% !important;
}

/* Header row (first tr in tbody) */
.wsus__dashboard_wishlist table.table tbody tr:first-child th{
    color:#00f5ff !important;
    font-weight:700 !important;
    border:none !important;
    padding:14px 16px !important;
    background: transparent !important;
    text-align:center !important;
}

/* Data rows */
.wsus__dashboard_wishlist table.table tbody tr:not(:first-child){
    background: rgba(255,255,255,0.04) !important;
    border: 1px solid rgba(255,255,255,0.08) !important;
    border-radius: 14px !important;
    transition: .25s;
}
.wsus__dashboard_wishlist table.table tbody tr:not(:first-child):hover{
    background: rgba(0,245,255,0.08) !important;
}

/* Cells */
.wsus__dashboard_wishlist table.table td{
    border:none !important;
    color:#fff !important;
    padding:16px !important;
    vertical-align: middle !important;
}

/* Image cell */
.wsus__dashboard_wishlist td.image{
    width: 180px;
}
.wsus__dashboard_wishlist td.image img{
    border-radius: 14px !important;
    max-height: 110px;
    object-fit: cover;
    box-shadow: 0 10px 25px rgba(0,0,0,.45);
}

/* Product name + price */
.wsus__dashboard_wishlist td.details h5{
    color:#fff !important;
    font-weight:700;
    margin-bottom:6px;
}
.wsus__dashboard_wishlist td.details h6{
    color:#00f5ff !important;
    font-weight:700;
    margin:0;
}

/* Download button glow */
.wsus__dashboard_wishlist td.status .btn.style2{
    background: linear-gradient(45deg, #00f5ff, #ff00ff) !important;
    border: none !important;
    border-radius: 40px !important;
    color:#fff !important;
    font-weight: 600 !important;
    padding: 10px 18px !important;
}
.wsus__dashboard_wishlist td.status .btn.style2:hover{
    box-shadow: 0 0 30px rgba(0,245,255,.55) !important;
    transform: translateY(-2px);
}

/* Modal dark theme */
#fileModal .modal-content{
    background: linear-gradient(145deg, #0f0f0f, #1a1a1a) !important;
    color:#000 !important;
    border: 1px solid rgba(255,255,255,0.12) !important;
    border-radius: 18px !important;
}

#fileModal .modal-header{
    border-bottom: 1px solid rgba(255,255,255,0.10) !important;
}
#fileModal .btn-close{
    filter: invert(1);
}
#fileModal .modal-title{
    background: linear-gradient(45deg, #00f5ff, #ff00ff);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* Pagination center */
.pagination{ justify-content:center !important; }

#fileModal .btn-close{
    filter: none !important;
    opacity: 1 !important;
    background: none !important;
    background-image: none !important;
    width: 1.2rem;
    height: 1.2rem;
}

#fileModal .btn-close::before{
    content: "✕";
    color: #ffffff;
    font-size: 22px;
    font-weight: bold;
}
/* =========================
   ✅ DIGITAL PRODUCT MOBILE RESPONSIVE (TABLE -> CARD)
   ========================= */
@media (max-width: 767px){

  /* spacing */
  .wsus__dashboard_main_contant.wishlist-content{
    padding: 18px !important;
    border-radius: 18px !important;
  }

  /* hide table headings on mobile */
  .wsus__dashboard_wishlist table.table tbody tr:first-child{
    display:none !important;
  }

  /* make rows behave like cards */
  .wsus__dashboard_wishlist table.table,
  .wsus__dashboard_wishlist table.table tbody,
  .wsus__dashboard_wishlist table.table tr,
  .wsus__dashboard_wishlist table.table td{
    display:block !important;
    width:100% !important;
  }

  /* card look */
  .wsus__dashboard_wishlist table.table tbody tr:not(:first-child){
    margin-bottom: 14px !important;
    padding: 14px !important;
    border-radius: 16px !important;
  }

  /* reset cell padding */
  .wsus__dashboard_wishlist table.table td{
    padding: 10px 0 !important;
    text-align: left !important;
  }

  /* image full width */
  .wsus__dashboard_wishlist td.image{
    width:100% !important;
  }
  .wsus__dashboard_wishlist td.image img{
    width:100% !important;
    max-height: 180px !important;
    border-radius: 14px !important;
  }

  /* details */
  .wsus__dashboard_wishlist td.details{
    text-align:left !important;
  }
  .wsus__dashboard_wishlist td.details h5{
    font-size: 18px !important;
    line-height: 1.3;
    margin-top: 6px;
  }
  .wsus__dashboard_wishlist td.details h6{
    font-size: 16px !important;
  }

  /* download button full width */
  .wsus__dashboard_wishlist td.status{
    text-align:left !important;
  }
  .wsus__dashboard_wishlist td.status .btn.style2{
    width:100% !important;
    display:flex !important;
    justify-content:center !important;
    gap:8px;
  }
}

</style>
@endpush


    @include('frontend.layouts.footer-layout.two')
@endsection

@push('js')
<script>
	function fileFn(id){

		$.ajax({
			url: "{{ route('user.digital.file') }}",
			type: "POST",
			data:{_token: "{{ csrf_token() }}",id:id},
			dataType:'json',
			success: function (res) {
				$('.file_html').html(res.html);
				$('#fileModal').modal('show');
			},
			error: function () {
				alert('Something went wrong');
			}
		});
	}
</script>
@endpush
