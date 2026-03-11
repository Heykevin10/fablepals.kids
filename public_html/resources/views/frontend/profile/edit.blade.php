@extends('frontend.layouts.master')

@section('meta_title', __('Edit Profile') . ' || ' . $setting->app_name)

@section('header')
    @include('frontend.layouts.header-layout.three')
@endsection

@section('contents')
    <!-- Breadcumb Area -->
    <x-breadcrumb :title="__('Edit Profile')" />

    <!--  Dashboard Area -->
    <section class="wsus__dashboard_profile wsus__dashboard">
        <div class="container">
            <div class="row">
                <!--  Sidebar Area -->
                @include('frontend.profile.partials.sidebar')
                <!--  Main Content Area -->
                <div class="col-lg-8 col-xl-9 ">
                    <div class="wsus__dashboard_main_contant ">
                        <h4>{{__('Update Your Information')}}</h4>
                        <form id="userForm" class="wsus__dashboard_profile_edit_info" method="POST" action="{{route('user.profile.update')}}">
                            @csrf
                                @method('patch')
                            <div class="row">
                                <div class="col-xl-12 ">
                                    <label>{{ __('Name') }} *</label>
                                    <input type="text" placeholder="{{__('Name')}}" value="{{ old('name', $name ?? $user->name) }}" name="name" required>
                                </div>
                                <div class="col-xl-6 ">
                                    <label>{{ __('Phone') }} *</label>
                                    <input type="text" placeholder="{{__('Phone')}}" value="{{old('phone', $phone ?? $user->phone)}}" name="phone" required>
                                </div>
                                <div class="col-xl-6 ">
                                    <label>{{ __('Email Address') }}</label>
                                    <input type="email" placeholder="{{__('Email')}}" value="{{ old('email', $email ?? $user->email) }}" name="email">
                                </div>
                                {{--<div class="col-xl-6 ">
                                    <label>{{ __('Gender') }} *</label>
                                    <select class="select_2" name="gender">
                                        <option value="" disabled>{{__('Select Gender')}}</option>
                                        <option value="male"  @selected(old('gender',strtolower($user->gender)) == 'male')>{{__('Male')}}</option>
                                        <option value="female" @selected(old('gender',strtolower($user->gender)) == 'female')>{{__('Female')}}</option>
                                    </select>
                                </div>
                                
                                <div class="col-xl-6 ">
                                    <label>{{ __('Age') }} *</label>
                                    <input type="text" placeholder="{{__('Age')}}" value="{{old('age', $age ?? $user->age)}}" name="age">
                                </div>--}}
                                <div class="col-xl-6 ">
                                    <label>{{ __('Country') }}</label>
                                    <select class="select_2 fix-height" name="country_id" required>
                                        <option value="">{{__('Select Country')}}</option>
                                        @foreach ($countries as $country)
                                            <option value="{{$country->id}}" @selected(old('country_id',$user->country_id) == $country->id)>{{$country->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-xl-6 ">
                                    <label>{{ __('Province') }}</label>
                                    <input type="text" placeholder="{{__('Province')}}" value="{{old('province', $province ?? $user->province)}}" name="province">
                                </div>
                                <div class="col-xl-6 ">
                                    <label>{{ __('City') }} *</label>
                                    <input type="text" placeholder="{{__('City')}}" value="{{old('city', $city ?? $user->city)}}" name="city">
                                </div>
                                <div class="col-xl-6 ">
                                    <label>{{ __('Zip code') }}</label>
                                    <input type="text" placeholder="{{__('Zip code')}}" value="{{old('zip_code', $zip_code ?? $user->zip_code)}}" name="zip_code">
                                </div>
                                <div class="col-xl-12 ">
                                    <label>{{ __('Address') }}</label>
                                    <textarea rows="5"
                                            placeholder="{{__('Address')}}" name="address">{{old('address', $address ?? $user->address)}}</textarea>
                                </div>
                                <div class="col-xl-12 ">
                                    <ul class="d-flex flex-wrap">
                                        <li>
                                            <a href="{{route('user.dashboard')}}" class="btn">
                                                <span class="link-effect">
                                                    <span class="effect-1">{{__('Cancel')}}</span>
                                                    <span class="effect-1">{{__('Cancel')}}</span>
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <button class="btn style2" type="submit">
                                                <span class="link-effect">
                                                    <span class="effect-1">{{__('Update info')}}</span>
                                                    <span class="effect-1">{{__('Update info')}}</span>
                                                </span>
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </form>
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
/* ===== EDIT PROFILE: SAME DASHBOARD PREMIUM THEME ===== */

/* Full dark background */
.wsus__dashboard_profile{
  background: radial-gradient(circle at 20% 30%, #001a2e, #000814 50%, #000 100%) !important;
  position: relative;
  overflow: hidden;
  padding: 80px 0 100px 0 !important;
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

/* Main card wrapper */
.wsus__dashboard_main_contant{
  background: linear-gradient(145deg, #111, #181818) !important;
  border-radius: 25px !important;
  padding: 40px !important;
  color:#fff !important;
  box-shadow: 0 30px 70px rgba(0,0,0,0.7) !important;
  position: relative;
  overflow: hidden;
}

/* Shine effect */
.wsus__dashboard_main_contant::before{
  content:"";
  position:absolute;
  top:-100%;left:-50%;
  width:200%;height:200%;
  background: linear-gradient(120deg, transparent 40%, rgba(0,255,255,0.10) 50%, transparent 60%);
  transform: rotate(25deg);
  animation: shineMove 6s infinite;
  pointer-events:none;
}
@keyframes shineMove{0%{top:-100%}100%{top:100%}}

/* Heading gradient */
.wsus__dashboard_main_contant > h4{
  font-size: 26px !important;
  font-weight: 800 !important;
  background: linear-gradient(45deg, #00f5ff, #ff00ff) !important;
  -webkit-background-clip: text !important;
  -webkit-text-fill-color: transparent !important;
}

/* Form labels */
.wsus__dashboard_profile_edit_info label{
  color:#00f5ff !important;
  font-weight:700 !important;
  margin: 12px 0 8px !important;
}

/* Inputs + textarea */
.wsus__dashboard_profile_edit_info input,
.wsus__dashboard_profile_edit_info textarea,
.wsus__dashboard_profile_edit_info select{
  width: 100% !important;
  height: 65px;
  background: rgba(255,255,255,0.06) !important;
  border: 1px solid rgba(255,255,255,0.10) !important;
  color:#fff !important;
  border-radius: 14px !important;
  padding: 14px 16px !important;
  outline: none !important;
  transition: .2s;
}

.wsus__dashboard_profile_edit_info input:focus,
.wsus__dashboard_profile_edit_info textarea:focus,
.wsus__dashboard_profile_edit_info select:focus{
  border-color: rgba(0,245,255,0.7) !important;
  box-shadow: 0 0 18px rgba(0,245,255,0.25) !important;
}

/* Placeholder color */
.wsus__dashboard_profile_edit_info input::placeholder,
.wsus__dashboard_profile_edit_info textarea::placeholder{
  color: rgba(255,255,255,0.55) !important;
}

/* Buttons */
.wsus__dashboard_profile_edit_info .btn,
.wsus__dashboard_profile_edit_info a.btn,
.wsus__dashboard_profile_edit_info button.btn{
  border-radius: 40px !important;
  font-weight: 700 !important;
  padding: 12px 22px !important;
}

/* Neon primary (Update info) */
.wsus__dashboard_profile_edit_info .btn.style2{
  background: linear-gradient(45deg, #00f5ff, #ff00ff) !important;
  border:none !important;
  color:#fff !important;
}
.wsus__dashboard_profile_edit_info .btn.style2:hover{
  box-shadow: 0 0 30px rgba(0,245,255,.55) !important;
  transform: translateY(-2px);
}

/* Cancel button */
.wsus__dashboard_profile_edit_info a.btn{
  background: rgba(255,255,255,0.08) !important;
  border: 1px solid rgba(255,255,255,0.12) !important;
  color:#fff !important;
}
.wsus__dashboard_profile_edit_info a.btn:hover{
  box-shadow: 0 0 25px rgba(255,255,255,0.12) !important;
  transform: translateY(-2px);
}



</style>
@endpush

    @include('frontend.layouts.footer-layout.two')
@endsection

