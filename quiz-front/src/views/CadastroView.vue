<template>
  <NavbarAll />

  <div class="page-wrapper container-fluid d-flex align-items-center justify-content-center">
    <div class="signup-card">
      <div class="row g-0 h-100">
        
        <!-- PAINEL ESQUERDO: Criativo / Gaming (Cores Vibrantes) -->
        <div class="col-lg-5 gaming-panel d-flex flex-column justify-content-between text-white">
          
          <!-- Elementos decorativos de fundo (Opcional, feito com CSS) -->
          <div class="bg-shape shape-1"></div>
          <div class="bg-shape shape-2"></div>

          <div class="position-relative z-1">
            <div class="brand-badge-light mb-4">
              <i class="bi bi-controller"></i> QUIZ GAMING
            </div>
            
            <h2 class="gaming-title">Pronto para o<br><span class="text-neon">desafio?</span></h2>
            <p class="gaming-description mt-3">
              Mostre que você domina o universo dos games. Responda rápido, acumule pontos e garanta sua posição no topo do ranking global!
            </p>

            <ul class="gaming-features mt-4">
              <li>
                <div class="feature-icon"><i class="bi bi-lightning-charge-fill"></i></div>
                <div>
                  <strong>Ação Rápida</strong>
                  <span>Menos tempo = mais pontos.</span>
                </div>
              </li>
              <li>
                <div class="feature-icon"><i class="bi bi-trophy-fill"></i></div>
                <div>
                  <strong>Ranking Global</strong>
                  <span>Dispute o 1º lugar com todos.</span>
                </div>
              </li>
              <li>
                <div class="feature-icon"><i class="bi bi-wallet2"></i></div>
                <div>
                  <strong>100% Gratuito</strong>
                  <span>Jogue sem pagar nada.</span>
                </div>
              </li>
            </ul>
          </div>

          <div class="position-relative z-1 mt-5">
            <p class="mb-0 text-white-50">Junte-se a milhares de jogadores.</p>
          </div>
        </div>

        <!-- PAINEL DIREITO: Formulário Limpo e Alinhado -->
        <div class="col-lg-7 form-panel">
          <div class="form-header mb-4 text-center">
            <h3 class="form-title">Criar Conta</h3>
            <p class="form-subtitle">Cadastre-se para registrar seu score</p>
          </div>

          <div class="form-body">
            
            <!-- NOME -->
            <div class="mb-3 text-start">
              <label for="nome" class="form-label">Nome Completo</label>
              <div class="input-wrapper">
                <i class="bi bi-person input-icon"></i>
                <input 
                  type="text" 
                  id="nome" 
                  v-model="nome" 
                  class="form-control custom-input"
                  placeholder=""
                >
              </div>
            </div>

            <!-- EMAIL -->
            <div class="mb-3 text-start">
              <label for="email" class="form-label">E-mail</label>
              <div class="input-wrapper">
                <i class="bi bi-envelope input-icon"></i>
                <input 
                  type="text" 
                  id="email" 
                  v-model="email" 
                  class="form-control custom-input"
                  placeholder=""
                >
              </div>
            </div>

            <!-- SENHA -->
            <div class="mb-3 text-start">
              <label for="senha" class="form-label">Senha</label>
              <div class="input-wrapper">
                <i class="bi bi-lock input-icon"></i>
                <input 
                  type="password" 
                  id="senha" 
                  v-model="senha" 
                  class="form-control custom-input"
                  placeholder=""
                >
              </div>
            </div>

            <!-- CPF E TELEFONE -->
            <div class="row text-start">
              <div class="col-md-6 mb-3">
                <label for="cpf" class="form-label">CPF</label>
                <div class="input-wrapper">
                  <i class="bi bi-card-text input-icon"></i>
                  <vue-mask 
                    class="form-control custom-input" 
                    v-model="cpf" 
                    mask="000.000.000-00" 
                    :raw="false"
                    placeholder=""
                  ></vue-mask>
                </div>
              </div>

              <div class="col-md-6 mb-3">
                <label for="telefone" class="form-label">Telefone</label>
                <div class="input-wrapper">
                  <i class="bi bi-telephone input-icon"></i>
                  <vue-mask 
                    type="text" 
                    id="telefone" 
                    v-model="telefone" 
                    mask="(00) 00000-0000" 
                    class="form-control custom-input"
                    placeholder=""
                  ></vue-mask>
                </div>
              </div>
            </div>

            <div id="request" class="response-message my-2 text-center"></div>

            <button class="btn btn-signup w-100 mt-3" v-on:click="cadastrar">
              <span 
                id="spinner" 
                class="spinner-border spinner-border-sm me-2 visually-hidden" 
                role="status" 
                aria-hidden="true"
              ></span>
              Finalizar Cadastro
            </button>
            
            <div class="text-center mt-4">
              <span class="text-muted" style="font-size: 0.9rem;">
                Já possui uma conta? <a href="/login" class="login-link">Fazer Login</a>
              </span>
            </div>

          </div>
        </div>

      </div>
    </div>
  </div>
</template>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap');

