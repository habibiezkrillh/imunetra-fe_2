<?php

namespace App\Models\Repositories;

use App\Models\Event;

interface EventRepositoryInterface
{
    public function all();

    public function findById(string $id_event);

    public function create(array $data): Event;

    public function update(string $id_event, array $data): bool;

    public function delete(string $id_event): bool;
}
