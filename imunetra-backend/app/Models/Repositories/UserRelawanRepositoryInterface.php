<?php

namespace App\Models\Repositories;

use App\Models\UserRelawan;

interface UserRelawanRepositoryInterface
{
    public function all();

    public function findById(string $id);

    public function create(array $data): UserRelawan;

    public function update($id, array $data): bool;

    public function delete($id): bool;
}
