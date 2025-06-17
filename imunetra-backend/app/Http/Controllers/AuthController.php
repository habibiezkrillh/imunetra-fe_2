<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\UserRelawan;
use App\Models\UserTenagaMedis;

class AuthController extends Controller
{
    // =========================
    // ===== REGISTER ==========
    // =========================

    public function registerRelawan(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'namarelawan'    => 'required|string|max:255',
            'kotadomisili'   => 'required|string|max:100',
            'nomortelepon'   => 'required|numeric|digits_between:10,15',
            'email'          => 'required|email|unique:user_relawan,email',
            'katasandi'      => 'required|string|min:6',
            'alamatlengkap'  => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Validasi gagal',
                'errors' => $validator->errors()
            ], 422);
        }

        $user = UserRelawan::create($request->all());

        return response()->json([
            'message' => 'Pendaftaran relawan berhasil',
            'data' => $user
        ], 201);
    }

    public function registerTenagaMedis(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'namatenagamedis'       => 'required|string|max:255',
            'kotadomisili'          => 'required|string|max:100',
            'nomortelepon'          => 'required|numeric|digits_between:10,15',
            'email'                 => 'required|email|unique:user_tenaga_medis,email',
            'katasandi'             => 'required|string|min:6',
            'tanggallahir'          => 'required|date',
            'alamatlengkap'         => 'required|string',
            'puskesmas_rumahsakit'  => 'required|string|max:255'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Validasi gagal',
                'errors' => $validator->errors()
            ], 422);
        }

        $user = UserTenagaMedis::create($request->all());

        return response()->json([
            'message' => 'Pendaftaran tenaga medis berhasil',
            'data' => $user
        ], 201);
    }

    // =========================
    // ======= LOGIN ==========
    // =========================

    public function loginRelawan(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email'     => 'required|email',
            'katasandi' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Validasi gagal',
                'errors' => $validator->errors()
            ], 422);
        }

        $user = UserRelawan::where('email', $request->email)->first();

        if ($user && $user->katasandi === $request->katasandi) {
            return response()->json([
                'message' => 'Login relawan berhasil',
                'data' => $user
            ]);
        }

        return response()->json([
            'message' => 'Email atau kata sandi salah'
        ], 401);
    }

    public function loginTenagaMedis(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email'     => 'required|email',
            'katasandi' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Validasi gagal',
                'errors' => $validator->errors()
            ], 422);
        }

        $user = UserTenagaMedis::where('email', $request->email)->first();

        if ($user && $user->katasandi === $request->katasandi) {
            return response()->json([
                'message' => 'Login tenaga medis berhasil',
                'data' => $user
            ]);
        }

        return response()->json([
            'message' => 'Email atau kata sandi salah'
        ], 401);
    }
}
