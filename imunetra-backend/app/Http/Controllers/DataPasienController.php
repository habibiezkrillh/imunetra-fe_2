<?php

namespace App\Http\Controllers;

use App\Models\DataPasien;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class DataPasienController extends Controller
{
    // Menampilkan semua data pasien
    public function index()
    {
        $data = DataPasien::all();
        return response()->json($data);
    }

    // Menyimpan data pasien baru
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'namapasien'     => 'required|string|max:255',
            'nik'            => 'required|string|max:20|unique:data_pasiens,nik',
            'alamatlengkap'  => 'required|string',
            'tanggallahir'   => 'required|date',
            'jeniskelamin'   => 'required|in:pria,wanita',
            'kategori'       => 'required|string|max:100'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $pasien = DataPasien::create($request->all());
        return response()->json(['message' => 'Data pasien berhasil disimpan', 'data' => $pasien], 201);
    }

    // Menampilkan satu data pasien
    public function show($id)
    {
        $pasien = DataPasien::find($id);
        if (!$pasien) {
            return response()->json(['message' => 'Data pasien tidak ditemukan'], 404);
        }
        return response()->json($pasien);
    }

    // Memperbarui data pasien
    public function update(Request $request, $id)
    {
        $pasien = DataPasien::find($id);
        if (!$pasien) {
            return response()->json(['message' => 'Data pasien tidak ditemukan'], 404);
        }

        $validator = Validator::make($request->all(), [
            'namapasien'     => 'string|max:255',
            'nik'            => 'string|max:20|unique:data_pasiens,nik,' . $id . ',id_pasien',
            'alamatlengkap'  => 'string',
            'tanggallahir'   => 'date',
            'jeniskelamin'   => 'in:pria,wanita',
            'kategori'       => 'string|max:100'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $pasien->update($request->all());
        return response()->json(['message' => 'Data pasien berhasil diperbarui', 'data' => $pasien]);
    }

    // Menghapus data pasien
    public function destroy($id)
    {
        $pasien = DataPasien::find($id);
        if (!$pasien) {
            return response()->json(['message' => 'Data pasien tidak ditemukan'], 404);
        }

        $pasien->delete();
        return response()->json(['message' => 'Data pasien berhasil dihapus']);
    }
}
