<?php

namespace App\Http\Controllers\Frontend;

use App\Enums\ThemeList;
use Illuminate\View\View;
use Illuminate\Http\Request;
use App\Rules\CustomRecaptcha;
use App\Traits\GlobalMailTrait;
use Modules\Faq\app\Models\Faq;
use Illuminate\Http\JsonResponse;
use Modules\Blog\app\Models\Blog;
use Modules\Award\app\Models\Award;
use Modules\Brand\app\Models\Brand;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Session;
use Modules\OurTeam\app\Models\OurTeam;
use Modules\Project\app\Models\Project;
use Modules\Project\app\Models\Character;
use Modules\Project\app\Models\CharacterGallery;
use Modules\Project\app\Models\CharacterMysticForm;
use Modules\Project\app\Models\CharacterGadget;
use Modules\Project\app\Models\Fabworld;
use Modules\Project\app\Models\FabworldCategory;
use Modules\Project\app\Models\FabworldSlide;
use Modules\Project\app\Models\FabworldGallery;
use Modules\Service\app\Models\Service;
use Modules\Frontend\app\Models\Section;
use Illuminate\Support\Facades\Validator;
use Modules\Testimonial\app\Models\Testimonial;
use Modules\PageBuilder\app\Models\CustomizeablePage;
use Modules\SiteAppearance\app\Models\SectionSetting;
use Modules\Subscription\app\Models\SubscriptionPlan;
use Modules\GlobalSetting\app\Models\CustomPagination;
use Modules\Shop\app\Models\Product;
use DB;

class HomePageController extends Controller {
    use GlobalMailTrait;

