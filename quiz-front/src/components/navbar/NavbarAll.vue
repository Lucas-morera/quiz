<template>
  <nav class="p-3 navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <i class="bi bi-dice-4 me-5"></i>
            <!-- <router-link to="/" >Home</router-link> -->
            <a href="/">Home</a>
          </li>
        </ul>
        <ul class="navbar-nav ms-4">
          <li class="nav-item">
            <!-- <router-link to="/game">Jogar</router-link> -->
            <a href="/game">Jogar</a>
          </li>
          <li class="nav-item ms-4">
            <!-- <router-link to="/cadastro">cadastro</router-link> -->
            <a href="/cadastro">Cadastro</a>
          </li>
          <li class="nav-item ms-4">
            <!-- <router-link to="/" >Home</router-link> -->
            <a href="/login">Login</a>
          </li>
        </ul>
        <span id="no" class="position-absolute end-0 me-5 pe-5">{{ nomeUser }}</span>
        <span class="position-absolute end-0 me-5"><i class="bi bi-person-circle" style="font-size: 1.5rem; "></i></span>
        <span v-if="this.nomeUser" class="position-absolute end-0 me-2"><i class="bi bi-box-arrow-right"
            style="font-size: 1.5rem; cursor: pointer;" @click="exit()" title="Sair"></i></span>
      </div>
    </div>
  </nav>
</template>

<script>
// window.sessionStorage.clear();
export default {
  name: 'NavbarAll',
  data() {
    return {
      nomeUser: '',
    }
  }
  , mounted() {
    if (window.sessionStorage.getItem('server') != null) {
      this.nomeUser = window.sessionStorage.getItem('server');
    }
  },methods:{
    exit(){
        window.sessionStorage.removeItem('server');
        window.sessionStorage.removeItem('idLogin');
        window.sessionStorage.removeItem('idNome');
        window.sessionStorage.removeItem('acertos');
        window.sessionStorage.removeItem('erros');
        window.sessionStorage.removeItem('score');
        
      if(window.sessionStorage.getItem('server') === null && window.sessionStorage.getItem('idLogin') === null && window.sessionStorage.getItem('idNome') === null){
        window.location.reload();
      }
    }
  }
}
</script>

<style>
a {
  text-decoration: none !important;
}

li {
  font-size: 19px;
  list-style-type: none;
  text-align: center;
}
</style>