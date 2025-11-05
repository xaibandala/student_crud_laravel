{{-- Use the main layout file --}}
@extends('layouts.app')

{{-- Start the content section --}}
@section('content')
    {{-- Page header with logo and title --}}
    <div class="d-flex align-items-center mb-3">
        <img src="{{ asset('images/ama2.png') }}" alt="AMA Logo" class="me-2" style="height:40px;">
        <h3 class="mb-0">Edit Student</h3>
    </div>

    {{-- Card container for the form --}}
    <div class="card">
        <div class="card-body">
            {{-- Form to update student details --}}
            <form action="{{ route('students.update', $student) }}" method="POST" enctype="multipart/form-data" novalidate>
                {{-- CSRF protection --}}
                @csrf
                {{-- Use PUT method for update --}}
                @method('PUT')

                {{-- Student ID field with error handling --}}
                <div class="mb-3">
                    <label for="student_id" class="form-label">Student ID</label>
                    <input id="student_id" name="student_id" type="text"
                           value="{{ old('student_id', $student->student_id) }}"
                           class="form-control @error('student_id') is-invalid @enderror" required>
                    {{-- Show validation error if any --}}
                    @error('student_id')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>

                {{-- Student Name field with error handling --}}
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input id="name" name="name" type="text"
                           value="{{ old('name', $student->name) }}"
                           class="form-control @error('name') is-invalid @enderror" required>
                    @error('name')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>

                {{-- Course field with error handling --}}
                <div class="mb-3">
                    <label for="course" class="form-label">Course</label>
                    <input id="course" name="course" type="text"
                           value="{{ old('course', $student->course) }}"
                           class="form-control @error('course') is-invalid @enderror" required>
                    @error('course')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>

                {{-- Year Level dropdown (1-5) with error handling --}}
                <div class="mb-3">
                    <label for="year_level" class="form-label">Year Level</label>
                    <select id="year_level" name="year_level" class="form-select @error('year_level') is-invalid @enderror" required>
                        @for($i = 1; $i <= 5; $i++)
                            <option value="{{ $i }}" {{ old('year_level', $student->year_level) == $i ? 'selected' : '' }}>
                                Year {{ $i }}
                            </option>
                        @endfor
                    </select>
                    @error('year_level')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>

                {{-- Form action buttons --}}
                <div class="d-flex gap-2">
                    <button class="btn btn-primary">Update</button>
                    <a href="{{ route('students.index') }}" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
{{-- End of content section --}}
@endsection