<template>
  <NavbarAll />

  <div class="page-wrapper container-fluid d-flex align-items-center justify-content-center">
    <div class="login-card">
      
      <!-- Cabeçalho -->
      <div class="card-header-content text-center mb-4">
        <div class="brand-badge">
          <i class="bi bi-controller"></i> QUIZ GAME
        </div>
        <h3 class="login-title">Acessar Conta</h3>
        <p class="login-subtitle">Entre para registrar seu score no ranking</p>
      </div>

      <!-- Formulário -->
      <div class="form-body">
        <div class="mb-3">
          <label for="email" class="form-label">E-mail</label>
          <div class="input-wrapper">
            <i class="bi bi-envelope input-icon"></i>
            <input 
              type="text" 
              class="form-control custom-input" 
              id="email" 
              placeholder=""
              v-model="email" 
              @keyup.enter="request"
            >
          </div>
        </div>

       <div class="mb-3">
  <label class="form-label">Senha</label>
  <div class="input-wrapper">
    <i class="bi bi-lock input-icon"></i>
    
    <!-- Altere o type para a sua variável dinamicamente se quiser -->
    <input 
      :type="tipoCampo"
      class="form-control custom-input" 
      placeholder=""
      v-model="senha" 
      @keyup.enter="request"
    >

    <!-- Botão do olho -->
    <button 
      type="button" 
      class="btn-toggle-password" 
      @click="mostrarSenha"
      tabindex="-1"
    >
      <i class="bi bi-eye"></i> <!-- Alterne para bi-eye-slash via script -->
    </button>
  </div>
</div>

        <div id="resposta" class="response-message my-3"></div>

        <button class="btn btn-login w-100" @click="request">
          <span id="spinner" class="spinner-border spinner-border-sm text-primary-emphasis d-none" aria-hidden="true"></span>
          Enviar
        </button>
      </div>

    </div>
  </div>
</template>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@500;600;700;800&display=swap');

.page-wrapper {
  background-color: #f1f5f9 !important;
  background-image: 
    radial-gradient(at 0% 0%, rgba(79, 70, 229, 0.05) 0px, transparent 50%),
    radial-gradient(at 100% 100%, rgba(16, 185, 129, 0.05) 0px, transparent 50%) !important;
  font-family: 'Plus Jakarta Sans', sans-serif !important;
  min-height: calc(100vh - 70px);
  padding: 2rem 1rem;
}

.login-card {
  background: #ffffff;
  border: 1px solid #e2e8f0;
  border-radius: 24px;
  padding: 2.5rem 2rem;
  width: 100%;
  max-width: 420px;
  box-shadow: 0 10px 30px -5px rgba(15, 23, 42, 0.04);
}

.brand-badge {
  display: inline-flex;
  align-items: center;
  gap: 0.4rem;
  font-size: 0.75rem;
  font-weight: 800;
  letter-spacing: 0.08em;
  color: #4f46e5;
  background: #e0e7ff;
  padding: 0.35rem 0.85rem;
  border-radius: 50px;
  margin-bottom: 0.75rem;
}

.login-title {
  font-size: 1.6rem;
  font-weight: 800;
  color: #0f172a;
  margin-bottom: 0.25rem;
}

.login-subtitle {
  color: #64748b;
  font-size: 0.9rem;
  margin-bottom: 0;
}

.form-label {
  font-size: 0.85rem;
  font-weight: 700;
  color: #334155;
  margin-bottom: 0.4rem;
}

.input-wrapper {
  position: relative;
  display: flex;
  align-items: center;
}

.input-icon {
  position: absolute;
  left: 1rem;
  color: #94a3b8;
  font-size: 1.05rem;
  pointer-events: none;
}

.custom-input {
  padding: 0.75rem 1rem 0.75rem 2.75rem;
  border-radius: 12px;
  border: 1px solid #cbd5e1;
  font-size: 0.95rem;
  color: #0f172a;
  transition: all 0.2s ease;
}

.custom-input:focus {
  border-color: #4f46e5;
  box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.1);
  outline: none;
}

.btn-login {
  background: #4f46e5;
  color: #ffffff !important;
  font-weight: 700;
  font-size: 0.95rem;
  padding: 0.85rem;
  border-radius: 12px;
  border: none;
  transition: all 0.2s ease;
  box-shadow: 0 8px 20px -4px rgba(79, 70, 229, 0.3);
}

.btn-login:hover {
  background: #4338ca;
  transform: translateY(-2px);
}

@media (max-width: 576px) {
  .login-card {
    padding: 2rem 1.5rem;
  }
}


/* Atualize o custom-input para dar espaço ao olho no lado direito */
.custom-input {
  padding: 0.75rem 2.5rem 0.75rem 2.75rem; /* Esquerda mantida (2.75rem) e Direita ajustada (2.5rem) */
}

/* Estilo do botão do olho */
.btn-toggle-password {
  position: absolute;
  right: 0.8rem;
  background: transparent;
  border: none;
  color: #94a3b8;
  padding: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.1rem;
  cursor: pointer;
  transition: color 0.2s ease;
}

.btn-toggle-password:hover {
  color: #4f46e5;
}
</style>

<script>
import NavbarAll from '@/components/navbar/NavbarAll.vue';
import axios from 'axios';
import router from '@/router';

export default {
    name: 'LoginView.vue',
    components: {
        NavbarAll
    },
    data() {
        return {
            senha: '',
            tipoCampo: 'password'
        };
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
        },
       
        mostrarSenha(){
            if(this.tipoCampo=="password"){
               this.tipoCampo = 'text'
            }else{
                this.tipoCampo = 'password'
            }
        }
    }
}
</script>

