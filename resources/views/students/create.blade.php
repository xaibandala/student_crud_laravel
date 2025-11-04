@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between align-items-center mb-3">
        <div class="d-flex align-items-center">
            <img src="{{ asset('images/ama2.png') }}" alt="AMA Logo" class="me-2" style="height:40px;">
            <h3 class="mb-0">Add Student</h3>
        </div>
    </div>

    <form action="{{ route('students.store') }}" method="POST">
        @csrf
        <div class="mb-3">
            <label for="student_id" class="form-label">Student ID</label>
            <input type="text" name="student_id" id="student_id" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" name="name" id="name" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="course" class="form-label">Course</label>
            <input type="text" name="course" id="course" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="year_level" class="form-label">Year Level</label>
            <input type="number" name="year_level" id="year_level" class="form-control" min="1" max="5" required>
        </div>
        <button type="submit" class="btn btn-success">Add Student</button>
        <a href="{{ route('students.index') }}" class="btn btn-secondary ms-2">Cancel</a>
    </form>
@endsection