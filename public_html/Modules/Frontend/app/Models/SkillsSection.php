<?php

namespace Modules\Frontend\app\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;

class SkillsSection extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     */
    protected $fillable = [
	'title',
	'sub_title',
	'skill_title_one',
	'skill_percentage_one',
	'skill_title_two',
	'skill_percentage_two',
	'skill_title_three',
	'skill_percentage_three',
	'skill_title_four',
	'skill_percentage_four',
	'link',
	'image',
	];
    
}
