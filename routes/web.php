<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\AuthController;

// Redirect root URL to students index page
Route::get('/', function () {
    return redirect()->route('students.index');
});

// ===== AUTHENTICATION ROUTES =====
// Only accessible to guests (non-authenticated users)
Route::middleware('guest')->group(function () {
    // Show login form
    Route::get('/login', [AuthController::class, 'showLogin'])->name('login');
    // Process login form submission
    Route::post('/login', [AuthController::class, 'login'])->name('login.attempt');
});

// Logout route - only accessible to authenticated users
Route::post('/logout', [AuthController::class, 'logout'])
    ->middleware('auth')
    ->name('logout');

// ===== PROTECTED ROUTES =====
// All routes in this group require authentication
Route::middleware('auth')->group(function () {
    // Standard RESTful resource routes for Student CRUD operations
    // GET      /students           - students.index
    // GET      /students/create    - students.create
    // POST     /students           - students.store
    // GET      /students/{id}      - students.show
    // GET      /students/{id}/edit - students.edit
    // PUT/PATCH /students/{id}     - students.update
    // DELETE   /students/{id}      - students.destroy
    Route::resource('students', StudentController::class);

    // ===== BATCH OPERATION ROUTES =====
    // Show batch create form
    Route::get('students/batch/create', [StudentController::class, 'batchCreate'])
        ->name('students.batch-create');
    
    // Process batch creation of students
    Route::post('students/batch/store', [StudentController::class, 'batchStore'])
        ->name('students.batch-store');
    
    // Batch update common fields for multiple students
    Route::post('students/batch/update', [StudentController::class, 'batchUpdate'])
        ->name('students.batch-update');
    
    // Batch delete multiple students
    Route::post('students/batch/destroy', [StudentController::class, 'batchDestroy'])
        ->name('students.batch-destroy');

    // ===== MULTI-ROW EDITOR ROUTES =====
    // Show multi-row editor for batch editing
    Route::post('students/batch/edit', [StudentController::class, 'batchEdit'])
        ->name('students.batch-edit');
    
    // Process multi-row editor form submission
    Route::post('students/batch/update-rows', [StudentController::class, 'batchUpdateRows'])
        ->name('students.batch-update-rows');
});