<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\AuthController;

Route::get('/', function () {
    return redirect()->route('students.index');
});

// Authentication routes
Route::middleware('guest')->group(function () {
    Route::get('/login', [AuthController::class, 'showLogin'])->name('login');
    Route::post('/login', [AuthController::class, 'login'])->name('login.attempt');
});
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth')->name('logout');

// Protected student routes
Route::middleware('auth')->group(function () {
    Route::resource('students', StudentController::class);

    Route::get('students/batch/create', [StudentController::class, 'batchCreate'])->name('students.batch-create');
    Route::post('students/batch/store', [StudentController::class, 'batchStore'])->name('students.batch-store');
    Route::post('students/batch/update', [StudentController::class, 'batchUpdate'])->name('students.batch-update');
    Route::post('students/batch/destroy', [StudentController::class, 'batchDestroy'])->name('students.batch-destroy');

    // Option B: show multi-row editor and submit updates
    Route::post('students/batch/edit', [StudentController::class, 'batchEdit'])->name('students.batch-edit');
    Route::post('students/batch/update-rows', [StudentController::class, 'batchUpdateRows'])->name('students.batch-update-rows');
});