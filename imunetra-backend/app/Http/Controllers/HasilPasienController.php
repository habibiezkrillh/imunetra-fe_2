<?php

namespace App\Http\Controllers;

use App\Models\HasilPasien;
use App\Models\DataPasien;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class HasilPasienController extends Controller
{
    // Menampilkan semua hasil pasien
    public function index()
    {
        $hasil = HasilPasien::with('pasien')->get();
        return response()->json($hasil);
    }
 
    // Menyimpan hasil baru
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id_pasien'            => 'required|exists:data_pasiens,id_pasien',
            'suhupasiencelcius'    => 'required|numeric',
            'denyutjantung'        => 'required|integer',
            'statusispneumonia'    => 'required|boolean'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $hasil = HasilPasien::create($request->all());
        return response()->json(['message' => 'Hasil pasien berhasil disimpan', 'data' => $hasil], 201);
    }

    // Menampilkan hasil berdasarkan ID
    public function show($id)
    {
        $hasil = HasilPasien::with('pasien')->find($id);
        if (!$hasil) {
            return response()->json(['message' => 'Hasil tidak ditemukan'], 404);
        }
        return response()->json($hasil);
    }

    // Update hasil pasien
    public function update(Request $request, $id)
    {
        $hasil = HasilPasien::find($id);
        if (!$hasil) {
            return response()->json(['message' => 'Hasil tidak ditemukan'], 404);
        }

        $validator = Validator::make($request->all(), [
            'suhupasiencelcius'    => 'numeric',
            'denyutjantung'        => 'integer',
            'statusispneumonia'    => 'boolean'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $hasil->update($request->all());
        return response()->json(['message' => 'Hasil pasien berhasil diperbarui', 'data' => $hasil]);
    }

    // Hapus hasil pasien
    public function destroy($id)
    {
        $hasil = HasilPasien::find($id);
        if (!$hasil) {
            return response()->json(['message' => 'Hasil tidak ditemukan'], 404);
        }

        $hasil->delete();
        return response()->json(['message' => 'Hasil pasien berhasil dihapus']);
    }
}
