<?php

use App\Http\Controllers\GamegeralController;
use Illuminate\Support\Facades\Route;

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

Route::get('/gamep',[GamegeralController::class,'index'])->name('index');

Route::post('/cadastro',[GamegeralController::class,'cadastro'])->name('cadastro');

Route::post('/login',[GamegeralController::class,'login'])->name('login');

Route::post('/score',[GamegeralController::class,'score'])->name('score');

Route::post('/questions',[GamegeralController::class,'questions'])->name('questions');

Route::post('/deletar',[GamegeralController::class,'deletar'])->name('deletar');

Route::post('cadastrar-perguntas',[GamegeralController::class,'cadastrarPerguntas'])->name('cadastrarPerguntas');

Route::post('ranking',[GamegeralController::class,'ranking'])->name('ranking');