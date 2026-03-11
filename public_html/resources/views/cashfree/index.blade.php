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
	</style>
	
@endpush

@section('header')
    @include('frontend.layouts.header-layout.three')
@endsection

@section('contents')
    <!-- Breadcumb -->
    <x-breadcrumb :image="$setting?->shop_page_breadcrumb_image" :title="__('Shop')" />

    <!-- Main Area -->
    <section class="shop__area space top-baseline">
        <div class="container">
            <div class="shop__inner-wrap">
                {{-- dynamic content will go here via ajax --}}
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
    <script src="{{ asset('frontend/js/shop.js') }}"></script>
	
	<script>
	var filters = {};

    function fetchProductData(page = 1, filters = {}) {
        const filterParams = new URLSearchParams(filters).toString();
        $.ajax({
            url: `${base_url}/fetch-products?page=${page}&${filterParams}`,
            beforeSend: function () {
                showPreLoader();
            },
            success: function (data) {
                $(".shop__inner-wrap").html(data.views);
                $(".price_slider").slider({
                    range: true,
                    min: 0,
                    max: data.max_price,
                    values: [data.from, data.to],
                    slide: function(event, ui) {
                        $(".from").text(currency_code + + ui.values[0]);
                        $(".to").text(currency_code + + ui.values[1]);
                    },
                    change: function (event, ui) {
                        filters.from = ui.values[0];
                        filters.to = ui.values[1];
                        fetchProductData(1, filters);
                    }
                });
                $(".from").text(currency_code + $(".price_slider").slider("values", 0));
                $(".to").text(currency_code + $(".price_slider").slider("values", 1));
                scrollToElement(".top-baseline");
            },
            error: () => toastr.error(basic_error_message),
            complete: hidePreLoader,
        });

        // Update browser history
        history.pushState({ page, filters }, null, window.location.pathname + (filterParams ? `?${filterParams}` : ""));
    }
	$(document).ready(function(){
		fetchProductData(1, filters);
	});
	</script>
	
@endpush
<script>
	function whatsApp() {
		var text = "{{ url()->full() }}";
		var url  = "https://wa.me/?text=" + encodeURIComponent(text);

		window.open(url, "_blank");
	}
        $(document).ready(function() {

            //buy now method
            $(document).on("click", ".buy-now-btn", function(e) {
                e.preventDefault();
                const isDigital = true;
                const url = $(this).data("url");
                window.location.href = isDigital ? `${url}` :
                    `${url}?qty=${$(".quantity-input-value").val() || 1}`;
            });
        });
    </script>
