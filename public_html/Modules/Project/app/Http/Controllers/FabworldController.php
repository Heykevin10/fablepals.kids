<?php

namespace Modules\Project\app\Http\Controllers;

use App\Enums\RedirectType;
use Illuminate\Http\Request;
use App\Traits\RedirectHelperTrait;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use Illuminate\Http\RedirectResponse;
use Modules\Project\app\Models\Character;
use Modules\Project\app\Models\CharacterGallery;
use Modules\Project\app\Models\CharacterMysticForm;
use Modules\Project\app\Models\CharacterGadget;

use Modules\Project\app\Models\Fabworld;
use Modules\Project\app\Models\FabworldCategory;
use Modules\Project\app\Models\FabworldGallery;
use Modules\Project\app\Models\FabworldSlide;
use Modules\Project\app\Models\Song;
use Modules\Project\app\Models\SongPlaylist;
use Modules\Project\app\Models\SongArtist;

use Modules\Service\app\Models\Service;
use Modules\Language\app\Models\Language;
use Modules\Language\app\Enums\TranslationModels;
use Modules\Project\app\Http\Requests\ProjectRequest;
use Modules\Language\app\Traits\GenerateTranslationTrait;
use Modules\Project\app\Models\CharacterTranslation;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class FabworldController extends Controller {
    use GenerateTranslationTrait, RedirectHelperTrait;
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request) {
		checkAdminHasPermissionAndThrowException('project.view');

		$query = Fabworld::query();

		// Keyword filter
		$query->when($request->filled('keyword'), function ($qa) use ($request) {
			$keyword = '%' . $request->keyword . '%';
			$qa->where(function ($qa) use ($keyword) {
				$qa->where('title', 'like', $keyword)
				   ->orWhere('description', 'like', $keyword);
			});
		});

		// Status filter
		$query->when($request->filled('status'), function ($q) use ($request) {
			$q->where('status', $request->status);
		});

		// Sorting
		$orderBy = $request->filled('order_by') && $request->order_by == 1 ? 'asc' : 'desc';

		// Pagination
		if ($request->filled('par-page')) {
			if ($request->get('par-page') === 'all') {
				$projects = $query->orderBy('id', $orderBy)->get();
			} else {
				$projects = $query->orderBy('id', $orderBy)
								  ->paginate($request->get('par-page'))
								  ->withQueryString();
			}
		} else {
			$projects = $query->orderBy('id', $orderBy)
							  ->paginate(10)
							  ->withQueryString();
		}

		return view('project::fabworld_index', compact('projects'));
	}

    /**
     * Show the form for creating a new resource.
     */
    public function create() {
        checkAdminHasPermissionAndThrowException('project.view');
		$categories = FabworldCategory::get();
        return view('project::fabworld_create', ['categories' => $categories]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): RedirectResponse
    {
        // Define validation rules
        $validator = Validator::make($request->all(), [
            'title' => 'required|string',
            'description' => 'required|string',
            'mystic_element' => 'nullable|string|max:255',
            'line_color' => 'nullable|string|max:255',
            'banner_heading' => 'nullable|string|max:255',
            'banner_sub_heading' => 'nullable|string|max:255',
            'image' => 'required|file|mimes:jpeg,png,jpg,webp,avif|max:2048',
            'gallery_images.*' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:2048',
            'status' => 'required|in:0,1',
            'slug' => 'required|string|max:255|unique:fabworlds,slug',
            'mystic_forms.*.title' => 'nullable|string|max:255',
            'mystic_forms.*.description' => 'nullable|string',
            'mystic_forms.*.image' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:2048',
        ]);

        // Check if validation fails
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        checkAdminHasPermissionAndThrowException('project.management');

        // Create character with text fields
        $character = Fabworld::create(array_merge(
            $request->only([
                'title',
                'banner_heading',
                'banner_sub_heading',
                'category_id',
				'description',
                'line_color',
                'status',
                'slug',
            ])
        ));

        // Upload and save main image
        if ($request->hasFile('image')) {
            $mainImage = $request->file('image');
            $fileName = 'image_' . time() . '.' . $mainImage->getClientOriginalExtension();
            $mainImage->move(public_path('uploads/custom-images'), $fileName);
            $character->banner = 'uploads/custom-images/' . $fileName;
        }

        $character->save(); // Save all updated image paths

        // Upload gallery images
        if ($request->hasFile('gallery_images')) {
            foreach ($request->file('gallery_images') as $index => $image) {
                if ($image->isValid()) {
                    $galleryFileName = 'gallery_' . time() . '_' . $index . '.' . $image->getClientOriginalExtension();
                    $image->move(public_path('uploads/gallery'), $galleryFileName);

                    FabworldGallery::create([
                        'fabworld_id' => $character->id,
                        'image' => 'uploads/gallery/' . $galleryFileName,
                    ]);
                }
            }
        }

        // Handle Mystic Forms
        if ($request->has('mystic_forms')) {
            foreach ($request->mystic_forms as $index => $form) {
                if (!empty($form['title']) || !empty($form['description']) || !empty($form['image'])) {
                    $mysticFormData = [
                        'fabworld_id' => $character->id,
                        'title' => $form['title'] ?? null,
                        'description' => $form['description'] ?? null,
                    ];

                    if (!empty($form['image']) && $request->hasFile("mystic_forms.$index.image")) {
                        $image = $request->file("mystic_forms.$index.image");
                        if ($image->isValid()) {
                            $fileName = 'mystic_form_' . time() . '_' . $index . '.' . $image->getClientOriginalExtension();
                            $image->move(public_path('uploads/custom-images'), $fileName);
                            $mysticFormData['image'] = 'uploads/custom-images/' . $fileName;
                        }
                    }

                    FabworldSlide::create($mysticFormData);
                }
            }
        }

        // Handle translations explicitly

        return $this->redirectWithMessage(
            RedirectType::CREATE->value,
            'admin.fabworld.edit',
            [
                'project' => $character->id,
                'code' => '',
            ]
        );
    }


    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request)
    {
        $id = $request->project;
        checkAdminHasPermissionAndThrowException('project.view');
        $code = '';
        
        $languages = '';
        $project = Fabworld::with(['fabworldSlides', 'galleryImages'])->findOrFail($id);
		
		$categories = FabworldCategory::get();

        return view('project::fabworld_edit', compact('project', 'code', 'languages', 'categories'));
    }

    /**
     * Remove the specified resource from storage.
     */
