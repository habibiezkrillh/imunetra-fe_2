<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PesanChat extends Model
{
    protected $table = 'Pesan Chat';
    protected $primaryKey = 'id_pesan';
    public $timestamps = false;

    protected $fillable = [
        'id_chat',
        'pengirimisrelawan',
        'waktukirim',
        'dibaca',
        'waktubaca',
        'isipesan',
    ];
}
