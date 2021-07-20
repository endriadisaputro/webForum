<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ForumController;
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

// Route::get('/forum/create', [App\Http\Controllers\ForumController::class,'create']);
Route::resource('/forum', 'App\Http\Controllers\ForumController');

Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
     \UniSharp\LaravelFilemanager\Lfm::routes();
 });

Route::get('/forum/read/{slug}', 'App\Http\Controllers\ForumController@show')->name('forumslug');
Route::post('/comment/addComment/{forum}', 'App\Http\Controllers\CommentController@addComment')->name('addComment');
Route::post('/comment/replyComment/{comment}', 'App\Http\Controllers\CommentController@replyComment')->name('replyComment');