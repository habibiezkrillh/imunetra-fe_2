<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\PesanChatRepositoryInterface;
use Mockery;

class PesanChatTest extends TestCase
{
    protected $mockPesanChatRepository;

    protected function setUp(): void
    {
        parent::setUp();

        $this->mockPesanChatRepository = Mockery::mock(PesanChatRepositoryInterface::class);
        $this->app->instance(PesanChatRepositoryInterface::class, $this->mockPesanChatRepository);
    }

    public function test_pesan_chat_can_be_created()
    {
        $pesanData = [
            'id_pesan' => 'CHT001',
            'id_pengirim' => 'USR001',
            'id_penerima' => 'USR002',
            'isi_pesan' => 'Halo, ada yang bisa saya bantu?',
            'waktu_kirim' => '2025-06-03 10:00:00',
        ];

        $this->mockPesanChatRepository
            ->shouldReceive('create')
            ->once()
            ->with($pesanData)
            ->andReturn((object) $pesanData);

        $pesan = $this->mockPesanChatRepository->create($pesanData);

        $this->assertEquals('Halo, ada yang bisa saya bantu?', $pesan->isi_pesan);
        $this->assertEquals('USR002', $pesan->id_penerima);
    }

    public function test_pesan_chat_can_be_read()
    {
        $pesanId = 'CHT001';
        $pesanData = (object) [
            'id_pesan' => $pesanId,
            'id_pengirim' => 'USR001',
            'id_penerima' => 'USR002',
            'isi_pesan' => 'Halo, ini pesan pertama',
            'waktu_kirim' => '2025-06-03 10:00:00',
        ];

        $this->mockPesanChatRepository
            ->shouldReceive('findById')
            ->once()
            ->with($pesanId)
            ->andReturn($pesanData);

        $pesan = $this->mockPesanChatRepository->findById($pesanId);

        $this->assertEquals($pesanId, $pesan->id_pesan);
        $this->assertEquals('Halo, ini pesan pertama', $pesan->isi_pesan);
    }

    public function test_pesan_chat_can_be_updated()
    {
        $pesanId = 'CHT001';
        $updateData = [
            'isi_pesan' => 'Pesan telah diperbarui.',
        ];

        $this->mockPesanChatRepository
            ->shouldReceive('update')
            ->once()
            ->with($pesanId, $updateData)
            ->andReturn(true);

        $result = $this->mockPesanChatRepository->update($pesanId, $updateData);

        $this->assertTrue($result);
    }

    public function test_pesan_chat_can_be_deleted()
    {
        $pesanId = 'CHT001';

        $this->mockPesanChatRepository
            ->shouldReceive('delete')
            ->once()
            ->with($pesanId)
            ->andReturn(true);

        $result = $this->mockPesanChatRepository->delete($pesanId);

        $this->assertTrue($result);
    }
}
