<?php

namespace App\Http\Controllers;

use App\Mail\SubscriptionEmail;
use App\Models\Subscription;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class SubscribeController extends Controller
{
    public function subscribe(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|email|unique:subscriptions',
        ]);

        $subscriber = Subscription::add($request->get('email'));


        Mail::to($subscriber)->send(new SubscriptionEmail($subscriber));
        return redirect()->back()->with('status', 'Проверьте Вашу почту!');
    }

    public function verify($token)
    {
        $subscriber = Subscription::where('token', $token)->firstOrFail();
        $subscriber->token = null;
        $subscriber->save();

        return redirect('/')->with('status', 'Ваша почта была успешно подтверждена!');
    }
}
