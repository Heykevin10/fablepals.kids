<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Donation extends Model
{
    protected $fillable = [
        'name',
        'mobile',
        'email',
        'amount',
        'purpose',
        'payment_status',
        'payment_id',
        'order_id',
    ];
}