.page-wrapper {
  background-color: #f4f7fb !important;
  font-family: 'Plus Jakarta Sans', sans-serif !important;
  min-height: calc(100vh - 70px);
  padding: 3rem 1rem;
}

.signup-card {
  background: #ffffff;
  border-radius: 24px;
  width: 100%;
  max-width: 1000px;
  box-shadow: 0 20px 40px -10px rgba(15, 23, 42, 0.08);
  overflow: hidden;
}

/* =======================================
   PAINEL ESQUERDO (GAMING / VIBRANTE)
   ======================================= */
.gaming-panel {
  background: linear-gradient(145deg, #3730a3 0%, #4f46e5 50%, #6366f1 100%);
  padding: 3.5rem 3rem;
  position: relative;
  overflow: hidden;
}

/* Formas abstratas de fundo para dar visual premium */
.bg-shape {
  position: absolute;
  border-radius: 50%;
  filter: blur(60px);
  opacity: 0.5;
  z-index: 0;
}
.shape-1 {
  width: 300px;
  height: 300px;
  background: #c7d2fe;
  top: -100px;
  right: -100px;
}
.shape-2 {
  width: 250px;
  height: 250px;
  background: #818cf8;
  bottom: -50px;
  left: -100px;
}

.brand-badge-light {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.8rem;
  font-weight: 800;
  letter-spacing: 0.08em;
  color: #ffffff;
  background: rgba(255, 255, 255, 0.15);
  backdrop-filter: blur(10px);
  padding: 0.4rem 1rem;
  border-radius: 50px;
  border: 1px solid rgba(255, 255, 255, 0.2);
}

.gaming-title {
  font-size: 2.5rem;
  font-weight: 800;
  line-height: 1.1;
  margin-top: 1rem;
}

.text-neon {
  color: #a5b4fc;
}

.gaming-description {
  font-size: 1rem;
  color: #e0e7ff;
  line-height: 1.6;
}

.gaming-features {
  list-style: none;
  padding: 0;
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.gaming-features li {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.feature-icon {
  width: 48px;
  height: 48px;
  border-radius: 14px;
  background: rgba(255, 255, 255, 0.1);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.3rem;
  color: #fff;
  border: 1px solid rgba(255, 255, 255, 0.1);
}

.gaming-features strong {
  display: block;
  font-size: 1.05rem;
  margin-bottom: 0.1rem;
}

.gaming-features span {
  font-size: 0.85rem;
  color: #c7d2fe;
}

/* =======================================
   PAINEL DIREITO (FORMULÁRIO)
   ======================================= */
.form-panel {
  padding: 3.5rem 4rem;
  background: #ffffff;
}

.form-title {
  font-size: 1.8rem;
  font-weight: 800;
  color: #0f172a;
}

.form-subtitle {
  color: #64748b;
  font-size: 0.95rem;
}

.form-label {
  font-size: 0.85rem;
  font-weight: 700;
  color: #334155;
  margin-bottom: 0.5rem;
  display: block; 
}

.input-wrapper {
  position: relative;
  display: flex;
  align-items: center;
}

.input-icon {
  position: absolute;
  left: 1.2rem;
  color: #94a3b8;
  font-size: 1.1rem;
  pointer-events: none;
  z-index: 2;
}

.custom-input {
  padding: 0.8rem 1rem 0.8rem 3rem; /* Espaço exato para o ícone */
  border-radius: 12px;
  border: 1px solid #cbd5e1;
  font-size: 0.95rem;
  color: #0f172a;
  background-color: #ffffff;
  transition: all 0.25s ease;
  width: 100%;
}

.custom-input:focus {
  border-color: #4f46e5;
  box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.1);
  outline: none;
}

.custom-input::placeholder {
  color: #94a3b8;
}

.btn-signup {
  background: #4f46e5;
  color: #ffffff !important;
  font-weight: 700;
  font-size: 1rem;
  padding: 0.9rem;
  border-radius: 12px;
  border: none;
  transition: all 0.2s ease;
  box-shadow: 0 8px 20px -4px rgba(79, 70, 229, 0.3);
}

.btn-signup:hover {
  background: #4338ca;
  transform: translateY(-2px);
  box-shadow: 0 12px 25px -4px rgba(79, 70, 229, 0.4);
}

.login-link {
  color: #4f46e5;
  font-weight: 700;
  text-decoration: none !important;
  transition: color 0.2s;
}

.login-link:hover {
  color: #3730a3;
  text-decoration: underline !important;
}

/* Responsividade para telas menores */
@media (max-width: 991px) {
  .gaming-panel {
    padding: 2.5rem 2rem;
  }
  .form-panel {
    padding: 2.5rem 2rem;
  }
}
</style>

<script>
import vueMask from 'vue-jquery-mask';
import axios from 'axios';
import NavbarAll from '@/components/navbar/NavbarAll.vue';


export default {
    name: 'CadastroView',
    components: {
        vueMask, NavbarAll 
    },
    mounted: function(){
      let a =  document.querySelector("#telefone");
      a.value = "";
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
                    senha: this.senha,
                    telefone: this.telefone,
                    cpf : this.cpf,
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
