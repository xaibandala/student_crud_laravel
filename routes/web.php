<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\StudentController;

Route::get('/', function () {
    return redirect()->route('students.index');
});

Route::resource('students', StudentController::class);

Route::get('students/batch/create', [StudentController::class, 'batchCreate'])->name('students.batch-create');
Route::post('students/batch/store', [StudentController::class, 'batchStore'])->name('students.batch-store');
Route::post('students/batch/update', [StudentController::class, 'batchUpdate'])->name('students.batch-update');
Route::post('students/batch/destroy', [StudentController::class, 'batchDestroy'])->name('students.batch-destroy');

// Option B: show multi-row editor and submit updates
Route::post('students/batch/edit', [StudentController::class, 'batchEdit'])->name('students.batch-edit');
Route::post('students/batch/update-rows', [StudentController::class, 'batchUpdateRows'])->name('students.batch-update-rows');