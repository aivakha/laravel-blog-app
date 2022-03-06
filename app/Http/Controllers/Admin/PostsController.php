<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Post;
use App\Models\Tag;
use Illuminate\Http\Request;

class PostsController extends Controller
{

    public function index()
    {
        $posts = Post::all();

        return view('admin.posts.index', ['posts' => $posts]);
    }


    public function create()
    {
        $categories = Category::pluck('title', 'id')->all();
        $tags       = Tag::pluck('title', 'id')->all();

        return view('admin.posts.create', compact('categories', 'tags'));
    }


    public function store(Request $request)
    {
        //
        $this->validate($request, [
           'title'      => 'required',
           'content'    => 'required',
           'date'       => 'required',
           'image'      => 'nullable|image',
        ]);

        $post = Post::add($request->all());
        $post->uploadImage($request->file('image'));
        $post->setCategory($request->get('category_id'));
        $post->setTags($request->get('tags'));
        $post->toggleFeatured($request->get('is_featured'));
        $post->toggleStatus($request->get('status'));

//        dd($request->all());
        return redirect()->route('posts.index');
    }


    public function edit($id)
    {
        $post       = Post::find($id);
        $categories = Category::pluck('title', 'id')->all();
        $tags       = Tag::pluck('title', 'id')->all();

        $selectedCategory = $post->category != null ? $post->category->id : '';
        $selectedTags     = $post->tags->pluck('id')->all();


        return view('admin.posts.edit', compact('categories', 'tags', 'post', 'selectedCategory', 'selectedTags'));
    }


    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'title'     => 'required',
            'content'   => 'required',
            'date'      => 'required',
            'image'     => 'nullable|image',
        ]);

        $post = Post::find($id);
        $post->edit($request->all());
        $post->uploadImage($request->file('image'));
        $post->setCategory($request->get('category_id'));
        $post->setTags($request->get('tags'));
        $post->toggleFeatured($request->get('is_featured'));
        $post->toggleStatus($request->get('status'));

        return redirect()->route('posts.index');
    }


    public function destroy(Request $request, $id)
    {
        Post::find($id)->remove();

        return redirect()->route('posts.index');
        //dd($request->all());
    }
}
