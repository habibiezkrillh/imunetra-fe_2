<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserRelawan extends Model
{
    protected $table = 'user_relawan'; 
    protected $primaryKey = 'id_relawan';
    public $timestamps = false;

    protected $fillable = [
        'namarelawan',
        'kotadomisili',
        'nomortelepon',
        'email',         
        'katasandi',
        'alamatlengkap',
    ];
}
