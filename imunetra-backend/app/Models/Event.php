<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    protected $table = 'Event';
    protected $primaryKey = 'id_event';
    public $timestamps = false;

    protected $fillable = [
        'namaevent',
        'waktuevent',
        'lokasievent',
        'kapasitasevent',
        'deskripsievent',
        'kotaberlangsung',
    ];
}
