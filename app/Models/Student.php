<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    protected $fillable = [
        'student_id',
        'name',
        'course',
        'year_level',
    ];

    public static $rules = [
        'student_id' => 'required|string|max:50|unique:students,student_id',
        'name' => 'required|string|max:100',
        'course' => 'required|string|max:100',
        'year_level' => 'required|integer|min:1|max:5',
    ];
}