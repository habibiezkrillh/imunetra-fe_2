<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\EventRepositoryInterface;
use Mockery;

class EventTest extends TestCase
{
    protected $mockEventRepository;

    protected function setUp(): void
    {
        parent::setUp();

        $this->mockEventRepository = Mockery::mock(EventRepositoryInterface::class);
        $this->app->instance(EventRepositoryInterface::class, $this->mockEventRepository);
    }

    public function test_event_can_be_created()
    {
        $eventData = [
            'id_event' => 'EVT001',
            'nama_event' => 'Workshop AI',
            'deskripsi' => 'Pelatihan AI dasar untuk pemula',
            'lokasi' => 'Universitas Ciputra',
            'tanggal' => '2025-07-10',
            'penyelenggara' => 'Fakultas Informatika'
        ];

        $this->mockEventRepository
            ->shouldReceive('create')
            ->once()
            ->with($eventData)
            ->andReturn((object) $eventData);

        $event = $this->mockEventRepository->create($eventData);

        $this->assertEquals('Workshop AI', $event->nama_event);
        $this->assertEquals('Universitas Ciputra', $event->lokasi);
    }

    public function test_event_can_be_read()
    {
        $eventId = 'EVT001';
        $eventData = (object) [
            'id_event' => $eventId,
            'nama_event' => 'Workshop AI',
            'deskripsi' => 'Pelatihan AI dasar untuk pemula',
            'lokasi' => 'Universitas Ciputra',
            'tanggal' => '2025-07-10',
            'penyelenggara' => 'Fakultas Informatika'
        ];

        $this->mockEventRepository
            ->shouldReceive('findById')
            ->once()
            ->with($eventId)
            ->andReturn($eventData);

        $event = $this->mockEventRepository->findById($eventId);

        $this->assertEquals($eventId, $event->id_event);
        $this->assertEquals('Workshop AI', $event->nama_event);
    }

    public function test_event_can_be_updated()
    {
        $eventId = 'EVT001';
        $updateData = [
            'lokasi' => 'Gedung A',
            'penyelenggara' => 'Inkubator Bisnis'
        ];

        $this->mockEventRepository
            ->shouldReceive('update')
            ->once()
            ->with($eventId, $updateData)
            ->andReturn(true);

        $result = $this->mockEventRepository->update($eventId, $updateData);

        $this->assertTrue($result);
    }

    public function test_event_can_be_deleted()
    {
        $eventId = 'EVT001';

        $this->mockEventRepository
            ->shouldReceive('delete')
            ->once()
            ->with($eventId)
            ->andReturn(true);

        $result = $this->mockEventRepository->delete($eventId);

        $this->assertTrue($result);
    }
}