    function index(): View {
        $sectionSetting = SectionSetting::first();

        $theme_name = Session::has('demo_theme') ? Session::get('demo_theme') : DEFAULT_HOMEPAGE;
        $sections = Section::whereHas("home", function ($q) use ($theme_name) {
            $q->where('slug', $theme_name);
        })->get();

        $hero = $sections->where('name', 'hero_section')->first();
        $aboutSection = $sections->where('name', 'about_section')->first();

        $faqs = Faq::select('id')->with(['translation' => function ($query) {
            $query->select('faq_id', 'question', 'answer');
        }])->active()->latest()->take(4)->get();

        $projects = Project::select('id', 'slug', 'image','project_date','service_id')->with([
            'translation' => function ($query) {
            $query->select('project_id', 'title', 'project_category');
        },
        'service' => function ($query) {
            $query->select('id','slug');
        },
        'service.translation' => function ($query) {
            $query->select('service_id','title');
        },
        ])->whereHas('service', function ($query) {
            $query->active();
        })->active()->latest()->get();

        $teams = OurTeam::select('name', 'slug', 'designation', 'image')->active()->latest()->take(4)->get();

        $testimonialSection = $sections->where('name', 'testimonial_section')->first();
        $testimonials = Testimonial::select('id')->with(['translation' => function ($query) {
            $query->select('testimonial_id', 'name', 'designation', 'comment');
        }])->active()->latest()->take(4)->get();

        $latest_blogs = Blog::select('id', 'blog_category_id', 'slug', 'image', 'created_at')->with([
            'translation'          => function ($query) {
                $query->select('blog_id', 'title');
            },
            'category'             => function ($query) {
                $query->select('id', 'slug');
            },
            'category.translation' => function ($query) {
                $query->select('blog_category_id', 'title');
            },
        ])->whereHas('category', function ($query) {
            $query->active();
        })->active()->homepage()->latest()->take(3)->get();

        $bannerSection = $sections->where('name', 'banner_section')->first();
        $brands = Brand::select('name', 'image', 'url')->active()->take(8)->get();

        $awards = Award::select('id', 'url')->with([
            'translation' => function ($query) {
                $query->select('award_id', 'year', 'title', 'sub_title', 'tag');
            },
        ])->active()->latest()->take(4)->get();

        $services = Service::select('id', 'slug', 'icon', 'line_color')->with(['translation' => function ($query) {
            $query->select('service_id', 'title', 'short_description', 'btn_text');
        }])->active()->latest()->take(6)->get();

        $servicefeatureSection = $sections->where('name', 'service_feature_section')->first();

        $chooseUsSection = $sections->where('name', 'choose_us_section')->first();

        $counterSection = $sections->where('name', 'counter_section')->first();

        $plans = SubscriptionPlan::select('id', 'plan_price','expiration_date','button_url')->with([
            'translation'          => function ($query) {
                $query->select( 'subscription_plan_id','plan_name','short_description','description','button_text');
            },
        ])->active()->orderBy('serial')->take(3)->get();
		
		$border_color = DB::table('award_colors')->where('id', 1)->value('color');

        return view('frontend.home.' . $theme_name . '.index', compact(
            'sectionSetting',
            'hero',
            'aboutSection',
            'faqs',
            'projects',
            'teams',
            'testimonialSection',
            'testimonials',
            'latest_blogs',
            'bannerSection',
            'brands',
            'awards',
            'services',
            'servicefeatureSection',
            'chooseUsSection',
            'counterSection',
            'plans',
            'border_color',
        ));
    }
    function changeTheme(string $theme) {
        if (cache()->get('setting')?->show_all_homepage != 1) {
            abort(404);
        }
        foreach (ThemeList::cases() as $enumTheme) {
            if ($theme == $enumTheme->value) {
                Session::put('demo_theme', $enumTheme->value);
                break;
            }
        }
        return redirect('/');
    }
    public function about(): View {
        $theme_name = DEFAULT_HOMEPAGE;

        $counterSection = Section::whereHas("home", function ($q) use ($theme_name) {
            $q->where('slug', $theme_name);
        })->where('name', 'counter_section')->first();

        $chooseUsSection = Section::whereHas("home", function ($q) use ($theme_name) {
            $q->where('slug', $theme_name);
        })->where('name', 'choose_us_section')->first();

        $awards = Award::select('id', 'url')->with([
            'translation' => function ($query) {
                $query->select('award_id', 'year', 'title', 'sub_title', 'tag');
            },
        ])->active()->latest()->take(4)->get();
        $teams = OurTeam::select('name', 'slug', 'designation', 'image')->active()->latest()->take(4)->get();
        $brands = Brand::select('name', 'image', 'url')->active()->take(8)->get();

        return view('frontend.pages.about', compact('counterSection','chooseUsSection','teams','brands','awards'));

    }
    public function faq(): View {
        $faqs = Faq::select('id')->with(['translation' => function ($query) {
            $query->select('faq_id', 'question', 'answer');
        }])->active()->latest()->get();

        return view('frontend.pages.faq', compact('faqs'));

    }
    public function pricing(): View {
        $per_age = cache('CustomPagination')?->pricing_plan ?? CustomPagination::where('section_name', 'Pricing Plan')->value('item_qty');

        $plans = SubscriptionPlan::select('id', 'plan_price','expiration_date','button_url')->with([
            'translation'          => function ($query) {
                $query->select( 'subscription_plan_id','plan_name','short_description','description','button_text');
            },
        ])->active()->orderBy('serial')->paginate($per_age);

        $faqs = Faq::select('id')->with(['translation' => function ($query) {
            $query->select('faq_id', 'question', 'answer');
        }])->active()->latest()->get();

        return view('frontend.pages.pricing', compact('plans','faqs'));

    }
    public function team(): View {
        $per_age = cache('CustomPagination')?->team_list ?? CustomPagination::where('section_name', 'Team List')->value('item_qty');
        $teams = OurTeam::select('name', 'slug', 'designation', 'image')->active()->latest()->paginate($per_age);

        $theme_name = DEFAULT_HOMEPAGE;

        $testimonialSection = Section::whereHas("home", function ($q) use ($theme_name) {
            $q->where('slug', $theme_name);
        })->where('name', 'testimonial_section')->first();

        $testimonials = Testimonial::select('id')->with(['translation' => function ($query) {
            $query->select('testimonial_id', 'name', 'designation', 'comment');
        }])->active()->latest()->get();

        return view('frontend.pages.team', compact('teams', 'testimonialSection', 'testimonials'));
    }
    public function singleTeam($slug): View {
        $team = OurTeam::select('name', 'slug', 'designation', 'image', 'sort_description', 'email', 'phone', 'facebook', 'twitter', 'dribbble', 'instagram')->whereSlug($slug)->active()->first();
        if ($team) {
            return view('frontend.pages.team-details', compact('team'));
        }
        abort(404);
    }
    public function portfolios(): View {
        $per_age = cache('CustomPagination')?->portfolio_list ?? CustomPagination::where('section_name', 'Portfolio List')->value('item_qty');
        
        $projects = Project::select('id', 'slug', 'image')->with(['translation' => function ($query) {
            $query->select('project_id', 'title', 'project_category');
        }])->whereHas('service', function ($query) {
            $query->active();
        })->active()->latest()->paginate($per_age);
        

        return view('frontend.pages.portfolio.index', compact('projects'));
    }
    public function singlePortfolio($slug): View {
        $project = Project::select('id', 'slug', 'image','tags','project_author','created_at')->with([
            'translation' => function ($query) {
            $query->select('project_id', 'title','description', 'project_category', 'seo_title', 'seo_description');
        },
        'service' => function ($query) {
            $query->select('id');
        },
        'service.translation' => function ($query) {
            $query->select('service_id','title');
        },
        'images' => function ($query) {
            $query->select('project_id', 'small_image', 'large_image');
        },
        ])->whereHas('service', function ($query) {
            $query->active();
        })->active()->where('slug', $slug)->first();

        if (!$project) {
            abort(404);
        }

        $tagString = '';
        if ($project?->tags) {
            $tags = json_decode($project?->tags, true);
            $tagString = implode(', ', array_map(function ($tag) {
                return $tag['value'];
            }, $tags));
        }

        $nextPost = Project::select('id', 'slug')->whereHas('service', function ($query) {
            $query->active();
        })->active()->where('id', '>', $project->id)->first();

        $prevPost = Project::select('id', 'slug')->whereHas('service', function ($query) {
            $query->active();
        })->active()->where('id', '<', $project->id)->orderBy('id', 'desc')->first();

        return view('frontend.pages.portfolio.details', compact('project','tagString', 'nextPost', 'prevPost'));
    }
    public function services(): View {
        $per_age = cache('CustomPagination')?->service_list ?? CustomPagination::where('section_name', 'Service List')->value('item_qty');
        
        $services = Service::select('id', 'slug', 'icon')->with(['translation' => function ($query) {
            $query->select('service_id', 'title', 'short_description', 'btn_text');
        }])->active()->latest()->paginate($per_age);

        $theme_name = DEFAULT_HOMEPAGE;

        $bannerSection = Section::whereHas("home", function ($q) use ($theme_name) {
            $q->where('slug', $theme_name);
        })->where('name', 'banner_section')->first();
        
        return view('frontend.pages.service.index', compact('services','bannerSection'));
    }
    public function singleService($slug): View {
        $service = Service::select('id', 'slug', 'image','created_at')->with([
            'translation' => function ($query) {
            $query->select('service_id', 'title','description','seo_title', 'seo_description');
        }])->active()->where('slug', $slug)->first();

        if (!$service) {
            abort(404);
        }


        return view('frontend.pages.service.details', compact('service'));
    }
    public function contactTeamMember(Request $request, $slug):JsonResponse {
        try {
            $setting = cache()->get('setting');

            if ($setting?->contact_team_member !== 'active') {
                return response()->json(['success' => false, 'message' => __('Something went wrong, please try again')]);
            }

            $validator = Validator::make($request->all(), [
                'name'                 => 'required',
                'email'                => 'required',
                'message'              => 'required',
                'g-recaptcha-response' => $setting?->recaptcha_status == 'active' ? ['required', new CustomRecaptcha()] : '',
            ], [
                'name.required'                 => __('Name is required'),
                'email.required'                => __('Email is required'),
                'message.required'              => __('Message is required'),
                'g-recaptcha-response.required' => __('Please complete the recaptcha to submit the form'),
            ]);
            if ($validator->fails()) {
                return response()->json(['status' => false, 'message' => $validator->errors()], 422);
            }

            $member = OurTeam::select('email')->active()->whereSlug($slug)->first();
            if (!$member) {
                return response()->json(['success' => false, 'message' => __('Not Found!')], 404);
            }
            $str_replace = [
                'name'    => $request->name,
                'email'   => $request->email,
                'message' => $request->message,
            ];
            [$subject, $message] = $this->fetchEmailTemplate('contact_team_mail', $str_replace);
            $this->sendMail($member?->email, $subject, $message);
            return response()->json(['success' => true,'message' => __('Message Sent Successfully')]);
        } catch (\Exception $e) {
            info($e->getMessage());
            return response()->json(['success' => false,'message' => __('Mail sending operation failed. Please try again.')]);
        }
    }
    public function privacyPolicy(): View {
        $customPage = CustomizeablePage::with('translation')->whereSlug('privacy-policy')->whereStatus(true)->first();
        if ($customPage) {
            return view('frontend.pages.custom-page', compact('customPage'));
        }
        abort(404);
    }

