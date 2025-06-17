<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePesanChatsTable extends Migration
{
    public function up(): void
    {
        Schema::create('pesan_chats', function (Blueprint $table) {
            $table->id('id_pesan');
            $table->unsignedBigInteger('id_chat');
            $table->boolean('pengirim_is_relawan');
            $table->dateTime('waktukirim');
            $table->boolean('dibaca');
            $table->dateTime('waktubaca')->nullable();
            $table->string('isipesan', 300);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('pesan_chats');
    }
}
