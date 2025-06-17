<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class HasilPasien extends Model
{
    protected $table = 'hasil_pasien';
    protected $primaryKey = 'id_hasilpasien';
    public $timestamps = false;

    protected $fillable = [
        'id_pasien',
        'suhupasiencelcius',
        'denyutjantung',
        'statusispneumonia',
    ];
}
