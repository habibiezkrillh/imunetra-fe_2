<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\DataPasienRepositoryInterface;
use Mockery;

class DataPasienTest extends TestCase
{
    protected $mockDataPasienRepository;

    protected function setUp(): void
    {
        parent::setUp();

        // Buat mock dari interface-nya
        $this->mockDataPasienRepository = Mockery::mock(DataPasienRepositoryInterface::class);

        // Registrasi mock agar Laravel pakai ini
        $this->app->instance(DataPasienRepositoryInterface::class, $this->mockDataPasienRepository);
    }

    public function test_pasien_can_be_created()
    {
        $pasienData = [
            'id_pasien' => 'P001',
            'nama' => 'Budi Santoso',
            'alamat' => 'Jl. Mawar No. 12',
            'tanggal_lahir' => '1990-01-01',
            'jenis_kelamin' => 'Laki-laki',
            'nomor_hp' => '081234567890'
        ];

        $this->mockDataPasienRepository
            ->shouldReceive('create')
            ->once()
            ->with($pasienData)
            ->andReturn((object) $pasienData);

        $pasien = $this->mockDataPasienRepository->create($pasienData);

        $this->assertEquals('Budi Santoso', $pasien->nama);
        $this->assertEquals('081234567890', $pasien->nomor_hp);
    }

    public function test_pasien_can_be_read()
    {
        $pasienId = 'P001';
        $pasienData = (object) [
            'id_pasien' => $pasienId,
            'nama' => 'Budi Santoso',
            'alamat' => 'Jl. Mawar No. 12',
            'tanggal_lahir' => '1990-01-01',
            'jenis_kelamin' => 'Laki-laki',
            'nomor_hp' => '081234567890'
        ];

        $this->mockDataPasienRepository
            ->shouldReceive('findById')
            ->once()
            ->with($pasienId)
            ->andReturn($pasienData);

        $pasien = $this->mockDataPasienRepository->findById($pasienId);

        $this->assertEquals($pasienId, $pasien->id_pasien);
        $this->assertEquals('Budi Santoso', $pasien->nama);
    }

    public function test_pasien_can_be_updated()
    {
        $pasienId = 'P001';
        $updateData = [
            'alamat' => 'Jl. Melati No. 45',
            'nomor_hp' => '089912345678'
        ];

        $this->mockDataPasienRepository
            ->shouldReceive('update')
            ->once()
            ->with($pasienId, $updateData)
            ->andReturn(true);

        $result = $this->mockDataPasienRepository->update($pasienId, $updateData);

        $this->assertTrue($result);
    }

    public function test_pasien_can_be_deleted()
    {
        $pasienId = 'P001';

        $this->mockDataPasienRepository
            ->shouldReceive('delete')
            ->once()
            ->with($pasienId)
            ->andReturn(true);

        $result = $this->mockDataPasienRepository->delete($pasienId);

        $this->assertTrue($result);
    }
}
