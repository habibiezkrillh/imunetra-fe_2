<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('user_relawan', function (Blueprint $table) {
            $table->id('id_relawan');
            $table->string('namarelawan');
            $table->string('kotadomisili');
            $table->string('nomortelepon');
            $table->string('email');
            $table->string('katasandi');
            $table->string('alamatlengkap');
        });
    }

    public function down(): void {
        Schema::dropIfExists('user_relawan');
    }
};