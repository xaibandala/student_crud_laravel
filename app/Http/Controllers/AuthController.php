<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

/**
 * Controller handling user authentication processes including login and logout functionality.
 */
class AuthController extends Controller
{
    /**
     * Display the login form.
     *
     * @return \Illuminate\View\View Returns the login view
     */
    public function showLogin()
    {
        return view('auth.login');
    }

    /**
     * Handle an authentication attempt.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function login(Request $request)
    {
        // Validate the incoming request data (email and password are required)
        $credentials = $request->validate([
            'email' => ['required', 'email'],    // Must be a valid email format
            'password' => ['required'],          // Password is required
        ]);

        // Check if 'remember me' was checked and convert to boolean
        $remember = (bool) $request->boolean('remember');

        // Attempt to authenticate the user with the provided credentials
        if (Auth::attempt($credentials, $remember)) {
            // Regenerate the session to prevent session fixation attacks
            $request->session()->regenerate();
            
            // Redirect to the intended URL or default to students.index
            // with a success message
            return redirect()->intended(route('students.index'))
                ->with('success', 'Welcome back! You have successfully logged in.');
        }

        // If authentication fails, redirect back with error message
        // and old input (except password for security)
        return back()->withErrors([
            'email' => 'Invalid credentials.',  // Generic error message for security
        ])->onlyInput('email');
    }

    /**
     * Log the user out of the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function logout(Request $request)
    {
        // Log the user out
        Auth::logout();
        
        // Invalidate the current session
        $request->session()->invalidate();
        
        // Regenerate CSRF token for security
        $request->session()->regenerateToken();

        // Redirect to login page after logout
        return redirect()->route('login');
    }
}
