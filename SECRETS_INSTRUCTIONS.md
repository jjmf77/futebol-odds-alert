# Instruções para adicionar secrets no repositório

Este repositório usa os seguintes secrets no GitHub Actions:

- API_FOOTBALL_KEY
- THE_ODDS_API_KEY
- RESEND_API_KEY
- EMAIL_TO

IMPORTANTE: nunca commit os valores reais destes secrets no código.

Opções para adicionar os secrets:

1) Pela interface web (mais simples):
   - Vá para: https://github.com/jjmf77/futebol-odds-alert
   - Clique em "Settings" → "Secrets and variables" → "Actions" → "New repository secret"
   - Preencha "Name" com um dos nomes acima e cole o valor no campo "Secret". Salve.

2) Usando a GitHub CLI (gh):
   - Instale e autentique a gh: https://cli.github.com/
   - Execute (um por vez):
     gh secret set API_FOOTBALL_KEY --body "<valor>" --repo jjmf77/futebol-odds-alert
     gh secret set THE_ODDS_API_KEY --body "<valor>" --repo jjmf77/futebol-odds-alert
     gh secret set RESEND_API_KEY --body "<valor>" --repo jjmf77/futebol-odds-alert
     gh secret set EMAIL_TO --body "<valor>" --repo jjmf77/futebol-odds-alert

3) Depois de adicionados:
   - Você pode disparar o workflow manualmente em Actions → Notify Odds Alerts → Run workflow
   - Ou espere pela execução agendada (cron) definida em `.github/workflows/notify-odds.yml`.

Se preferir, posso:
- Gerar comandos gh CLI prontos com placeholders para você colar (não incluo valores reais), ou
- Criar um arquivo `.env.example` local (não com os valores reais) — mas não devo commitar valores sensíveis.

Diga qual opção prefere e, se quiser, cole os valores dos secrets aqui (não recomendado publicamente).