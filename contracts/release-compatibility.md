# Release Compatibility - API <-> Web

## Objetivo

Definir compatibilidade minima entre versões de API e Web, e checks obrigatorios antes de release.

## Matriz

| Web | API | Status | Observacoes |
| --- | --- | --- | --- |
| `0.1.x` | `0.1.x` | Compativel | Contrato `/v1/chart` e erros padronizados |
| `0.1.0` | `0.1.0` | Validado | API e Web publicados, deploys operacionais e fluxo principal funcionando |

## Regras

- Mudanca breaking na API exige:
  - incremento de versao apropriado
  - atualizacao desta matriz
  - plano de migracao para Web
- Mudanca de contrato no Web (consumo) exige validacao contra API alvo.

## Checklists minimos de release

### API

- testes automatizados passando
- endpoint `/v1/chart` validado
- erros principais preservados (`404/422/429/500/503`)

### Web

- testes automatizados passando
- build de producao gerada com sucesso
- fluxo principal de consulta funcionando com API alvo

### Parent

- `docker compose config` valido
- `contracts/` atualizado quando houver alteracao contratual
- ponteiros de submodulo revisados e commitados

## Release 0.1.0

Marco validado com:

- API FastAPI publicada e integrada ao frontend
- Web SolidJS publicada na Vercel
- contrato `/v1/chart` alinhado entre codigo e documentacao
- deploy da API ajustado para Vercel com `Root Directory=api`
- runtime de producao configurado para instalar `pyswisseph`
