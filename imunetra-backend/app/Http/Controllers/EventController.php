<?php

namespace App\Http\Controllers;

use App\Models\Event;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class EventController extends Controller
{
    // Menampilkan semua event
    public function index()
    {
        $events = Event::all();
        return response()->json($events);
    }

    // Menyimpan event baru
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'namaevent'        => 'required|string|max:255',
            'waktuevent'       => 'required|date',
            'lokasievent'      => 'required|string|max:255',
            'kapasitasevent'   => 'required|integer|min:1',
            'deskripsievent'   => 'required|string|max:500',
            'kotaberlangsung'  => 'required|in:Makassar,Surabaya,Jakarta',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $event = Event::create($request->all());
        return response()->json(['message' => 'Event berhasil dibuat', 'data' => $event], 201);
    }

    // Menampilkan detail event berdasarkan ID
    public function show($id)
    {
        $event = Event::find($id);
        if (!$event) {
            return response()->json(['message' => 'Event tidak ditemukan'], 404);
        }
        return response()->json($event);
    }

    // Memperbarui event
    public function update(Request $request, $id)
    {
        $event = Event::find($id);
        if (!$event) {
            return response()->json(['message' => 'Event tidak ditemukan'], 404);
        }

        $validator = Validator::make($request->all(), [
            'namaevent'        => 'string|max:255',
            'waktuevent'       => 'date',
            'lokasievent'      => 'string|max:255',
            'kapasitasevent'   => 'integer|min:1',
            'deskripsievent'   => 'string|max:500',
            'kotaberlangsung'  => 'in:Makassar,Surabaya,Jakarta',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $event->update($request->all());
        return response()->json(['message' => 'Event berhasil diperbarui', 'data' => $event]);
    }

    // Menghapus event
    public function destroy($id)
    {
        $event = Event::find($id);
        if (!$event) {
            return response()->json(['message' => 'Event tidak ditemukan'], 404);
        }

        $event->delete();
        return response()->json(['message' => 'Event berhasil dihapus']);
    }

    // Filter event berdasarkan query
    public function filter(Request $request)
    {
        $query = Event::query();

        if ($request->has('kapasitas_min')) {
            $query->where('kapasitasevent', '>=', $request->kapasitas_min);
        }

        if ($request->has('kapasitas_max')) {
            $query->where('kapasitasevent', '<=', $request->kapasitas_max);
        }

        if ($request->has('waktu_dari')) {
            $query->where('waktuevent', '>=', $request->waktu_dari);
        }

        if ($request->has('waktu_sampai')) {
            $query->where('waktuevent', '<=', $request->waktu_sampai);
        }

        if ($request->has('lokasi')) {
            $query->where('lokasievent', 'like', '%' . $request->lokasi . '%');
        }

        if ($request->has('kota')) {
            $query->where('kotaberlangsung', $request->kota);
        }

        $results = $query->get();
        return response()->json($results);
    }
}
