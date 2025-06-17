<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\HasilPasienRepositoryInterface;
use Mockery;

class HasilPasienTest extends TestCase
{
    protected $mockHasilPasienRepository;

    protected function setUp(): void
    {
        parent::setUp();

        $this->mockHasilPasienRepository = Mockery::mock(HasilPasienRepositoryInterface::class);
        $this->app->instance(HasilPasienRepositoryInterface::class, $this->mockHasilPasienRepository);
    }

    public function test_hasil_pasien_can_be_created()
    {
        $hasilData = [
            'id_hasilpasien' => 'HSP001',
            'id_pasien' => 'PS001',
            'hasil_diagnosa' => 'Negatif',
            'catatan_dokter' => 'Pasien sehat',
            'tanggal_pemeriksaan' => '2025-06-03',
        ];

        $this->mockHasilPasienRepository
            ->shouldReceive('create')
            ->once()
            ->with($hasilData)
            ->andReturn((object) $hasilData);

        $hasil = $this->mockHasilPasienRepository->create($hasilData);

        $this->assertEquals('Negatif', $hasil->hasil_diagnosa);
        $this->assertEquals('Pasien sehat', $hasil->catatan_dokter);
    }

    public function test_hasil_pasien_can_be_read()
    {
        $hasilId = 'HSP001';
        $hasilData = (object) [
            'id_hasilpasien' => $hasilId,
            'id_pasien' => 'PS001',
            'hasil_diagnosa' => 'Negatif',
            'catatan_dokter' => 'Pasien sehat',
            'tanggal_pemeriksaan' => '2025-06-03',
        ];

        $this->mockHasilPasienRepository
            ->shouldReceive('findById')
            ->once()
            ->with($hasilId)
            ->andReturn($hasilData);

        $hasil = $this->mockHasilPasienRepository->findById($hasilId);

        $this->assertEquals($hasilId, $hasil->id_hasilpasien);
        $this->assertEquals('Negatif', $hasil->hasil_diagnosa);
    }

    public function test_hasil_pasien_can_be_updated()
    {
        $hasilId = 'HSP001';
        $updateData = [
            'hasil_diagnosa' => 'Positif',
            'catatan_dokter' => 'Segera periksa lanjutan',
        ];

        $this->mockHasilPasienRepository
            ->shouldReceive('update')
            ->once()
            ->with($hasilId, $updateData)
            ->andReturn(true);

        $result = $this->mockHasilPasienRepository->update($hasilId, $updateData);

        $this->assertTrue($result);
    }

    public function test_hasil_pasien_can_be_deleted()
    {
        $hasilId = 'HSP001';

        $this->mockHasilPasienRepository
            ->shouldReceive('delete')
            ->once()
            ->with($hasilId)
            ->andReturn(true);

        $result = $this->mockHasilPasienRepository->delete($hasilId);

        $this->assertTrue($result);
    }
}
