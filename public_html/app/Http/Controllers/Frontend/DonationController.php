<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Donation;
use App\Http\Controllers\CashfreeController;

class DonationController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'name'    => 'required|string|max:255',
            'mobile'  => 'required|digits:10',
            'email'   => 'nullable|email',
            'amount'  => 'required|numeric|min:1',
            'purpose' => 'required|string',
        ]);

        // 1️⃣ Donation save (PENDING)
        $donation = Donation::create([
            'name'           => $request->name,
            'mobile'         => $request->mobile,
            'email'          => $request->email,
            'amount'         => $request->amount,
            'purpose'        => $request->purpose,
            'payment_status' => 'pending',
        ]);

        // 2️⃣ Cashfree redirect
        return app(CashfreeController::class)
            ->createDonationOrder($donation);
    }
}
