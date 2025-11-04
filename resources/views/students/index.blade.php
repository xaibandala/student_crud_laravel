@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between align-items-center mb-3">
        <div class="d-flex align-items-center">
            <img src="{{ asset('images/ama2.png') }}" alt="AMA Logo" class="me-2" style="height:40px;">
            <h3 class="mb-0">AMAer Students</h3>
        </div>
        <div class="d-flex gap-2">
            <a href="{{ route('students.batch-create') }}" class="btn btn-success">Batch Add</a>
            <a href="{{ route('students.create') }}" class="btn btn-primary">Add Student</a>
        </div>
    </div>

    <form method="GET" action="{{ route('students.index') }}" class="mb-3">
        <div class="input-group">
            <input type="text" name="q" value="{{ request('q') }}" class="form-control" placeholder="Search by ID, name, course or year level...">
            <button class="btn btn-outline-secondary" type="submit">Search</button>
            @if(request('q'))
                <a href="{{ route('students.index') }}" class="btn btn-outline-secondary">Clear</a>
            @endif
        </div>
    </form>

    @if ($errors->any())
        <div class="alert alert-danger">
            <ul class="mb-0">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    @if($students->count())
        <div class="d-flex justify-content-end mb-2 gap-2">
            <button id="btnBatchUpdate" type="submit" class="btn btn-warning" disabled form="batchForm">
                Update Selected
            </button>
            <button id="btnBatchDelete" type="submit" class="btn btn-danger" disabled form="batchForm"
                    formaction="{{ route('students.batch-destroy') }}">
                Delete Selected
            </button>
        </div>

        <div class="table-responsive">
            <table class="table table-striped align-middle">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="selectAll">
                    </th>
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
                        <td>
                            <input type="checkbox" class="row-check" value="{{ $student->id }}">
                        </td>
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

        <form id="batchForm" method="POST" action="{{ route('students.batch-edit') }}" class="d-none">
            @csrf
        </form>

        {{ $students->links() }}
    @else
        <div class="alert alert-info">No students found. Add one.</div>
    @endif

    <script>
        const selectAll = document.getElementById('selectAll');
        const batchForm = document.getElementById('batchForm');
        const btnUpdate = document.getElementById('btnBatchUpdate');
        const btnDelete = document.getElementById('btnBatchDelete');
        const rowChecks = () => Array.from(document.querySelectorAll('.row-check'));

        function updateButtonsState() {
            const anyChecked = rowChecks().some(ch => ch.checked);
            if (btnUpdate) btnUpdate.disabled = !anyChecked;
            if (btnDelete) btnDelete.disabled = !anyChecked;
        }

        function rebuildHiddenIds() {
            // Remove any existing hidden ids
            batchForm.querySelectorAll('input[name="ids[]"]').forEach(n => n.remove());
            // Add hidden inputs for each checked row
            rowChecks().filter(ch => ch.checked).forEach(ch => {
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'ids[]';
                input.value = ch.value;
                batchForm.appendChild(input);
            });
        }

        if (selectAll) {
            selectAll.addEventListener('change', function(){
                rowChecks().forEach(ch => ch.checked = selectAll.checked);
                updateButtonsState();
                rebuildHiddenIds();
            });
        }
        document.addEventListener('change', function(e){
            if (e.target && e.target.classList && e.target.classList.contains('row-check')) {
                updateButtonsState();
                rebuildHiddenIds();
            }
        });
        updateButtonsState();

        if (batchForm) {
            batchForm.addEventListener('submit', function(e){
                const anyChecked = rowChecks().some(ch => ch.checked);
                if (!anyChecked) {
                    e.preventDefault();
                    alert('Please select at least one student.');
                    return;
                }
                rebuildHiddenIds();
            });
        }
    </script>
@endsection