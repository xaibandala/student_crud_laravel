@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3 class="mb-0">Batch Add Students</h3>
        <a href="{{ route('students.index') }}" class="btn btn-secondary">Cancel</a>
    </div>

    @if ($errors->any())
        <div class="alert alert-danger">
            <strong>There were some problems with your input.</strong>
            <ul class="mb-0 mt-2">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form method="POST" action="{{ route('students.batch-store') }}" id="batchAddForm">
        @csrf
        <div class="table-responsive">
            <table class="table align-middle" id="studentsTable">
                <thead>
                <tr>
                    <th style="width: 20%">Student ID</th>
                    <th style="width: 30%">Name</th>
                    <th style="width: 30%">Course</th>
                    <th style="width: 15%">Year</th>
                    <th style="width: 5%"></th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <div class="d-flex gap-2">
            <button type="button" id="addRow" class="btn btn-outline-primary">+ Add Row</button>
            <button type="submit" class="btn btn-success">Save All</button>
        </div>
    </form>

    <template id="rowTemplate">
        <tr>
            <td>
                <input type="text" class="form-control" name="REPLACE_students_INDEX_student_id" required>
            </td>
            <td>
                <input type="text" class="form-control" name="REPLACE_students_INDEX_name" required>
            </td>
            <td>
                <input type="text" class="form-control" name="REPLACE_students_INDEX_course" required>
            </td>
            <td>
                <select class="form-select" name="REPLACE_students_INDEX_year_level" required>
                    @for($i=1;$i<=5;$i++)
                        <option value="{{ $i }}">{{ $i }}</option>
                    @endfor
                </select>
            </td>
            <td>
                <button type="button" class="btn btn-outline-danger btn-sm removeRow">X</button>
            </td>
        </tr>
    </template>

    <script>
        const tbody = document.querySelector('#studentsTable tbody');
        const tplHtml = document.querySelector('#rowTemplate').innerHTML;
        const addBtn = document.getElementById('addRow');
        let idx = 0;

        function addRow() {
            let html = tplHtml.replace(/REPLACE_students_INDEX_/g, `students[${idx}]_`);
            // Map placeholders to keys in order
            html = html
                .replace(`students[${idx}]_student_id`, `students[${idx}][student_id]`)
                .replace(`students[${idx}]_name`, `students[${idx}][name]`)
                .replace(`students[${idx}]_course`, `students[${idx}][course]`)
                .replace(`students[${idx}]_year_level`, `students[${idx}][year_level]`);
            const wrap = document.createElement('tbody');
            wrap.innerHTML = html.trim();
            tbody.appendChild(wrap.firstElementChild);
            idx++;
        }

        addBtn.addEventListener('click', addRow);
        document.addEventListener('click', function(e){
            if (e.target && e.target.classList.contains('removeRow')) {
                e.target.closest('tr').remove();
            }
        });

        // Start with three blank rows
        addRow(); addRow(); addRow();
    </script>
@endsection