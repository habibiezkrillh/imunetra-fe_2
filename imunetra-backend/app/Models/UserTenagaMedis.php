<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserTenagaMedis extends Model
{
    protected $table = 'user_tenaga_medis';

protected $fillable = [
    'namatenagamedis',
    'kotadomisili',
    'nomortelepon',
    'email', 
    'katasandi',
    'tanggallahir',
    'alamatlengkap',
    'puskesmas_rumahsakit', 
];

}
