<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\UserTenagaMedisRepositoryInterface;
use Mockery;

class UserTenagaMedisTest extends TestCase
{
    protected $mockUserTenagaMedisRepository;

    protected function setUp(): void
    {
        parent::setUp();

        $this->mockUserTenagaMedisRepository = Mockery::mock(UserTenagaMedisRepositoryInterface::class);
        $this->app->instance(UserTenagaMedisRepositoryInterface::class, $this->mockUserTenagaMedisRepository);
    }

    public function test_user_tenaga_medis_can_be_created()
    {
        $data = [
            'id_user_tenaga_medis' => 'UTM001',
            'nama' => 'Dr. Andi',
            'spesialisasi' => 'Pediatri',
            'email' => 'andi@example.com',
            'no_hp' => '08123456789',
        ];

        $this->mockUserTenagaMedisRepository
            ->shouldReceive('create')
            ->once()
            ->with($data)
            ->andReturn((object) $data);

        $tenagaMedis = $this->mockUserTenagaMedisRepository->create($data);

        $this->assertEquals('Dr. Andi', $tenagaMedis->nama);
        $this->assertEquals('Pediatri', $tenagaMedis->spesialisasi);
    }

    public function test_user_tenaga_medis_can_be_read()
    {
        $id = 'UTM001';
        $tenagaMedisData = (object) [
            'id_user_tenaga_medis' => $id,
            'nama' => 'Dr. Andi',
            'spesialisasi' => 'Pediatri',
            'email' => 'andi@example.com',
            'no_hp' => '08123456789',
        ];

        $this->mockUserTenagaMedisRepository
            ->shouldReceive('findById')
            ->once()
            ->with($id)
            ->andReturn($tenagaMedisData);

        $tenagaMedis = $this->mockUserTenagaMedisRepository->findById($id);

        $this->assertEquals($id, $tenagaMedis->id_user_tenaga_medis);
        $this->assertEquals('Dr. Andi', $tenagaMedis->nama);
    }

    public function test_user_tenaga_medis_can_be_updated()
    {
        $id = 'UTM001';
        $updateData = [
            'spesialisasi' => 'Bedah',
            'no_hp' => '08129876543',
        ];

        $this->mockUserTenagaMedisRepository
            ->shouldReceive('update')
            ->once()
            ->with($id, $updateData)
            ->andReturn(true);

        $result = $this->mockUserTenagaMedisRepository->update($id, $updateData);

        $this->assertTrue($result);
    }

    public function test_user_tenaga_medis_can_be_deleted()
    {
        $id = 'UTM001';

        $this->mockUserTenagaMedisRepository
            ->shouldReceive('delete')
            ->once()
            ->with($id)
            ->andReturn(true);

        $result = $this->mockUserTenagaMedisRepository->delete($id);

        $this->assertTrue($result);
    }
}
