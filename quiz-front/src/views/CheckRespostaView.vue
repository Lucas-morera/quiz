<template>
<br>
  <router-link to="/">Voltar</router-link><br><br><br><br>
  <h1>Acertos <span class="text-primary">{{ scoreView }}</span></h1>
  <h1>Erros <span class="text-danger">{{ erros }}</span></h1>
  <h5>{{ data.success }}</h5>
</template>

<script>
import axios from 'axios';

export default {
  data: () => ({
    scoreView: sessionStorage.getItem("acertos") == null ? 0 : sessionStorage.getItem("acertos"),
    erros: sessionStorage.getItem("erros") == null ? 0 : sessionStorage.getItem("erros") ,
    data: '',
    idLogin: sessionStorage.getItem("idLogin"),
    idNome: sessionStorage.getItem("idNome"),
  }),
  mounted(){
    // this.data = '';
  },
  methods: {
    async result() {
      await axios.post("http://localhost:8080/score", { "score": sessionStorage.getItem("acertos") , "idLogin" : sessionStorage.getItem("idLogin") , "idNome" : sessionStorage.getItem("idNome")})
        .then((response) => { this.data = response.data  })
    }
  },
  beforeMount(){
    this.result();
  }
 

}
setTimeout(() => {
    sessionStorage.removeItem('erros');
    sessionStorage.removeItem('acertos');
    sessionStorage.removeItem('score');
}, "1000");

</script>

<style></style>
