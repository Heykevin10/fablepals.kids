<?php

namespace Modules\Project\app\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class CharacterGallery extends Model {
    use HasFactory;

    protected $fillable = ['character_id', 'image'];

    public function project()
    {
        return $this->belongsTo(Project::class);
    }
}
