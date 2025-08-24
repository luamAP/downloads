# Dockerfile v7 - Copiando scripts customizados
FROM ghcr.io/fazer-ai/chatwoot:latest

# Instalar o pnpm diretamente usando o gerenciador de pacotes do sistema
RUN apk add --no-cache pnpm

# Copiar a pasta 'deployment' (que contém nosso script) para dentro da imagem
COPY deployment/ /app/deployment/