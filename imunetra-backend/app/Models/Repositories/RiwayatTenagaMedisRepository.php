<?php

namespace App\Models\Repositories;

use App\Models\RiwayatTenagaMedis;

class RiwayatTenagaMedisRepository implements RiwayatTenagaMedisRepositoryInterface
{
    public function all()
    {
        return RiwayatTenagaMedis::all();
    }

    public function findById(string $id)
    {
        return RiwayatTenagaMedis::find($id);
    }

    public function create(array $data): RiwayatTenagaMedis
    {
        return RiwayatTenagaMedis::create($data);
    }

    public function update($id, array $data): bool
    {
        $riwayat = RiwayatTenagaMedis::find($id);
        if (!$riwayat) return false;
        return $riwayat->update($data);
    }

    public function delete($id): bool
    {
        $riwayat = RiwayatTenagaMedis::find($id);
        if (!$riwayat) return false;
        return $riwayat->delete();
    }
}
