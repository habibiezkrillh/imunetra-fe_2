<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DataPasien extends Model
{
    protected $table = 'data_pasiens'; 
    protected $primaryKey = 'id_pasien';
    public $timestamps = false;

    protected $fillable = [
        'namapasien',
        'nik',
        'alamatlengkap',
        'tanggallahir',
        'jeniskelamin',
        'kategori',
    ];
}
