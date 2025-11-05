{{-- Use the main layout file --}}
@extends('layouts.app')

{{-- Start the content section --}}
@section('content')
    {{-- Page header with logo and title --}}
    <div class="d-flex justify-content-between align-items-center mb-3">
        <div class="d-flex align-items-center">
            {{-- Display AMA logo --}}
            <img src="{{ asset('images/ama2.png') }}" alt="AMA Logo" class="me-2" style="height:40px;">
            <h3 class="mb-0">Add Student</h3>
        </div>
    </div>

    {{-- Form to add a new student --}}
    <form action="{{ route('students.store') }}" method="POST" enctype="multipart/form-data">
        {{-- CSRF protection --}}
        @csrf
        
        {{-- Student ID field --}}
        <div class="mb-3">
            <label for="student_id" class="form-label">Student ID</label>
            <input type="text" name="student_id" id="student_id" class="form-control" required>
        </div>
        
        {{-- Student Name field --}}
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" name="name" id="name" class="form-control" required>
        </div>
        
        {{-- Course field --}}
        <div class="mb-3">
            <label for="course" class="form-label">Course</label>
            <input type="text" name="course" id="course" class="form-control" required>
        </div>
        
        {{-- Year Level dropdown (1-5) --}}
        <div class="mb-3">
            <label for="year_level" class="form-label">Year Level</label>
            <select name="year_level" id="year_level" class="form-select" required>
                <option value="" disabled selected>Select Year Level</option>
                @for($i = 1; $i <= 5; $i++)
                    <option value="{{ $i }}">Year {{ $i }}</option>
                @endfor
            </select>
        </div>
        
        {{-- Form actions --}}
        <button type="submit" class="btn btn-success">Add Student</button>
        <a href="{{ route('students.index') }}" class="btn btn-secondary ms-2">Cancel</a>
    </form>
{{-- End of content section --}}
@endsection