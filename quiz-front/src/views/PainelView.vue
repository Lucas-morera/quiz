<template>
   
    <div class="container mt-5">
        <div class="row">

            <div class="col-3 mb-3">
                <router-link to="/painel">Lista </router-link>
                <!-- <a href="/painel">Lista de Perguntas</a>  -->
                <a href="/pergunta-cadastro" class="ms-4">Cadastro de Perguntas</a> 
            </div>
            <div class="col-4">
                <div id="request" class="w-100"></div>
            </div>

            <div class="list">
            <table class="table">
                <thead>
                    <tr>
                        <th>Pergunta</th>
                        <th>Questão 1</th>
                        <th>Questão 2</th>
                        <th>Questão 3</th>
                        <th>Questão 4</th>
                        <th>Resposta</th>
                        <th>Deletar</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for=" ques in quest" :key="ques">
                        <td>{{ques.PERGUNTA }}</td>
                        <td>{{ques.QUESTAO_1 }}</td>
                        <td>{{ques.QUESTAO_2 }}</td>
                        <td>{{ques.QUESTAO_3 }}</td>
                        <td>{{ques.QUESTAO_4 }}</td>
                        <td>{{ques.RESPOSTA }}</td>
                        <td class="text-center"><button class="btn btn-danger" @click="deletar(ques.ID)"><i class="bi bi-trash3"></i></button></td>
                    </tr>
                </tbody>
            </table>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';

export default {
methods:{
    async dados(){
        axios.post("http://localhost:8080/questions").then((res)=>{ this.quest = res.data })
    },
    deletar(e){
        axios.post("http://localhost:8080/deletar",{"id":e}).then((res)=>{
            if(res.data.success == 'true'){
                document.querySelector("#request").innerHTML='<span class="text-white bg-success w-100">Dados Apagados !</span>'
                setTimeout(() => {
                    window.location.reload();    
                }, 1000);
            }
            console.log(res.data);
        });
    }
},
beforeMount(){
    this.dados();
},
data(){
    return{
        quest : [],
    }
}
}
</script>

<style>


.list{
    margin-right: 10vh;
    height: 80vh;
    width: 100%;
    text-align: justify;
    overflow-x: auto;
    overflow-y: auto;
}
html ::-webkit-scrollbar {
  width: 10px;
}
html ::-webkit-scrollbar-thumb {
  border-radius: 50px;
  background: #838393;
}
html ::-webkit-scrollbar-track {
  background: #ededed;
}
</style>