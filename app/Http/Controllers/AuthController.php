<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Notifications\RegisterUserNotification;
use Illuminate\Http\Request;
//use Illuminate\Notifications\Notification;
use Notification;
use Illuminate\Support\Facades\Auth;


class AuthController extends Controller
{
    // R E G I S T R A T I O N
    public function registerForm()
    {
        return view('pages.register');
    }

    public function register(Request $request)
    {
        $this->validate($request, [
           'name'       => 'required',
           'email'      => 'required|email|unique:users',
           'password'   => 'required',
        ]);

        $user = User::add($request->all());
        $user->generatePassword($request->get('password'));

        // QUEUE
        $admins = User::where('is_admin', 1)->get();
        Notification::send($admins, new RegisterUserNotification($user));

        Auth::login($user);

        return redirect('/')->with('status', "Thank you for registration!");;
    }

    // L O G I N
    public function loginForm()
    {
        return view('pages.login');
    }

    public function login(Request $request)
    {
        $this->validate($request, [
            'email'      => 'required|email',
            'password'   => 'required',
        ]);

        if ($request = Auth::attempt([
            'email'      => $request->get('email'),
            'password'   => $request->get('password'),
        ])) {

            return redirect('/');
        }
        return redirect()->back()->with('status', 'Неправильный логин или пароль');



    }

    public function logout()
    {
        Auth::logout();

        return redirect('/login');
    }



}
