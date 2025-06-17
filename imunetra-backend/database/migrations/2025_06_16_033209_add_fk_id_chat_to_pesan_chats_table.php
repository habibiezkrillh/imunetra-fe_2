<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::table('pesan_chats', function (Blueprint $table) {
            $table->foreign('id_chat')->references('id_chat')->on('chats')->onDelete('cascade');
        });
    }

    public function down(): void {
        Schema::table('pesan_chats', function (Blueprint $table) {
            $table->dropForeign(['id_chat']);
        });
    }
};
