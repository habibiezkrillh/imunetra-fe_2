<?php

namespace App\Models\Repositories;

use App\Models\RiwayatTenagaMedis;

interface RiwayatTenagaMedisRepositoryInterface
{
    public function all();

    public function findById(string $id);

    public function create(array $data): RiwayatTenagaMedis;

    public function update($id, array $data): bool;

    public function delete($id): bool;
}
