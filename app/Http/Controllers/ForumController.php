<?php

namespace App\Http\Controllers;

use App\Models\Forum;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Auth;
use DB;
use Storage;

class ForumController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->except('index','show','populars');
    }
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

        $forums=Forum::paginate(5);
        return view('forum.index', compact('forums','populars'));  
    }

    public function populars()
    {
        $populars=DB::table('forums')
                    ->join('views','forums.id','=','views.viewable_id')
                    ->select(DB::raw('count(viewable_id) as count'),'forums.id','forums.title','forums.slug')
                    ->groupBy('id','title','slug')
                    ->orderBy('count','desc')
                    ->take(5)
                    ->get();

        return view('forum.populars', compact('populars'));  
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
        $request->validate([
            'title'=>'required',
            'description'=>'required',
            'tags'=>'required',
            'image'=>'image|mimes:jpg,jpeg,png|max:1024'
        ]);


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

        return back()->withInfo('Pertanyaan Berhasil di Kirim!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Forum  $forum
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

        $forums=Forum::where('id', $slug)
                ->orWhere('slug', $slug)
                ->firstOrFail();

        views($forums)->record();

        return view('forum.show', compact('forums','populars'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Forum  $forum
     * @return \Illuminate\Http\Response
     */
    public function edit($slug)
    {
        $tags=Tag::all();
        
        $forum=Forum::where('id', $slug)
                ->orWhere('slug', $slug)
                ->firstOrFail();

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
        $request->validate([
            'title'=>'required',
            'description'=>'required',
            'tags'=>'required',
            'image'=>'image|mimes:jpg,jpeg,png|max:1024'
        ]);

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

        return back()->withInfo('Pertanyaan Berhasil di Update!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Forum  $forum
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $forum=Forum::find($id);
        Storage::delete($forum->image);
        $forum->tags()->detach();
        $forum->delete();
        return back()->withInfo('Pertanyaan berhasil di Hapus !!');
    }
}
