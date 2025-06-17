<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Models\Repositories\ChatRepositoryInterface;
use App\Models\Repositories\ChatRepository;
use App\Models\Repositories\DataPasienRepositoryInterface;
use App\Models\Repositories\DataPasienRepository;
use App\Models\Repositories\EventRepositoryInterface;
use App\Models\Repositories\EventRepository;
use App\Models\Repositories\HasilPasienRepositoryInterface;
use App\Models\Repositories\HasilPasienRepository;
use App\Models\Repositories\PesanChatRepositoryInterface;
use App\Models\Repositories\PesanChatRepository;
use App\Models\Repositories\RiwayatRelawanRepositoryInterface;
use App\Models\Repositories\RiwayatRelawanRepository;
use App\Models\Repositories\RiwayatTenagaMedisRepositoryInterface;
use App\Models\Repositories\RiwayatTenagaMedisRepository;
use App\Models\Repositories\UserRelawanRepositoryInterface;
use App\Models\Repositories\UserRelawanRepository;
use App\Models\Repositories\UserTenagaMedisRepositoryInterface;
use App\Models\Repositories\UserTenagaMedisRepository;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->bind(ChatRepositoryInterface::class, ChatRepository::class);
        $this->app->bind(DataPasienRepositoryInterface::class, DataPasienRepository::class);
        $this->app->bind(EventRepositoryInterface::class, EventRepository::class);
        $this->app->bind(HasilPasienRepositoryInterface::class, HasilPasienRepository::class);
        $this->app->bind(PesanChatRepositoryInterface::class, PesanChatRepository::class);
        $this->app->bind(RiwayatRelawanRepositoryInterface::class, RiwayatRelawanRepository::class);
        $this->app->bind(RiwayatTenagaMedisRepositoryInterface::class, RiwayatTenagaMedisRepository::class);
        $this->app->bind(UserRelawanRepositoryInterface::class, UserRelawanRepository::class);
        $this->app->bind(UserTenagaMedisRepositoryInterface::class, UserTenagaMedisRepository::class);

    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
