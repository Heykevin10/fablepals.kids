<?php

namespace Database\Seeders;

use App\Models\User;
use App\Enums\UserStatus;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Modules\Location\app\Models\Country;

class UserInfoSeeder extends Seeder {
    /**
     * Run the database seeds.
     */
    public function run(): void {
        $user = new User();
        $user->name = 'Curtis Campher';
        $user->email = 'user@gmail.com';
        $user->gender = 'Male';
        $user->country_id = Country::where('slug','united-states')->first()?->id ?? 1;
        $user->province = 'Florida';
        $user->city = 'Washington DC';
        $user->zip_code = '8834';
        $user->address = '4A, Park Street';

        $user->age = '45 Year';
        $user->phone = '2420 -136- 1452';
        $user->image = 'frontend/images/user.png';
        $user->email_verified_at = now();
        $user->password = Hash::make('1234');
        $user->status == UserStatus::ACTIVE;
        $user->save();
    }
}
