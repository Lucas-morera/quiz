<template>
    <router-link to="/">Voltar</router-link><br>
    <p>Acertos <span class="text-primary">{{ scoreView }}</span></p>
</template>

<script>
import axios from 'axios';



axios.post("http://localhost:8080/score",{ "score" : sessionStorage.getItem("score") }) .then((response) => response)
.then((data) => { data });




export default {
    data: () => ({
    scoreView : sessionStorage.getItem("score"),
    data:''
  }),
}
// setTimeout(() => {
//     sessionStorage.removeItem('score');
// }, "9000");

</script>

<style></style>
