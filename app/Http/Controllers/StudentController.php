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
        $students = Student::latest()->paginate(10);
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
    }

    public function edit(Student $student)
    {
        return view('students.edit', compact('student'));
    }

    public function update(Request $request, Student $student)
    {
        $rules = Student::$rules;
        $rules['student_id'] = 'required|string|max:50|unique:students,student_id,' . $student->id;

        $validated = $request->validate($rules);
        $student->update($validated);

        return redirect()
            ->route('students.index')
            ->with('success', 'Student updated successfully.');
    }

    public function destroy(Student $student)
    {
        $student->delete();

        return redirect()
            ->route('students.index')
            ->with('success', 'Student deleted successfully.');
    }

    // Batch create view
    public function batchCreate()
    {
        return view('students.batch-create');
    }

    // Batch store multiple students
    public function batchStore(Request $request)
    {
        $rules = [
            'students' => 'required|array|min:1',
            'students.*.student_id' => 'required|string|max:50|distinct|unique:students,student_id',
            'students.*.name' => 'required|string|max:100',
            'students.*.course' => 'required|string|max:100',
            'students.*.year_level' => 'required|integer|min:1|max:5',
        ];

        $validated = $request->validate($rules);

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

        DB::table('students')->insert($rows);

        return redirect()->route('students.index')->with('success', 'Students created successfully.');
    }

    // Batch update selected students
    public function batchUpdate(Request $request)
    {
        $validated = $request->validate([
            'ids' => 'required|array|min:1',
            'ids.*' => 'integer|exists:students,id',
            'course' => 'nullable|string|max:100',
            'year_level' => 'nullable|integer|min:1|max:5',
        ]);

        $data = [];
        if ($request->filled('course')) {
            $data['course'] = $validated['course'];
        }
        if ($request->filled('year_level')) {
            $data['year_level'] = $validated['year_level'];
        }

        if (empty($data)) {
            return redirect()->back()->with('success', 'No changes applied.');
        }

        Student::whereIn('id', $validated['ids'])->update($data);

        return redirect()->route('students.index')->with('success', 'Selected students updated successfully.');
    }

    // Batch delete selected students
    public function batchDestroy(Request $request)
    {
        $validated = $request->validate([
            'ids' => 'required|array|min:1',
            'ids.*' => 'integer|exists:students,id',
        ]);

        Student::whereIn('id', $validated['ids'])->delete();

        return redirect()->route('students.index')->with('success', 'Selected students deleted successfully.');
    }

    // Option B: show multi-row editor
    public function batchEdit(Request $request)
    {
        $validated = $request->validate([
            'ids' => 'required|array|min:1',
            'ids.*' => 'integer|exists:students,id',
        ]);

        // Keep the selected order
        $ids = $validated['ids'];
        $students = Student::whereIn('id', $ids)->get()->sortBy(function($s) use ($ids) {
            return array_search($s->id, $ids);
        })->values();

        return view('students.batch-edit', compact('students'));
    }

    // Option B: update multiple rows at once
    public function batchUpdateRows(Request $request)
    {
        $data = $request->validate([
            'students' => 'required|array|min:1',
            'students.*.id' => 'required|integer|exists:students,id',
            'students.*.student_id' => ['required','string','max:50'],
            'students.*.name' => 'required|string|max:100',
            'students.*.course' => 'required|string|max:100',
            'students.*.year_level' => 'required|integer|min:1|max:5',
        ]);

        foreach ($data['students'] as $row) {
            // Validate unique per row (ignore current id)
            $request->validate([
                'students.' . $row['id'] . '.student_id' => [
                    Rule::unique('students','student_id')->ignore($row['id'])
                ]
            ]);

            $student = Student::find($row['id']);
            $student->update([
                'student_id' => $row['student_id'],
                'name' => $row['name'],
                'course' => $row['course'],
                'year_level' => $row['year_level'],
            ]);
        }

        return redirect()->route('students.index')->with('success', 'Selected students updated successfully.');
    }
}