<?php

namespace App\Models\Repositories;

use App\Models\PesanChat;

class PesanChatRepository implements PesanChatRepositoryInterface
{
    public function all()
    {
        return PesanChat::all();
    }

    public function findById(string $id_pesan)
    {
        return PesanChat::find($id_pesan);
    }

    public function create(array $data): PesanChat
    {
        return PesanChat::create($data);
    }

    public function update(string $id_pesan, array $data): bool
    {
        $pesan = PesanChat::find($id_pesan);
        if (!$pesan) return false;

        return $pesan->update($data);
    }

    public function delete(string $id_pesan): bool
    {
        $pesan = PesanChat::find($id_pesan);
        if (!$pesan) return false;

        return $pesan->delete();
    }
}
