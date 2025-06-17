<?php

namespace App\Models\Repositories;

use App\Models\RiwayatRelawan;

interface RiwayatRelawanRepositoryInterface
{
    public function all();

    public function findById(string $id_relawan, string $id_event);

    public function create(array $data): RiwayatRelawan;

    public function update(string $id_relawan, string $id_event, array $data): bool;

    public function delete(string $id_relawan, string $id_event): bool;
}
