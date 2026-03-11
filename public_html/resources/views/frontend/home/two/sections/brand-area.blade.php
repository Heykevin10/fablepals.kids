<div class="overflow-hidden bg-white mt-3" style="padding: 4em 0;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-12">
                <ul class="client-list-wrap style2">
                    @foreach ($brands->take(6) as $brand)
                        <li>
                            <a href="{{ $brand?->url }}">
                                <span class="link-effect">
                                    <span class="effect-1"><img src="{{ asset($brand?->image) }}"
                                            alt="{{ $brand?->name }}"></span>
                                    <span class="effect-1"><img src="{{ asset($brand?->image) }}"
                                            alt="{{ $brand?->name }}"></span>
                                </span>
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>
        </div>
    </div>
</div>
