@extends('admin.master_layout')

@section('title')
<title>{{ __('Donations') }}</title>
@endsection

@section('admin-content')
<section class="section">

    {{-- ✅ Blog List jaisa Header --}}
    <div class="section-header">
        <h1>{{ __('Donations') }}</h1>
        <div class="section-header-breadcrumb">
            <div class="breadcrumb-item active">
                <a href="{{ route('admin.dashboard') }}">{{ __('Dashboard') }}</a>
            </div>
            <div class="breadcrumb-item">{{ __('Donations') }}</div>
        </div>
    </div>

    <div class="section-body">

        {{-- ✅ Blog List jaisa Filter/Search Card --}}
        <div class="card">
            <div class="card-body">
                <form method="GET" action="{{ url()->current() }}">
                    <div class="row align-items-center">

                        <div class="col-md-5 mb-2 mb-md-0">
                            <input type="text"
                                   name="search"
                                   value="{{ request('search') }}"
                                   class="form-control"
                                   placeholder="Search name / mobile / purpose">
                        </div>

                        <div class="col-md-3 mb-2 mb-md-0">
                            <button class="btn btn-primary w-100">
                                <i class="fas fa-search"></i> {{ __('Search') }}
                            </button>
                        </div>

                        @if(request('search'))
                            <div class="col-md-2 mb-2 mb-md-0">
                                <a href="{{ url()->current() }}" class="btn btn-light w-100">
                                    {{ __('Reset') }}
                                </a>
                            </div>
                        @endif

                    </div>
                </form>
            </div>
        </div>

        {{-- ✅ Blog List jaisa Table Card --}}
        <div class="card">
            <div class="card-header">
                <h4>{{ __('Donations') }}</h4>
            </div>

            <div class="card-body">

                <div class="table-responsive">
                    <table class="table table-striped table-hover mb-0 donation-table">
                        <thead>
                            <tr>
                                <th style="width:70px;">#</th>
                                <th>{{ __('Name') }}</th>
                                <th class="text-nowrap">{{ __('Mobile') }}</th>
                                <th class="text-nowrap">{{ __('Amount') }}</th>
                                <th class="text-nowrap">{{ __('Date') }}</th>
                                <th>{{ __('Purpose') }}</th>
                            </tr>
                        </thead>

                        <tbody>
                            @forelse($donations as $i => $d)
                                <tr>
                                    <td>
                                        {{ $donations->firstItem() + $i }}
                                    </td>

                                    <td class="fw-600">
                                        {{ $d->name }}
                                    </td>

                                    <td class="text-nowrap">
                                        {{ $d->mobile }}
                                    </td>

                                    <td class="text-nowrap">
                                        <span class="badge badge-success">
                                            ₹ {{ number_format($d->amount, 2) }}
                                        </span>
                                    </td>

                                    <td class="text-nowrap">
                                        {{ \Carbon\Carbon::parse($d->created_at)->format('d M Y, h:i A') }}
                                    </td>

                                    <td style="max-width:320px; white-space:normal;">
                                        {{ $d->purpose ?? '-' }}
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="6" class="text-center text-muted py-4">
                                        {{ __('No donations found') }}
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>

                {{-- Pagination --}}
                <div class="d-flex justify-content-between align-items-center mt-4">
                    <small class="text-muted">
                        @if($donations->total() > 0)
                            Showing {{ $donations->firstItem() }} to {{ $donations->lastItem() }}
                            of {{ $donations->total() }}
                        @endif
                    </small>

                    <div>
                        {{ $donations->links() }}
                    </div>
                </div>

            </div>
        </div>

    </div>
</section>
@endsection

@push('css')
<style>
  /* ✅ optional: table spacing same feel */
  .donation-table th, .donation-table td{
    vertical-align: middle !important;
  }
</style>
@endpush