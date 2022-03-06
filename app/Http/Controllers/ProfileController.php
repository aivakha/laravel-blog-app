<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ProfileController extends Controller
{
    public function index()
    {
        $user = Auth::user();


        return view('pages.profile', compact('user'));
    }

    public function update(Request $request)
    {

        $user = Auth::user();

        $this->validate($request, [
            'name'  => 'required',
            'email' => [
                'required',
                'email',
                Rule::unique('users')->ignore($user->id),
            ],
            //'password' => 'required',
            'avatar'    => 'nullable|image'
        ]);


        $user->edit($request->all());
        $user->generatePassword($request->get('password'));
        $user->uploadAvatar($request->file('avatar'));

//        echo 'ok';

        return redirect()->back()->with('status', 'Профиль был успешно обновлен');

//        $post = Post::find($id);
//        $post->edit($request->all());
//        $post->uploadImage($request->file('image'));
//        $post->setCategory($request->get('category_id'));
//        $post->setTags($request->get('tags'));
//        $post->toggleFeatured($request->get('is_featured'));
//        $post->toggleStatus($request->get('status'));
    }
}
