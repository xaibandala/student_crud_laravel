{{-- Use the main layout file --}}
@extends('layouts.app')

{{-- Start the content section --}}
@section('content')
    {{-- Page header with logo, title, and cancel button --}}
    <div class="d-flex justify-content-between align-items-center mb-3">
        <div class="d-flex align-items-center">
            <img src="{{ asset('images/ama2.png') }}" alt="AMA Logo" class="me-2" style="height:40px;">
            <h3 class="mb-0">Batch Add Students</h3>
        </div>
        <a href="{{ route('students.index') }}" class="btn btn-secondary">Cancel</a>
    </div>

    {{-- Display validation errors if any --}}
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

    {{-- Batch add form --}}
    <form method="POST" action="{{ route('students.batch-store') }}" id="batchAddForm">
        {{-- CSRF protection --}}
        @csrf
        
        {{-- Responsive table container --}}
        <div class="table-responsive">
            <table class="table align-middle" id="studentsTable">
                {{-- Table header --}}
                <thead>
                <tr>
                    <th style="width: 20%">Student ID</th>
                    <th style="width: 30%">Name</th>
                    <th style="width: 30%">Course</th>
                    <th style="width: 15%">Year</th>
                    <th style="width: 5%"></th> {{-- Column for remove button --}}
                </tr>
                </thead>
                {{-- Table body (initially empty, filled by JavaScript) --}}
                <tbody>
                </tbody>
            </table>
        </div>
        
        {{-- Form action buttons --}}
        <div class="d-flex gap-2">
            <button type="button" id="addRow" class="btn btn-outline-primary">+ Add Row</button>
            <button type="submit" class="btn btn-success">Save All</button>
        </div>
    </form>

    {{-- Template for new student rows (hidden, used by JavaScript) --}}
    <template id="rowTemplate">
        <tr>
            {{-- Student ID field --}}
            <td>
                <input type="text" class="form-control" name="REPLACE_students_INDEX_student_id" required>
            </td>
            {{-- Name field --}}
            <td>
                <input type="text" class="form-control" name="REPLACE_students_INDEX_name" required>
            </td>
            {{-- Course field --}}
            <td>
                <input type="text" class="form-control" name="REPLACE_students_INDEX_course" required>
            </td>
            {{-- Year Level dropdown (1-5) --}}
            <td>
                <select class="form-select" name="REPLACE_students_INDEX_year_level" required>
                    @for($i=1;$i<=5;$i++)
                        <option value="{{ $i }}">{{ $i }}</option>
                    @endfor
                </select>
            </td>
            {{-- Remove row button --}}
            <td>
                <button type="button" class="btn btn-outline-danger btn-sm removeRow" title="Remove this row">X</button>
            </td>
        </tr>
    </template>

    {{-- JavaScript for dynamic row management --}}
    <script>
        // Get DOM elements
        const tbody = document.querySelector('#studentsTable tbody');
        const tplHtml = document.querySelector('#rowTemplate').innerHTML;
        const addBtn = document.getElementById('addRow');
        let idx = 0; // Counter for generating unique field names

        // Function to add a new row to the table
        function addRow() {
            // Replace placeholders with current index
            let html = tplHtml.replace(/REPLACE_students_INDEX_/g, `students[${idx}]_`);
            
            // Map placeholders to proper array format for form submission
            html = html
                .replace(`students[${idx}]_student_id`, `students[${idx}][student_id]`)
                .replace(`students[${idx}]_name`, `students[${idx}][name]`)
                .replace(`students[${idx}]_course`, `students[${idx}][course]`)
                .replace(`students[${idx}]_year_level`, `students[${idx}][year_level]`);
                
            // Create and append the new row
            const wrap = document.createElement('tbody');
            wrap.innerHTML = html.trim();
            tbody.appendChild(wrap.firstElementChild);
            
            idx++; // Increment counter for next row
        }

        // Add click handler for the Add Row button
        addBtn.addEventListener('click', addRow);
        
        // Handle click events for remove buttons using event delegation
        document.addEventListener('click', function(e){
            if (e.target && e.target.classList.contains('removeRow')) {
                e.target.closest('tr').remove();
            }
        });

        // Start with three empty rows by default
        addRow(); 
        addRow(); 
        addRow();
    </script>
{{-- End of content section --}}
@endsection