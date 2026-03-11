<?php

namespace Modules\Frontend\app\Http\Controllers;

use App\Enums\RedirectType;
use App\Traits\RedirectHelperTrait;
use App\Http\Controllers\Controller;
use Modules\Frontend\app\Models\Section;
use Modules\Language\app\Models\Language;
use Modules\Language\app\Enums\TranslationModels;
use Modules\Frontend\app\Models\SectionTranslation;
use Modules\Frontend\app\Models\HomeBanner;
use Modules\Frontend\app\Models\SkillsSection;
use Modules\Frontend\app\Models\Video;
use Modules\Frontend\app\Models\YoutubeCount;
use Modules\Frontend\app\Traits\UpdateSectionTraits;
use Modules\Language\app\Traits\GenerateTranslationTrait;
use Modules\Frontend\app\Http\Requests\HeroSectionUpdateRequest;
use Illuminate\Http\Request;
use DB;

class HeroSectionController extends Controller {
    use GenerateTranslationTrait, RedirectHelperTrait, UpdateSectionTraits;

    /**
     * Display a listing of the resource.
     */
    public function index() {
        checkAdminHasPermissionAndThrowException('section.management');
        $code = request('code') ?? getSessionLanguage();
        if (!Language::where('code', $code)->exists()) {
            abort(404);
        }
        $languages = allLanguages();
        $heroSection = Section::getByName('hero_section');

        return view('frontend::' . DEFAULT_HOMEPAGE . '.hero-section', compact('languages', 'code', 'heroSection'));
    }
	
	public function form($id = null)
    {
        $banner = null;
        if ($id) {
            $banner = HomeBanner::findOrFail($id);
        }
        return view('frontend::two.home-banners', compact('banner'));
    }
	
	public function heroForm($id = null)
    {
        $section  = null;
        if ($id) {
            $section = SkillsSection::findOrFail($id);
        }
        return view('frontend::two.home-heros', compact('section'));
    }
	
	public function videoForm($id = null)
    {
        $section  = null;
        if ($id) {
            $section = Video::findOrFail($id);
        }
        return view('frontend::two.video-form', compact('section'));
    }
	
	public function bannerList()
    {
        $banners = HomeBanner::latest()->get();
        return view('frontend::two.home-banners-list', compact('banners'));
    }
	
	public function heroList()
    {
        $skillsSections = SkillsSection::latest()->get();
        return view('frontend::two.home-heros-list', compact('skillsSections'));
    }
	
	public function videoList()
    {
        $videos = Video::latest()->get();
		$stats = DB::table('youtube_stats')->first();
        return view('frontend::two.video-list', compact('videos', 'stats'));
    }
	
	public function bannerDelete($id)
    {
        $banner = HomeBanner::findOrFail($id);

        // Delete image if exists
        if ($banner->image && file_exists(public_path('uploads/home_banners/'.$banner->image))) {
            unlink(public_path('uploads/home_banners/'.$banner->image));
        }

        $banner->delete();

        return redirect()->route('home_banners.index')->with('success', 'Banner deleted successfully.');
    }
	
	public function heroDelete($id)
    {
        $skillsSection = SkillsSection::findOrFail($id);

        // Delete image if exists
        if ($skillsSection->image && file_exists(public_path($skillsSection->image))) {
            unlink(public_path($skillsSection->image));
        }

        $skillsSection->delete();

        return redirect()->route('skills_sections.list')->with('success', 'Skills section deleted successfully.');
    }
	
	public function videoDelete($id)
    {
        $model = Video::findOrFail($id);

        $model->delete();

        return redirect()->route('video.index')->with('success', 'Link deleted successfully.');
    }
	
	 public function bannerSave(Request $request)
    {
		$rules = [
			'title' => 'required|string|max:255',
			'image' => $request->id 
				? 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048' 
				: 'required|image|mimes:jpg,jpeg,png,webp|max:2048',
		];

		$request->validate($rules);

		$banner = HomeBanner::updateOrCreate(
			['id' => $request->id],
			[
				'desktop' => $request->desktop,
				'title' => $request->title,
				'title_two' => $request->title_two,
				'title_three' => $request->title_three,
				'sub_title' => $request->sub_title,
				'action_button_text' => $request->action_button_text,
				'action_button_url' => $request->action_button_url,
			]
		);

		// Handle image upload
		if ($request->hasFile('image')) {
			$file = $request->file('image');
			$filename = time().'_'.$file->getClientOriginalName();
			$file->move(public_path('uploads/home_banners'), $filename);

			// delete old image if updating
			if ($banner->image && file_exists(public_path('uploads/home_banners/'.$banner->image))) {
				unlink(public_path('uploads/home_banners/'.$banner->image));
			}

			$banner->image = $filename;
			$banner->save();
		}

		return redirect()->to(route('home_banners.index'));
	}
	
