<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Student CRUD</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-3">
    @auth
    <div class="d-flex justify-content-end mb-3">
        <span class="me-2">Hello, {{ auth()->user()->name }}</span>
        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-inline">
            @csrf
            <button type="button" onclick="confirmLogout()" class="btn btn-sm btn-outline-danger">Logout</button>
        </form>
    </div>
    <script>
    function confirmLogout() {
        Swal.fire({
            title: 'Are you sure?',
            text: 'You are about to log out of the system.',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#6c757d',
            confirmButtonText: 'Yes, log me out',
            cancelButtonText: 'Cancel'
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('logout-form').submit();
            }
        });
    }
    </script>
    @endauth

    <div class="py-4">
        @yield('content')
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
@if(session('success'))
<script>
Swal.fire({
  icon: 'success',
  title: 'Success',
  text: @json(session('success'))
});
</script>
@endif
</body>
</html>