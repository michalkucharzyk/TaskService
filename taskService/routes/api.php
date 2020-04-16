<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::get('/getAll', 'TaskController@getAll');

Route::get('/getAllReact', 'TaskController@getAllReact');

Route::put('/update/{id}', 'TaskController@update');
Route::put('/updateStatusTaskReact/{id}', 'TaskController@updateStatusTaskReact');


Route::post('/add', 'TaskController@insert');
Route::post('/addReact', 'TaskController@insertReact');

Route::delete('/delete/{id}', 'TaskController@delete');
Route::delete('/deleteReact/{id}', 'TaskController@deleteReact');
Route::delete('/deleteAllTask/', 'TaskController@deleteAllTask');