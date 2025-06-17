<?php

namespace App\Models\Repositories;

use App\Models\PesanChat;

interface PesanChatRepositoryInterface
{
    public function all();

    public function findById(string $id_pesan);

    public function create(array $data): PesanChat;

    public function update(string $id_pesan, array $data): bool;

    public function delete(string $id_pesan): bool;
}
