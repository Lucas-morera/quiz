<template>
    <NavbarAll />

    <div class="container-fluid">
        <div class="row">
            <div class="numero" id="numero"></div>
            <div class="menu">
                <div class="col-12 text-start">
                    <h4 class="title mt-4"> {{ questions.PERGUNTA }}</h4><br><br>
                    <input type="radio" class="form-check-input ms-2" v-bind:value="questions.QUESTAO_1" name="computer"
                        required>
                    <label class="" for="computer">{{ questions.QUESTAO_1 }}</label><br>
                    <input type="radio" class="form-check-input ms-2" v-bind:value="questions.QUESTAO_2" name="computer"
                        required>
                    <label for="computer">{{ questions.QUESTAO_2 }}</label><br>
                    <input type="radio" class="form-check-input ms-2" v-bind:value="questions.QUESTAO_3" name="computer"
                        required>
                    <label for="computer">{{ questions.QUESTAO_3 }}</label><br>
                    <input type="radio" class="form-check-input ms-2" v-bind:value="questions.QUESTAO_4" name="computer"
                        required>
                    <label for="computer">{{ questions.QUESTAO_4 }}</label>
                    <br>
                    <button id="btn" class="btn btn-info" v-on:click="dataForm()">Enviar</button>

                </div>
            </div>
        </div>
    </div>
</template>

<script>
import router from '@/router';
import axios from 'axios';
import NavbarAll from '@/components/navbar/NavbarAll.vue';
// console.log(console.log(Object.keys(sessionStorage)));

// Verifica se está logado para jogar
if (window.sessionStorage.getItem('server') == null) {
    alert('faça o cadastro');
    router.push('/');
}
// console.log((typeof sessionStorage.getItem("acertos")));

export default {
    async mounted() {
        // Número de perguntas respondidas /10.
        var totalRespondida = null;
        if (typeof sessionStorage.getItem("erros") != 'object' || typeof sessionStorage.getItem("acertos") != 'object') {
            if (typeof sessionStorage.getItem("erros") == "string" || typeof sessionStorage.getItem("acertos") == "string") {
                if (typeof sessionStorage.getItem("erros") == "string" && typeof sessionStorage.getItem("acertos") == "object") {
                    totalRespondida = parseInt(sessionStorage.getItem("erros"));
                } if (typeof sessionStorage.getItem("acertos") == "string" && typeof sessionStorage.getItem("erros") == "object") {
                    totalRespondida = parseInt(sessionStorage.getItem("acertos"));
                } if (typeof sessionStorage.getItem("acertos") == "string" && typeof sessionStorage.getItem("erros") == "string") {
                    totalRespondida = parseInt(sessionStorage.getItem("acertos")) + parseInt(sessionStorage.getItem("erros"));
                }
            }
            document.getElementById("numero").innerHTML = totalRespondida + "/10";
        }
        else {
            document.getElementById("numero").innerHTML = "0/10";
        }

        // Questões que vem do banco
        var dataRes = await axios.get('http://localhost:8080/gamep');
        this.questions = dataRes.data;
        //Se o ID vier igual, a pergunta não irá repitir porque vai fazer otra req até mudar.
        if (dataRes.data.ID == sessionStorage.getItem('lastQuestion')) {
            dataRes = await axios.get('http://localhost:8080/gamep');
            this.questions = dataRes.data;
        }
        sessionStorage.setItem('lastQuestion', dataRes.data.ID);
    },
    data: () => ({
        questions: JSON,
    }),
    methods: {
        dataForm() {
            const selectedRadio = document.querySelector("input[name='computer']:checked")
            if (selectedRadio == null) {
                alert('preencha');
            }
            else {
                if (selectedRadio.value == this.questions.RESPOSTA) {
                    var acertos = sessionStorage.getItem('acertos');
                    sessionStorage.setItem('acertos', ++acertos)
                    var scoreAtual = null;

                    if (typeof sessionStorage.getItem("erros") != 'object' || typeof sessionStorage.getItem("acertos") != 'object') {
                        if (typeof sessionStorage.getItem("erros") == "string" || typeof sessionStorage.getItem("acertos") == "string") {
                            if (typeof sessionStorage.getItem("erros") == "string" && typeof sessionStorage.getItem("acertos") == "object") {
                                scoreAtual = parseInt(sessionStorage.getItem("erros"))
                            } if (typeof sessionStorage.getItem("acertos") == "string" && typeof sessionStorage.getItem("erros") == "object") {
                                scoreAtual = parseInt(sessionStorage.getItem("acertos"))
                            } if (typeof sessionStorage.getItem("acertos") == "string" && typeof sessionStorage.getItem("erros") == "string") {
                                scoreAtual = parseInt(sessionStorage.getItem("acertos")) + parseInt(sessionStorage.getItem("erros"));
                            }
                        }
                    }

                    var score = scoreAtual;
                    sessionStorage.setItem("score", score);
                    console.log((sessionStorage.getItem("score")))

                    // Caso tenha feito as 10 questões
                    if (scoreAtual == 10) {
                        router.push("/check")
                    }
                    else {
                        window.location.reload();
                    }
                } else {
                    var erros = sessionStorage.getItem('erros');
                    sessionStorage.setItem('erros', ++erros);
                    var scoreAtualE = null;

                    if (typeof sessionStorage.getItem("erros") != 'object' || typeof sessionStorage.getItem("acertos") != 'object') {
                        if (typeof sessionStorage.getItem("erros") == "string" || typeof sessionStorage.getItem("acertos") == "string") {
                            if (typeof sessionStorage.getItem("erros") == "string" && typeof sessionStorage.getItem("acertos") == "object") {
                                scoreAtualE = parseInt(sessionStorage.getItem("erros"))
                            } if (typeof sessionStorage.getItem("acertos") == "string" && typeof sessionStorage.getItem("erros") == "object") {
                                scoreAtualE = parseInt(sessionStorage.getItem("acertos"))
                            } if (typeof sessionStorage.getItem("acertos") == "string" && typeof sessionStorage.getItem("erros") == "string") {
                                scoreAtualE = parseInt(sessionStorage.getItem("acertos")) + parseInt(sessionStorage.getItem("erros"));
                            }
                        }
                    }
                    var scoreE = scoreAtualE;
                    sessionStorage.setItem('score', scoreE);

                    console.log(sessionStorage.getItem('score'));
                    // Caso tenha feito as 10 questões
                    if (scoreAtualE == 10) {
                        router.push("/check")
                    } else {
                        window.location.reload();
                    }
                }
            }

        }
    },

    components: {
        NavbarAll
    }

}
</script>
<style>
.numero {
    position: absolute;
    top: 10vh;
}

.menu {
    background-color: #cac6c6;
    width: 90vh;
    height: 70vh;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
    border-radius: 3vh;
}

input {
    margin-bottom: 2rem;
}

#btn {
    /* margin-left: 3vh; */
    width: 20%;
}

label {
    font-size: 2.5vh;
    margin-left: 1vh;
}

h4 {
    font-size: 3.4vh;
}</style>