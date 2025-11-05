{{-- Use the main layout file --}}
@extends('layouts.app')

{{-- Start the content section --}}
@section('content')
    {{-- Page header with logo, title, and back button --}}
    <div class="d-flex justify-content-between align-items-center mb-3">
        <div class="d-flex align-items-center">
            <img src="{{ asset('images/ama2.png') }}" alt="AMA Logo" class="me-2" style="height:40px;">
            <h3 class="mb-0">Batch Edit Students</h3>
        </div>
        <a href="{{ route('students.index') }}" class="btn btn-secondary">Back to List</a>
    </div>

    {{-- Display any validation errors --}}
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul class="mb-0">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    {{-- Batch edit form --}}
    <form method="POST" action="{{ route('students.batch-update-rows') }}">
        {{-- CSRF protection --}}
        @csrf
        
        {{-- Responsive table container --}}
        <div class="table-responsive">
            <table class="table align-middle">
                {{-- Table header --}}
                <thead>
                <tr>
                    <th style="width:12%">Student ID</th>
                    <th style="width:25%">Name</th>
                    <th style="width:25%">Course</th>
                    <th style="width:15%">Year</th>
                </tr>
                </thead>
                
                {{-- Table body with student data --}}
                <tbody>
                @foreach($students as $i => $student)
                    <tr>
                        {{-- Student ID field --}}
                        <td>
                            {{-- Hidden field to store student ID --}}
                            <input type="hidden" name="students[{{ $i }}][id]" value="{{ $student->id }}">
                            <input type="text" 
                                   name="students[{{ $i }}][student_id]" 
                                   class="form-control" 
                                   value="{{ $student->student_id }}" 
                                   required>
                        </td>
                        
                        {{-- Name field --}}
                        <td>
                            <input type="text" 
                                   name="students[{{ $i }}][name]" 
                                   class="form-control" 
                                   value="{{ $student->name }}" 
                                   required>
                        </td>
                        
                        {{-- Course field --}}
                        <td>
                            <input type="text" 
                                   name="students[{{ $i }}][course]" 
                                   class="form-control" 
                                   value="{{ $student->course }}" 
                                   required>
                        </td>
                        
                        {{-- Year Level dropdown (1-5) --}}
                        <td>
                            <select name="students[{{ $i }}][year_level]" class="form-select" required>
                                @for($y=1;$y<=5;$y++)
                                    <option value="{{ $y }}" @selected($student->year_level==$y)>
                                        Year {{ $y }}
                                    </option>
                                @endfor
                            </select>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
        
        {{-- Form action buttons --}}
        <div class="d-flex gap-2">
            <button type="submit" class="btn btn-primary">Save Changes</button>
            <a href="{{ route('students.index') }}" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
{{-- End of content section --}}
@endsection