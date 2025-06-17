<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('riwayat_tenaga_medis', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_tenagamedis');
            $table->unsignedBigInteger('id_event');
            $table->timestamp('waktubergabung')->nullable();
            $table->string('status');
        });
    }

    public function down(): void {
        Schema::dropIfExists('riwayat_tenaga_medis');
    }
};
