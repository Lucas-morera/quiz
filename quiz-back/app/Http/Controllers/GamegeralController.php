<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class GamegeralController extends Controller
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

       $telefone =  Str::replace(' ','',Str::replace('-','',Str::replace(')','',Str::replace('(','',$request->telefone))));
       $cpf = Str::replace('.','',Str::replace('-','', $request->cpf));

       $usuarios = DB::table('usuarios')
       ->where('email', '=', $email)->first();


        if($usuarios){
          return response()->json(['success' => 'false' ]);
        }
        else{
         $query=DB::table('usuarios')->insert(['email'=>$email,'nome'=>$nome,'senha'=>Hash::make($senha) , 'telefone' => $telefone , 'cpf' => $cpf]); 
          if($query){
            return response()->json(['success'=>'true']);
          }
       }
       
    }

    public function login(Request $request){
    $email =  DB::table('usuarios')->where('email','=',$request->email)->first();
    if($email){
      if (Hash::check($request->senha, $email->senha)) {
        return response()->json(["success"=>"true","idlogin"=>$email->id,"idNome"=>$email->nome]);
      }
    }
    else{
      return response()->json(['success'=>'false']);
    }
  }
  
    public function score(Request $request){

      $query = DB::table('score')->where("usuario_fk","=",$request->idLogin)->first();
      

      ///////////////////////////////////////
      ///////////// Se já tiver jogado//////
      //////////////////////////////////////
      if($query != null){

        DB::table('score')->where('id',$request->idLogin)->update(['score'=>$request->score]);
       
        return response()->json(["success"=>"Score Atualizado!"]);
      }
      ///////////////////////////////////////
      ////// se não estiver jogado//////////
      /////////////////////////////////////
      else{
        DB::table('score')->insert([ 
          'usuario_fk' => $request->idLogin,
          'nome'=>$request->idNome,
          'score'=>$request->score 
        ]);

        return response()->json(["success"=>"Recorde Salvo !"]);
      }

    }

    public function questions(){

    $dados = DB::table('perguntas')->where('ACTIVE','=','Y')->get();
      return response()->json($dados);
    }
    
    public function deletar(Request $request){
      $verify = DB::table('perguntas')->where('ID', '=', $request->id)->update(['ACTIVE' => 'N']); 

      if($verify == true){
        return response()->json(["success"=>"true"]);
      }
      else{
        return response()->json(["success"=>"false"]);
      }

    }

    public function cadastrarPerguntas(Request $request){
     $verify = DB::table('perguntas')->insert([
        'PERGUNTA'=> $request->pergunta,
        'QUESTAO_1' => $request->questao_1,
        'QUESTAO_2' => $request->questao_2,
        'QUESTAO_3' => $request->questao_3,
        'QUESTAO_4' => $request->questao_4,
        'RESPOSTA'  => $request->resposta,
        'ACTIVE' => 'Y'
      ]);

      if($verify){
        return response()->json(["success"=>"true"]);
      }
      else{
        return response()->json(["success"=>"false"]);
      }
    }

    public function ranking(){
    $score = DB::table('score as s')
    ->join('usuarios as u', 'u.id', '=', 's.usuario_fk')
    ->select('s.nome', DB::raw('MAX(s.score) as maior'))
    ->groupBy('s.usuario_fk', 's.nome')
    ->orderByDesc('maior')
    ->limit(3)
    ->get();


  $usuarios = [];

  foreach ($score as $value) {
      $usuarios[] = $value->nome;
  }

  return $usuarios;

  }
}
