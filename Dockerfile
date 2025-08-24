# Dockerfile v9 - Instalando a versão correta do pnpm
FROM ghcr.io/fazer-ai/chatwoot:latest

# Diagnóstico: A versão do pnpm do repositório Alpine (9.x) é muito antiga.
# O projeto exige a versão 10.x.
# Solução:
# 1. Instalar nodejs e npm, que são as ferramentas base.
# 2. Usar o npm para instalar a versão exata do pnpm que precisamos (@10).
RUN apk add --no-cache nodejs npm && \
    npm install -g pnpm@10

# Copiar o script customizado e torná-lo executável
COPY deployment/ /app/deployment/
RUN chmod +x /app/deployment/extract_brand_assets.sh