<?php

namespace App\Http\Controllers;

use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;

class StudentController extends Controller
{
    public function index()
    {
        $q = request('q');

        $students = Student::query()
            ->when($q, function ($query, $q) {
                $query->where(function ($sub) use ($q) {
                    $sub->where('student_id', 'like', "%{$q}%")
                        ->orWhere('name', 'like', "%{$q}%")
                        ->orWhere('course', 'like', "%{$q}%")
                        ->orWhere('year_level', 'like', "%{$q}%");
                });
            })
            ->orderBy('id', 'asc')
            ->paginate(10)
            ->withQueryString();

        return view('students.index', compact('students'));
    }

    public function create()
    {
        return view('students.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate(Student::$rules);
        Student::create($validated);

        return redirect()
            ->route('students.index')
            ->with('success', 'Student created successfully.');

        return redirect()
            ->route('students.index')
            ->with('success', 'Student created successfully.');
    }

    /**
     * Show the form for editing the specified student.
     *
     * @param  \App\Models\Student  $student
     * @return \Illuminate\View\View
     */
    public function edit(Student $student)
    {
        return view('students.edit', compact('student'));
    }

    /**
     * Update the specified student in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Student  $student
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, Student $student)
    {
        // Get validation rules from Student model
        $rules = Student::$rules;
        // Ensure student_id is unique, but ignore the current student's ID
        $rules['student_id'] = 'required|string|max:50|unique:students,student_id,' . $student->id;

        // Validate the request data
        $validated = $request->validate($rules);
        
        // Update the student record
        $student->update($validated);

        // Redirect with success message
        return redirect()
            ->route('students.index')
            ->with('success', 'Student updated successfully.');
    }

    /**
     * Remove the specified student from storage.
     *
     * @param  \App\Models\Student  $student
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Student $student)
    {
        // Delete the student record
        $student->delete();

        // Redirect with success message
        return redirect()
            ->route('students.index')
            ->with('success', 'Student deleted successfully.');
    }

    /**
     * Show the form for creating multiple students at once.
     *
     * @return \Illuminate\View\View
     */
    public function batchCreate()
    {
        return view('students.batch-create');
    }

    /**
     * Store multiple students in storage from batch input.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function batchStore(Request $request)
    {
        // Define validation rules for batch student creation
        $rules = [
            'students' => 'required|array|min:1',  // Must have at least one student
            'students.*.student_id' => 'required|string|max:50|distinct|unique:students,student_id',
            'students.*.name' => 'required|string|max:100',
            'students.*.course' => 'required|string|max:100',
            'students.*.year_level' => 'required|integer|min:1|max:5',
        ];

        // Validate the request data
        $validated = $request->validate($rules);

        // Prepare data for batch insert
        $rows = array_map(function ($s) {
            return [
                'student_id' => $s['student_id'],
                'name' => $s['name'],
                'course' => $s['course'],
                'year_level' => $s['year_level'],
                'created_at' => now(),
                'updated_at' => now(),
            ];
        }, $validated['students']);

        // Perform batch insert
        DB::table('students')->insert($rows);

        return redirect()
            ->route('students.index')
            ->with('success', 'Students created successfully.');
    }

    /**
     * Update multiple students' common fields in bulk.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function batchUpdate(Request $request)
    {
        // Validate the request data
        $validated = $request->validate([
            'ids' => 'required|array|min:1',  // At least one student ID must be provided
            'ids.*' => 'integer|exists:students,id',  // Each ID must exist in students table
            'course' => 'nullable|string|max:100',    // Optional course update
            'year_level' => 'nullable|integer|min:1|max:5',  // Optional year level update
        ]);

        // Prepare update data based on provided fields
        $data = [];
        if ($request->filled('course')) {
            $data['course'] = $validated['course'];
        }
        if ($request->filled('year_level')) {
            $data['year_level'] = $validated['year_level'];
        }

        // If no valid fields to update, return with message
        if (empty($data)) {
            return redirect()->back()->with('success', 'No changes applied.');
        }

        // Update all selected students with the new data
        Student::whereIn('id', $validated['ids'])->update($data);

        return redirect()
            ->route('students.index')
            ->with('success', 'Selected students updated successfully.');
    }

    /**
     * Remove multiple students in bulk.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function batchDestroy(Request $request)
    {
        // Validate that at least one student ID is provided and exists
        $validated = $request->validate([
            'ids' => 'required|array|min:1',
            'ids.*' => 'integer|exists:students,id',
        ]);

        // Delete all selected students
        Student::whereIn('id', $validated['ids'])->delete();

        return redirect()
            ->route('students.index')
            ->with('success', 'Selected students deleted successfully.');
    }

    /**
     * Display the multi-row editor for batch editing students.
     * This is an alternative approach to batch updating that shows a form with all selected students.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\View\View
     */
    public function batchEdit(Request $request)
    {
        // Validate that at least one student ID is provided and exists
        $validated = $request->validate([
            'ids' => 'required|array|min:1',
            'ids.*' => 'integer|exists:students,id',
        ]);

        // Keep the selected order of students
        $ids = $validated['ids'];
        
        // Get students in the same order as they were selected
        $students = Student::whereIn('id', $ids)
            ->get()
            ->sortBy(function($s) use ($ids) {
                return array_search($s->id, $ids);
            })
            ->values();

        return view('students.batch-edit', compact('students'));
    }

    /**
     * Update multiple students with individual field values.
     * This is the handler for the multi-row editor form.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function batchUpdateRows(Request $request)
    {
        // Validate the request data structure and basic rules
        $data = $request->validate([
            'students' => 'required|array|min:1',
            'students.*.id' => 'required|integer|exists:students,id',
            'students.*.student_id' => ['required','string','max:50'],
            'students.*.name' => 'required|string|max:100',
            'students.*.course' => 'required|string|max:100',
            'students.*.year_level' => 'required|integer|min:1|max:5',
        ]);

        // Process each student in the batch
        foreach ($data['students'] as $row) {
            // Validate uniqueness of student_id for each row, ignoring the current record
            $request->validate([
                'students.' . $row['id'] . '.student_id' => [
                    Rule::unique('students','student_id')->ignore($row['id'])
                ]
            ]);

            // Update the student record with new values
            $student = Student::find($row['id']);
            $student->update([
                'student_id' => $row['student_id'],
                'name' => $row['name'],
                'course' => $row['course'],
                'year_level' => $row['year_level'],
            ]);
        }

        return redirect()
            ->route('students.index')
            ->with('success', 'Selected students updated successfully.');
    }
}