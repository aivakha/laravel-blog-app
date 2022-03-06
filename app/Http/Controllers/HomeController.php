<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Post;
use App\Models\Tag;
use Illuminate\Http\Request;

class HomeController extends Controller
{
   public function index()
   {
       $posts = Post::paginate(2);

       return view('pages.index', [
           'posts' => $posts,
       ]);
   }

   public function single($slug)
   {
       $post = Post::where('slug', $slug)->firstOrFail();

       return view('pages.single', compact('post'));
   }

   public function tag($slug)
   {
       $tag = Tag::where('slug', $slug)->firstOrFail();

       $posts = $tag->posts()->paginate(2);

       return view('pages.list', compact('posts'));
   }

    public function category($slug)
    {
        $category = Category::where('slug', $slug)->firstOrFail();

        // Collection struct
        $posts = $category->posts()->paginate(2);

        dd($posts);

        return view('pages.list', compact('posts'));
    }



}
