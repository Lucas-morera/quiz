<template>
    <NavbarAll/>
    <div class="container-fluid">

  <img class="img mt-5" src="../assets/img/capa.jpg" alt="">

  <div class="mt-5 w-100">
    <h5 class="">Ranking de jogadores (Nicks)</h5>
    <hr class="sublin mb-5">
  </div>

  <div class="scroll mb-5">
    <div class="m-scroll row" >
      <span class="mt-5 pt-5 ps-5" v-if="position[0]">1º Lugar {{ position[0] }}</span>
      <span class="mt-5 pt-5" v-if="position[1]">2º Lugar {{ position[1] }} </span>
      <span class="mt-5 pt-5" v-if="position[2]">3º Lugar {{ position[2] }} </span>
    </div>
    <span class="mt-5 pt-5" v-if="position[0] == null && position[1] == null && position[2] == null">Sem informações</span>
  </div>

    <div class="row mb-4">
      <div class="col-6">
        <h5 >Faça seu login e jogue</h5>
        <hr class="sublin mb-4 " style="color:yellow;opacity: inherit;">
        <div>
          <p>Primeiro crie um cadastro para jogar o quiz.<br/> Logo após realizar o cadastro, logue
          no site e depois jogue.
        </p>
        </div>
      </div>
      <div class="col-6 position-relative">
        <a href="/cadastro" class="btn btn-success position-absolute position-absolute top-50 start-50 translate-middle">Cadastro <i class="bi bi-arrow-right-circle"></i></a>
      </div>
    </div>

  </div>

</template>

<script>
import NavbarAll from './navbar/NavbarAll.vue';
import axios from 'axios';

export default {
  name: 'HelloWorld',
  components:{
    NavbarAll
  },
  beforeMount(){
    axios.post('http://localhost:8080/ranking').then((t)=>{this.position = t.data});
  },
  data(){
    return{
      position:Array
    }
  }

}
</script>

<style>

.sublin {
  width: 42vh;
  border: 3px solid;
  border-radius: 1rem;
  background-color: #ffff4b!important;
  margin: auto;
  opacity: auto!important;
  color: #a8a8a8;
}

.img {
  /* width:100% ; */
  max-inline-size: 100%;
  block-size: auto;
  aspect-ratio: 2/1;
  object-fit: contain;
}

/* scroll verticale */

body {
  margin: 0;
}

.scroll {
  position: relative;
  width: 98%;
  background-color: $boxify-bg-light-dark;
  overflow: hidden;
  z-index: 1;
  margin: 0;
  padding: 0;
  height: 30vh;
 background-color: #ffff4b;
 margin-left:auto;
 margin-right:auto;
}

.m-scroll {
  overflow: hidden;
  height: 100%;
  white-space: nowrap;
  /* time of scroll */
  animation: scrollText 6s infinite linear;
  margin: 0;
  display: table-footer-group!important;
  justify-content: space-between;
  width: 200%;
  margin: 0 !important;
}

span {
  display: inline-block;
  margin: 0;
  padding: 0;
  color: black;
}

@keyframes scrollText {
  from {
    transform: translateX(0%);
  }

  to {
    transform: translateX(-50%);
  }
}
</style>

