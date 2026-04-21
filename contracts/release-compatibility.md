# Release Compatibility - API <-> Web

## Objetivo

Definir compatibilidade minima entre versões de API e Web, e checks obrigatorios antes de release.

## Matriz inicial

| Web | API | Status | Observacoes |
| --- | --- | --- | --- |
| `0.1.x` | `0.1.x` | Compativel | Contrato `/v1/chart` e erros padronizados |

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
- erros principais preservados (`400/422/429/500/503`)

### Web

- testes automatizados passando
- build de producao gerada com sucesso
- fluxo principal de consulta funcionando com API alvo

### Parent

- `docker compose config` valido
- `contracts/` atualizado quando houver alteracao contratual
- ponteiros de submodulo revisados e commitados
