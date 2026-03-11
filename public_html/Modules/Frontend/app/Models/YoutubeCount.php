<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class YoutubeStat extends Model
{
    protected $table = 'youtube_stats';

    protected $fillable = [
        'subscribers',
        'views',
    ];
}
