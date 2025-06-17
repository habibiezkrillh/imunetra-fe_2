<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('riwayat_relawan', function (Blueprint $table) {
            $table->unsignedBigInteger('id_relawan');
            $table->unsignedBigInteger('id_event');
            $table->dateTime('waktubergabung');
            $table->string('Status');

            $table->primary(['id_relawan', 'id_event']);
        });
    }

    public function down(): void {
        Schema::dropIfExists('riwayat_relawan');
    }
};
