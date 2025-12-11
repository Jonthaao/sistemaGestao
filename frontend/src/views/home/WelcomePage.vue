<template>
  <div class="welcome-container">
    <div class="background-shapes">
      <div class="shape shape-1"></div>
      <div class="shape shape-2"></div>
      <div class="shape shape-3"></div>
    </div>

    <div class="content">
      <div class="logo-container">
        <div class="logo-circle">
          <svg viewBox="0 0 100 100" class="logo-svg">
            <path d="M50 10 L90 90 L10 90 Z" fill="currentColor" />
          </svg>
        </div>
      </div>

      <h1 class="title">
        <span class="title-word">Bem-vindo</span>
        <span class="title-word">ao</span>
        <span class="title-word">Sistema</span>
        <span class="title-word">de</span>
        <span class="title-word">Gestão</span>
      </h1>

      <p class="subtitle">
        Transforme sua gestão com inteligência e eficiência
      </p>

      <div class="features">
        <div class="feature-card" v-for="(feature, index) in features" :key="index" :style="{ animationDelay: `${index * 0.1}s` }">
          <div class="feature-icon">{{ feature.icon }}</div>
          <h3>{{ feature.title }}</h3>
          <p>{{ feature.description }}</p>
        </div>
      </div>

      <button class="cta-button" @click="handleStart">
        <span>Começar Agora</span>
        <svg viewBox="0 0 24 24" class="arrow-icon">
          <path d="M5 12h14M12 5l7 7-7 7" stroke="currentColor" stroke-width="2" fill="none" />
        </svg>
      </button>

      <div class="scroll-indicator">
        <div class="mouse">
          <div class="wheel"></div>
        </div>
        <p>Role para explorar</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'WelcomePage',
  data() {
    return {
      features: [
        {
          icon: '📊',
          title: 'Dashboard Inteligente',
          description: 'Visualize dados em tempo real com gráficos interativos'
        },
        {
          icon: '⚡',
          title: 'Performance',
          description: 'Sistema rápido e otimizado para sua produtividade'
        },
        {
          icon: '🔒',
          title: 'Segurança',
          description: 'Seus dados protegidos com criptografia avançada'
        }
      ]
    }
  },
  methods: {
    handleStart() {
      // Aqui você pode navegar para a próxima página
      // this.$router.push('/dashboard')
      console.log('Iniciando sistema...')
    }
  }
}
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.welcome-container {
  min-height: 100vh;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  position: relative;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
}

.background-shapes {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
}

.shape {
  position: absolute;
  border-radius: 50%;
  filter: blur(80px);
  opacity: 0.3;
  animation: float 20s infinite ease-in-out;
}

.shape-1 {
  width: 500px;
  height: 500px;
  background: #f093fb;
  top: -10%;
  left: -10%;
  animation-delay: 0s;
}

.shape-2 {
  width: 400px;
  height: 400px;
  background: #4facfe;
  bottom: -10%;
  right: -10%;
  animation-delay: -5s;
}

.shape-3 {
  width: 300px;
  height: 300px;
  background: #43e97b;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  animation-delay: -10s;
}

@keyframes float {
  0%, 100% {
    transform: translate(0, 0) scale(1);
  }
  33% {
    transform: translate(30px, -50px) scale(1.1);
  }
  66% {
    transform: translate(-20px, 20px) scale(0.9);
  }
}

.content {
  position: relative;
  z-index: 1;
  text-align: center;
  padding: 40px 20px;
  max-width: 1200px;
  width: 100%;
}

.logo-container {
  margin-bottom: 30px;
  animation: fadeInDown 1s ease-out;
}

.logo-circle {
  width: 100px;
  height: 100px;
  background: rgba(255, 255, 255, 0.2);
  backdrop-filter: blur(10px);
  border-radius: 50%;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  border: 2px solid rgba(255, 255, 255, 0.3);
  animation: pulse 2s infinite;
}

.logo-svg {
  width: 50px;
  height: 50px;
  color: white;
}

