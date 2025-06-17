<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::table('hasil_pasien', function (Blueprint $table) {
            $table->foreign('id_pasien')->references('id_pasien')->on('data_pasiens')->onDelete('cascade');
        });
    }

    public function down(): void {
        Schema::table('hasil_pasien', function (Blueprint $table) {
            $table->dropForeign(['id_pasien']);
        });
    }
};
