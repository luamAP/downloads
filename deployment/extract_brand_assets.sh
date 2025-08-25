#!/bin/sh

set -e

# Configuração do repositório GitHub
GITHUB_USER="luamAP"
GITHUB_REPO="downloads"
BRANCH="main"
ZIP_PATH="branding.zip"

URL="https://raw.githubusercontent.com/$GITHUB_USER/$GITHUB_REPO/$BRANCH/$ZIP_PATH"

TEMP_DIR=$(mktemp -d)
ZIP_FILE="$TEMP_DIR/branding.zip"
EXTRACT_DIR="$TEMP_DIR/extracted_favicons"
TARGET_DIR="public/brand-assets"

cleanup() {
  echo "Cleaning up temporary files..."
  rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

echo "Baixando branding.zip do GitHub ($URL)..."
if wget -q -O "$ZIP_FILE" "$URL"; then
  echo "Download concluído."
else
  echo "Erro: não foi possível baixar $URL"
  exit 1
fi

echo "Extraindo em: $EXTRACT_DIR"
mkdir -p "$EXTRACT_DIR"
if unzip -q "$ZIP_FILE" -d "$EXTRACT_DIR"; then
  echo "Extração concluída."
else
  echo "Erro: falha ao extrair $ZIP_FILE"
  exit 1
fi

echo "Substituindo arquivos antigos em $TARGET_DIR..."
find "$EXTRACT_DIR" -type f -exec mv -f {} "$TARGET_DIR/" \;

echo "Processo finalizado! Agora rode:"
echo "bundle exec rails assets:clobber"
echo "bundle exec rails assets:precompile RAILS_ENV=production"