@keyframes pulse {
  0%, 100% {
    transform: scale(1);
    box-shadow: 0 0 0 0 rgba(255, 255, 255, 0.7);
  }
  50% {
    transform: scale(1.05);
    box-shadow: 0 0 0 20px rgba(255, 255, 255, 0);
  }
}

.title {
  font-size: 3.5rem;
  font-weight: 800;
  color: white;
  margin-bottom: 20px;
  line-height: 1.2;
}

.title-word {
  display: inline-block;
  margin: 0 10px;
  animation: fadeInUp 0.8s ease-out backwards;
}

.title-word:nth-child(1) { animation-delay: 0.1s; }
.title-word:nth-child(2) { animation-delay: 0.2s; }
.title-word:nth-child(3) { animation-delay: 0.3s; }
.title-word:nth-child(4) { animation-delay: 0.4s; }
.title-word:nth-child(5) { animation-delay: 0.5s; }

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes fadeInDown {
  from {
    opacity: 0;
    transform: translateY(-30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.subtitle {
  font-size: 1.3rem;
  color: rgba(255, 255, 255, 0.9);
  margin-bottom: 60px;
  animation: fadeInUp 1s ease-out 0.6s backwards;
}

.features {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 30px;
  margin-bottom: 60px;
}

.feature-card {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: 20px;
  padding: 40px 30px;
  transition: all 0.3s ease;
  animation: fadeInUp 1s ease-out backwards;
}

.feature-card:hover {
  transform: translateY(-10px);
  background: rgba(255, 255, 255, 0.15);
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
}

.feature-icon {
  font-size: 3rem;
  margin-bottom: 20px;
  animation: bounce 2s infinite;
}

@keyframes bounce {
  0%, 100% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-10px);
  }
}

.feature-card h3 {
  font-size: 1.5rem;
  color: white;
  margin-bottom: 15px;
  font-weight: 600;
}

.feature-card p {
  font-size: 1rem;
  color: rgba(255, 255, 255, 0.8);
  line-height: 1.6;
}

.cta-button {
  background: white;
  color: #667eea;
  border: none;
  padding: 18px 50px;
  font-size: 1.2rem;
  font-weight: 600;
  border-radius: 50px;
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  gap: 10px;
  transition: all 0.3s ease;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  animation: fadeInUp 1s ease-out 1s backwards;
}

.cta-button:hover {
  transform: translateY(-5px);
  box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
  background: #f8f9fa;
}

.arrow-icon {
  width: 24px;
  height: 24px;
  transition: transform 0.3s ease;
}

.cta-button:hover .arrow-icon {
  transform: translateX(5px);
}

.scroll-indicator {
  position: absolute;
  bottom: 30px;
  left: 50%;
  transform: translateX(-50%);
  color: rgba(255, 255, 255, 0.7);
  animation: fadeIn 2s ease-out 1.5s backwards;
}

.mouse {
  width: 30px;
  height: 50px;
  border: 2px solid rgba(255, 255, 255, 0.5);
  border-radius: 15px;
  margin: 0 auto 10px;
  position: relative;
}

.wheel {
  width: 4px;
  height: 10px;
  background: rgba(255, 255, 255, 0.7);
  border-radius: 2px;
  position: absolute;
  top: 10px;
  left: 50%;
  transform: translateX(-50%);
  animation: scroll 1.5s infinite;
}

@keyframes scroll {
  0% {
    opacity: 1;
    transform: translateX(-50%) translateY(0);
  }
  100% {
    opacity: 0;
    transform: translateX(-50%) translateY(15px);
  }
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.scroll-indicator p {
  font-size: 0.9rem;
  margin: 0;
}

@media (max-width: 768px) {
  .title {
    font-size: 2.5rem;
  }

  .title-word {
    margin: 0 5px;
  }

  .subtitle {
    font-size: 1.1rem;
  }

  .features {
    grid-template-columns: 1fr;
  }

  .cta-button {
    padding: 15px 40px;
    font-size: 1.1rem;
  }
}
</style>