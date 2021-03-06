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

Route::resource('/forum', 'App\Http\Controllers\ForumController');

Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
     \UniSharp\LaravelFilemanager\Lfm::routes();
 });

Route::get('/forum/read/{slug}', 'App\Http\Controllers\ForumController@show')->name('forumslug');
Route::post('/comment/addComment/{forum}', 'App\Http\Controllers\CommentController@addComment')->name('addComment');
Route::post('/comment/replyComment/{comment}', 'App\Http\Controllers\CommentController@replyComment')->name('replyComment');

Route::get('/populars', 'App\Http\Controllers\ForumController@populars')->name('populars');
Route::get('/user/{user}', 'App\Http\Controllers\ProfileController@index')->name('profile');

Route::resource('/tag', 'App\Http\Controllers\TagController');