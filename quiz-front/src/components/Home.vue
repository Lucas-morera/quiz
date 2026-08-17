<template>
  <NavbarAll />

  <div class="page-wrapper container-fluid">
    <div class="main-container">

      <!-- HERO BANNER (CARD ESTRUTURADO) -->
      <section class="hero-card">
        <div class="row align-items-center">
          <div class="col-lg-7">
            <div class="badge-status">
              <span class="status-dot"></span> Player 1 Ready
            </div>
            <h1 class="hero-title">Jogue de graça e aprenda com o quiz gaming</h1>
            <p class="hero-subtitle">
              Mostre seu conhecimento no mundo dos games, dispute as melhores posições do ranking e mostre quem manda no controller.
            </p>
            <div class="hero-actions">
              <a href="/cadastro" class="btn-hero-primary">
                <span>Criar Conta & Jogar</span>
                <i class="bi bi-arrow-right-short"></i>
              </a>
            </div>
          </div>

          <div class="col-lg-5 text-center mt-4 mt-lg-0">
            <div class="hero-img-box">
              <div class="avatar-backdrop"></div>
              <img class="hero-img" src="../assets/img/Mario.png" alt="Mario" />
            </div>
          </div>
        </div>
      </section>

      <!-- RANKING PODIUM SECTION -->
      <section class="ranking-section">
        <div class="section-header text-center">
          <span class="section-eyebrow">HIGH SCORES</span>
          <h2 class="section-title">Ranking dos Melhores Jogadores</h2>
          <div class="title-bar"></div>
        </div>

        <div v-if="hasRanking" class="podium-grid">
          
          <!-- 2º LUGAR -->
          <div class="podium-col rank-2-col" v-if="position[1]">
            <div class="podium-card rank-silver">
              <div class="rank-tag">2º LUGAR</div>
              <div class="player-info">
                <span class="medal-icon">🥈</span>
                <h3 class="player-name">{{ position[1] }}</h3>
              </div>
            </div>
          </div>

          <!-- 1º LUGAR (EM DESTAQUE CENTRAL) -->
          <div class="podium-col rank-1-col" v-if="position[0]">
            <div class="podium-card rank-gold">
              <div class="rank-tag">👑 1º LUGAR</div>
              <div class="player-info">
                <span class="medal-icon">🥇</span>
                <h3 class="player-name">{{ position[0] }}</h3>
              </div>
            </div>
          </div>

          <!-- 3º LUGAR -->
          <div class="podium-col rank-3-col" v-if="position[2]">
            <div class="podium-card rank-bronze">
              <div class="rank-tag">3º LUGAR</div>
              <div class="player-info">
                <span class="medal-icon">🥉</span>
                <h3 class="player-name">{{ position[2] }}</h3>
              </div>
            </div>
          </div>

        </div>

        <div class="empty-ranking" v-else>
          <div class="empty-icon">🎮</div>
          <h4>Nenhum jogador no ranking</h4>
          <p>Seja o primeiro a jogar e garanta o 1º lugar!</p>
        </div>
      </section>

      <!-- CTA CARD -->
      <section class="cta-card">
        <div class="cta-body">
          <div class="cta-text-content">
            <h3>Pronto para subir no ranking?</h3>
            <p>Cadastre-se para registrar suas pontuações e competir com outros jogadores.</p>
          </div>
          <a href="/cadastro" class="btn-cta">
            Cadastro
          </a>
        </div>
      </section>

    </div>
  </div>
</template>

<script>
import NavbarAll from './navbar/NavbarAll.vue';
import axios from 'axios';

