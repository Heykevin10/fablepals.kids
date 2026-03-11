@extends('frontend.layouts.master')

@section('meta_title', __('Billing Addresses') . ' || ' . $setting->app_name)

@section('header')
    @include('frontend.layouts.header-layout.three')
@endsection
@section('contents')
    <!-- Breadcumb Area -->
    <x-breadcrumb :title="__('Billing Addresses')" />

    <!--  Dashboard Area -->
    <section class="wsus__dashboard_profile wsus__dashboard">
        <div class="container">
            <div class="row">
                <!--  Sidebar Area -->
                @include('frontend.profile.partials.sidebar')
                <!--  Main Content Area -->
                <div class="col-lg-8 col-xl-9 ">
                    <div class="wsus__dashboard_main_contant ">
                        <div class="wsus__dashboard_order">
                            <div class="row">
                                <div class="col-12 mb-3 d-flex justify-content-between align-items-center">
                                    <h4>{{ __('Billing Addresses') }}</h4>
                                    <a href="javascript:;" data-bs-toggle="modal" data-bs-target="#storeModal" class="btn">
                                        <span class="link-effect">
                                            <span class="effect-1"><i class="fas fa-plus"></i> {{ __('Add New') }}</span>
                                            <span class="effect-1"><i class="fas fa-plus"></i> {{ __('Add New') }}</span>
                                        </span>
                                    </a>
                                </div>
                                <div class="col-12 ">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <th class="serial">{{ __('Serial') }}</th>
                                                    <th class="price">{{ __('Title') }}</th>
                                                    <th class="package">{{ __('Details') }}</th>
                                                    <th class="price">{{ __('Action') }}</th>
                                                </tr>
                                                @forelse ($addresses as $key => $address)
                                                    <tr>
                                                        <td class="serial align-middle">
                                                            {{ $key++ < 10 ? '0' . $key++ : $key++ }}
                                                        </td>
                                                        <td class="price align-middle">{{ $address?->title }}</td>
                                                        <td class="package">
                                                            <address class="mb-0">
                                                                {{ $address?->first_name }} {{ $address?->last_name }}<br>
                                                                {{ $address?->address }}<br>
                                                                {{ $address?->city }}, {{ $address?->province }}
                                                                {{ $address?->zip_code }}<br>
                                                                {{ $address?->country?->name }}<br>
                                                                <strong>{{ __('Phone') }}:</strong>
                                                                {{ $address?->phone }}<br>
                                                                <strong>{{ __('Email') }}:</strong>
                                                                {{ $address?->email }}
                                                            </address>
                                                        </td>

                                                        <td class="price border-bottom-0 align-middle">
                                                            <div
                                                                class=" d-flex gap-2 align-items-center justify-content-center">
                                                                <a class="address-edit btn-sm btn-success"
                                                                    href="javascript:;" data-bs-toggle="modal"
                                                                    data-bs-target="#edit-address-modal"
                                                                    data-address="{{ $address }}"><i
                                                                        class="fas fa-pencil-alt"
                                                                        aria-hidden="true"></i></a>


                                                                <a class="btn-sm btn-danger address-remove"
                                                                    href="javascript:;" data-bs-toggle="modal"
                                                                    data-bs-target="#deleteModal"
                                                                    data-id="{{ $address?->id }}"><i
                                                                        class="far fa-trash-alt" aria-hidden="true"></i></a>
                                                            </div>

                                                        </td>
                                                    </tr>
                                                @empty
                                                    <tr>
                                                        <td colspan="4"><x-data-not-found /></td>
                                                    </tr>
                                                @endforelse
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @if ($addresses->hasPages())
                            {{ $addresses->onEachSide(0)->links('frontend.pagination.custom') }}
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--  Add Modal -->
    <div class="modal fade" id="storeModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered custom-max-width">
            <form class="modal-content woocommerce-checkout" action="{{ route('user.billing.store') }}" method="POST">
                @csrf
                <div class="modal-header">
                    <h4>{{ __('Address') }}</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>{{ __('First Name') }} *</label>
                            <input type="text" class="form-control" placeholder="{{ __('First Name') }}"
                                value="{{ old('first_name') }}" name="first_name">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('Last Name') }}</label>
                            <input type="text" class="form-control" placeholder="{{ __('Last Name') }}" name="last_name"
                                value="{{ old('last_name') }}">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('Phone') }} *</label>
                            <input type="text" class="form-control" placeholder="{{ __('Phone') }}" name="phone"
                                value="{{ old('phone') }}">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('Email Address') }} *</label>
                            <input type="email" class="form-control" placeholder="{{ __('Email') }}" name="email"
                                value="{{ old('email') }}">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('Title') }} *</label>
                            <input type="text" class="form-control" placeholder="{{ __('Title') }}" name="title"
                                value="{{ old('title') }}">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('Country') }} *</label>
                            <select class="form-select" name="country_id" id="country_id">
                                @foreach ($countries as $country)
                                    <option @selected(old('country_id') == $country?->id) value="{{ $country?->id }}">
                                        {{ $country?->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('Province') }} *</label>
                            <input type="text" class="form-control" name="province" placeholder="{{ __('Province') }}"
                                value="{{ old('province') }}">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('City') }} *</label>
                            <input type="text" class="form-control" name="city" placeholder="{{ __('City') }}"
                                value="{{ old('city') }}">

                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('Zip code') }} *</label>
                            <input type="text" class="form-control" placeholder="{{ __('Zip code') }}"
                                name="zip_code" value="{{ old('zip_code') }}">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('Address') }} <span>*</span></label>
                            <input type="text" class="form-control" placeholder="{{ __('Address') }}" name="address"
                                value="{{ old('address') }}">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn py-2 px-3" data-bs-dismiss="modal">
                        <span class="link-effect text-uppercase">
                            <span class="effect-1">{{ __('Close') }}</span>
                            <span class="effect-1">{{ __('Close') }}</span>
                        </span>
                    </button>
                    <button type="submit" class="btn style2 py-2 px-3">
                        <span class="link-effect text-uppercase">
                            <span class="effect-1">{{ __('Save') }}</span>
                            <span class="effect-1">{{ __('Save') }}</span>
                        </span>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!--  Edit Modal -->
    <div class="modal fade" id="edit-address-modal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered custom-max-width">
            <form class="modal-content woocommerce-checkout" id="editForm" action="" method="POST">
                @csrf
                @method('PATCH')
                <div class="modal-header">
                    <h4>{{ __('Update Address') }}</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>{{ __('First Name') }} *</label>
                            <input type="text" class="form-control" placeholder="{{ __('First Name') }}"
                                name="first_name">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('Last Name') }}</label>
                            <input type="text" class="form-control" placeholder="{{ __('Last Name') }}"
                                name="last_name">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('Phone') }} *</label>
                            <input type="text" class="form-control" placeholder="{{ __('Phone') }}"
                                name="phone">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('Email Address') }} *</label>
                            <input type="email" class="form-control" placeholder="{{ __('Email') }}"
                                name="email">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('Title') }} *</label>
                            <input type="text" class="form-control" placeholder="{{ __('Title') }}"
                                name="title">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('Country') }} *</label>
                            <select class="form-select" name="country_id" id="country_id">
                                @foreach ($countries as $country)
                                    <option value="{{ $country?->id }}">
                                        {{ $country?->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('Province') }} *</label>
                            <input type="text" class="form-control" name="province"
                                placeholder="{{ __('Province') }}">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('City') }} *</label>
                            <input type="text" class="form-control" name="city"
                                placeholder="{{ __('City') }}">

                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('Zip code') }} *</label>
                            <input type="text" class="form-control" placeholder="{{ __('Zip code') }}"
                                name="zip_code">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ __('Address') }} <span>*</span></label>
                            <input type="text" class="form-control" placeholder="{{ __('Address') }}"
                                name="address">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn py-2 px-3" data-bs-dismiss="modal">
                        <span class="link-effect text-uppercase">
                            <span class="effect-1">{{ __('Close') }}</span>
                            <span class="effect-1">{{ __('Close') }}</span>
                        </span>
                    </button>
                    <button type="submit" class="btn style2 py-2 px-3">
                        <span class="link-effect text-uppercase">
                            <span class="effect-1">{{ __('Update') }}</span>
                            <span class="effect-1">{{ __('Update') }}</span>
                        </span>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!--  Delete Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <form class="modal-content woocommerce-checkout" id="deleteForm" action="" method="POST">
                @csrf
                @method('DELETE')
                <div class="modal-header">
                    <h4>{{ __('Delete Confirmation') }}</h4>
                </div>
                <div class="modal-body">
                    <p>{{ __('Are You sure want to delete this item ?') }}</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn py-2 px-3" data-bs-dismiss="modal">
                        <span class="link-effect text-uppercase">
                            <span class="effect-1">{{ __('Close') }}</span>
                            <span class="effect-1">{{ __('Close') }}</span>
                        </span>
                    </button>
                    <button type="submit" class="btn style2 py-2 px-3">
                        <span class="link-effect text-uppercase">
                            <span class="effect-1">{{ __('Yes, Delete') }}</span>
                            <span class="effect-1">{{ __('Yes, Delete') }}</span>
                        </span>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <!--  Marquee Area -->
    @include('frontend.partials.marquee')
