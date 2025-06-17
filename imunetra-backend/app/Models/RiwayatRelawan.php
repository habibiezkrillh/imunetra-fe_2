<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiwayatRelawan extends Model
{
    protected $table = 'Riwayat Relawan';
    public $timestamps = false;
    public $incrementing = false;

    protected $fillable = [
        'id_relawan',
        'id_event',
        'waktubergabung',
        'Status',
    ];
}
