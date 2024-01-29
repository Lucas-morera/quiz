<template>

    
    <div class="container">
        <div class="row">
            <div class="col-3 mb-4 mt-4">
                <router-link to="/painel">Lista </router-link>
                <!-- <a href="/painel">Lista de Perguntas</a>  -->
                <a href="/pergunta-cadastro" class="ms-4">Cadastro de Perguntas</a> 
            </div>
        </div>
        <div class="painel">
            <h3 class="text-center">Cadastro</h3>

            <label for="">Pergunta</label>
            <input type="text" class="form-control mb-4" id="pergunta">
            
            <label for="" class="">Questão 1</label>
            <input type="radio" class="ms-2" value="" name="quest" id="quest1" v-model="quest1" @click="teste(this.v1)" disabled="true">
            <input type="text" class="form-control mb-4" id="v1" v-model="v1" @keyup="onChange(this.v1)">
            

            <label for="" class="">Questão 2</label>
            <input type="radio" class="ms-2" value="" name="quest" id="quest2" @click="teste(this.v2)" disabled="true">
            <input type="text" class="form-control mb-4" id="v2" v-model="v2" @keyup="onChange(this.v2)">

            <label for="" class="">Questão 3</label>
            <input type="radio" class="ms-2" value="" name="quest" id="quest3" @click="teste(this.v3)" disabled="true">
            <input type="text" class="form-control mb-4" id="v3" v-model="v3" @keyup="onChange(this.v3)">

            <label for="" class="">Questão 4</label>
            <input type="radio" class="ms-2" value="" name="quest" id="quest4" @click="teste(this.v4)" disabled="true">
            <input type="text" class="form-control mb-4" id="v4" v-model="v4" @keyup="onChange(this.v4)">
            <div class="text-center">
                <div id="request" class=""></div><br>
                <button class="btn btn-info w-50" @click="value()">Enviar</button>
            </div>
        </div>

    </div>


</template>

<script>
import axios from 'axios';
export default{

    methods:{
        value(){
            // Inputs
             let pergunta = document.querySelector("#pergunta").value;
             let v1 = document.querySelector("#v1").value;
             let v2 = document.querySelector("#v2").value;
             let v3 = document.querySelector("#v3").value;
             let v4 = document.querySelector("#v4").value;
             
             if(pergunta == '' || v1 == '' || v2 == '' || v3=='' || v4 == ''){
                document.querySelector("#request").innerHTML='<span class="text-warning"> Preencha as informações !<span>';
             }else{
             axios.post("http://localhost:8080/cadastrar-perguntas",{"pergunta" : pergunta , "questao_1": v1 , "questao_2": v2 , "questao_3": v3 ,"questao_4": v4 , "resposta" : this.resp})
             .then((r)=>{
                if(r.data.success=='false'){
                    document.querySelector("#request").innerHTML='<span class="text-warning"> Ocorreu um erro, tente mais tarde!<span>';
        
                }else{
                    document.querySelector("#request").innerHTML='<span class="text-info"> Dados cadastrados com sucesso !<span>';
                        setTimeout(() => {
                            window.location.reload();
                        }, 2000);
                }
             });
            }
        }, 
        teste(e){
            return this.resp = e ;
        },
        onChange(e){
            if( e != '' ){
                document.getElementById("quest1").disabled=false;
                document.getElementById("quest2").disabled=false;
                document.getElementById("quest3").disabled=false;
                document.getElementById("quest4").disabled=false;
            }
        }

    },
    data(){
        return{
            resp : '',
        }
    }
}

</script>

<style>
.painel{
    width: 70vh;
    height: 87vh;
    margin-left: auto;
    margin-right: auto;
    background-color:gray;
    padding: 3vh;
    color: white;
    text-align: left;
}
</style>