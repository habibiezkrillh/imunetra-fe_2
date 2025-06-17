<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\UserRelawan;
use Illuminate\Support\Facades\Validator;

class UserRelawanController extends Controller
{
    // Menampilkan semua relawan
    public function index()
    {
        $relawans = UserRelawan::all();
        return response()->json($relawans);
    }

    // Menampilkan satu relawan berdasarkan ID
    public function show($id)
    {
        $relawan = UserRelawan::find($id);

        if (!$relawan) {
            return response()->json(['message' => 'Relawan tidak ditemukan'], 404);
        }

        return response()->json($relawan);
    }

    // Update profil relawan
    public function update(Request $request, $id)
    {
        $relawan = UserRelawan::find($id);

        if (!$relawan) {
            return response()->json(['message' => 'Relawan tidak ditemukan'], 404);
        }

        // Validasi input
        $validator = Validator::make($request->all(), [
            'namarelawan' => 'sometimes|required|string',
            'kotadomisili' => 'sometimes|required|string',
            'nomortelepon' => 'sometimes|required|digits_between:10,15',
            'email' => 'sometimes|required|email',
            'alamatlengkap' => 'sometimes|required|string',
            'katasandi' => 'sometimes|required|string|min:6',
            'KTP' => 'sometimes|required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $relawan->update($request->all());

        return response()->json(['message' => 'Data relawan berhasil diperbarui', 'data' => $relawan]);
    }

    // Hapus akun relawan
    public function destroy($id)
    {
        $relawan = UserRelawan::find($id);

        if (!$relawan) {
            return response()->json(['message' => 'Relawan tidak ditemukan'], 404);
        }

        $relawan->delete();

        return response()->json(['message' => 'Relawan berhasil dihapus']);
    }
}
