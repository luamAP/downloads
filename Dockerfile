# Dockerfile v3 - Instalando dependências do build
FROM ghcr.io/fazer-ai/chatwoot:latest

# A imagem base é minimalista e não tem 'curl'.
# Primeiro, usamos o gerenciador de pacotes do sistema (apk, para Alpine Linux)
# para instalar o 'curl'. O '&& \' permite juntar múltiplos comandos em uma só camada.
RUN apk add --no-cache curl && \
    curl -fsSL https://get.pnpm.io/install.sh | sh -

# O resto continua igual, configurando o PATH para o pnpm
ENV PNPM_HOME="/root/.local/share/pnpm"
ENV PATH="$PNPM_HOME:$PATH"