<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Donation;
use Illuminate\Http\Request;

class DonationController extends Controller
{
    public function index(Request $request)
    {
        $q = Donation::select('name','mobile','amount','purpose','created_at');

        if ($request->filled('search')) {
            $s = $request->search;
            $q->where('name', 'like', "%$s%")
              ->orWhere('mobile', 'like', "%$s%")
              ->orWhere('purpose', 'like', "%$s%");
        }

        $donations = $q->orderBy('id','desc')->paginate(20);

        return view('admin.donations.index', compact('donations'));
    }
}
