<template>
  <div class="layout-default">
    <!-- Header/Navbar -->
    <header class="navbar">
      <div class="navbar-content">
        <div class="navbar-brand">
          <h2>🚀 Sistema Gestão</h2>
        </div>
        
        <nav class="navbar-menu">
          <router-link to="/dashboard">Dashboard</router-link>
          <router-link to="/users">Usuários</router-link>
          <router-link to="/settings">Configurações</router-link>
        </nav>
        
        <div class="navbar-actions">
          <button @click="logout" class="btn-logout">Sair</button>
        </div>
      </div>
    </header>

    <!-- Conteúdo Principal -->
    <main class="main-content">
      <slot />
    </main>

    <!-- Footer (opcional) -->
    <footer class="footer">
      <p>&copy; 2024 Sistema de Gestão. Todos os direitos reservados.</p>
    </footer>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'

const router = useRouter()

const logout = () => {
  // Limpar token, etc
  localStorage.removeItem('token')
  router.push('/login')
}
</script>

<style scoped>
.layout-default {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

/* Navbar */
.navbar {
  background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
  color: white;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  position: sticky;
  top: 0;
  z-index: 1000;
}

.navbar-content {
  max-width: 1400px;
  margin: 0 auto;
  padding: 1rem 2rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 2rem;
}

.navbar-brand h2 {
  margin: 0;
  font-size: 1.5rem;
  font-weight: 700;
}

.navbar-menu {
  display: flex;
  gap: 2rem;
  flex: 1;
  margin-left: 3rem;
}

.navbar-menu a {
  color: rgba(255, 255, 255, 0.9);
  text-decoration: none;
  font-weight: 500;
  padding: 0.5rem 1rem;
  border-radius: 8px;
  transition: all 0.3s ease;
}

.navbar-menu a:hover {
  background: rgba(255, 255, 255, 0.1);
  color: white;
}

.navbar-menu a.router-link-active {
  background: rgba(255, 255, 255, 0.2);
  color: white;
}

.navbar-actions {
  display: flex;
  gap: 1rem;
  align-items: center;
}

.btn-logout {
  background: rgba(255, 255, 255, 0.2);
  color: white;
  border: 1px solid rgba(255, 255, 255, 0.3);
  padding: 0.5rem 1.5rem;
  border-radius: 8px;
  cursor: pointer;
  font-weight: 500;
  transition: all 0.3s ease;
}

.btn-logout:hover {
  background: rgba(255, 255, 255, 0.3);
}

/* Main Content */
.main-content {
  flex: 1;
  max-width: 1400px;
  width: 100%;
  margin: 0 auto;
  padding: 2rem;
}

/* Footer */
.footer {
  background: #f8f9fa;
  padding: 1.5rem 2rem;
  text-align: center;
  color: #666;
  border-top: 1px solid #e9ecef;
}

.footer p {
  margin: 0;
}

/* Responsivo */
@media (max-width: 768px) {
  .navbar-content {
    flex-direction: column;
    align-items: flex-start;
    gap: 1rem;
  }

  .navbar-menu {
    margin-left: 0;
    flex-wrap: wrap;
  }

  .navbar-actions {
    width: 100%;
  }

  .btn-logout {
    width: 100%;
  }
}
</style>