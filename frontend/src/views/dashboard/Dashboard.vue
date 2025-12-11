<template>
  <div class="dashboard">
    <!-- Header do Dashboard -->
    <div class="dashboard-header">
      <div>
        <h1>Dashboard</h1>
        <p>Bem-vindo de volta, <strong>{{ userName }}</strong>! 👋</p>
      </div>
      <div class="header-actions">
        <button class="btn-secondary">
          <svg viewBox="0 0 24 24" class="icon">
            <path d="M12 22c1.1 0 2-.9 2-2h-4c0 1.1.9 2 2 2zm6-6v-5c0-3.07-1.63-5.64-4.5-6.32V4c0-.83-.67-1.5-1.5-1.5s-1.5.67-1.5 1.5v.68C7.64 5.36 6 7.92 6 11v5l-2 2v1h16v-1l-2-2zm-2 1H8v-6c0-2.48 1.51-4.5 4-4.5s4 2.02 4 4.5v6z" fill="currentColor"/>
          </svg>
          Notificações
        </button>
      </div>
    </div>

    <!-- Cards de Estatísticas -->
    <div class="stats-grid">
      <div 
        v-for="(stat, index) in stats" 
        :key="index" 
        class="stat-card"
        :style="{ animationDelay: `${index * 0.1}s` }"
      >
        <div class="stat-icon" :style="{ background: stat.color }">
          {{ stat.icon }}
        </div>
        <div class="stat-content">
          <h3>{{ stat.title }}</h3>
          <p class="stat-value">{{ stat.value }}</p>
          <span class="stat-change" :class="stat.trend">
            {{ stat.change }}
          </span>
        </div>
      </div>
    </div>

    <!-- Gráficos e Tabelas -->
    <div class="dashboard-grid">
      <!-- Atividades Recentes -->
      <div class="card">
        <div class="card-header">
          <h2>Atividades Recentes</h2>
          <button class="btn-text">Ver todas</button>
        </div>
        <div class="activities">
          <div 
            v-for="(activity, index) in activities" 
            :key="index" 
            class="activity-item"
          >
            <div class="activity-icon" :style="{ background: activity.color }">
              {{ activity.icon }}
            </div>
            <div class="activity-content">
              <p class="activity-text">{{ activity.text }}</p>
              <span class="activity-time">{{ activity.time }}</span>
            </div>
          </div>
        </div>
      </div>

      <!-- Gráfico de Vendas (Mockup) -->
      <div class="card">
        <div class="card-header">
          <h2>Vendas do Mês</h2>
          <select class="select-period">
            <option>Últimos 7 dias</option>
            <option>Últimos 30 dias</option>
            <option>Últimos 90 dias</option>
          </select>
        </div>
        <div class="chart-container">
          <!-- Mockup de gráfico em CSS -->
          <div class="chart-bars">
            <div class="bar" style="height: 45%;" data-label="Seg"></div>
            <div class="bar" style="height: 65%;" data-label="Ter"></div>
            <div class="bar" style="height: 55%;" data-label="Qua"></div>
            <div class="bar" style="height: 80%;" data-label="Qui"></div>
            <div class="bar" style="height: 70%;" data-label="Sex"></div>
            <div class="bar" style="height: 40%;" data-label="Sáb"></div>
            <div class="bar" style="height: 35%;" data-label="Dom"></div>
          </div>
        </div>
      </div>

      <!-- Tarefas Pendentes -->
      <div class="card">
        <div class="card-header">
          <h2>Tarefas Pendentes</h2>
          <button class="btn-text">+ Nova tarefa</button>
        </div>
        <div class="tasks">
          <div 
            v-for="(task, index) in tasks" 
            :key="index" 
            class="task-item"
          >
            <input type="checkbox" :id="`task-${index}`" />
            <label :for="`task-${index}`">
              <span>{{ task.title }}</span>
              <span class="task-priority" :class="task.priority">
                {{ task.priority }}
              </span>
            </label>
          </div>
        </div>
      </div>

      <!-- Últimos Usuários -->
      <div class="card">
        <div class="card-header">
          <h2>Últimos Usuários</h2>
          <button class="btn-text">Ver todos</button>
        </div>
        <div class="users-list">
          <div 
            v-for="(user, index) in recentUsers" 
            :key="index" 
            class="user-item"
          >
            <div class="user-avatar" :style="{ background: user.color }">
              {{ user.initials }}
            </div>
            <div class="user-info">
              <p class="user-name">{{ user.name }}</p>
              <span class="user-email">{{ user.email }}</span>
            </div>
            <span class="user-status" :class="user.status">
              {{ user.status === 'active' ? 'Ativo' : 'Inativo' }}
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'