    public function termsCondition(): View {
        $customPage = CustomizeablePage::with('translation')->whereSlug('terms-conditions')->whereStatus(true)->first();
        if ($customPage) {
            return view('frontend.pages.custom-page', compact('customPage'));
        }
        abort(404);
    }
    public function customPage($slug): View {
        $customPage = CustomizeablePage::with('translation')->whereStatus(true)->whereSlug($slug)->first();
        if ($customPage) {
            return view('frontend.pages.custom-page', compact('customPage'));
        }
        abort(404);
    }
	
	public function characters(){
		$data['projects'] = Character::select('characters.*', 'character_translations.title', 'character_translations.description')
		->join('character_translations', 'character_translations.character_id', '=', 'characters.id')
		->where('character_translations.lang_code', 'en')
		->where('status', true)
		->get();

		
		return view('frontend.character.list', $data);
	}
	
	public function fabworlds(){
		$data['projects'] = FabworldCategory::select('fabworlds.banner', 'fabworld_categories.name', 'fabworld_categories.id', 'fabworld_categories.slug')
		->join('fabworlds', 'fabworlds.category_id', '=', 'fabworld_categories.id')
		->groupBy('fabworld_categories.name')
		->get();

		
		return view('frontend.fabworld.list', $data);
	}
	
	public function fabworldList($slug){
		$category = FabworldCategory::select('id', 'name')->where('slug', $slug)->first();
		$data['category'] = $category;
		$data['projects'] = Fabworld::select('fabworlds.*')
		->where('category_id', $category->id)
		->where('status', true)
		->get();

		
		return view('frontend.fabworld.fabworld_list', $data);
	}
	
