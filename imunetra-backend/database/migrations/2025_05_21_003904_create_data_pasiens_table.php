<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('data_pasiens', function (Blueprint $table) {
            $table->id('id_pasien');
            $table->string('namapasien');
            $table->string('nik');
            $table->string('alamatlengkap');
            $table->date('tanggallahir');
            $table->enum('jeniskelamin', ['pria', 'wanita']);
            $table->string('kategori');
        });
    }

    public function down(): void {
        Schema::dropIfExists('data_pasiens');
    }
};
