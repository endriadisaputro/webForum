<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Forum;

class ProfileController extends Controller
{
    public function index(User $user)
    {
    	$forums =Forum::where('user_id',$user->id)->get();
    	return view('profile.index', compact('user','forums'));
    }
}
