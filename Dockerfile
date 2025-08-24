# Dockerfile v6 - A Abordagem Direta
FROM ghcr.io/fazer-ai/chatwoot:latest

# Diagnóstico final: A imagem base não tem NENHUMA ferramenta de build (nem curl, nem npm).
# Solução: Usar o gerenciador de pacotes do sistema (apk) para instalar
# o pnpm diretamente do repositório oficial do Alpine.
# Simples, limpo e sem dependências ocultas.
RUN apk add --no-cache pnpm