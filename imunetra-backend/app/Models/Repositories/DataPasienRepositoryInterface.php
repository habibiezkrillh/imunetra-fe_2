<?php

namespace App\Models\Repositories;

use App\Models\DataPasien;

interface DataPasienRepositoryInterface
{
    public function all();

    public function findById(string $id_pasien);

    public function create(array $data): DataPasien;

    public function update(string $id_pasien, array $data): bool;

    public function delete(string $id_pasien): bool;
}