	public function characterProfile($slug){
		$data['project'] = Character::select('characters.*', 'character_translations.title', 'character_translations.description')
		->join('character_translations', 'character_translations.character_id', '=', 'characters.id')
		->where('character_translations.lang_code', 'en')
		->where('characters.slug', $slug)
		->first();
		
		$data['products'] = Product::select('products.*', 'product_translations.title')->join('product_translations', 'product_translations.product_id', '=', 'products.id')
		->where('product_translations.lang_code', 'en')
		->where('products.status', 1)
		->where('character_id', $data['project']->id)
		->get();
		
		if(empty($data['project']->id)){
		    abort(404);
		}
		if(!empty($data['project']->id)){
			$data['project_gallery'] = CharacterGallery::where('character_id', $data['project']->id)->get();
			$data['mystical_forms'] = CharacterMysticForm::where('character_id', $data['project']->id)->get();
			$data['gadgets'] = CharacterGadget::where('character_id', $data['project']->id)->get();
		}else{
			$data['project_gallery'] = array();
			$data['mystical_forms'] = array();
			$data['gadgets'] = array();
		}
		
		if (!empty($data['project']->line_color)) {
			$color_arr = explode(',', $data['project']->line_color);
			$color_one = trim($color_arr[0]) ?? '#007bff';
			if(!empty($color_arr[1])){
				$color_two = trim($color_arr[1]) ?? '#00ffff';
			}else{
				$color_two = trim($color_arr[0]) ?? '#00ffff';
			}
			$color_three = $this->hexToRgba($color_one, 0.5);
			$color_four = $this->hexToRgba($color_one, 0.2);
		} else {
			$color_one = '#007bff';
			$color_two = '#00ffff';
			$color_three = $this->hexToRgba('#007bff', 0.5);
			$color_four = $this->hexToRgba('#007bff', 0.2);
		}

		$data['color_one'] = $color_one;
		$data['color_two'] = $color_two;
		$data['color_three'] = $color_three;
		$data['color_four'] = $color_four;
		
		return view('frontend.character.profile', $data);
	}
	
