<template>
  <div id="app">
    <component :is="layout">
      <router-view />
    </component>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { useRoute } from 'vue-router'

// Importação dos layouts
import LayoutDefault from '@/layouts/LayoutDefault.vue'
import LayoutFull from '@/layouts/LayoutFull.vue'

const route = useRoute()

// Escolhe o layout baseado na meta da rota
const layout = computed(() => {
  // Se a rota tem meta.layout definido, usa ele
  // Caso contrário, usa o layout padrão
  const layoutType = route.meta.layout || 'default'
  
  if (layoutType === 'full') {
    return LayoutFull
  }
  
  return LayoutDefault
})
</script>

<style>
/* Estilos globais */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

#app {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

/* Variáveis CSS para tema */
:root {
  --primary: #667eea;
  --secondary: #764ba2;
  --success: #28a745;
  --danger: #dc3545;
  --warning: #ffc107;
  --info: #17a2b8;
  --light: #f8f9fa;
  --dark: #343a40;
}
</style>