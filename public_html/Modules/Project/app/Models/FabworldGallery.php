<?php

namespace Modules\Project\app\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class FabworldGallery extends Model {
    use HasFactory;

    protected $fillable = ['fabworld_id', 'image'];

    public function fabworld()
    {
        return $this->belongsTo(Fabworld::class);
    }
}
