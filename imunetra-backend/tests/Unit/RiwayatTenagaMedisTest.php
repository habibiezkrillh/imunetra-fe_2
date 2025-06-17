<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\RiwayatTenagaMedisRepositoryInterface;
use Mockery;

class RiwayatTenagaMedisTest extends TestCase
{
    protected $mockRiwayatTenagaMedisRepository;

    protected function setUp(): void
    {
        parent::setUp();

        $this->mockRiwayatTenagaMedisRepository = Mockery::mock(RiwayatTenagaMedisRepositoryInterface::class);
        $this->app->instance(RiwayatTenagaMedisRepositoryInterface::class, $this->mockRiwayatTenagaMedisRepository);
    }

    public function test_riwayat_tenaga_medis_can_be_created()
    {
        $data = [
            'id_riwayat' => 'RTM001',
            'id_tenagamedis' => 'TM001',
            'tanggal_mulai' => '2024-01-01',
            'tanggal_selesai' => '2024-12-31',
            'posisi' => 'Dokter Umum',
            'tempat_kerja' => 'RSUD Makassar',
        ];

        $this->mockRiwayatTenagaMedisRepository
            ->shouldReceive('create')
            ->once()
            ->with($data)
            ->andReturn((object) $data);

        $riwayat = $this->mockRiwayatTenagaMedisRepository->create($data);

        $this->assertEquals('Dokter Umum', $riwayat->posisi);
        $this->assertEquals('RSUD Makassar', $riwayat->tempat_kerja);
    }

    public function test_riwayat_tenaga_medis_can_be_read()
    {
        $id = 'RTM001';
        $riwayatData = (object) [
            'id_riwayat' => $id,
            'id_tenagamedis' => 'TM001',
            'tanggal_mulai' => '2024-01-01',
            'tanggal_selesai' => '2024-12-31',
            'posisi' => 'Dokter Umum',
            'tempat_kerja' => 'RSUD Makassar',
        ];

        $this->mockRiwayatTenagaMedisRepository
            ->shouldReceive('findById')
            ->once()
            ->with($id)
            ->andReturn($riwayatData);

        $riwayat = $this->mockRiwayatTenagaMedisRepository->findById($id);

        $this->assertEquals($id, $riwayat->id_riwayat);
        $this->assertEquals('Dokter Umum', $riwayat->posisi);
    }

    public function test_riwayat_tenaga_medis_can_be_updated()
    {
        $id = 'RTM001';
        $updateData = [
            'posisi' => 'Dokter Spesialis',
            'tempat_kerja' => 'RS Siloam',
        ];

        $this->mockRiwayatTenagaMedisRepository
            ->shouldReceive('update')
            ->once()
            ->with($id, $updateData)
            ->andReturn(true);

        $result = $this->mockRiwayatTenagaMedisRepository->update($id, $updateData);

        $this->assertTrue($result);
    }

    public function test_riwayat_tenaga_medis_can_be_deleted()
    {
        $id = 'RTM001';

        $this->mockRiwayatTenagaMedisRepository
            ->shouldReceive('delete')
            ->once()
            ->with($id)
            ->andReturn(true);

        $result = $this->mockRiwayatTenagaMedisRepository->delete($id);

        $this->assertTrue($result);
    }
}
