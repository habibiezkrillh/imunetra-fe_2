<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\RiwayatRelawanRepositoryInterface;
use Mockery;

class RiwayatRelawanTest extends TestCase
{
    protected $mockRiwayatRelawanRepository;

    protected function setUp(): void
    {
        parent::setUp();

        $this->mockRiwayatRelawanRepository = Mockery::mock(RiwayatRelawanRepositoryInterface::class);
        $this->app->instance(RiwayatRelawanRepositoryInterface::class, $this->mockRiwayatRelawanRepository);
    }

    public function test_riwayat_relawan_can_be_created()
    {
        $data = [
            'id_relawan' => 'USR001',
            'id_event' => 'EVT001',
            'tanggal_bergabung' => '2025-06-03',
        ];

        $this->mockRiwayatRelawanRepository
            ->shouldReceive('create')
            ->once()
            ->with($data)
            ->andReturn((object) $data);

        $result = $this->mockRiwayatRelawanRepository->create($data);

        $this->assertEquals('USR001', $result->id_relawan);
    }

    public function test_riwayat_relawan_can_be_read()
    {
        $id_relawan = 'USR001';
        $id_event = 'EVT001';

        $riwayat = (object) [
            'id_relawan' => $id_relawan,
            'id_event' => $id_event,
            'tanggal_bergabung' => '2025-06-03',
        ];

        $this->mockRiwayatRelawanRepository
            ->shouldReceive('findById')
            ->once()
            ->with($id_relawan, $id_event)
            ->andReturn($riwayat);

        $result = $this->mockRiwayatRelawanRepository->findById($id_relawan, $id_event);

        $this->assertEquals($id_event, $result->id_event);
    }

    public function test_riwayat_relawan_can_be_updated()
    {
        $id_relawan = 'USR001';
        $id_event = 'EVT001';
        $updateData = [
            'tanggal_bergabung' => '2025-06-05',
        ];

        $this->mockRiwayatRelawanRepository
            ->shouldReceive('update')
            ->once()
            ->with($id_relawan, $id_event, $updateData)
            ->andReturn(true);

        $result = $this->mockRiwayatRelawanRepository->update($id_relawan, $id_event, $updateData);

        $this->assertTrue($result);
    }

    public function test_riwayat_relawan_can_be_deleted()
    {
        $id_relawan = 'USR001';
        $id_event = 'EVT001';

        $this->mockRiwayatRelawanRepository
            ->shouldReceive('delete')
            ->once()
            ->with($id_relawan, $id_event)
            ->andReturn(true);

        $result = $this->mockRiwayatRelawanRepository->delete($id_relawan, $id_event);

        $this->assertTrue($result);
    }
}
