@php
    $header_admin = Auth::guard('admin')->user();
@endphp

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="" type="image/x-icon">
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    @yield('title')
    <link rel="icon" href="{{ asset($setting->favicon) }}">

    @include('admin.partials.styles')
    @stack('css')

    <style>
        :root{
            --sidebar-open: 250px;
            --sidebar-close: 80px;
            --admin-navbar-height: 70px;
        }

        /* ✅ Remove default bg row */
        .navbar-bg{
            display: none !important;
        }

        /* ✅ Main Navbar */
        .main-navbar{
            position: sticky;
            top: 0;
            z-index: 1050;

            background: #6777ef !important;
            box-shadow: none !important;

            margin-left: var(--sidebar-open);
            width: calc(100% - var(--sidebar-open));
            transition: margin-left .3s ease, width .3s ease;
        }

        /* ✅ Sidebar mini */
        body.sidebar-mini .main-navbar{
            margin-left: var(--sidebar-close);
            width: calc(100% - var(--sidebar-close));
        }

        /* ✅ Sidebar fully hidden (mobile states) */
        body.sidebar-show .main-navbar,
        body.sidebar-gone .main-navbar{
            margin-left: 0 !important;
            width: 100% !important;
        }

        /* ✅ Navbar text */
        .main-navbar .nav-link{
            color:#fff !important;
        }

        .main-navbar input{
            height: 38px;
        }

        /* ✅ Main content wrapper */
        .my-main-content{
            margin-left: var(--sidebar-open);
            padding: 25px 25px !important;
            padding-top: calc(var(--admin-navbar-height) + 20px);
            transition: margin-left .25s ease;
            min-height: calc(100vh - 120px);
        }

        /* ✅ Sidebar mini content */
        body.sidebar-mini .my-main-content{
            margin-left: var(--sidebar-close) !important;
        }

        /* ✅ Remove extra padding/margin from nested main-content */
        .my-main-content .main-content{
            padding: 0 !important;
            margin: 0 !important;
        }

        .my-main-content .section{
            padding-top: 0 !important;
            margin-top: 0 !important;
        }

        /* ✅ Table fixes */
        .my-main-content .section-body{
            max-width: 100% !important;
        }

        .my-main-content .table-responsive{
            width: 100% !important;
        }

        .table td:last-child{
            white-space: nowrap;
        }

        .table td:last-child .btn{
            margin-right: 5px;
        }

        /* ✅ Mobile */
        @media (max-width: 991px){
            .main-navbar{
                margin-left: 0 !important;
                width: 100% !important;
            }

            .my-main-content{
                margin-left: 0 !important;
                padding: 15px !important;
                padding-top: calc(var(--admin-navbar-height) + 15px) !important;
            }
        }
    </style>
</head>

<body>
<div id="app">
    <div class="main-wrapper">

        <nav class="navbar navbar-expand-lg main-navbar px-3 py-2">
            <div class="container-fluid d-flex align-items-center justify-content-between">

                <!-- ✅ LEFT SIDE -->
                <div class="d-flex align-items-center gap-3">

                    <!-- Hamburger -->
                    <a href="#" data-toggle="sidebar" class="nav-link nav-link-lg text-white p-0">
                        <i class="fas fa-bars"></i>
                    </a>

                    <!-- Language Dropdown -->
                    @if (Module::isEnabled('Language') && Route::has('set-language') && allLanguages()?->where('status', 1)->count() > 1)
                        <div class="dropdown">
                            <a href="javascript:;" data-bs-toggle="dropdown"
                               class="nav-link dropdown-toggle text-white p-0">
                                {{ allLanguages()?->firstWhere('code', getSessionLanguage())?->name ?? __('English') }}
                            </a>

                            <div class="dropdown-menu">
                                @foreach (allLanguages()?->where('status', 1) as $language)
                                    <a href="{{ route('set-language', ['code' => $language->code]) }}"
                                       class="dropdown-item {{ getSessionLanguage() == $language->code ? 'active' : '' }}">
                                        {{ $language->name }}
                                    </a>
                                @endforeach
                            </div>
                        </div>
                    @endif

                    <!-- Search -->
                    <div class="position-relative admin-search-box">
                        <x-admin.form-input id="search_menu" :placeholder="__('Search option')" />
                        <div id="admin_menu_list" class="position-absolute d-none rounded-2 bg-white shadow">
                            @foreach (App\Enums\RouteList::getAll() as $route_item)
                                @if (checkAdminHasPermission($route_item?->permission) || empty($route_item?->permission))
                                    <a href="{{ $route_item?->route }}" class="dropdown-item">
                                        {{ $route_item?->name }}
                                    </a>
                                @endif
                            @endforeach
                        </div>
                    </div>

                </div>

                <!-- ✅ RIGHT SIDE -->
                <ul class="navbar-nav d-flex align-items-center gap-3">

                    <!-- Visit Website -->
                    <li class="nav-item">
                        <a target="_blank" href="{{ route('home') }}" class="nav-link text-white">
                            <i class="fas fa-home me-1"></i> {{ __('Visit Website') }}
                        </a>
                    </li>

                    <!-- Profile -->
                    <li class="dropdown">
                        <a href="javascript:;" data-bs-toggle="dropdown"
                           class="nav-link dropdown-toggle d-flex align-items-center text-white">

                            @if ($header_admin->image)
                                <img src="{{ asset($header_admin->image) }}" class="rounded-circle me-2" width="35" alt="admin">
                            @else
                                <img src="{{ asset($setting->default_avatar) }}" class="rounded-circle me-2" width="35" alt="admin">
                            @endif

                            <span class="d-none d-lg-inline">{{ $header_admin->name }}</span>
                        </a>

                        <div class="dropdown-menu dropdown-menu-end">
                            @adminCan('admin.profile.view')
                                <a href="{{ route('admin.edit-profile') }}" class="dropdown-item">
                                    <i class="far fa-user me-2"></i> {{ __('Profile') }}
                                </a>
                            @endadminCan

                            @adminCan('setting.view')
                                <a href="{{ route('admin.settings') }}" class="dropdown-item">
                                    <i class="fas fa-cog me-2"></i> {{ __('Setting') }}
                                </a>
                            @endadminCan

                            <a href="javascript:;" class="dropdown-item logout-button">
                                <i class="fas fa-sign-out-alt me-2"></i> {{ __('Logout') }}
                            </a>
                        </div>
                    </li>

                </ul>

            </div>
        </nav>

        @if (request()->routeIs(
            'admin.general-setting',
            'admin.crediential-setting',
            'admin.email-configuration',
            'admin.edit-email-template',
            'admin.currency.*',
            'admin.tax.*',
            'admin.seo-setting',
            'admin.custom-code',
            'admin.cache-clear',
            'admin.database-clear',
            'admin.system-update.index',
            'admin.admin.*',
            'admin.languages.*',
            'admin.basicpayment',
            'admin.addons.*',
            'admin.sitemap.*',
            'admin.role.*'
        ))
            @include('admin.settings.sidebar')
        @else
            @include('admin.sidebar')
        @endif

        <div class="my-main-content">
            @yield('admin-content')
        </div>

        <footer class="main-footer">
            <div class="footer-right">
                {{ $setting->copyright_text }}
            </div>
        </footer>

    </div>
</div>

<form id="admin-logout-form" action="{{ route('admin.logout') }}" method="POST" class="d-none">
    @csrf
</form>

@include('admin.partials.javascripts')
@include('admin.js-variables')
@stack('js')

</body>
</html>