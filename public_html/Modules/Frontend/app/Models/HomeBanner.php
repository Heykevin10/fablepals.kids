<?php

namespace Modules\Frontend\app\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;

class HomeBanner extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     */
    protected $fillable = [
	'desktop',
	'title',
	'title_two',
	'title_three',
	'sub_title',
	'action_button_text',
	'action_button_url',
	'image',
	];
    
}
