<?php

namespace App\Models\Repositories;

use App\Models\Chat;

class ChatRepository implements ChatRepositoryInterface
{
    public function all()
    {
        return Chat::all();
    }

    public function findById(string $id_chat)
    {
        return Chat::find($id_chat);
    }

    public function create(array $data): Chat
    {
        return Chat::create($data);
    }

    public function update(string $id_chat, array $data): bool
    {
        $chat = Chat::find($id_chat);
        if (!$chat) return false;

        return $chat->update($data);
    }

    public function delete(string $id_chat): bool
    {
        $chat = Chat::find($id_chat);
        if (!$chat) return false;

        return $chat->delete();
    }
}
