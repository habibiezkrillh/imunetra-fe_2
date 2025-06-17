<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\UserRelawan;
use App\Models\Repositories\UserRelawanRepositoryInterface;
use Mockery;

class UserRelawanTest extends TestCase
{
    protected $mockUserRelawanRepository;

    protected function setUp(): void
    {
        parent::setUp();

        $this->mockUserRelawanRepository = Mockery::mock(UserRelawanRepositoryInterface::class);
        $this->app->instance(UserRelawanRepositoryInterface::class, $this->mockUserRelawanRepository);
    }

    public function test_user_relawan_can_be_created()
    {
        $data = [
            'namarelawan'    => 'Andi',
            'kotadomisili'   => 'Makassar',
            'nomortelepon'   => '08123456789',
            'email'          => 'andi@example.com',
            'katasandi'      => 'password123',
            'alamatlengkap'  => 'Jl. AP Pettarani',
            'KTP'            => '1234567890',
        ];

        $expected = new UserRelawan($data);
        $expected->id_relawan = 1;

        $this->mockUserRelawanRepository
            ->shouldReceive('create')
            ->once()
            ->with($data)
            ->andReturn($expected);

        $relawan = $this->mockUserRelawanRepository->create($data);

        $this->assertEquals('Andi', $relawan->namarelawan);
        $this->assertEquals('andi@example.com', $relawan->email);
    }

    public function test_user_relawan_can_be_read()
    {
        $id = 1;
        $relawanData = new UserRelawan([
            'namarelawan'    => 'Andi',
            'kotadomisili'   => 'Makassar',
            'nomortelepon'   => '08123456789',
            'email'          => 'andi@example.com',
            'katasandi'      => 'password123',
            'alamatlengkap'  => 'Jl. AP Pettarani',
            'KTP'            => '1234567890',
        ]);
        $relawanData->id_relawan = $id;

        $this->mockUserRelawanRepository
            ->shouldReceive('findById')
            ->once()
            ->with($id)
            ->andReturn($relawanData);

        $relawan = $this->mockUserRelawanRepository->findById($id);

        $this->assertEquals($id, $relawan->id_relawan);
        $this->assertEquals('Andi', $relawan->namarelawan);
    }

    public function test_user_relawan_can_be_updated()
    {
        $id = 1;
        $updateData = [
            'alamatlengkap' => 'Gowa',
            'nomortelepon' => '0899999999',
        ];

        $this->mockUserRelawanRepository
            ->shouldReceive('update')
            ->once()
            ->with($id, $updateData)
            ->andReturn(true);

        $result = $this->mockUserRelawanRepository->update($id, $updateData);

        $this->assertTrue($result);
    }

    public function test_user_relawan_can_be_deleted()
    {
        $id = 1;

        $this->mockUserRelawanRepository
            ->shouldReceive('delete')
            ->once()
            ->with($id)
            ->andReturn(true);

        $result = $this->mockUserRelawanRepository->delete($id);

        $this->assertTrue($result);
    }

    protected function tearDown(): void
    {
        Mockery::close();
        parent::tearDown();
    }
}
