<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration

{
    public function up(): void
    {
        Schema::create('hasil_pasien', function (Blueprint $table) {
            $table->id('id_hasilpasien');
            $table->unsignedBigInteger('id_pasien');
            $table->float('suhupasiencelcius');
            $table->integer('denyutjantung');
            $table->boolean('statusispneumonia');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('hasil_pasien');
    }
};
