<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Tag;
use App\Models\Forum;
use Str;
use DB;

class TagController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $populars=DB::table('forums')
                    ->join('views','forums.id','=','views.viewable_id')
                    ->select(DB::raw('count(viewable_id) as count'),'forums.id','forums.title','forums.slug')
                    ->groupBy('id','title','slug')
                    ->orderBy('count','desc')
                    ->take(5)
                    ->get();

        $tags=Tag::all();
        return view('tag.index',compact('tags','populars'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $tags=Tag::all();
        return view('tag.create',compact('tags'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $tag=new Tag;
        $tag->name=$request->name;
        $tag->slug=Str::slug($request->name);
        $tag->save();

        return back()->withInfo('Tag berhasil ditambahkan!!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        $populars=DB::table('forums')
                    ->join('views','forums.id','=','views.viewable_id')
                    ->select(DB::raw('count(viewable_id) as count'),'forums.id','forums.title','forums.slug')
                    ->groupBy('id','title','slug')
                    ->orderBy('count','desc')
                    ->take(5)
                    ->get();

        $tags=Tag::where('id', $slug)
                ->orWhere('slug', $slug)
                ->firstOrFail();

        views($tags)->record();

        return view('tag.show', compact('tags','populars'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $tag=Tag::find($id);
        return view('tag.edit', compact('tag'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $tag=Tag::find($id);
        $tag->name=$request->name;
        $tag->slug=Str::slug($request->name);
        $tag->save();

        return redirect()->route('tag.create')->withInfo('Tag berhasil di Update!!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $tag=Tag::find($id);
        $tag->delete();
        return redirect()->route('tag.create')->withInfo('Tag berhasil di Hapus!!');
    }
}
