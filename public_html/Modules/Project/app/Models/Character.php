<?php

namespace Modules\Project\app\Models;

use Illuminate\Support\Facades\File;
use Illuminate\Database\Eloquent\Model;
use Modules\Service\app\Models\Service;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Character extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     */
    protected $fillable = [
		'slug', 'service_id', 'image', 'image_two', 'image_three',
		'mystic_element', 'signature_rider', 'mystic_planet', 'signature_weapon', 'mystic_guardian',
		'project_date', 'project_author', 'tags', 'status','line_color'
	];
	
	public function mysticForms()
	{
		return $this->hasMany(CharacterMysticForm::class, 'character_id');
	}

	public function gadgets()
	{
		return $this->hasMany(CharacterGadget::class, 'character_id');
	}

    public function galleries()
    {
        return $this->hasMany(CharacterGallery::class);
    }

    public function galleryImages()
    {
        return $this->hasMany(CharacterGallery::class, 'character_id');
    }

    public function translation(): ?HasOne
    {
        //return $this->hasOne(CharacterTranslation::class)->where('lang_code', getSessionLanguage());
		return $this->hasOne(CharacterTranslation::class)->where('lang_code', 'en');
    }

    public function getTranslation($code): ?CharacterTranslation
    {
        //return $this->hasOne(CharacterTranslation::class)->where('lang_code', $code)->first();
		return $this->hasOne(CharacterTranslation::class)->where('lang_code', 'en')->first();
    }

    public function translations(): ?HasMany
    {
        return $this->hasMany(CharacterTranslation::class, 'character_id');
    }

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }

    public function service(): ?BelongsTo
    {
        return $this->belongsTo(Service::class, 'service_id');
    }

    public function images()
    {
        return $this->hasMany(ProjectImage::class);
    }

    protected static function boot()
    {
        parent::boot();

        static::deleting(function ($project) {
            try {
                if ($project->images) {
                    $project->images()->each(function ($image) {
                        if ($image->large_image && !str($image->large_image)->contains('website/images')) {
                            if (@File::exists(public_path($image->large_image))) {
                                @unlink(public_path($image->large_image));
                            }
                        }
                        if ($image->small_image && !str($image->small_image)->contains('website/images')) {
                            if (@File::exists(public_path($image->small_image))) {
                                @unlink(public_path($image->small_image));
                            }
                        }
                        $image->project()->dissociate();
                        $image->delete();
                    });
                }
                if ($project->translations) {
                    $project->translations()->each(function ($translation) {
                        if ($translation?->description) {
                            deleteUnusedUploadedImages($translation?->description);
                        }
                        $translation->project()->dissociate();
                        $translation->delete();
                    });
                }
            } catch (\Exception $e) {
                info($e);

                $notification = __('Unable to delete as relational data exists!');
                $notification = ['message' => $notification, 'alert-type' => 'error'];

                return redirect()->back()->with($notification);
            }
        });
    }
}