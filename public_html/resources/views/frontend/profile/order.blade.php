@extends('frontend.layouts.master')

@section('meta_title', __('Order') . ' || ' . $setting->app_name)

@section('header')
    @include('frontend.layouts.header-layout.three')
@endsection
@use('App\Enums\OrderStatus', 'OrderStatus')
@section('contents')
    <!-- Breadcumb Area -->
    <x-breadcrumb :title="__('Order')" />

    <!--  Dashboard Area -->
    <section class="wsus__dashboard_profile wsus__dashboard">
        <div class="container">
            <div class="row">
                <!--  Sidebar Area -->
                @include('frontend.profile.partials.sidebar')
                <!--  Main Content Area -->
                <div class="col-lg-8 col-xl-9 ">
                    <div class="wsus__dashboard_main_contant ">
                        <h4>{{ __('Order') }}</h4>
                        <div class="wsus__dashboard_order">
                            <div class="row">
                                <div class="col-12 ">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <th class="serial">{{ __('Serial') }}</th>
                                                    <th class="p_date">{{ __('Purchase Date') }}</th>
                                                    <th class="serial">{{ __('Quantity') }}</th>
                                                    <th class="price">{{ __('Amount') }}</th>
                                                    <th class="package">{{ __('Payment Status') }}</th>
                                                    <th class="price">{{ __('Status') }}</th>
                                                    <th class="action">{{ __('Action') }}</th>
                                                </tr>
                                                @forelse ($orders as $key => $order)
                                                    <tr>
                                                        <td class="serial">{{ $key++ < 10 ? '0' . $key++ : $key++ }}
                                                        </td>
                                                        <td class="p_date">
                                                            {{ formattedDate($order?->created_at) }}
                                                        </td>
                                                        <td class="serial">{{ $order?->product_qty }}</td>
                                                        <td class="price">
                                                            {{ specific_currency_with_icon($order?->payable_currency, $order?->paid_amount) }}
                                                        </td>

                                                        <td class="package"><span
                                                                class="btn-sm rounded-5 btn-{{ OrderStatus::getColor($order?->payment_status) }}">{{ OrderStatus::getLabel($order?->payment_status) }}</span>
                                                        </td>

                                                        <td class="price"><span
                                                                class="btn-sm rounded-5 btn-{{ OrderStatus::getColor($order?->order_status) }}">{{ OrderStatus::getLabel($order?->order_status) }}</span>
                                                        </td>

                                                        <td class="price d-flex gap-1">
                                                            <a target="_blank" class="btn-sm btn-success"
                                                                href="{{ route('user.order.show', $order?->order_id) }}"><i data-bs-toggle="tooltip"
                                                                data-placement="top" title="{{__('Invoice')}}"
                                                                    class="far fa-eye" aria-hidden="true"></i></a>
                                                            @if ($order?->order_status == OrderStatus::DRAFT->value)
                                                                <a class="btn-sm btn-primary"
                                                                    href="{{ route('payment', ['order_id' => $order?->order_id]) }}"><i data-bs-toggle="tooltip"
                                                                data-placement="top" title="{{__('Pay Now')}}"
                                                                        class="fas fa-credit-card"
                                                                        aria-hidden="true"></i></a>
                                                                        
                                                            @endif
                                                            <!-- ✅ Forward Button (Amber) -> Digital Product Page -->
                                                            <a class="btn-sm btn-forward"
                                                               href="{{ route('user.digital.products') }}">
                                                               <i data-bs-toggle="tooltip"
                                                                  data-placement="top"
                                                                  title="{{ __('Digital Products') }}"
                                                                  class="fas fa-forward"
                                                                  aria-hidden="true"></i>
                                                            </a>

                                                            
                                                            <!--@if (in_array($order?->payment_status, [OrderStatus::COMPLETED->value, OrderStatus::REFUND->value]))
                                                                <a class="btn-sm btn-danger" href="javascript:;"
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#refund-{{ $key }}"><i data-bs-toggle="tooltip"
                                                                data-placement="top" title="{{__('Refund Amount')}}"
                                                                        class="fas fa-undo" aria-hidden="true"></i></a>
                                                                <div class="modal fade" id="refund-{{ $key }}"
                                                                    tabindex="-1" aria-hidden="true">
                                                                    <div class="modal-dialog modal-dialog-centered">
                                                                        @if ($order?->refund)
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <h4>{{ __('Refund Request') }}</h4>
                                                                                </div>
                                                                                <div class="modal-body text-center">
                                                                                    <p
                                                                                        class="text-{{ OrderStatus::getColor($order?->refund?->status) }}">
                                                                                        {{ $order?->refund?->admin_response ?? __('Your refund request is pending. Please wait for the admin response') }}
                                                                                    </p>
                                                                                    @if ($order?->refund?->status == OrderStatus::COMPLETED->value)
                                                                                        <p><b>{{ __('Refund amount') }}</b>
                                                                                            <span>{{ currency($order?->refund?->refund_amount) }}</span>
                                                                                        </p>
                                                                                    @endif
                                                                                    <span
                                                                                        class="btn-sm rounded-5 btn-{{ OrderStatus::getColor($order?->refund?->status) }}">{{ OrderStatus::getLabel($order?->refund?->status) }}</span>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button"
                                                                                        class="btn py-2 px-3"
                                                                                        data-bs-dismiss="modal">
                                                                                        <span
                                                                                            class="link-effect text-uppercase">
                                                                                            <span
                                                                                                class="effect-1">{{ __('Close') }}</span>
                                                                                            <span
                                                                                                class="effect-1">{{ __('Close') }}</span>
                                                                                        </span>
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        @else
                                                                            <form class="modal-content woocommerce-checkout"
                                                                                action="{{ route('user.refund-request', $order?->order_id) }}"
                                                                                method="post">
                                                                                @csrf
                                                                                <div class="modal-header">
                                                                                    <h4>{{ __('Refund Request') }}</h4>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    <div class="form-group">
                                                                                        <label>{{ __('Reason') }}
                                                                                            *</label>
                                                                                        <textarea rows="5" class="form-control" placeholder="{{ __('Reason') }}" name="reason">{{ old('reason') }}</textarea>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label>{{ __('Payment Method') }}
                                                                                            *</label>
                                                                                        <select class="select_2 form-select"
                                                                                            name="method">
                                                                                            <option value="">
                                                                                                {{ __('Select Method') }}
                                                                                            </option>
                                                                                            @foreach ($methods as $key => $method)
                                                                                                @continue($key == 'hand_cash')
                                                                                                <option
                                                                                                    value="{{ $key }}"
                                                                                                    @selected(old('method') == $key)>
                                                                                                    {{ $method['name'] }}
                                                                                                </option>
                                                                                            @endforeach
                                                                                        </select>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label>{{ __('Account Information') }}
                                                                                            *</label>
                                                                                        <textarea rows="5" class="form-control" placeholder="{{ __('Account Information') }}" name="account_information">{{ old('account_information') }}</textarea>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button"
                                                                                        class="btn py-2 px-3"
                                                                                        data-bs-dismiss="modal">
                                                                                        <span
                                                                                            class="link-effect text-uppercase">
                                                                                            <span
                                                                                                class="effect-1">{{ __('Close') }}</span>
                                                                                            <span
                                                                                                class="effect-1">{{ __('Close') }}</span>
                                                                                        </span>
                                                                                    </button>
                                                                                    <button type="submit"
                                                                                        class="btn style2 py-2 px-3">
                                                                                        <span
                                                                                            class="link-effect text-uppercase">
                                                                                            <span
                                                                                                class="effect-1">{{ __('Submit') }}</span>
                                                                                            <span
                                                                                                class="effect-1">{{ __('Submit') }}</span>
                                                                                        </span>
                                                                                    </button>
                                                                                </div>
                                                                            </form>
                                                                        @endif
                                                                    </div>
                                                                </div>
                                                            @endif -->
                                                            
                                                            
                                                        </td>
                                                    </tr>
                                                @empty
                                                    <tr>
                                                        <td colspan="7"><x-data-not-found /></td>
                                                    </tr>
                                                @endforelse
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @if ($orders->hasPages())
                            {{ $orders->onEachSide(0)->links('frontend.pagination.custom') }}
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--  Marquee Area -->
    @include('frontend.partials.marquee')
