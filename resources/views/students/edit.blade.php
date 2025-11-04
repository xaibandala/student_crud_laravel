@extends('layouts.app')

@section('content')
    <h3 class="mb-3">Edit Student</h3>

    <div class="card">
        <div class="card-body">
            <form action="{{ route('students.update', $student) }}" method="POST" novalidate>
                @csrf
                @method('PUT')

                <div class="mb-3">
                    <label for="student_id" class="form-label">Student ID</label>
                    <input id="student_id" name="student_id" type="text"
                           value="{{ old('student_id', $student->student_id) }}"
                           class="form-control @error('student_id') is-invalid @enderror" required>
                    @error('student_id')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>

                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input id="name" name="name" type="text"
                           value="{{ old('name', $student->name) }}"
                           class="form-control @error('name') is-invalid @enderror" required>
                    @error('name')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>

                <div class="mb-3">
                    <label for="course" class="form-label">Course</label>
                    <input id="course" name="course" type="text"
                           value="{{ old('course', $student->course) }}"
                           class="form-control @error('course') is-invalid @enderror" required>
                    @error('course')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>

                <div class="mb-3">
                    <label for="year_level" class="form-label">Year Level</label>
                    <select id="year_level" name="year_level"
                            class="form-select @error('year_level') is-invalid @enderror" required>
                        @for($i=1;$i<=5;$i++)
                            <option value="{{ $i }}" @selected(old('year_level',$student->year_level)==$i)>
                                Year {{ $i }}
                            </option>
                        @endfor
                    </select>
                    @error('year_level')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>

                <div class="d-flex gap-2">
                    <button class="btn btn-primary">Update</button>
                    <a href="{{ route('students.index') }}" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
@endsection