<?php

namespace Modules\Project\app\Models;

use Illuminate\Support\Facades\File;
use Illuminate\Database\Eloquent\Model;
use Modules\Service\app\Models\Service;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Fabworld extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     */
    protected $fillable = [
		'title', 'slug', 'banner', 'banner_heading', 'banner_sub_heading', 'description','tags','seo_title','seo_description','status', 'category_id'
	];
	
	public function fabworldSlides()
	{
		return $this->hasMany(FabworldSlide::class, 'fabworld_id');
	}

    public function galleries()
    {
        return $this->hasMany(FabworldGallery::class);
    }

    public function galleryImages()
    {
        return $this->hasMany(FabworldGallery::class, 'fabworld_id');
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