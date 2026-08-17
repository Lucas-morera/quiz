<template>
  <nav class="navbar navbar-expand-lg bg-white border-bottom shadow-sm py-2">
    <div class="container">
      
      <!-- Brand / Logo -->
      <a class="navbar-brand d-flex align-items-center gap-2" href="/">
        <i class="bi bi-dice-4-fill fs-3 text-primary"></i>
        <span class="fw-bold fs-5 text-dark tracking-tight">QUIZ</span>
      </a>

      <!-- Botão Mobile -->
      <button
        class="navbar-toggler border-0 shadow-none"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Links de Navegação + Perfil -->
      <div class="collapse navbar-collapse" id="navbarNav">
        
        <!-- Opções sem ícones -->
        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4 gap-lg-1">
          <li class="nav-item">
            <a class="nav-link custom-link" href="/">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link custom-link" href="/game">Jogar</a>
          </li>
          <li class="nav-item">
            <a class="nav-link custom-link" href="/cadastro">Cadastro</a>
          </li>
          <li class="nav-item">
            <a class="nav-link custom-link" href="/login">Login</a>
          </li>
        </ul>

        <!-- Área de Usuário Unificada (Canto Direito) -->
        <div v-if="nomeUser" class="d-flex align-items-center pt-2 pt-lg-0 border-top-mobile">
          <div class="user-card d-flex align-items-center gap-2">
            <div class="user-avatar">
              <i class="bi bi-person-fill"></i>
            </div>
            <span class="user-name">{{ nomeUser }}</span>
            <span class="vertical-divider"></span>
            <button @click="exit()" class="btn-logout" title="Sair">
              <i class="bi bi-box-arrow-right me-1"></i> Sair
            </button>
          </div>
        </div>

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
  },
  mounted() {
    if (window.sessionStorage.getItem('server') != null) {
      this.nomeUser = window.sessionStorage.getItem('server');
    }
  },
  methods: {
    exit() {
      window.sessionStorage.removeItem('server');
      window.sessionStorage.removeItem('idLogin');
      window.sessionStorage.removeItem('idNome');
      window.sessionStorage.removeItem('acertos');
      window.sessionStorage.removeItem('erros');
      window.sessionStorage.removeItem('score');

      if (
        window.sessionStorage.getItem('server') === null &&
        window.sessionStorage.getItem('idLogin') === null &&
        window.sessionStorage.getItem('idNome') === null
      ) {
        window.location.reload();
      }
    }
  }
}
</script>

<style scoped>
/* Typography & Links */
.tracking-tight {
  letter-spacing: -0.5px;
}

.custom-link {
  font-size: 0.95rem;
  font-weight: 500;
  color: #475569 !important;
  padding: 0.5rem 0.85rem !important;
  border-radius: 6px;
  transition: all 0.15s ease-in-out;
}

.custom-link:hover {
  color: #0d6efd !important;
  background-color: #f8fafc;
}

/* Card Integrado do Usuário */
.user-card {
  background-color: #f8fafc;
  border: 1px solid #e2e8f0;
  padding: 0.25rem 0.35rem 0.25rem 0.75rem;
  border-radius: 9999px;
}

.user-avatar {
  width: 26px;
  height: 26px;
  background-color: #0d6efd;
  color: #ffffff;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 0.85rem;
}

.user-name {
  font-size: 0.88rem;
  font-weight: 600;
  color: #1e293b;
}

.vertical-divider {
  width: 1px;
  height: 16px;
  background-color: #cbd5e1;
  margin: 0 4px;
}

/* Botão Sair Clean */
.btn-logout {
  border: none;
  background: transparent;
  color: #dc3545;
  font-size: 0.82rem;
  font-weight: 600;
  padding: 0.3rem 0.6rem;
  border-radius: 9999px;
  transition: all 0.15s ease-in-out;
  cursor: pointer;
}

.btn-logout:hover {
  background-color: #fee2e2;
  color: #b91c1c;
}

/* Responsividade Mobile */
@media (max-width: 991px) {
  .border-top-mobile {
    border-top: 1px solid #e2e8f0;
    margin-top: 0.5rem;
    padding-top: 0.75rem !important;
  }
}
</style>