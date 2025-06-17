<?php

namespace App\Models\Repositories;

use App\Models\RiwayatRelawan;

class RiwayatRelawanRepository implements RiwayatRelawanRepositoryInterface
{
    public function all()
    {
        return RiwayatRelawan::all();
    }

    public function findById(string $id_relawan, string $id_event)
    {
        return RiwayatRelawan::where('id_relawan', $id_relawan)
                             ->where('id_event', $id_event)
                             ->first();
    }

    public function create(array $data): RiwayatRelawan
    {
        return RiwayatRelawan::create($data);
    }

    public function update(string $id_relawan, string $id_event, array $data): bool
    {
        $riwayat = $this->findById($id_relawan, $id_event);
        if (!$riwayat) return false;

        return $riwayat->update($data);
    }

    public function delete(string $id_relawan, string $id_event): bool
    {
        $riwayat = $this->findById($id_relawan, $id_event);
        if (!$riwayat) return false;

        return $riwayat->delete();
    }
}
