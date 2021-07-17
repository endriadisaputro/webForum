<?php

namespace App\Http\Controllers;

use App\Models\Forum;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Auth;

class ForumController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $forums=Forum::orderBy('id','desc')->paginate(1);
        $tags=Tag::all();
        return view('forum.create', compact('tags','forums'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $forums=New Forum;
        $forums->user_id=Auth::user()->id;
        $forums->title=$request->title;
        $forums->slug=Str::slug($request->title);
        $forums->description=$request->description;
        if($request->file('image')){
            $file=$request->file('image');
            $filename=time().'.'.$file->getClientOriginalExtension();
            $location=public_path('/images');
            $file->move($location, $filename);
            $forums->image=$filename;
        }
        $forums->save();

        $forums->tags()->sync($request->tags);

        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Forum  $forum
     * @return \Illuminate\Http\Response
     */
    public function show(Forum $forum)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Forum  $forum
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $tags=Tag::all();
        $forum=Forum::find($id);
        return view('forum.edit', compact('forum','tags'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Forum  $forum
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $forums=Forum::find($id);
        $forums->user_id=Auth::user()->id;
        $forums->title=$request->title;
        $forums->slug=Str::slug($request->title);
        $forums->description=$request->description;
        if($request->file('image')){
            $file=$request->file('image');
            $filename=time().'.'.$file->getClientOriginalExtension();
            $location=public_path('/images');
            $file->move($location, $filename);

            $oldImage=$forums->image;
            \Storage::delete($oldImage);

            $forums->image=$filename;
        }
        $forums->save();

        $forums->tags()->sync($request->tags);

        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Forum  $forum
     * @return \Illuminate\Http\Response
     */
    public function destroy(Forum $forum)
    {
        //
    }
}
