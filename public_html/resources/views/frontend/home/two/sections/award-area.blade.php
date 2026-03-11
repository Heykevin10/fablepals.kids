<style>
.home_two {
    background: #000 !important;
}
.bg-black h1, .bg-black h2, .bg-black h3{
	color: #fff;
}
.bg-black .award-wrap-area li span, .bg-black .award-wrap-area li p, .bg-black .award-wrap-area li a{
	color: #fff!important;
} 
.bg-black .award-wrap-area li{
	border-color: #fff!important;
}

	</style>
<div class="award-area-1 space-bottom overflow-hidden bg-black">
    <div class="container">
	<div class="row justify-content-center">
            <div class="col-xl-7 col-lg-9">
                
            </div>
        </div>
        <div class="row justify-content-center p-3">
            <div class="col-lg-11 p-5" @if(!empty($border_color))style="box-shadow: 0 0 21px {{$border_color}};border-radius: 20px;"@endif>
				<div class="title-area text-center">
                    <h2 class="sec-title">{{__('Fabtv')}}</h2>
                </div>
                <ul class="award-wrap-area">
                    @foreach ($awards as $award)
                      <li class="single-award-list">
                        <span class="award-year">{{$award?->year}}</span>
                        <div class="award-details">
                            <h4><a href="{{$award?->url}}">{{$award?->title}}</a></h4>
                            <p>{{$award?->sub_title}}</p>
                        </div>
                        <span class="award-tag">{{$award?->tag}}</span>
                    </li>  
                    @endforeach
                </ul>
            </div>
        </div>
    </div>
</div>