@endsection
@section('footer')
@push('css')
<style>
/* ✅ Country select mobile friendly */
.modal-body .form-select{
  width: 100% !important;
  min-height: 52px !important;
  padding: 12px 42px 12px 14px !important;
  line-height: 1.3 !important;
  appearance: auto !important;        /* iOS/Android */
  -webkit-appearance: menulist !important;
  background-color: #111 !important;
  color: #fff !important;
}

/* ===== DARK BACKGROUND ===== */
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

/* ===== MAIN CONTENT GLASS CARD ===== */
.wsus__dashboard_main_contant{
    background: linear-gradient(145deg,#111,#181818) !important;
    border-radius: 25px !important;
    padding: 40px !important;
    color:#fff !important;
    box-shadow: 0 30px 70px rgba(0,0,0,0.7) !important;
    position: relative;
    overflow:hidden;
}
.wsus__dashboard_main_contant::before{
    content:"";
    position:absolute;
    top:-100%;left:-50%;
    width:200%;height:200%;
    background: linear-gradient(120deg,transparent 40%,rgba(0,255,255,0.1) 50%,transparent 60%);
    transform: rotate(25deg);
    animation: shineMove 6s infinite;
    pointer-events:none;
}
@keyframes shineMove{0%{top:-100%}100%{top:100%}}

/* ===== HEADER ROW (TITLE + ADD NEW) ===== */
.wsus__dashboard_main_contant h4{
    color:#fff !important;
    font-weight:700;
}
.wsus__dashboard_main_contant .btn{
    background: linear-gradient(45deg, #00f5ff, #ff00ff) !important;
    border:none !important;
    border-radius: 40px !important;
    padding: 10px 22px !important;
    color:#fff !important;
    font-weight:600;
}
.wsus__dashboard_main_contant .btn:hover{
    box-shadow: 0 0 25px rgba(0,245,255,.6) !important;
    transform: translateY(-2px);
}

/* ===== PREMIUM TABLE ===== */
.wsus__dashboard_order .table{
    width:100%;
    border-collapse: separate !important;
    border-spacing: 0 10px !important;
}
.wsus__dashboard_order .table tr:first-child{
    background: transparent !important;
}
.wsus__dashboard_order .table th{
    color:#00f5ff !important;
    font-weight:700 !important;
    padding: 14px 16px !important;
    border:none !important;
    text-transform: uppercase;
    font-size: 12px;
}
.wsus__dashboard_order .table td{
    background: rgba(255,255,255,0.05) !important;
    border: 1px solid rgba(255,255,255,0.08) !important;
    color:#fff !important;
    padding: 16px 16px !important;
    vertical-align: middle !important;
}
.wsus__dashboard_order .table tr td:first-child{
    border-top-left-radius: 14px;
    border-bottom-left-radius: 14px;
}
.wsus__dashboard_order .table tr td:last-child{
    border-top-right-radius: 14px;
    border-bottom-right-radius: 14px;
}

/* address text */
.wsus__dashboard_order address{
    color:#ddd !important;
    line-height: 1.6;
}
.wsus__dashboard_order address strong{
    color:#00f5ff !important;
}

/* action buttons */
.wsus__dashboard_order .btn-sm{
    border-radius: 12px !important;
    padding: 8px 10px !important;
}
.wsus__dashboard_order .btn-success{
    background: rgba(0,255,136,0.18) !important;
    border: 1px solid rgba(0,255,136,0.45) !important;
    color:#00ff88 !important;
}
.wsus__dashboard_order .btn-danger{
    background: rgba(255,77,77,0.18) !important;
    border: 1px solid rgba(255,77,77,0.45) !important;
    color:#ff4d4d !important;
}
.wsus__dashboard_order .btn-success:hover,
.wsus__dashboard_order .btn-danger:hover{
    transform: translateY(-2px);
}

/* ===== MODAL DARK THEME ===== */
.modal-content{
    background: #0f0f0f !important;
    color:#fff !important;
    border: 1px solid rgba(0,245,255,0.25) !important;
    border-radius: 18px !important;
}
.modal-header{
    border-bottom: 1px solid rgba(255,255,255,0.08) !important;
    
}
.modal-header h4{
    color: #00f5ff !important;
    font-weight: 700;
}
.modal-footer{
    border-top: 1px solid rgba(255,255,255,0.08) !important;
}
.modal-body label{
    color:#ddd !important;
    font-weight:600;
    font-size:13px;
}
.modal-body .form-control,
.modal-body .form-select{
    background:#111 !important;
    border:1px solid rgba(255,255,255,0.12) !important;
    color:#fff !important;
    border-radius: 12px !important;
}
.modal-body .form-control:focus,
.modal-body .form-select:focus{
    border-color: rgba(0,245,255,0.7) !important;
    box-shadow: 0 0 0 0.2rem rgba(0,245,255,0.15) !important;
}

/* pagination */
.pagination{justify-content:center !important;}
/* ===== Billing Addresses: Mobile Optimization ===== */
@media (max-width: 991px){

  /* main card padding reduce */
  .wsus__dashboard_main_contant{
    padding: 18px !important;
    border-radius: 18px !important;
  }

  /* top header row: title + button wrap */
  .wsus__dashboard_order .col-12.mb-3.d-flex{
    flex-wrap: wrap !important;
    gap: 12px !important;
  }

  .wsus__dashboard_order .col-12.mb-3 h4{
    width: 100% !important;
    margin: 0 !important;
    font-size: 18px !important;
  }

  .wsus__dashboard_order .col-12.mb-3 .btn{
    width: 100% !important;
    justify-content: center !important;
    text-align: center !important;
    padding: 10px 14px !important;
  }

  /* table -> card layout */
  .wsus__dashboard_order .table-responsive{
    overflow: visible !important;
  }

  .wsus__dashboard_order table.table{
    border-spacing: 0 !important;
  }

  /* hide header row on mobile */
  .wsus__dashboard_order table.table tbody tr:first-child{
    display: none !important;
  }

  /* each row becomes card */
  .wsus__dashboard_order table.table tbody tr{
    display: block !important;
    background: rgba(255,255,255,0.05) !important;
    border: 1px solid rgba(255,255,255,0.10) !important;
    border-radius: 14px !important;
    padding: 12px !important;
    margin-bottom: 12px !important;
  }

  /* each cell becomes row line */
  .wsus__dashboard_order table.table td{
    display: flex !important;
    align-items: flex-start !important;
    gap: 10px !important;
    width: 100% !important;
    border: none !important;
    background: transparent !important;
    padding: 8px 0 !important;
  }

  /* labels using data-title */
  .wsus__dashboard_order table.table td::before{
    content: attr(data-title);
    font-weight: 700;
    color: #00f5ff;
    flex: 0 0 40%;
    max-width: 40%;
    font-size: 12px;
    text-transform: uppercase;
  }

  /* values */
  .wsus__dashboard_order table.table td > *{
    flex: 1 1 auto;
    max-width: 60%;
  }

  /* address text wrap */
  .wsus__dashboard_order address{
    margin: 0 !important;
    font-size: 13px !important;
    word-break: break-word !important;
  }

  /* action buttons full width & aligned right */
  .wsus__dashboard_order td.price .d-flex{
    justify-content: flex-end !important;
    width: 100% !important;
  }

  .wsus__dashboard_order .btn-sm{
    padding: 8px 10px !important;
    border-radius: 12px !important;
  }

  /* modal form: one column */
  .modal-body .row .col-md-6{
    width: 100% !important;
    max-width: 100% !important;
  }

  .modal-body .form-control,
  .modal-body .form-select{
    font-size: 14px !important;
    padding: 10px 12px !important;
  }
}
@media (max-width: 991px){

  


</style>
@endpush

    @include('frontend.layouts.footer-layout.two')
@endsection
@push('js')
    <script>
        $(document).ready(function() {
            $(document).on("click", ".address-remove", function(e) {
                const id = $(this).data("id");
                $("#deleteForm").attr("action", '{{ url('/user/billing/address') }}' + "/" + id)
            });
            $(document).on("click", ".address-edit", function(e) {
                const data = $(this).data("address");

                $("#editForm input[name='first_name']").val(data.first_name);
                $("#editForm input[name='last_name']").val(data.last_name);
                $("#editForm input[name='phone']").val(data.phone);
                $("#editForm input[name='email']").val(data.email);
                $("#editForm input[name='title']").val(data.title);
                $("#editForm input[name='province']").val(data.province);
                $("#editForm input[name='city']").val(data.city);
                $("#editForm input[name='zip_code']").val(data.zip_code);
                $("#editForm input[name='address']").val(data.address);

                $("#editForm select[name='country_id']").val(data.country_id);

                $("#editForm").attr("action", '{{ url('/user/billing/address') }}' + "/" + data.id)
            });
        });
    </script>
@endpush
