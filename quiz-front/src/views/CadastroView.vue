<template>
    <NavbarAll />
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 menu">
                <div class="row" style="height: 44vh;">
                    <div class="col-7 bg-text ">
                        <h3 class="align">Bem vindo(a)</h3>
                        <h6>Faça seu cadastro para jogar e competir no jogo de perguntas, o quiz se baseia em pontuação,
                            quem tem mais acertos em menos tempo terá o maior resultado.<br>
                            Faça Seu Cadastro e jogue, é 100% gratuito e dispute sua pontuação com outros jogadores.</h6>
                    </div>
                    <div class="col-5 bg-i">
                        <h3 class="text-start ms-3">Cadastro</h3>
                        <label for="nome" class="d-flex">Nome</label>
                        <input type="text" id="nome" v-model="nome" class="form-control">
                        <label for="" class="d-flex mt-2">E-mail</label>
                        <input type="text" id="email" v-model="email" class="form-control">
                        <label for="" class="d-flex mt-2">Senha</label>
                        <input type="password" id="senha" v-model="senha" class="form-control">
                        <div id="request" class="mt-3"></div>
                        <button class="btn btn-success mt-3" v-on:click="cadastrar"> <span id="spinner"
                                class="spinner-border spinner-border-sm text-info visually-hidden" role="status"
                                aria-hidden="true"></span> Cadastrar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import NavbarAll from '@/components/navbar/NavbarAll.vue';
export default {
    name: 'CadastroView',
    components: {
        NavbarAll
    },
    methods: {
        async cadastrar() {
            let spinner = document.querySelector("#spinner");
            let resultado = document.querySelector("#request");


            // add efeito spinner load no button
            spinner.classList.remove("visually-hidden");
            
            if ( this.nome == null || this.email == null || this.senha == null) {
                spinner.classList.add("visually-hidden");
                resultado.innerHTML = "<p class='text-warning'>Preencha as informações !</p>";
            }
            else {
                const data = await axios.post("http://localhost:8080/cadastro", {
                    nome: this.nome,
                    email: this.email,
                    senha: this.senha
                }).then(request => request);

                console.log(data);
                if (data.status == 200) {
                    spinner.classList.add("visually-hidden");

                    if (data.data.success == 'true') {
                        resultado.innerHTML = "<p class='text-info'>Dados Cadastrados com sucesso !</p>";
                    } else {
                        resultado.innerHTML = "<p class='text-warning'>E-mail já cadastrado anteriormente!</p>";
                    }
                } else {
                    spinner.classList.add("visually-hidden");
                    resultado.innerHTML = "<p class='text-danger'>Servidor fora do ar, tente mais tarde!</p>";
                }
            }
        }
    }
}
</script>

<style>
.align {
    margin-top: 13%;
}

.menu {
    margin-top: 23vh;
}

.bg-text {
    background: rgb(6 0 255 / 60%);
    color: wheat;
}

.bg-i {
    background: rgb(6 0 255 / 60%);
    color: wheat;
    padding: 5vh;
}

body {
    background-size: 30% 52%;
    background-image: url("../assets/img/capa_game.png");
}</style>