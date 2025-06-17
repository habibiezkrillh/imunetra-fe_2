<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\ChatRepositoryInterface;
use Mockery;

class ChatTest extends TestCase
{
    protected $mockChatRepository;

    protected function setUp(): void
    {
        parent::setUp();
        $this->mockChatRepository = Mockery::mock(ChatRepositoryInterface::class);
        $this->app->instance(ChatRepositoryInterface::class, $this->mockChatRepository);
    }

    public function test_chat_can_be_created()
    {
        $chatData = [
            'id_chat' => 'CHT123',
            'message' => 'Hello World',
            'sender' => 'User1',
            'receiver' => 'User2',
            'timestamp' => now()->toDateTimeString(),
        ];

        $this->mockChatRepository
            ->shouldReceive('create')
            ->once()
            ->with($chatData)
            ->andReturn((object) $chatData);

        $chat = $this->mockChatRepository->create($chatData);

        $this->assertEquals('Hello World', $chat->message);
        $this->assertEquals('User1', $chat->sender);
    }

    public function test_chat_can_be_read()
    {
        $chatId = 'CHT123';
        $chatData = (object)[
            'id_chat' => $chatId,
            'message' => 'Test Message',
            'sender' => 'User1',
            'receiver' => 'User2',
            'timestamp' => now()->toDateTimeString(),
        ];

        $this->mockChatRepository
            ->shouldReceive('findById')
            ->once()
            ->with($chatId)
            ->andReturn($chatData);

        $chat = $this->mockChatRepository->findById($chatId);

        $this->assertEquals($chatId, $chat->id_chat);
        $this->assertEquals('Test Message', $chat->message);
    }

    public function test_chat_can_be_updated()
    {
        $chatId = 'CHT123';
        $updateData = [
            'message' => 'Updated Message',
        ];

        $this->mockChatRepository
            ->shouldReceive('update')
            ->once()
            ->with($chatId, $updateData)
            ->andReturn(true);

        $result = $this->mockChatRepository->update($chatId, $updateData);

        $this->assertTrue($result);
    }

    public function test_chat_can_be_deleted()
    {
        $chatId = 'CHT123';

        $this->mockChatRepository
            ->shouldReceive('delete')
            ->once()
            ->with($chatId)
            ->andReturn(true);

        $result = $this->mockChatRepository->delete($chatId);

        $this->assertTrue($result);
    }
}