// Dados do usuário
const user = ref(JSON.parse(localStorage.getItem('user') || '{}'))
const userName = computed(() => user.value.name || 'Usuário')

// Estatísticas
const stats = ref([
  {
    icon: '💰',
    title: 'Receita Total',
    value: 'R$ 45.231',
    change: '+12.5% vs mês anterior',
    trend: 'up',
    color: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)'
  },
  {
    icon: '👥',
    title: 'Usuários Ativos',
    value: '2.340',
    change: '+8.2% vs mês anterior',
    trend: 'up',
    color: 'linear-gradient(135deg, #f093fb 0%, #f5576c 100%)'
  },
  {
    icon: '📦',
    title: 'Pedidos',
    value: '1.523',
    change: '-3.1% vs mês anterior',
    trend: 'down',
    color: 'linear-gradient(135deg, #4facfe 0%, #00f2fe 100%)'
  },
  {
    icon: '⭐',
    title: 'Avaliação',
    value: '4.8/5.0',
    change: '+0.3 vs mês anterior',
    trend: 'up',
    color: 'linear-gradient(135deg, #43e97b 0%, #38f9d7 100%)'
  }
])

// Atividades recentes
const activities = ref([
  {
    icon: '✅',
    text: 'Novo pedido #3421 foi criado',
    time: 'há 5 minutos',
    color: 'linear-gradient(135deg, #43e97b 0%, #38f9d7 100%)'
  },
  {
    icon: '👤',
    text: 'João Silva se cadastrou',
    time: 'há 15 minutos',
    color: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)'
  },
  {
    icon: '💳',
    text: 'Pagamento de R$ 1.234 recebido',
    time: 'há 1 hora',
    color: 'linear-gradient(135deg, #f093fb 0%, #f5576c 100%)'
  },
  {
    icon: '📧',
    text: '3 novos e-mails recebidos',
    time: 'há 2 horas',
    color: 'linear-gradient(135deg, #4facfe 0%, #00f2fe 100%)'
  }
])

// Tarefas
const tasks = ref([
  { title: 'Revisar relatório mensal', priority: 'high' },
  { title: 'Atualizar documentação da API', priority: 'medium' },
  { title: 'Responder e-mails pendentes', priority: 'low' },
  { title: 'Fazer backup do banco de dados', priority: 'high' },
  { title: 'Testar nova funcionalidade', priority: 'medium' }
])

// Usuários recentes
const recentUsers = ref([
  { 
    name: 'João Silva', 
    email: 'joao@email.com', 
    initials: 'JS',
    status: 'active',
    color: '#667eea'
  },
  { 
    name: 'Maria Santos', 
    email: 'maria@email.com', 
    initials: 'MS',
    status: 'active',
    color: '#f093fb'
  },
  { 
    name: 'Pedro Costa', 
    email: 'pedro@email.com', 
    initials: 'PC',
    status: 'inactive',
    color: '#4facfe'
  },
  { 
    name: 'Ana Oliveira', 
    email: 'ana@email.com', 
    initials: 'AO',
    status: 'active',
    color: '#43e97b'
  }
])

onMounted(() => {
  // Aqui você pode fazer chamadas à API para buscar dados reais
  console.log('Dashboard montado!')
})
</script>

<style scoped>
.dashboard {
  max-width: 1400px;
  margin: 0 auto;
}

.dashboard-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 2rem;
  flex-wrap: wrap;
  gap: 1rem;
}

.dashboard-header h1 {
  font-size: 2rem;
  font-weight: 700;
  color: #333;
  margin: 0;
}

.dashboard-header p {
  color: #666;
  margin: 0.5rem 0 0;
}

.header-actions {
  display: flex;
  gap: 1rem;
}

.btn-secondary {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.75rem 1.5rem;
  background: white;
  border: 2px solid #e9ecef;
  border-radius: 12px;
  color: #333;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.btn-secondary:hover {
  border-color: #667eea;
  color: #667eea;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(102, 126, 234, 0.2);
}

.icon {
  width: 20px;
  height: 20px;
}

/* Stats Grid */
.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1.5rem;
  margin-bottom: 2rem;
}

.stat-card {
  background: white;
  border-radius: 16px;
  padding: 1.5rem;
  display: flex;
  gap: 1rem;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  transition: all 0.3s ease;
  animation: fadeInUp 0.6s ease-out backwards;
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.stat-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
}

.stat-icon {
  width: 60px;
  height: 60px;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.75rem;
  flex-shrink: 0;
}

.stat-content {
  flex: 1;
}

