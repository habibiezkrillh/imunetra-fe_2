<?php

namespace App\Models\Repositories;

use App\Models\HasilPasien;

interface HasilPasienRepositoryInterface
{
    public function all();

    public function findById(string $id_hasilpasien);

    public function create(array $data): HasilPasien;

    public function update(string $id_hasilpasien, array $data): bool;

    public function delete(string $id_hasilpasien): bool;
}
