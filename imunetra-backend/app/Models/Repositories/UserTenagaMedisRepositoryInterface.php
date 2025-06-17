<?php

namespace App\Models\Repositories;

use App\Models\UserTenagaMedis;

interface UserTenagaMedisRepositoryInterface
{
    public function all();

    public function findById(string $id);

    public function create(array $data): UserTenagaMedis;

    public function update($id, array $data): bool;

    public function delete($id): bool;
}