export default {
  name: 'HelloWorld',
  components: {
    NavbarAll
  },
  data() {
    return {
      position: []
    };
  },
  computed: {
    hasRanking() {
      return !!(this.position[0] || this.position[1] || this.position[2]);
    }
  },
  async beforeMount() {
    try {
      const { data } = await axios.post('http://localhost:8080/ranking');
      console.log(data);
      this.position = data;
    } catch (error) {
      console.error('Erro ao buscar ranking:', error);
    }
  }
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@500;600;700;800&display=swap');

.page-wrapper {
  background-color: #f1f5f9 !important;
  background-image: 
    radial-gradient(at 0% 0%, rgba(99, 102, 241, 0.05) 0px, transparent 50%),
    radial-gradient(at 100% 100%, rgba(16, 185, 129, 0.05) 0px, transparent 50%) !important;
  font-family: 'Plus Jakarta Sans', sans-serif !important;
  color: #0f172a !important;
  min-height: 100vh;
  padding: 2.5rem 1rem 4rem;
}

.main-container {
  max-width: 1080px;
  margin: 0 auto;
}

/* HERO CARD */
.hero-card {
  background: #ffffff;
  border: 1px solid #e2e8f0;
  border-radius: 24px;
  padding: 3rem 2.5rem;
  box-shadow: 0 10px 30px -5px rgba(15, 23, 42, 0.04);
  margin-bottom: 3.5rem;
}

.badge-status {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.75rem;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  color: #059669;
  background: #ecfdf5;
  border: 1px solid #a7f3d0;
  padding: 0.35rem 0.9rem;
  border-radius: 50px;
  margin-bottom: 1.25rem;
}

.status-dot {
  width: 7px;
  height: 7px;
  background: #10b981;
  border-radius: 50%;
}

.hero-title {
  font-size: 2.2rem;
  font-weight: 800;
  line-height: 1.25;
  color: #0f172a;
  letter-spacing: -0.02em;
  margin-bottom: 1rem;
}

.hero-subtitle {
  color: #64748b;
  font-size: 1.05rem;
  line-height: 1.6;
  margin-bottom: 1.75rem;
}

.btn-hero-primary {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  background: #4f46e5;
  color: #ffffff !important;
  font-weight: 700;
  font-size: 0.95rem;
  padding: 0.85rem 1.6rem;
  border-radius: 12px;
  text-decoration: none !important;
  transition: all 0.2s ease;
  box-shadow: 0 8px 20px -4px rgba(79, 70, 229, 0.3);
}

.btn-hero-primary:hover {
  background: #4338ca;
  transform: translateY(-2px);
}

.hero-img-box {
  position: relative;
  display: inline-block;
}

.avatar-backdrop {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 220px;
  height: 220px;
  background: #e0e7ff;
  border-radius: 50%;
  z-index: 0;
}

.hero-img {
  position: relative;
  z-index: 1;
  max-width: 220px;
  height: auto;
  filter: drop-shadow(0 12px 20px rgba(0, 0, 0, 0.08));
}

/* RANKING SECTION */
.ranking-section {
  margin-bottom: 3.5rem;
}

.section-header {
  margin-bottom: 2.5rem;
}

.section-eyebrow {
  font-size: 0.75rem;
  font-weight: 800;
  letter-spacing: 0.12em;
  color: #4f46e5;
  display: block;
  margin-bottom: 0.35rem;
}

.section-title {
  font-size: 1.85rem;
  font-weight: 800;
  color: #0f172a;
  margin: 0;
}

.title-bar {
  width: 48px;
  height: 4px;
  background: #4f46e5;
  margin: 0.75rem auto 0;
  border-radius: 2px;
}

/* PODIUM ESTRUTURADO */
.podium-grid {
  display: flex;
  align-items: flex-end;
  justify-content: center;
  gap: 1.25rem;
  max-width: 900px;
  margin: 0 auto;
}

.podium-col {
  flex: 1;
}

.podium-card {
  background: #ffffff;
  border-radius: 20px;
  padding: 1.75rem 1.25rem;
  text-align: center;
  border: 1px solid #e2e8f0;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
  transition: transform 0.2s ease;
}

.podium-card:hover {
  transform: translateY(-4px);
}

.rank-tag {
  display: inline-block;
  font-size: 0.75rem;
  font-weight: 800;
  padding: 0.3rem 0.85rem;
  border-radius: 50px;
  margin-bottom: 1.25rem;
}

.medal-icon {
  font-size: 2.2rem;
  display: block;
  margin-bottom: 0.5rem;
}

.player-name {
  font-size: 1.2rem;
  font-weight: 700;
  color: #0f172a;
  margin: 0;
  word-break: break-word;
}

/* DESTAQUE DO 1º LUGAR */
.rank-1-col {
  order: 2;
}

.rank-2-col {
  order: 1;
}

.rank-3-col {
  order: 3;
}

.rank-gold {
  background: #ffffff;
  border: 2px solid #f59e0b;
  box-shadow: 0 12px 30px -5px rgba(245, 158, 11, 0.15);
  padding: 2.5rem 1.25rem;
}

.rank-gold .rank-tag {
  background: #fef3c7;
  color: #b45309;
}

.rank-silver {
  border-color: #cbd5e1;
}

.rank-silver .rank-tag {
  background: #f1f5f9;
  color: #475569;
}

.rank-bronze {
  border-color: #fed7aa;
}

.rank-bronze .rank-tag {
  background: #fff7ed;
  color: #c2410c;
}

.empty-ranking {
  background: #ffffff;
  border: 1px dashed #cbd5e1;
  border-radius: 20px;
  padding: 3rem;
  text-align: center;
  color: #64748b;
}

.empty-icon {
  font-size: 2.5rem;
  margin-bottom: 0.5rem;
}

/* CTA CARD */
.cta-card {
  background: #ffffff;
  border: 1px solid #e2e8f0;
  border-radius: 20px;
  padding: 2rem 2.5rem;
  box-shadow: 0 8px 25px -5px rgba(15, 23, 42, 0.03);
}

.cta-body {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 1.5rem;
  flex-wrap: wrap;
}

.cta-text-content h3 {
  font-size: 1.35rem;
  font-weight: 800;
  color: #0f172a;
  margin-bottom: 0.25rem;
}

.cta-text-content p {
  color: #64748b;
  margin: 0;
}

.btn-cta {
  background: #0f172a;
  color: #ffffff !important;
  font-weight: 700;
  font-size: 0.9rem;
  padding: 0.8rem 1.5rem;
  border-radius: 12px;
  text-decoration: none !important;
  transition: all 0.2s ease;
}

.btn-cta:hover {
  background: #1e293b;
  transform: translateY(-2px);
}

@media (max-width: 768px) {
  .hero-card {
    padding: 2rem 1.5rem;
  }
  .hero-title {
    font-size: 1.7rem;
  }
  .podium-grid {
    flex-direction: column;
    align-items: stretch;
  }
  .rank-1-col {
    order: 1;
  }
  .rank-2-col {
    order: 2;
  }
  .rank-3-col {
    order: 3;
  }
  .rank-gold {
    padding: 1.75rem 1.25rem;
  }
  .cta-body {
    flex-direction: column;
    text-align: center;
  }
}
</style>