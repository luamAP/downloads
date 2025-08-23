FROM ghcr.io/fazer-ai/chatwoot:latest

# Instala Node.js + npm + pnpm (necessário pro Vite build)
RUN apk add --no-cache nodejs npm && \
    npm install -g pnpm && \
    pnpm --version
