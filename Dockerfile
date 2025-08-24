# Dockerfile CORRIGIDO E SIMPLIFICADO
FROM ghcr.io/fazer-ai/chatwoot:latest

# Comandos 'RUN' são executados como root por padrão, o que é perfeito para instalar software.
# Nós apenas instalamos o pnpm e deixamos a imagem base cuidar da definição do usuário final.
RUN curl -fsSL https://get.pnpm.io/install.sh | sh -
ENV PNPM_HOME="/root/.local/share/pnpm"
ENV PATH="$PNPM_HOME:$PATH"