@endsection
@push('css')
<style>
/* ===== ORDERS PAGE: SAME DASHBOARD PREMIUM THEME ===== */

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

/* Main content card (orders container) */
.wsus__dashboard_main_contant{
    background: linear-gradient(145deg, #111, #181818) !important;
    border-radius: 25px !important;
    padding: 40px !important;
    color: #fff !important;
    box-shadow: 0 30px 70px rgba(0,0,0,0.7) !important;
    position: relative;
    overflow: hidden;
}

/* Shine moving effect on card */
.wsus__dashboard_main_contant::before{
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

/* Heading gradient like Personal Information */
.wsus__dashboard_main_contant > h4{
    font-size: 26px !important;
    font-weight: 700 !important;
    background: linear-gradient(45deg, #00f5ff, #ff00ff) !important;
    -webkit-background-clip: text !important;
    -webkit-text-fill-color: transparent !important;
}

/* Table container */
.wsus__dashboard_order .table-responsive{
    border-radius: 18px;
    overflow: hidden;
}

/* Table reset */
.wsus__dashboard_order table.table{
    margin:0 !important;
    border-collapse: separate !important;
    border-spacing: 0 12px !important;
    width:100% !important;
}

/* Header row (your table uses <th> inside tbody first row) */
.wsus__dashboard_order table.table tbody tr:first-child{
    background: transparent !important;
}
.wsus__dashboard_order table.table tbody tr:first-child th{
    color:#00f5ff !important;
    font-weight:700 !important;
    border:none !important;
    padding:14px 16px !important;
    background: transparent !important;
}

/* Data rows */
.wsus__dashboard_order table.table tbody tr:not(:first-child){
    background: rgba(255,255,255,0.04) !important;
    border: 1px solid rgba(255,255,255,0.08) !important;
    border-radius: 14px !important;
    overflow: hidden;
    transition: .25s;
}
.wsus__dashboard_order table.table tbody tr:not(:first-child):hover{
    background: rgba(0,245,255,0.08) !important;
}

/* Cells */
.wsus__dashboard_order table.table td{
    border:none !important;
    color:#fff !important;
    padding:16px !important;
    vertical-align: middle !important;
}

/* Status pills (payment/order status) */
.wsus__dashboard_order .package span,
.wsus__dashboard_order .price span.btn-sm{
    border-radius: 999px !important;
    padding: 6px 12px !important;
    font-weight: 600 !important;
}

/* Action icons buttons (eye/pay/refund) */
.wsus__dashboard_order .btn-sm{
    border-radius: 12px !important;
    padding: 8px 10px !important;
}
/* ✅ Amber Forward Button */
.btn-forward{
    background:#ffb300 !important;
    color:#000 !important;
    border:none !important;
}
.btn-forward:hover{
    background:#ffc107 !important;
    box-shadow:0 0 18px rgba(255,193,7,.6);
    transform:translateY(-2px);
}

/* Pagination centered */
.pagination{
    justify-content: center !important;
}
/* =========================
   ORDERS PAGE - RESPONSIVE
   (Add at the end)
========================= */

/* Mobile spacing fix */
@media (max-width: 991px){

  /* main card padding smaller */
  .wsus__dashboard_main_contant{
    padding: 18px !important;
    border-radius: 18px !important;
  }

  /* heading smaller */
  .wsus__dashboard_main_contant > h4{
    font-size: 20px !important;
    margin-bottom: 12px !important;
  }

  /* sidebar + content stack properly */
  .wsus__dashboard_profile .row{
    row-gap: 18px !important;
  }

  /* table scroll fix */
  .wsus__dashboard_order .table-responsive{
    overflow-x: auto !important;
    -webkit-overflow-scrolling: touch;
    border-radius: 14px !important;
  }

  /* table min width so it scrolls instead of breaking */
  .wsus__dashboard_order table.table{
    min-width: 820px !important; /* ✅ adjust if needed */
  }

  /* cells padding smaller */
  .wsus__dashboard_order table.table td,
  .wsus__dashboard_order table.table tbody tr:first-child th{
    padding: 12px !important;
    font-size: 13px !important;
  }

  /* action buttons in one line */
  .wsus__dashboard_order td.price.d-flex{
    flex-wrap: nowrap !important;
    white-space: nowrap !important;
  }

  .wsus__dashboard_order td.price.d-flex a.btn-sm{
    flex: 0 0 auto !important;
  }
}

/* Sticky header row while horizontal scroll */
.wsus__dashboard_order table.table tbody tr:first-child th{
  position: sticky;
  top: 0;
  z-index: 5;
  background: rgba(0,0,0,0.85) !important;
  backdrop-filter: blur(6px);
}
@media (max-width: 991px){
  .wsus__dashboard_order .btn-sm{
    padding: 6px 8px !important;
    border-radius: 10px !important;
  }
}
</style>
@endpush

@section('footer')
    @include('frontend.layouts.footer-layout.two')
@endsection
