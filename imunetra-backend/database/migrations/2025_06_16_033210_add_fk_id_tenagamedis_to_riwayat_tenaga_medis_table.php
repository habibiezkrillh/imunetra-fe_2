<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::table('riwayat_tenaga_medis', function (Blueprint $table) {
            $table->foreign('id_tenagamedis')->references('id_tenagamedis')->on('user_tenaga_medis')->onDelete('cascade');
        });
    }

    public function down(): void {
        Schema::table('riwayat_tenaga_medis', function (Blueprint $table) {
            $table->dropForeign(['id_tenagamedis']);
        });
    }
};
