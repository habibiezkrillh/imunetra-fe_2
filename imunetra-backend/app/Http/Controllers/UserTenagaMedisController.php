<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\UserTenagaMedis;
use Illuminate\Support\Facades\Validator;

class UserTenagaMedisController extends Controller
{
    // Menampilkan semua tenaga medis
    public function index()
    {
        $tenagaMedis = UserTenagaMedis::all();
        return response()->json($tenagaMedis);
    }

    // Menampilkan satu tenaga medis berdasarkan ID
    public function show($id)
    {
        $tenagaMedis = UserTenagaMedis::find($id);

        if (!$tenagaMedis) {
            return response()->json(['message' => 'Tenaga medis tidak ditemukan'], 404);
        }

        return response()->json($tenagaMedis);
    }

    // Update data tenaga medis
    public function update(Request $request, $id)
    {
        $tenagaMedis = UserTenagaMedis::find($id);

        if (!$tenagaMedis) {
            return response()->json(['message' => 'Tenaga medis tidak ditemukan'], 404);
        }

        $validator = Validator::make($request->all(), [
            'namatenagamedis' => 'sometimes|required|string',
            'kotadomisili' => 'sometimes|required|string',
            'nomortelepon' => 'sometimes|required|digits_between:10,15',
            'katasandi' => 'sometimes|required|string|min:6',
            'tanggallahir' => 'sometimes|required|date',
            'alamatlengkap' => 'sometimes|required|string',
            'Puskesmas/RumahSakit' => 'sometimes|required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $tenagaMedis->update($request->all());

        return response()->json(['message' => 'Data tenaga medis berhasil diperbarui', 'data' => $tenagaMedis]);
    }

    // Hapus akun tenaga medis
    public function destroy($id)
    {
        $tenagaMedis = UserTenagaMedis::find($id);

        if (!$tenagaMedis) {
            return response()->json(['message' => 'Tenaga medis tidak ditemukan'], 404);
        }

        $tenagaMedis->delete();

        return response()->json(['message' => 'Tenaga medis berhasil dihapus']);
    }
}
