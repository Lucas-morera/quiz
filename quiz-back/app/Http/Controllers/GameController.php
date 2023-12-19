<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class GameController extends Controller
{
    public function index(){
        $data = DB::table('perguntas')
        ->inRandomOrder()
        ->first();

        return response()->json(["ID" =>$data->ID ,"PERGUNTA"=> $data->PERGUNTA, "QUESTAO_1"=> $data->QUESTAO_1, "QUESTAO_2"=> $data->QUESTAO_2, "QUESTAO_3"=> $data->QUESTAO_3, "QUESTAO_4"=> $data->QUESTAO_4, "RESPOSTA"=> $data->RESPOSTA, ]);
    }

    public function cadastro(Request $request){
       $nome = $request->nome;
       $email = $request->email;
       $senha = $request->senha;

       $usuarios = DB::table('usuarios')
       ->where('email', '=', $email)->first();


        if($usuarios){
          return response()->json(['success' => 'false' ]);
        }
        else{
         $query =  DB::table('usuarios')->insert(['email' => $email ,'nome' => $nome , 'senha' => Hash::make($senha) ]); 
          if($query){
            return response()->json(['success'=>'true']);
          }
       }
       
    }

    public function login(){

      return response()->json(['success','true']);
    }

    public function score(Request $request){

      echo $request->score;
    }
}
