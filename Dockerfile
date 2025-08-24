# Dockerfile v4 - Corrigindo o instalador do pnpm
FROM ghcr.io/fazer-ai/chatwoot:latest

# O instalador do pnpm precisa saber qual shell está ativo.
# Definimos a variável SHELL=sh explicitamente para o comando.
RUN apk add --no-cache curl && \
    SHELL=sh curl -fsSL https://get.pnpm.io/install.sh | sh -

# O resto continua igual
ENV PNPM_HOME="/root/.local/share/pnpm"
ENV PATH="$PNPM_HOME:$PATH"