.stat-content h3 {
  font-size: 0.9rem;
  color: #666;
  margin: 0 0 0.5rem;
  font-weight: 500;
}

.stat-value {
  font-size: 1.75rem;
  font-weight: 700;
  color: #333;
  margin: 0 0 0.25rem;
}

.stat-change {
  font-size: 0.85rem;
  font-weight: 500;
}

.stat-change.up {
  color: #28a745;
}

.stat-change.down {
  color: #dc3545;
}

/* Dashboard Grid */
.dashboard-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: 1.5rem;
}

.card {
  background: white;
  border-radius: 16px;
  padding: 1.5rem;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 1.5rem;
}

.card-header h2 {
  font-size: 1.25rem;
  font-weight: 700;
  color: #333;
  margin: 0;
}

.btn-text {
  background: none;
  border: none;
  color: #667eea;
  font-weight: 600;
  cursor: pointer;
  padding: 0.5rem;
  border-radius: 8px;
  transition: all 0.3s ease;
}

.btn-text:hover {
  background: rgba(102, 126, 234, 0.1);
}

.select-period {
  padding: 0.5rem 1rem;
  border: 2px solid #e9ecef;
  border-radius: 8px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
}

.select-period:focus {
  outline: none;
  border-color: #667eea;
}

/* Activities */
.activities {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.activity-item {
  display: flex;
  gap: 1rem;
  padding: 1rem;
  background: #f8f9fa;
  border-radius: 12px;
  transition: all 0.3s ease;
}

.activity-item:hover {
  background: #e9ecef;
}

.activity-icon {
  width: 40px;
  height: 40px;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.25rem;
  flex-shrink: 0;
}

.activity-content {
  flex: 1;
}

.activity-text {
  margin: 0 0 0.25rem;
  color: #333;
  font-weight: 500;
}

.activity-time {
  font-size: 0.85rem;
  color: #666;
}

/* Chart */
.chart-container {
  padding: 1rem 0;
}

.chart-bars {
  display: flex;
  align-items: flex-end;
  justify-content: space-between;
  height: 200px;
  gap: 1rem;
}

.bar {
  flex: 1;
  background: linear-gradient(180deg, #667eea 0%, #764ba2 100%);
  border-radius: 8px 8px 0 0;
  position: relative;
  transition: all 0.3s ease;
  cursor: pointer;
}

.bar:hover {
  opacity: 0.8;
}

.bar::after {
  content: attr(data-label);
  position: absolute;
  bottom: -25px;
  left: 50%;
  transform: translateX(-50%);
  font-size: 0.85rem;
  color: #666;
}

/* Tasks */
.tasks {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.task-item {
  display: flex;
  align-items: center;
  gap: 0.75rem;
}

.task-item input[type="checkbox"] {
  width: 20px;
  height: 20px;
  cursor: pointer;
}

.task-item label {
  flex: 1;
  display: flex;
  justify-content: space-between;
  align-items: center;
  cursor: pointer;
  padding: 0.75rem;
  border-radius: 8px;
  transition: background 0.3s ease;
}

.task-item label:hover {
  background: #f8f9fa;
}

.task-priority {
  padding: 0.25rem 0.75rem;
  border-radius: 12px;
  font-size: 0.75rem;
  font-weight: 600;
  text-transform: uppercase;
}

.task-priority.high {
  background: #fee;
  color: #dc3545;
}

.task-priority.medium {
  background: #ffeaa7;
  color: #e17055;
}

.task-priority.low {
  background: #dfe6e9;
  color: #636e72;
}

/* Users List */
.users-list {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.user-item {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 0.75rem;
  border-radius: 12px;
  transition: background 0.3s ease;
}

.user-item:hover {
  background: #f8f9fa;
}

.user-avatar {
  width: 45px;
  height: 45px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-weight: 700;
  flex-shrink: 0;
}

.user-info {
  flex: 1;
}

.user-name {
  margin: 0 0 0.25rem;
  font-weight: 600;
  color: #333;
}

.user-email {
  font-size: 0.85rem;
  color: #666;
}

.user-status {
  padding: 0.25rem 0.75rem;
  border-radius: 12px;
  font-size: 0.75rem;
  font-weight: 600;
}

.user-status.active {
  background: #d4edda;
  color: #28a745;
}

.user-status.inactive {
  background: #f8d7da;
  color: #dc3545;
}

@media (max-width: 768px) {
  .dashboard-header {
    flex-direction: column;
    align-items: flex-start;
  }

  .stats-grid {
    grid-template-columns: 1fr;
  }

  .dashboard-grid {
    grid-template-columns: 1fr;
  }
}
</style>