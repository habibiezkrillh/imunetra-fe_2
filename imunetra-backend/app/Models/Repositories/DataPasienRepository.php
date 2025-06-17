<?php

namespace App\Models\Repositories;

use App\Models\DataPasien;

class DataPasienRepository implements DataPasienRepositoryInterface
{
    public function all()
    {
        return DataPasien::all();
    }

    public function findById(string $id_pasien)
    {
        return DataPasien::find($id_pasien);
    }

    public function create(array $data): DataPasien
    {
        return DataPasien::create($data);
    }

    public function update(string $id_pasien, array $data): bool
    {
        $pasien = DataPasien::find($id_pasien);
        if (!$pasien) return false;

        return $pasien->update($data);
    }

    public function delete(string $id_pasien): bool
    {
        $pasien = DataPasien::find($id_pasien);
        if (!$pasien) return false;

        return $pasien->delete();
    }
}