public function update(Request $request, $project): RedirectResponse
{
    // Define validation rules
    $validator = Validator::make($request->all(), [
		'title' => 'required|string',
        'description' => 'nullable|string',
		'line_color' => 'nullable|string|max:255',
		'seo_title' => 'nullable|string|max:255',
		'seo_description' => 'nullable|string',
        'image' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:2048',
        'gallery_images.*' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:2048',
        'status' => 'nullable|in:0,1',
        'mystic_forms.*.id' => 'nullable|exists:fabworld_slides,id',
        'mystic_forms.*.title' => 'nullable|string|max:255',
        'mystic_forms.*.description' => 'nullable|string',
        'mystic_forms.*.image' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:2048', // For file upload
        'mystic_forms.*.image_path' => 'nullable|string', // For existing path
    ]);

    // Check if validation fails
    if ($validator->fails()) {
        return redirect()->back()->withErrors($validator)->withInput();
    }

    checkAdminHasPermissionAndThrowException('project.management');

    $project = Fabworld::findOrFail($project);

    // Update basic fields
    $project->title = $request->title ?? $project->title;
    $project->description = $request->description ?? $project->description;
    $project->tags = $request->tags ?? $project->tags;
    $project->banner_heading = $request->banner_heading;
    $project->banner_sub_heading = $request->banner_sub_heading;
    $project->category_id = $request->category_id;
    $project->line_color = $request->line_color;
	$project->seo_title = $request->seo_title;
	$project->seo_description = $request->seo_description;

    // Update main image
    if ($request->hasFile('image')) {
        $image = $request->file('image');
        $fileName = 'image_' . time() . '.' . $image->getClientOriginalExtension();
        $image->move(public_path('uploads/custom-images'), $fileName);
        $project->banner = 'uploads/custom-images/' . $fileName;
    }



    $project->save();

    // Upload and save new gallery images
    if ($request->hasFile('gallery_images')) {
        foreach ($request->file('gallery_images') as $index => $image) {
            if ($image->isValid()) {
                $galleryFileName = 'gallery_' . time() . '_' . $index . '.' . $image->getClientOriginalExtension();
                $image->move(public_path('uploads/gallery'), $galleryFileName);

                FabworldGallery::create([
                    'fabworld_id' => $project->id,
                    'image' => 'uploads/gallery/' . $galleryFileName,
                ]);
            }
        }
    }

    // Handle Mystic Forms
    if ($request->has('mystic_forms')) {
        $existingfabworldSlides = $project->fabworldSlides()->get()->keyBy('id');
        $submittedFormIds = [];

        foreach ($request->mystic_forms as $index => $form) {
            $formId = $form['id'] ?? null;

            $mysticFormData = [
                'fabworld_id' => $project->id,
                'title' => $form['title'] ?? null,
                'description' => $form['description'] ?? null,
            ];

            // Handle image: use uploaded file if present, otherwise use image_path or existing image
            if ($request->hasFile("mystic_forms.$index.image")) {
                $image = $request->file("mystic_forms.$index.image");
                if ($image->isValid()) {
                    $fileName = 'mystic_form_' . time() . '_' . $index . '.' . $image->getClientOriginalExtension();
                    $image->move(public_path('uploads/custom-images'), $fileName);
                    $mysticFormData['image'] = 'uploads/custom-images/' . $fileName;
                }
            } else {
                $mysticFormData['image'] = $form['image_path'] ?? ($formId && isset($existingfabworldSlides[$formId]) ? $existingfabworldSlides[$formId]->image : null);
            }

            if ($formId && isset($existingfabworldSlides[$formId])) {
                // Update existing record
                FabworldSlide::where('id', $formId)->update($mysticFormData);
                $submittedFormIds[] = (int)$formId;
            } else {
                // Create new record
                $newMysticForm = FabworldSlide::create($mysticFormData);
                $submittedFormIds[] = $newMysticForm->id;
            }
        }

        // Delete mystic forms that were removed from the form
        if (!empty($submittedFormIds)) {
            FabworldSlide::where('fabworld_id', $project->id)
                ->whereNotIn('id', $submittedFormIds)
                ->delete();
        }
    }

    return $this->redirectWithMessage(RedirectType::UPDATE->value, 'admin.fabworld.list');
}

    public function destroy($id): RedirectResponse
	{
		checkAdminHasPermissionAndThrowException('project.management');

		$project = Fabworld::findOrFail($id);

		// Delete main character images
		if ($project->banner) {
			if (File::exists(public_path($project->banner))) {
				unlink(public_path($project->banner));
			}
		}
		

		// Delete related mystic forms and their images
		$fabworldSlides = $project->fabworldSlides;
		foreach ($fabworldSlides as $form) {
			if ($form->image) {
				if (File::exists(public_path($form->image))) {
					unlink(public_path($form->image));
				}
			}
		}
		if ($fabworldSlides->isNotEmpty()) {
			FabworldSlide::where('fabworld_id', $project->id)->delete();
		}


		// Delete the character
		$success = $project->delete();

		return $this->redirectWithMessage(RedirectType::DELETE->value, 'admin.fabworld.list');
	}
	
	public function songDestroy($id): RedirectResponse
	{
		checkAdminHasPermissionAndThrowException('project.management');

		$project = Song::findOrFail($id);

		if ($project->file) {
			if (File::exists(public_path($project->file))) {
				unlink(public_path($project->file));
			}
		}


		$success = $project->delete();

		return $this->redirectWithMessage(RedirectType::DELETE->value, 'admin.song.list');
	}
	
	public function songPlaylistDestroy($id): RedirectResponse
	{
		checkAdminHasPermissionAndThrowException('project.management');

		$project = SongPlaylist::findOrFail($id);

		if ($project->file) {
			if (File::exists(public_path($project->file))) {
				unlink(public_path($project->file));
			}
		}

		$project->is_deleted = 1;
		$success = $project->save();

		return $this->redirectWithMessage(RedirectType::DELETE->value, 'admin.song.playlist.list');
	}
	
	public function destroyGalleryImage($id)
	{
		$gallery = FabworldGallery::findOrFail($id);

		// Delete image file
		if ($gallery->banner && File::exists(public_path($gallery->banner))) {
			File::delete(public_path($gallery->banner));
		}

		$gallery->delete();

		return response()->json(['success' => true]);
	}

    public function statusUpdate($id) {
        checkAdminHasPermissionAndThrowException('project.management');

        $project = Fabworld::find($id);
        $status = $project->status == 1 ? 0 : 1;
        $project->update(['status' => $status]);

        $notification = __('Updated Successfully');

        return response()->json([
            'success' => true,
            'message' => $notification,
        ]);
    }
	
	public function songList()
    {
		$videos = Song::leftJoin('song_playlists', 'song_playlists.id', '=', 'songs.playlist_id')
				->leftJoin('song_artists', 'song_artists.id', '=', 'songs.artist_id')
				->select('songs.*', 'song_playlists.name', 'song_artists.name as artist')
				->latest()
				->get();
        return view('project::song_index', compact('videos'));
    }
	
	public function songPlaylistList()
    {
        $videos = SongPlaylist::latest()->where('is_deleted', false)->get();
        return view('project::song_paylist_index', compact('videos'));
    }
	
	public function songArtistList()
    {
        $videos = SongArtist::latest()->where('is_deleted', false)->get();
        return view('project::song_artist_index', compact('videos'));
    }
	
	public function songForm($id = null)
    {
        $section  = null;
        if ($id) {
            $section = Song::findOrFail($id);
        }
		$playlists = SongPlaylist::where('is_deleted', false)->get();
		$artists = SongArtist::where('is_deleted', false)->get();
        return view('project::song_form', compact('section', 'playlists', 'artists'));
    }
	
	public function songPlaylistForm($id = null)
    {
        $section  = null;
        if ($id) {
            $section = SongPlaylist::findOrFail($id);
        }
        return view('project::song_playlist', compact('section'));
    }
	
	public function songArtistForm($id = null)
    {
        $section  = null;
        if ($id) {
            $section = SongArtist::findOrFail($id);
        }
        return view('project::song_artist', compact('section'));
    }
	
	public function songSave(Request $request)
    {
        $rules = [
            'title' => 'string|max:255',
			'song' => 'nullable|max:20480', // 20MB limit
        ];
		$request->validate($rules);
		
		if ($request->hasFile('song')) {
            $mainImage = $request->file('song');
            $fileName = 'song_' . time() . '.' . $mainImage->getClientOriginalExtension();
            $mainImage->move(public_path('uploads/songs'), $fileName);
            $song_path = 'uploads/songs/' . $fileName;
			
			if ($request->file_path) {
				if (File::exists(public_path($request->file_path))) {
					unlink(public_path($request->file_path));
				}
			}
        }else{
			$song_path = $request->file_path;
		}
		

        $section = Song::updateOrCreate(
            ['id' => $request->id],
            [
                'title' => $request->title,
				'artist_id' => $request->artist_id,
				'minutes' => $request->minutes,
				'seconds' => $request->seconds,
				'playlist_id' => $request->playlist_id,
                'file' => $song_path,
            ]
        );
		
		$count = Song::where('playlist_id', $request->playlist_id)->count();
		$artist_count = Song::where('artist_id', $request->artist_id)->count();
		if($count > 0){
			SongPlaylist::where('id', $request->playlist_id)->update(['count' => $count]);
		}
		if($artist_count > 0){
			Songartist::where('id', $request->artist_id)->update(['count' => $artist_count]);
		}

        return redirect()->to(route('admin.song.list'));
    }
	
	public function songPlaylistSave(Request $request)
	{
		$rules = [
			'title' => 'string|max:255',
			'song' => 'nullable|max:2048', // 2MB limit
			'name' => 'required|string|max:255',
		];
		$request->validate($rules);

		// FILE handling as in your original code
		if ($request->hasFile('playlist')) {
			$mainImage = $request->file('playlist');
			$fileName = 'song_' . time() . '.' . $mainImage->getClientOriginalExtension();
			$mainImage->move(public_path('uploads/playlist'), $fileName);
			$song_path = 'uploads/playlist/' . $fileName;

			if ($request->file_path) {
				if (File::exists(public_path($request->file_path))) {
					unlink(public_path($request->file_path));
				}
			}
		} else {
			$song_path = $request->file_path;
		}

		// COUNT logic as per your code
		$count = Song::where('playlist_id', $request->id)->count();

		// Generate unique slug from name
		$baseSlug = Str::slug($request->name);
		$slug = $baseSlug;
		$i = 1;
		while (
			SongPlaylist::where('slug', $slug)
				->where('id', '!=', $request->id)
				->exists()
		) {
			$slug = $baseSlug . '-' . $i;
			$i++;
		}

		// Save or update playlist with slug
		$section = SongPlaylist::updateOrCreate(
			['id' => $request->id],
			[
				'name' => $request->name,
				'count' => $count,
				'file' => $song_path,
				'slug' => $slug, // Save unique slug
			]
		);

		return redirect()->to(route('admin.song.playlist.list'));
	}
	
	public function songArtistSave(Request $request)
	{
		$rules = [
			'title' => 'string|max:255',
			'artist' => 'nullable|max:2048', // 2MB limit
			'name' => 'required|string|max:255',
		];
		$request->validate($rules);

		if ($request->hasFile('artist')) {
			$mainImage = $request->file('artist');
			$fileName = 'song_' . time() . '.' . $mainImage->getClientOriginalExtension();
			$mainImage->move(public_path('uploads/artist'), $fileName);
			$song_path = 'uploads/artist/' . $fileName;

			if ($request->file_path) {
				if (File::exists(public_path($request->file_path))) {
					unlink(public_path($request->file_path));
				}
			}
		} else {
			$song_path = $request->file_path;
		}

		$count = Song::where('artist_id', $request->id)->count();

		// Generate unique slug from name
		$baseSlug = Str::slug($request->name);
		$slug = $baseSlug;
		$i = 1;
		while (
			SongArtist::where('slug', $slug)
				->where('id', '!=', $request->id)
				->exists()
		) {
			$slug = $baseSlug . '-' . $i;
			$i++;
		}

		$section = SongArtist::updateOrCreate(
			['id' => $request->id],
			[
				'name' => $request->name,
				'count' => $count,
				'file' => $song_path,
				'slug' => $slug, // Save unique slug
			]
		);

		return redirect()->to(route('admin.song.artist.list'));
	}
	
}
