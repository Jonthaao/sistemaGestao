<script setup>
import { ref, onMounted } from 'vue'

const apiUrl = import.meta.env.VITE_API_URL
const message = ref('Carregando...')

onMounted(async () => {
  try {
    const response = await fetch(`${apiUrl}/health`)
    const data = await response.json()
    message.value = data.status === 'ok' 
      ? '✅ API conectada com sucesso!' 
      : '⚠️ API respondeu, mas com status diferente'
  } catch (error) {
    message.value = '❌ Erro ao conectar com a API'
    console.error('Erro:', error)
  }
})
</script>

<template>
  <div class="container">
    <h1>🚀 Sistema de Gestão</h1>
    <p class="subtitle">Laravel + Vue.js + PostgreSQL</p>
    
    <div class="card">
      <h2>Status da Conexão</h2>
      <p>{{ message }}</p>
    </div>

    <div class="info">
      <h3>Próximos Passos:</h3>
      <ul>
        <li>✅ Ambiente Docker configurado</li>
        <li>✅ Frontend Vue.js rodando</li>
        <li>✅ Backend Laravel pronto</li>
        <li>⏳ Criar models e migrations</li>
        <li>⏳ Desenvolver componentes</li>
        <li>⏳ Implementar autenticação</li>
      </ul>
    </div>
  </div>
</template>

<style scoped>
.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 2rem;
  text-align: center;
}

h1 {
  font-size: 3rem;
  margin-bottom: 0.5rem;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.subtitle {
  color: #666;
  margin-bottom: 2rem;
}

.card {
  background: white;
  border-radius: 8px;
  padding: 2rem;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  margin-bottom: 2rem;
}

.card h2 {
  margin-top: 0;
  color: #333;
}

.card p {
  font-size: 1.2rem;
  font-weight: 500;
}

.info {
  background: #f8f9fa;
  border-radius: 8px;
  padding: 2rem;
  text-align: left;
}

.info h3 {
  margin-top: 0;
  color: #333;
}

.info ul {
  list-style: none;
  padding: 0;
}

.info li {
  padding: 0.5rem 0;
  font-size: 1.1rem;
}
</style>