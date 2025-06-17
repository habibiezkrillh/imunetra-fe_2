<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserRelawanController;
use App\Http\Controllers\UserTenagaMedisController;
use App\Http\Controllers\DataPasienController;
use App\Http\Controllers\HasilPasienController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\RiwayatRelawanController;

// =======================
// === AUTH SECTION =====
// =======================

// Register
Route::post('/register/relawan', [AuthController::class, 'registerRelawan']);
Route::post('/register/tenaga-medis', [AuthController::class, 'registerTenagaMedis']);

// Login
Route::post('/login/relawan', [AuthController::class, 'loginRelawan']);
Route::post('/login/tenaga-medis', [AuthController::class, 'loginTenagaMedis']);

// ================================
// === RELAWAN (CRUD sederhana) ===
// ================================
Route::get('/relawan', [UserRelawanController::class, 'index']);           // list all
Route::get('/relawan/{id}', [UserRelawanController::class, 'show']);       // show one
Route::put('/relawan/{id}', [UserRelawanController::class, 'update']);     // update
Route::delete('/relawan/{id}', [UserRelawanController::class, 'destroy']); // delete

// =======================================
// === TENAGA MEDIS ======================
// =======================================
Route::get('/tenaga-medis', [UserTenagaMedisController::class, 'index']);           // list all
Route::get('/tenaga-medis/{id}', [UserTenagaMedisController::class, 'show']);       // show one
Route::put('/tenaga-medis/{id}', [UserTenagaMedisController::class, 'update']);     // update
Route::delete('/tenaga-medis/{id}', [UserTenagaMedisController::class, 'destroy']); // delete

// =======================================
// === DATA PASIEN ======================
// =======================================
Route::get('/pasien', [DataPasienController::class, 'index']);
Route::get('/pasien/{id}', [DataPasienController::class, 'show']);
Route::post('/pasien', [DataPasienController::class, 'store']);
Route::put('/pasien/{id}', [DataPasienController::class, 'update']);
Route::delete('/pasien/{id}', [DataPasienController::class, 'destroy']);

// =======================================
// === HASIL PASIEN ======================
// =======================================
Route::get('/hasil-pasien', [HasilPasienController::class, 'index']);
Route::get('/hasil-pasien/{id}', [HasilPasienController::class, 'show']);
Route::post('/hasil-pasien', [HasilPasienController::class, 'store']);
Route::put('/hasil-pasien/{id}', [HasilPasienController::class, 'update']);
Route::delete('/hasil-pasien/{id}', [HasilPasienController::class, 'destroy']);

// =======================================
// === EVENT =============================
// =======================================
Route::get('/events', [EventController::class, 'index']);
Route::post('/events', [EventController::class, 'store']);
Route::get('/events/{id}', [EventController::class, 'show']);
Route::put('/events/{id}', [EventController::class, 'update']);
Route::delete('/events/{id}', [EventController::class, 'destroy']);
Route::get('/events/filter', [EventController::class, 'filter']);

// =======================================
// === RiwayatRelawan ====================
// =======================================
Route::get('/riwayat-relawan', [RiwayatRelawanController::class, 'index']);
Route::get('/riwayat-relawan/{id_relawan}', [RiwayatRelawanController::class, 'riwayatByRelawan']);
Route::post('/riwayat-relawan', [RiwayatRelawanController::class, 'store']);
Route::get('/riwayat-relawan/{id_relawan}/{id_event}', [RiwayatRelawanController::class, 'show']);