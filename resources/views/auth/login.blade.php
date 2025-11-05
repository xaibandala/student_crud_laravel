@extends('layouts.app')

@section('content')
<div class="d-flex justify-content-center align-items-center" style="min-height: 100vh; margin: 0; padding: 0;">
    <div class="col-11 col-sm-8 col-md-6 col-lg-4">
        <div class="card shadow-lg">
            <div class="card-body p-4">
                <div class="text-center mb-4">
                    <img src="{{ asset('images/ama2.png') }}" alt="Logo" class="mb-3" style="max-height: 80px; width: auto;">
                    <h4 class="mb-0">Admin Login</h4>
                </div>
                <form method="POST" action="{{ route('login.attempt') }}" autocomplete="off" id="loginForm">
                    @csrf

                    <div class="mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="text" 
                               class="form-control @error('email') is-invalid @enderror" 
                               id="email" 
                               name="email" 
                               value="{{ old('email') }}" 
                               autocomplete="off"
                               autocorrect="off"
                               autocapitalize="off"
                               spellcheck="false"
                               required 
                               autofocus>
                        @error('email')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="mb-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <label for="password" class="form-label mb-0">Password</label>
                            @if (Route::has('password.request'))
                                <a href="{{ route('password.request') }}" class="text-decoration-none small">
                                    Forgot Password?
                                </a>
                            @endif
                        </div>
                        <div style="position: relative;">
                            <input type="password" 
                                   class="form-control @error('password') is-invalid @enderror" 
                                   id="password" 
                                   name="password" 
                                   autocomplete="new-password"
                                   required
                                   style="background-color: white !important;">
                            <input type="text" 
                                   style="position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip: rect(0, 0, 0, 0); border: 0;" 
                                   aria-hidden="true">
                        </div>
                        @error('password')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                        <div class="mt-2">
                            <small class="text-muted">credentials: admin@example.com | admin12345</small>
                        </div>
                    </div>

                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="remember" name="remember" {{ old('remember') ? 'checked' : '' }}>
                        <label class="form-check-label" for="remember">Remember me</label>
                    </div>

                    <button type="submit" class="btn btn-primary w-100 py-2">
                        <i class="bi bi-box-arrow-in-right me-2"></i>Login
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

@push('styles')
<style>
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
        background-color: #f8f9fa;
        overflow: hidden;
    }
    .card {
        border: none;
        border-radius: 10px;
    }
    .form-control:focus {
        border-color: #0d6efd;
        box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.15);
    }
    .btn-primary {
        font-weight: 500;
    }
</style>
@endpush
@endsection
