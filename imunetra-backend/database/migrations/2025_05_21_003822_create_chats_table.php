<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('chats', function (Blueprint $table) {
            $table->id('id_chat');
            $table->unsignedBigInteger('id_relawan');
            $table->unsignedBigInteger('id_tenagamedis');
        });
    }

    public function down(): void {
        Schema::dropIfExists('chats');
    }
};
