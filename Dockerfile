# Usar a imagem do fork como base
FROM ghcr.io/fazer-ai/chatwoot:latest

# Mudar para o usuário root para instalar pacotes
USER root

# Instalar o pnpm e configurar o PATH para que o sistema o encontre
RUN curl -fsSL https://get.pnpm.io/install.sh | sh -
ENV PNPM_HOME="/root/.local/share/pnpm"
ENV PATH="$PNPM_HOME:$PATH"

# Retornar ao usuário padrão do chatwoot
USER chatwoot