#!/usr/bin/env bash
set -euo pipefail

# Script para configurar secrets do GitHub para o repositório
# jjmf77/futebol-odds-alert
#
# Pré-requisitos:
#   - gh instalado e autenticado: gh auth login
#   - permissão de admin no repositório
#
# Uso:
#   1) Edite os valores abaixo antes de executar
#   2) Execute: bash setup-secrets.sh
#
# Atenção:
#   Não commite este ficheiro com valores reais em produção.
#   Em ambientes compartilhados, use variáveis de ambiente em vez de escrever valores diretamente.

REPO="jjmf77/futebol-odds-alert"

# Preencha com os valores reais antes de executar.
API_FOOTBALL_KEY="SEU_API_FOOTBALL_KEY_AQUI"
THE_ODDS_API_KEY="SEU_THE_ODDS_API_KEY_AQUI"
RESEND_API_KEY="SEU_RESEND_API_KEY_AQUI"
EMAIL_TO="seu-email@exemplo.com"

if ! command -v gh >/dev/null 2>&1; then
  echo "Erro: GitHub CLI (gh) não está instalado."
  echo "Instale em: https://cli.github.com/"
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "Erro: gh não está autenticado. Execute: gh auth login"
  exit 1
fi

for pair in \
  "API_FOOTBALL_KEY:$API_FOOTBALL_KEY" \
  "THE_ODDS_API_KEY:$THE_ODDS_API_KEY" \
  "RESEND_API_KEY:$RESEND_API_KEY" \
  "EMAIL_TO:$EMAIL_TO"; do
  key="${pair%%:*}"
  value="${pair#*:}"

  # Evita enviar valores placeholder
  if [[ "$value" == "SEU_"* || "$value" == "seu-email@exemplo.com" ]]; then
    echo "Aviso: $key ainda contém valor placeholder. Ajuste o script antes de continuar."
    exit 1
  fi

  gh secret set "$key" --body "$value" --repo "$REPO"
  echo "Secret configurado: $key"
done

echo "Todos os secrets foram configurados com sucesso."
