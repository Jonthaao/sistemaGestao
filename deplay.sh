#!/bin/bash

# Como usar
# Dê permissão de execução:

# bash
# chmod +x deploy.sh
# Sempre que quiser atualizar e subir em produção:

# bash
# ./deploy.sh
# 🎯 O que ele faz
# Atualiza o repositório (git pull).

# Gera o build do frontend Vue.js..

# Sobe os containers com docker-compose.override.yml.

# Executa migrations no banco.

# Limpa e recria caches do Laravel.

# Testa a rota /api/health para confirmar que está tudo ok.

echo "🚀 Iniciando processo de deploy..."

# 1. Atualizar código
echo "📥 Atualizando repositório..."
git pull origin main

# 2. Build do frontend
echo "🛠️ Gerando build do frontend..."
docker-compose run --rm frontend npm install
docker-compose run --rm frontend npm run build

# 3. Subir containers em modo produção
echo "🐳 Subindo containers com override de produção..."
docker-compose -f docker-compose.yml -f docker-compose.override.yml up -d --build

# 4. Rodar migrations no backend
echo "📂 Executando migrations..."
docker exec -it gestao_backend php artisan migrate --force

# 5. Limpar e recriar caches do Laravel
echo "🧹 Limpando caches do Laravel..."
docker exec -it gestao_backend php artisan config:clear
docker exec -it gestao_backend php artisan route:clear
docker exec -it gestao_backend php artisan cache:clear
docker exec -it gestao_backend php artisan view:clear

echo "⚡ Recriando caches..."
docker exec -it gestao_backend php artisan config:cache
docker exec -it gestao_backend php artisan route:cache

# 6. Testar rota de saúde
echo "📋 Testando rota de saúde..."
curl -s http://localhost:8080/api/health

echo "✅ Deploy concluído com sucesso!"
