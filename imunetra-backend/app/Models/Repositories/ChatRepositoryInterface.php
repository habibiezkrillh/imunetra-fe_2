<?php

namespace App\Models\Repositories;

use App\Models\Chat;

interface ChatRepositoryInterface
{
    public function all();

    public function findById(string $id_chat);

    public function create(array $data): Chat;

    public function update(string $id_chat, array $data): bool;

    public function delete(string $id_chat): bool;
}
