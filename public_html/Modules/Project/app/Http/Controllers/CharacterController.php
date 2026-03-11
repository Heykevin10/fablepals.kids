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
use Modules\Service\app\Models\Service;
use Modules\Language\app\Models\Language;
use Modules\Language\app\Enums\TranslationModels;
use Modules\Project\app\Http\Requests\ProjectRequest;
use Modules\Language\app\Traits\GenerateTranslationTrait;
use Modules\Project\app\Models\CharacterTranslation;
use Illuminate\Support\Facades\Validator;

class CharacterController extends Controller {
    use GenerateTranslationTrait, RedirectHelperTrait;
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request) {
        checkAdminHasPermissionAndThrowException('project.view');
        $query = Character::query();

        $query->when($request->filled('keyword'), function ($qa) use ($request) {
            $keyword = '%' . $request->keyword . '%';
            $qa->where(function ($qa) use ($keyword) {
                $qa->whereHas('translations', function ($q) use ($keyword) {
                    $q->where('title', 'like', $keyword)
                      ->orWhere('description', 'like', $keyword)
                      ->orWhere('project_category', 'like', $keyword);
                })->orWhere('project_author', 'like', $keyword);
            });
        });

        $query->when($request->filled('status'), function ($q) use ($request) {
            $q->where('status', $request->status);
        });

        $orderBy = $request->filled('order_by') && $request->order_by == 1 ? 'asc' : 'desc';

        if ($request->filled('par-page')) {
            $projects = $request->get('par-page') == 'all' ? $query->with('translation')->orderBy('id', $orderBy)->get() : $query->with('translation')->orderBy('id', $orderBy)->paginate($request->get('par-page'))->withQueryString();
        } else {
            $projects = $query->with('translation')->orderBy('id', $orderBy)->paginate(10)->withQueryString();
        }

        return view('project::character_index', compact('projects'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create() {
        checkAdminHasPermissionAndThrowException('project.view');
        return view('project::character_create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): RedirectResponse
    {
        // Define validation rules
        $validator = Validator::make($request->all(), [
            'description' => 'required|string',
            'mystic_element' => 'nullable|string|max:255',
            'line_color' => 'nullable|string|max:255',
            'signature_rider' => 'nullable|string|max:255',
            'mystic_planet' => 'nullable|string|max:255',
            'signature_weapon' => 'nullable|string|max:255',
            'mystic_guardian' => 'nullable|string|max:255',
            'image' => 'required|file|mimes:jpeg,png,jpg,webp,avif|max:2048',
            'image_two' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:2048',
            'image_three' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:2048',
            'gallery_images.*' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:2048',
            'status' => 'required|in:0,1',
            'tags' => 'nullable|string|max:255',
            'slug' => 'required|string|max:255|unique:characters,slug',
            'mystic_forms.*.title' => 'nullable|string|max:255',
            'mystic_forms.*.description' => 'nullable|string',
            'mystic_forms.*.image' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:2048',
            'gadgets_attacks.*.title' => 'nullable|string|max:255',
            'gadgets_attacks.*.description' => 'nullable|string',
            'gadgets_attacks.*.image' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:2048',
        ]);

        // Check if validation fails
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        checkAdminHasPermissionAndThrowException('project.management');

        // Create character with text fields
        $character = Character::create(array_merge(
            $request->only([
                'mystic_element',
                'signature_rider',
                'mystic_planet',
                'signature_weapon',
                'mystic_guardian',
                'tags',
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
            $character->image = 'uploads/custom-images/' . $fileName;
        }

        // Upload and save image_two
        if ($request->hasFile('image_two')) {
            $imageTwo = $request->file('image_two');
            $fileName = 'image_two_' . time() . '.' . $imageTwo->getClientOriginalExtension();
            $imageTwo->move(public_path('uploads/custom-images'), $fileName);
            $character->image_two = 'Uploads/custom-images/' . $fileName;
        }

        // Upload and save image_three
        if ($request->hasFile('image_three')) {
            $imageThree = $request->file('image_three');
            $fileName = 'image_three_' . time() . '.' . $imageThree->getClientOriginalExtension();
            $imageThree->move(public_path('uploads/custom-images'), $fileName);
            $character->image_three = 'Uploads/custom-images/' . $fileName;
        }

        $character->save(); // Save all updated image paths

        // Upload gallery images
        if ($request->hasFile('gallery_images')) {
            foreach ($request->file('gallery_images') as $index => $image) {
                if ($image->isValid()) {
                    $galleryFileName = 'gallery_' . time() . '_' . $index . '.' . $image->getClientOriginalExtension();
                    $image->move(public_path('uploads/gallery'), $galleryFileName);

                    CharacterGallery::create([
                        'character_id' => $character->id,
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
                        'character_id' => $character->id,
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

                    CharacterMysticForm::create($mysticFormData);
                }
            }
        }
		
		if ($request->has('gadgets_attacks')) {
            foreach ($request->gadgets_attacks as $index => $form) {
                if (!empty($form['title']) || !empty($form['description']) || !empty($form['image'])) {
                    $gadgetFormData = [
                        'character_id' => $character->id,
                        'title' => $form['title'] ?? null,
                        'description' => $form['description'] ?? null,
                    ];

                    if (!empty($form['image']) && $request->hasFile("gadgets_attacks.$index.image")) {
                        $image = $request->file("gadgets_attacks.$index.image");
                        if ($image->isValid()) {
                            $fileName = 'gadgets_attacks_' . time() . '_' . $index . '.' . $image->getClientOriginalExtension();
                            $image->move(public_path('uploads/custom-images'), $fileName);
                            $gadgetFormData['image'] = 'uploads/custom-images/' . $fileName;
                        }
                    }

                    CharacterGadget::create($gadgetFormData);
                }
            }
        }

        // Handle translations explicitly
        $defaultLanguageCode = allLanguages()->first()->code;
        $character->translations()->create([
            'lang_code' => $defaultLanguageCode,
            'title' => $request->title,
            'description' => $request->description,
            'seo_title' => $request->seo_title,
            'seo_description' => $request->seo_description,
        ]);

        return $this->redirectWithMessage(
            RedirectType::CREATE->value,
            'admin.character.edit',
            [
                'project' => $character->id,
                'code' => $defaultLanguageCode,
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
        $code = request('code') ?? getSessionLanguage();
        if (!Language::where('code', $code)->exists()) {
            abort(404);
        }
        $languages = allLanguages();
        $project = Character::with(['mysticForms', 'gadgets', 'galleryImages'])->findOrFail($id);
        $services = Service::get();

        return view('project::character_edit', compact('project', 'code', 'languages', 'services'));
    }

    /**
     * Remove the specified resource from storage.
     */
public function update(Request $request, $project, $code): RedirectResponse
{
    // Define validation rules
    $validator = Validator::make($request->all(), [
        'description' => 'nullable|string',
		'line_color' => 'nullable|string|max:255',
        'mystic_element' => 'nullable|string|max:255',
        'signature_rider' => 'nullable|string|max:255',
        'mystic_planet' => 'nullable|string|max:255',
        'signature_weapon' => 'nullable|string|max:255',
        'mystic_guardian' => 'nullable|string|max:255',
        'image' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:2048',
        'image_two' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:2048',
        'image_three' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:2048',
        'gallery_images.*' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:2048',
        'status' => 'nullable|in:0,1',
        'mystic_forms.*.id' => 'nullable|exists:character_mystic_forms,id',
        'mystic_forms.*.title' => 'nullable|string|max:255',
        'mystic_forms.*.description' => 'nullable|string',
        'mystic_forms.*.image' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:2048', // For file upload
        'mystic_forms.*.image_path' => 'nullable|string', // For existing path
        'gadgets_attacks.*.id' => 'nullable|exists:character_gadgets,id',
        'gadgets_attacks.*.title' => 'nullable|string|max:255',
        'gadgets_attacks.*.description' => 'nullable|string',
        'gadgets_attacks.*.image' => 'nullable|file|mimes:jpeg,png,jpg,webp,avif|max:2048', // For file upload
        'gadgets_attacks.*.image_path' => 'nullable|string', // For existing path
    ]);

    // Check if validation fails
    if ($validator->fails()) {
        return redirect()->back()->withErrors($validator)->withInput();
    }

    checkAdminHasPermissionAndThrowException('project.management');

    $project = Character::findOrFail($project);

    // Update basic fields
    $project->tags = $request->tags ?? $project->tags;
    $project->mystic_element = $request->mystic_element;
    $project->signature_rider = $request->signature_rider;
    $project->mystic_planet = $request->mystic_planet;
    $project->signature_weapon = $request->signature_weapon;
    $project->mystic_guardian = $request->mystic_guardian;
    $project->line_color = $request->line_color;

    // Update main image
    if ($request->hasFile('image')) {
        $image = $request->file('image');
        $fileName = 'image_' . time() . '.' . $image->getClientOriginalExtension();
        $image->move(public_path('uploads/custom-images'), $fileName);
        $project->image = 'uploads/custom-images/' . $fileName;
    }

    // Update image_two
	if ($request->hasFile('image_two')) {
		// Delete old image if exists
		if ($request->image_two_path && file_exists(public_path($request->image_two_path))) {
			@unlink(public_path($request->image_two_path));
		}

		$imageTwo = $request->file('image_two');
		$fileName = 'image_two_' . time() . '.' . $imageTwo->getClientOriginalExtension();
		$imageTwo->move(public_path('uploads/custom-images'), $fileName);
		$project->image_two = 'uploads/custom-images/' . $fileName;
	}

	// Update image_three
	if ($request->hasFile('image_three')) {
		// Delete old image if exists
		if ($request->image_three_path && file_exists(public_path($request->image_three_path))) {
			@unlink(public_path($request->image_three_path));
		}

		$imageThree = $request->file('image_three');
		$fileName = 'image_three_' . time() . '.' . $imageThree->getClientOriginalExtension();
		$imageThree->move(public_path('uploads/custom-images'), $fileName);
		$project->image_three = 'uploads/custom-images/' . $fileName;
	}

    $project->save();

    // Upload and save new gallery images
    if ($request->hasFile('gallery_images')) {
        foreach ($request->file('gallery_images') as $index => $image) {
            if ($image->isValid()) {
                $galleryFileName = 'gallery_' . time() . '_' . $index . '.' . $image->getClientOriginalExtension();
                $image->move(public_path('uploads/gallery'), $galleryFileName);

                CharacterGallery::create([
                    'character_id' => $project->id,
                    'image' => 'uploads/gallery/' . $galleryFileName,
                ]);
            }
        }
    }

    // Handle Mystic Forms
    if ($request->has('mystic_forms')) {
        $existingMysticForms = $project->mysticForms()->get()->keyBy('id');
        $submittedFormIds = [];

        foreach ($request->mystic_forms as $index => $form) {
            $formId = $form['id'] ?? null;

            $mysticFormData = [
                'character_id' => $project->id,
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
                $mysticFormData['image'] = $form['image_path'] ?? ($formId && isset($existingMysticForms[$formId]) ? $existingMysticForms[$formId]->image : null);
            }

            if ($formId && isset($existingMysticForms[$formId])) {
                // Update existing record
                CharacterMysticForm::where('id', $formId)->update($mysticFormData);
                $submittedFormIds[] = (int)$formId;
            } else {
                // Create new record
                $newMysticForm = CharacterMysticForm::create($mysticFormData);
                $submittedFormIds[] = $newMysticForm->id;
            }
        }

        // Delete mystic forms that were removed from the form
        if (!empty($submittedFormIds)) {
            CharacterMysticForm::where('character_id', $project->id)
                ->whereNotIn('id', $submittedFormIds)
                ->delete();
        }
    }

    // Handle Gadgets & Attacks
    if ($request->has('gadgets_attacks')) {
        $existingGadgets = $project->gadgets()->get()->keyBy('id');
        $submittedGadgetIds = [];

        foreach ($request->gadgets_attacks as $index => $gadget) {
            $gadgetId = $gadget['id'] ?? null;

            $gadgetData = [
                'character_id' => $project->id,
                'title' => $gadget['title'] ?? null,
                'description' => $gadget['description'] ?? null,
            ];

            // Handle image: use uploaded file if present, otherwise use image_path or existing image
            if ($request->hasFile("gadgets_attacks.$index.image")) {
                $image = $request->file("gadgets_attacks.$index.image");
                if ($image->isValid()) {
                    $fileName = 'gadget_attack_' . time() . '_' . $index . '.' . $image->getClientOriginalExtension();
                    $image->move(public_path('uploads/custom-images'), $fileName);
                    $gadgetData['image'] = 'uploads/custom-images/' . $fileName;
                }
            } else {
                $gadgetData['image'] = $gadget['image_path'] ?? ($gadgetId && isset($existingGadgets[$gadgetId]) ? $existingGadgets[$gadgetId]->image : null);
            }

            if ($gadgetId && isset($existingGadgets[$gadgetId])) {
                // Update existing record
                CharacterGadget::where('id', $gadgetId)->update($gadgetData);
                $submittedGadgetIds[] = (int)$gadgetId;
            } else {
                // Create new record
                $newGadget = CharacterGadget::create($gadgetData);
                $submittedGadgetIds[] = $newGadget->id;
            }
        }

        // Delete gadgets that were removed from the form
        if (!empty($submittedGadgetIds)) {
            CharacterGadget::where('character_id', $project->id)
                ->whereNotIn('id', $submittedGadgetIds)
                ->delete();
        }
    }

    // Update or create translation
    $translation = $project->translations()->where('lang_code', $code)->first();
    if ($translation) {
        $translation->update([
            'title' => $request->title ?? $translation->title,
            'description' => $request->description ?? $translation->description,
            'seo_title' => $request->seo_title ?? $translation->seo_title,
            'seo_description' => $request->seo_description ?? $translation->seo_description,
        ]);
    } else {
        $project->translations()->create([
            'lang_code' => $code,
            'title' => $request->title,
            'description' => $request->description,
            'seo_title' => $request->seo_title,
            'seo_description' => $request->seo_description,
        ]);
    }

    return $this->redirectWithMessage(RedirectType::UPDATE->value, 'admin.character.list');
}

    public function destroy($id): RedirectResponse
	{
		checkAdminHasPermissionAndThrowException('project.management');

		$project = Character::findOrFail($id);

		// Delete main character images
		if ($project->image) {
			if (File::exists(public_path($project->image))) {
				unlink(public_path($project->image));
			}
		}
		if ($project->image_two) {
			if (File::exists(public_path($project->image_two))) {
				unlink(public_path($project->image_two));
			}
		}
		if ($project->image_three) {
			if (File::exists(public_path($project->image_three))) {
				unlink(public_path($project->image_three));
			}
		}

		// Delete related mystic forms and their images
		$mysticForms = $project->mysticForms;
		foreach ($mysticForms as $form) {
			if ($form->image) {
				if (File::exists(public_path($form->image))) {
					unlink(public_path($form->image));
				}
			}
		}
		if ($mysticForms->isNotEmpty()) {
			CharacterMysticForm::where('character_id', $project->id)->delete();
		}

		// Delete related gadgets and their images
		$gadgets = $project->gadgets;
		foreach ($gadgets as $gadget) {
			if ($gadget->image) {
				if (File::exists(public_path($gadget->image))) {
					unlink(public_path($gadget->image));
				}
			}
		}
		if ($gadgets->isNotEmpty()) {
			CharacterGadget::where('character_id', $project->id)->delete();
		}

		// Delete the character
		$success = $project->delete();

		return $this->redirectWithMessage(RedirectType::DELETE->value, 'admin.character.list');
	}
	
	public function destroyGalleryImage($id)
	{
		$gallery = CharacterGallery::findOrFail($id);

		// Delete image file
		if ($gallery->image && File::exists(public_path($gallery->image))) {
			File::delete(public_path($gallery->image));
		}

		$gallery->delete();

		return response()->json(['success' => true]);
	}

    public function statusUpdate($id) {
        checkAdminHasPermissionAndThrowException('project.management');

        $project = Character::find($id);
        $status = $project->status == 1 ? 0 : 1;
        $project->update(['status' => $status]);

        $notification = __('Updated Successfully');

        return response()->json([
            'success' => true,
            'message' => $notification,
        ]);
    }
}
