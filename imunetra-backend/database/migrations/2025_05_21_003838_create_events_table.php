<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventsTable extends Migration
{
    public function up(): void
    {
        Schema::create('events', function (Blueprint $table) {
            $table->id('id_event');
            $table->string('namaevent');
            $table->dateTime('waktuevent');
            $table->string('lokasievent');
            $table->integer('kapasitasevent');
            $table->string('deskripsievent', 500);
            $table->enum('kotaberlangsung', ['Makassar', 'Surabaya', 'Jakarta']);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('events');
    }
}