	public function heroSave(Request $request)
    {
        $rules = [
            'title' => 'required|string|max:255',
            'image' => $request->id
                ? 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048'
                : 'required|image|mimes:jpg,jpeg,png,webp|max:2048',
            'skill_percentage_one' => 'nullable|integer|min:0|max:100',
            'skill_percentage_two' => 'nullable|integer|min:0|max:100',
            'skill_percentage_three' => 'nullable|integer|min:0|max:100',
            'skill_percentage_four' => 'nullable|integer|min:0|max:100',
        ];

        $request->validate($rules);

        $section = SkillsSection::updateOrCreate(
            ['id' => $request->id],
            [
                'title' => $request->title,
                'sub_title' => $request->sub_title,
                'skill_title_one' => $request->skill_title_one,
                'skill_percentage_one' => $request->skill_percentage_one,
                'skill_title_two' => $request->skill_title_two,
                'skill_percentage_two' => $request->skill_percentage_two,
                'skill_title_three' => $request->skill_title_three,
                'skill_percentage_three' => $request->skill_percentage_three,
                'skill_title_four' => $request->skill_title_four,
                'skill_percentage_four' => $request->skill_percentage_four,
                'link' => $request->link,
            ]
        );

        // Handle image upload
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = time().'_'.$file->getClientOriginalName();
            $file->move(public_path('uploads/skills_sections'), $filename);

            // delete old image if updating
            if ($section->image && file_exists(public_path('uploads/skills_sections/'.$section->image))) {
                unlink(public_path('uploads/skills_sections/'.$section->image));
            }

            $section->image = $filename;
            $section->save();
        }

        return redirect()->to(route('hero.index'));
    }
	
	public function videoSave(Request $request)
    {
        $rules = [
            'title' => 'required|string|max:255',
            'link' => 'required|string|max:255',
        ];

        $request->validate($rules);

        $section = Video::updateOrCreate(
            ['id' => $request->id],
            [
                'title' => $request->title,
                'link' => $request->link,
            ]
        );

        return redirect()->to(route('video.index'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(HeroSectionUpdateRequest $request) {
        checkAdminHasPermissionAndThrowException('section.management');
        $section = Section::getByName('hero_section');

        // Update global content
        $global_content = $this->updateSectionContent($section?->global_content, $request, ['action_button_url'], ['hero_year_image','image','image_two']);

        // Update translated content
        $content = $this->updateSectionContent($section?->content, $request, ['title', 'title_two','title_three', 'sub_title', 'action_button_text', 'hero_year_text', 'total_customers']);

        $section->update(['global_content' => $global_content]);

        $translation = SectionTranslation::where('section_id', $section->id)->exists();

        if (!$translation) {
            $this->generateTranslations(TranslationModels::Section, $section, 'section_id', $request);
        }

        $this->updateTranslations($section, $request, $request->only('code'), ['content' => $content]);

        return $this->redirectWithMessage(RedirectType::UPDATE->value);
    }
	

    public function saveStats(Request $request)
	{
		$validated = $request->validate([
			'subscribers' => 'required|integer|min:0',
			'views' => 'required|integer|min:0',
		]);

		// There should be only one row
		$stats = DB::table('youtube_stats')->first();

		if ($stats) {
			// Update the only row
			DB::table('youtube_stats')->where('id', $stats->id)->update([
				'subscribers' => $validated['subscribers'],
				'views' => $validated['views'],
				'updated_at' => now(),
			]);
		} else {
			// Insert a new row if none exists
			DB::table('youtube_stats')->insert([
				'subscribers' => $validated['subscribers'],
				'views' => $validated['views'],
				'created_at' => now(),
				'updated_at' => now(),
			]);
		}

		return redirect()->back()->with('success', 'Statistics saved successfully.');
	}
	
}
