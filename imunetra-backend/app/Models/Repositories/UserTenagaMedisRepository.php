<?php

namespace App\Models\Repositories;

use App\Models\UserTenagaMedis;

class UserTenagaMedisRepository implements UserTenagaMedisRepositoryInterface
{
    public function all()
    {
        return UserTenagaMedis::all();
    }

    public function findById(string $id)
    {
        return UserTenagaMedis::find($id);
    }

    public function create(array $data): UserTenagaMedis
    {
        return UserTenagaMedis::create($data);
    }

    public function update($id, array $data): bool
    {
        $tenagaMedis = UserTenagaMedis::find($id);
        if (!$tenagaMedis) return false;
        return $tenagaMedis->update($data);
    }

    public function delete($id): bool
    {
        $tenagaMedis = UserTenagaMedis::find($id);
        if (!$tenagaMedis) return false;
        return $tenagaMedis->delete();
    }
}
