<?php

namespace App\Models\Repositories;

use App\Models\UserRelawan;

class UserRelawanRepository implements UserRelawanRepositoryInterface
{
    public function all()   
    {
        return UserRelawan::all();
    }

    public function findById(string $id)
    {
        return UserRelawan::find($id);
    }

    public function create(array $data): UserRelawan
    {
        return UserRelawan::create($data);
    }

    public function update($id, array $data): bool
    {
        $relawan = UserRelawan::find($id);
        if (!$relawan) return false;
        return $relawan->update($data);
    }

    public function delete($id): bool
    {
        $relawan = UserRelawan::find($id);
        if (!$relawan) return false;
        return $relawan->delete();
    }
}
