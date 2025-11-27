#!/bin/bash

# Corrige permissões dos diretórios críticos
echo "🔧 Ajustando permissões..."
sudo chown -R www-data:www-data backend/storage backend/bootstrap/cache backend/vendor
sudo chmod -R 775 backend/storage backend/bootstrap/cache backend/vendor

# Limpa caches do Laravel
echo "🧹 Limpando caches do Laravel..."
docker exec -it gestao_backend php artisan config:clear
docker exec -it gestao_backend php artisan route:clear
docker exec -it gestao_backend php artisan cache:clear
docker exec -it gestao_backend php artisan view:clear

# Recompila autoloader e cache de rotas
echo "⚡ Recompilando autoloader e cache..."
docker exec -it gestao_backend composer dump-autoload
docker exec -it gestao_backend php artisan route:cache

# Lista rotas para confirmar
echo "📋 Rotas registradas:"
docker exec -it gestao_backend php artisan route:list | grep health

echo "✅ Script concluído!"



# COMO RODAR ESSE ARQUIVO:
# chmod +x fix-permissions.sh
