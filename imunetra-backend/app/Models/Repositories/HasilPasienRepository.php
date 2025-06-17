<?php

namespace App\Models\Repositories;

use App\Models\HasilPasien;

class HasilPasienRepository implements HasilPasienRepositoryInterface
{
    public function all()
    {
        return HasilPasien::all();
    }

    public function findById(string $id_hasilpasien)
    {
        return HasilPasien::find($id_hasilpasien);
    }

    public function create(array $data): HasilPasien
    {
        return HasilPasien::create($data);
    }

    public function update(string $id_hasilpasien, array $data): bool
    {
        $hasil = HasilPasien::find($id_hasilpasien);
        if (!$hasil) return false;

        return $hasil->update($data);
    }

    public function delete(string $id_hasilpasien): bool
    {
        $hasil = HasilPasien::find($id_hasilpasien);
        if (!$hasil) return false;

        return $hasil->delete();
    }
}
