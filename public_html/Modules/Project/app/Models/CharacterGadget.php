<?php

namespace Modules\Project\app\Models;

use Illuminate\Support\Facades\File;
use Illuminate\Database\Eloquent\Model;
use Modules\Service\app\Models\Service;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class CharacterGadget extends Model
{
    protected $table = 'character_gadgets';

    protected $fillable = [
        'character_id',
        'title',
        'description',
        'image',
    ];

    public function character()
    {
        return $this->belongsTo(Character::class, 'character_id');
    }
}