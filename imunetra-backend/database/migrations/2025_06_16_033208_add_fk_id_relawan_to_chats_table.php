<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::table('chats', function (Blueprint $table) {
            $table->foreign('id_relawan')->references('id_relawan')->on('user_relawan')->onDelete('cascade');
        });
    }

    public function down(): void {
        Schema::table('chats', function (Blueprint $table) {
            $table->dropForeign(['id_relawan']);
        });
    }
};
