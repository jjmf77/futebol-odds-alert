#!/usr/bin/env bash
set -euo pipefail

# Script seguro para configurar secrets do GitHub para o repositório
# jjmf77/futebol-odds-alert
# Lê os valores a partir de variáveis de ambiente (não grava segredos no ficheiro)

REPO="jjmf77/futebol-odds-alert"

if ! command -v gh >/dev/null 2>&1; then
  echo "Erro: GitHub CLI (gh) não está instalado."
  echo "Instale em: https://cli.github.com/"
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "Erro: gh não está autenticado. Execute: gh auth login"
  exit 1
fi

: "${API_FOOTBALL_KEY:?Need to set API_FOOTBALL_KEY}"
: "${THE_ODDS_API_KEY:?Need to set THE_ODDS_API_KEY}"
: "${RESEND_API_KEY:?Need to set RESEND_API_KEY}"
: "${EMAIL_TO:?Need to set EMAIL_TO}"

for NAME in API_FOOTBALL_KEY THE_ODDS_API_KEY RESEND_API_KEY EMAIL_TO; do
  gh secret set "$NAME" --body "${!NAME}" --repo "$REPO"
  echo "Secret configurado: $NAME"
done

echo "Todos os secrets foram configurados com sucesso."
