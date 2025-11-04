@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3 class="mb-0">Students</h3>
        <a href="{{ route('students.create') }}" class="btn btn-primary">Add Student</a>
    </div>

    @if($students->count())
        <div class="table-responsive">
            <table class="table table-striped align-middle">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Student ID</th>
                    <th>Name</th>
                    <th>Course</th>
                    <th>Year Level</th>
                    <th style="width:160px;">Actions</th>
                </tr>
                </thead>
                <tbody>
                @foreach($students as $student)
                    <tr>
                        <td>{{ $student->id }}</td>
                        <td>{{ $student->student_id }}</td>
                        <td>{{ $student->name }}</td>
                        <td>{{ $student->course }}</td>
                        <td>{{ $student->year_level }}</td>
                        <td>
                            <a href="{{ route('students.edit', $student) }}" class="btn btn-sm btn-warning">Edit</a>
                            <form action="{{ route('students.destroy', $student) }}" method="POST" class="d-inline">
                                @csrf
                                @method('DELETE')
                                <button class="btn btn-sm btn-danger" onclick="return confirm('Delete this student?')">
                                    Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>

        {{ $students->links() }}
    @else
        <div class="alert alert-info">No students found. Add one.</div>
    @endif
@endsection