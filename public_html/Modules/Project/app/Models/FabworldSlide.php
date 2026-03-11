<?php

namespace Modules\Project\app\Models;

use Illuminate\Support\Facades\File;
use Illuminate\Database\Eloquent\Model;
use Modules\Service\app\Models\Service;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class FabworldSlide extends Model
{
    protected $table = 'fabworld_slides';

    protected $fillable = [
        'fabworld_id',
        'title',
        'description',
        'image',
    ];

    public function fabworld()
    {
        return $this->belongsTo(Fabworld::class, 'fabworld_id');
    }
}