	public function fabworldProfile($slug){
		$data['project'] = Fabworld::select('fabworlds.*')
		->where('fabworlds.slug', $slug)
		->first();
		if(empty($data['project']->id)){
		    abort(404);
		}
		$data['project_gallery'] = collect();
		$data['mystical_forms'] = collect();
		$data['gadgets'] = collect();
		
		$data['products'] = Product::select('products.*', 'product_translations.title')->join('product_translations', 'product_translations.product_id', '=', 'products.id')
		->where('product_translations.lang_code', 'en')
		->where('products.status', 1)
		->where('fabworld_id', $data['project']->id)
		->get();

		if(!empty($data['project']->id)){
			$data['project_gallery'] = FabworldGallery::where('fabworld_id', $data['project']->id)->get();
			$data['mystical_forms'] = FabworldSlide::where('fabworld_id', $data['project']->id)->get();
		}
		
		if (!empty($data['project']->line_color)) {
			$color_arr = explode(',', $data['project']->line_color);
			$color_one = trim($color_arr[0]) ?? '#007bff';
			if(!empty($color_arr[1])){
				$color_two = trim($color_arr[1]) ?? '#00ffff';
			}else{
				$color_two = trim($color_arr[0]) ?? '#00ffff';
			}
			$color_three = $this->hexToRgba($color_one, 0.5);
			$color_four = $this->hexToRgba($color_one, 0.2);
		} else {
			$color_one = '#007bff';
			$color_two = '#00ffff';
			$color_three = $this->hexToRgba('#007bff', 0.5);
			$color_four = $this->hexToRgba('#007bff', 0.2);
		}

		$data['color_one'] = $color_one;
		$data['color_two'] = $color_two;
		$data['color_three'] = $color_three;
		$data['color_four'] = $color_four;
		
		return view('frontend.fabworld.profile', $data);
	}
	
	public function hexToRgba($hex, $alpha = 1) {
		$hex = ltrim($hex, '#');
		if (strlen($hex) == 3) {
			$r = hexdec(str_repeat($hex[0], 2));
			$g = hexdec(str_repeat($hex[1], 2));
			$b = hexdec(str_repeat($hex[2], 2));
		} else {
			$r = hexdec(substr($hex, 0, 2));
			$g = hexdec(substr($hex, 2, 2));
			$b = hexdec(substr($hex, 4, 2));
		}

		return "rgba($r, $g, $b, $alpha)";
	}
	
	public function videoLinks()
	{
		$videos = DB::table('videos')->orderBy('id', 'desc')->get();
		$data['youtubeStats'] = DB::table('youtube_stats')->first();

		// Convert normal YouTube URLs to embed URLs
		foreach ($videos as $video) {
			$video->embed_link = str_replace('watch?v=', 'embed/', $video->link);
		}

		// Highlight first video (most recent)
		$data['highlightedVideo'] = $videos->first();
		$data['otherVideos'] = $videos->skip(1);

		return view('frontend.fabworld.fabtv', $data);
	}
	
	public function homeBannerItems()
	{
		$isDesktop = request('desktop');

		// if desktop = 1 → load desktop banners only  
		// if desktop = 0 → load mobile banners only  
		$banners = HomeBanner::where('desktop', $isDesktop)->get();

		return view('frontend.partials.slider_items', compact('banners'))->render();
	}
	
	public function songs($slug){
		$id = DB::table('song_playlists')->where('slug', $slug)->value('id');
		$songs = DB::table('songs')
			->select('songs.*', 'song_artists.name as artist')
			->join('song_artists', 'song_artists.id', '=', 'songs.artist_id')
			->where('playlist_id', $id)
			->get()
			->map(function($song) {
				return [
					'id' => $song->id,
					'title' => $song->title,
					'artist' => $song->artist,
					'duration' => sprintf('%d:%02d', $song->minutes, $song->seconds),
					'src' => asset($song->file),
				];
			})->toArray();

		return view('frontend.pages.song.index', compact('songs'));
	}
	
	public function artistSongs($slug){
		$id = $data['artists'] = DB::table('song_artists')->where('slug', $slug)->value('id');

		$data['songs'] = DB::table('songs')
        ->select('songs.*', 'song_artists.name as artist')
        ->join('song_artists', 'song_artists.id', '=', 'songs.artist_id')
        ->where('artist_id', $id)
        ->get()
        ->map(function($song) {
            return [
                'id' => $song->id,
                'title' => $song->title,
                'artist' => $song->artist,
                'duration' => sprintf('%d:%02d', $song->minutes, $song->seconds),
                'src' => asset($song->file),
            ];
        })->toArray();
		
		
		return view('frontend.pages.song.index', $data);
	}
	
	public function playlists(){
		$data['playlists'] = DB::table('song_playlists')->where('is_deleted', false)->get();
		return view('frontend.pages.song.playlists', $data);
	}
	
	public function artists(){
		$data['artists'] = DB::table('song_artists')->orderBy('name', 'asc')->get();
		
		
		return view('frontend.pages.song.artists', $data);
	}

}
