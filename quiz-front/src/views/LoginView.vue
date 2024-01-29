<template>
    <NavbarAll />

    <div class="container-fluid">
        <div class="row d-flex justify-content-center">
            <div class="junbotron">
                <h3 class="float-start">Login</h3> <br />
                <label for="email" class="d-flex mt-5">E-mail</label>
                <input type="text" class="form-control mt-1" id="email" v-model="email" @keyup.enter="request">
                <label for="" class="mt-3 d-flex">Senha</label>
                <input type="password" class="form-control mt-1" v-model="senha" @keyup.enter="request">
                <div id="resposta" class="mt-3"></div>
                <button class="btn btn-success mt-4" @click="request"><span id="spinner" class="spinner-border spinner-border-sm text-primary-emphasis d-none" aria-hidden="true"></span> Enviar</button>
            </div>

        </div>
    </div>
</template>

<script>
import NavbarAll from '@/components/navbar/NavbarAll.vue';
import axios from 'axios';
import router from '@/router';

export default {
    name: 'LoginView.vue',
    components: {
        NavbarAll
    },
    methods: {
        async request() {
            console.log(typeof this.senha )
            if ( (typeof this.senha !== "undefined" ||  this.senha == "") && (typeof this.email !== "undefined" ||  this.email == "" )) {
                document.querySelector("#spinner").classList.remove('d-none');
                const resp = await axios.post("http://localhost:8080/login", { "email": this.email, "senha": this.senha });
                
                if (resp.status == '200') {
                    document.querySelector("#spinner").classList.add('d-none');
                }

                if (resp.data.success == 'true') {
                    window.sessionStorage.setItem('server', resp.data.idNome);
                    window.sessionStorage.setItem('idLogin', resp.data.idlogin);
                    window.sessionStorage.setItem('idNome', resp.data.idNome);
                    if (window.sessionStorage.getItem('server') != null) {
                        router.push('/');
                    }
                } else {
                    document.querySelector("#resposta").innerHTML = '<span class="text-warning">Dados não encontrados !</span>'
                }
            }
            else {
                document.querySelector("#resposta").innerHTML = '<span class="text-warning">Preencha os campos !</span>'
            }
        }
    }
}
</script>

<style>
.junbotron {
    width: 60vh;
    height: 60vh;
    background-color: gray;
    margin-top: 14vh;
    padding: 3vh;
}
</style>