<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Mail\SubscriptionEmail;
use App\Models\Subscription;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class SubscribersController extends Controller
{

    public function index()
    {
        $subscribers = Subscription::all();

        return view('admin.subscribers.index', compact('subscribers'));
    }

    public function create()
    {
        $subscribers = Subscription::all();

        return view('admin.subscribers.create', compact('subscribers'));
    }

    public function store(Request $request)
    {
        //
        $this->validate($request, [
            'email'  => 'required|email|unique:subscriptions',
        ]);

        $subscriber = Subscription::add($request->email);
        Mail::to($subscriber)->send(new SubscriptionEmail($subscriber));

        $subscriber->save($request->all());

        return redirect()->route('subscribers.index');
    }

    public function destroy($id)
    {
        Subscription::find($id)->remove();

        return redirect()->back();

        // И Л И  М О Ж Н О   Т А К //
        //return redirect()->route('subscribers.index');
    }
}
