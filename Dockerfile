# Dockerfile v5 - Instalando pnpm via npm (método mais robusto)
FROM ghcr.io/fazer-ai/chatwoot:latest

# O script de instalação do pnpm falhou.
# Em vez disso, vamos usar o npm, que já vem na imagem, para instalar o pnpm globalmente.
# Esta é a forma padrão de instalar ferramentas de linha de comando do Node.js.
RUN npm install -g pnpm