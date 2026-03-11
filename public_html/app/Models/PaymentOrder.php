<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use App\Enums\UserStatus;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Modules\Location\app\Models\Country;
use Modules\Order\app\Models\Order;
use Modules\Shop\app\Models\DeliveryAddress;
use Modules\Shop\app\Models\Product;
use Modules\Shop\app\Models\ProductReview;
use Modules\Shop\app\Models\ShippingAddress;

class PaymentOrder extends Authenticatable {
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'order_id',
        'amount',
        'status',
        'payload',
    ];

}
