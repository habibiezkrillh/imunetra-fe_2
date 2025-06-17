<?php

namespace App\Models\Repositories;

use App\Models\Event;

class EventRepository implements EventRepositoryInterface
{
    public function all()
    {
        return Event::all();
    }

    public function findById(string $id_event)
    {
        return Event::find($id_event);
    }

    public function create(array $data): Event
    {
        return Event::create($data);
    }

    public function update(string $id_event, array $data): bool
    {
        $event = Event::find($id_event);
        if (!$event) return false;

        return $event->update($data);
    }

    public function delete(string $id_event): bool
    {
        $event = Event::find($id_event);
        if (!$event) return false;

        return $event->delete();
    }
}
