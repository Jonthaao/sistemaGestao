<template>
  <div class="layout-full">
    <!-- Sem navbar, sidebar - apenas o conteúdo -->
    <slot />
  </div>
</template>

<script setup>
// Layout vazio para páginas como login, boas-vindas, 404, etc
</script>

<style scoped>
.layout-full {
  min-height: 100vh;
  width: 100%;
}
</style>