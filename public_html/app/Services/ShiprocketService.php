<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Cache;

class ShiprocketService
{
    public static function getToken()
    {
        return Cache::remember('shiprocket_token', 86000, function () {

            $response = Http::post(
				config('shiprocket.base_url') . '/v1/external/auth/login',
				[
					'email'    => config('shiprocket.email'),
					'password' => config('shiprocket.password'),
				]
			);

			if (!$response->successful()) {
				dd([
					'status' => $response->status(),
					'body'   => $response->body(),
					'json'   => $response->json(),
				]);
			}

            return $response->json('token');
        });
    }
}
