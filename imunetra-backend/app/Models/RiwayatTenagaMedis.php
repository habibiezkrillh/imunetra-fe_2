<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiwayatTenagaMedis extends Model
{
    protected $table = 'Riwayat Tenaga Medis';
    public $timestamps = false;
    public $incrementing = false;

    protected $fillable = [
        'id_tenagamedis',
        'id_event',
        'waktubergabung',
        'Status',
    ];
}
