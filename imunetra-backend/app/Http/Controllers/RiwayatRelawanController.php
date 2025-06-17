<?php

namespace App\Http\Controllers;

use App\Models\RiwayatRelawan;
use App\Models\Event;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

class RiwayatRelawanController extends Controller
{
    public function index()
    {
        $riwayat = RiwayatRelawan::with(['relawan', 'event'])->get();
        $riwayat = $this->generateStatus($riwayat);
        return response()->json($riwayat);
    }

    public function riwayatByRelawan($id_relawan, Request $request)
    {
        $query = RiwayatRelawan::with('event')->where('id_relawan', $id_relawan);
        $riwayat = $this->generateStatus($query->get());

        if ($request->has('status')) {
            $filtered = $riwayat->filter(function ($item) use ($request) {
                return $item->status_dinamis === $request->status;
            })->values();

            return response()->json($filtered);
        }

        return response()->json($riwayat);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id_relawan'     => 'required|exists:user_relawans,id_relawan',
            'id_event'       => 'required|exists:events,id_event',
            'waktubergabung' => 'required|date',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $exists = RiwayatRelawan::where('id_relawan', $request->id_relawan)
                    ->where('id_event', $request->id_event)
                    ->exists();

        if ($exists) {
            return response()->json(['message' => 'Relawan sudah terdaftar di event ini'], 409);
        }

        // Status tidak dikirim dari client, akan dihitung otomatis
        $data = $request->only(['id_relawan', 'id_event', 'waktubergabung']);
        $data['Status'] = 'akan datang'; // default awal, walau nanti akan dihitung ulang saat tampil

        $riwayat = RiwayatRelawan::create($data);
        return response()->json(['message' => 'Riwayat relawan berhasil ditambahkan', 'data' => $riwayat], 201);
    }

    public function show($id_relawan, $id_event)
    {
        $riwayat = RiwayatRelawan::with(['relawan', 'event'])
                    ->where('id_relawan', $id_relawan)
                    ->where('id_event', $id_event)
                    ->first();

        if (!$riwayat) {
            return response()->json(['message' => 'Riwayat tidak ditemukan'], 404);
        }

        $riwayat->status_dinamis = $this->getStatusByWaktu($riwayat->event->waktuevent);
        return response()->json($riwayat);
    }

    // ========================
    // Logika penentuan status
    // ========================
    private function generateStatus($riwayats)
    {
        foreach ($riwayats as $riwayat) {
            $riwayat->status_dinamis = $this->getStatusByWaktu($riwayat->event->waktuevent);
        }
        return $riwayats;
    }

    private function getStatusByWaktu($eventTime)
    {
        $now = Carbon::now();
        $eventStart = Carbon::parse($eventTime);
        $eventEnd = $eventStart->copy()->addHours(2); // Asumsi durasi event 2 jam

        if ($now->lt($eventStart)) {
            return 'akan datang';
        } elseif ($now->between($eventStart, $eventEnd)) {
            return 'sedang berlangsung';
        } else {
            return 'sudah berlalu';
        }
    }
}
