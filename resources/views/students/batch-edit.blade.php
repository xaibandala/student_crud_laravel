@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between align-items-center mb-3">
        <div class="d-flex align-items-center">
            <img src="{{ asset('images/ama2.png') }}" alt="AMA Logo" class="me-2" style="height:40px;">
            <h3 class="mb-0">Batch Edit Students</h3>
        </div>
        <a href="{{ route('students.index') }}" class="btn btn-secondary">Back to List</a>
    </div>

    @if ($errors->any())
        <div class="alert alert-danger">
            <ul class="mb-0">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form method="POST" action="{{ route('students.batch-update-rows') }}">
        @csrf
        <div class="table-responsive">
            <table class="table align-middle">
                <thead>
                <tr>
                    <th style="width:12%">Student ID</th>
                    <th style="width:25%">Name</th>
                    <th style="width:25%">Course</th>
                    <th style="width:15%">Year</th>
                </tr>
                </thead>
                <tbody>
                @foreach($students as $i => $student)
                    <tr>
                        <td>
                            <input type="hidden" name="students[{{ $i }}][id]" value="{{ $student->id }}">
                            <input type="text" name="students[{{ $i }}][student_id]" class="form-control" value="{{ $student->student_id }}" required>
                        </td>
                        <td>
                            <input type="text" name="students[{{ $i }}][name]" class="form-control" value="{{ $student->name }}" required>
                        </td>
                        <td>
                            <input type="text" name="students[{{ $i }}][course]" class="form-control" value="{{ $student->course }}" required>
                        </td>
                        <td>
                            <select name="students[{{ $i }}][year_level]" class="form-select" required>
                                @for($y=1;$y<=5;$y++)
                                    <option value="{{ $y }}" @selected($student->year_level==$y)>Year {{ $y }}</option>
                                @endfor
                            </select>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
        <div class="d-flex gap-2">
            <button type="submit" class="btn btn-primary">Save Changes</button>
            <a href="{{ route('students.index') }}" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
@endsection