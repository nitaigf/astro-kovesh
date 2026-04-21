# Changelog

## 0.1.0 - 2026-04-21

Primeira release funcional do ecossistema Astro Kovesh.

### Entregue

- API publica com `GET /health` e `POST /v1/chart`
- frontend SolidJS para consulta astrologica
- deploy separado de API e Web na Vercel
- compose local para orquestracao da stack
- contratos compartilhados entre API e Web

### Estabilizado

- contrato HTTP alinhado com a implementacao real
- formato de erro padronizado em `detail.code` e `detail.message`
- configuracao de ambiente revisada para local e producao
- deploy da API ajustado para `Root Directory=api` na Vercel
- dependencias de runtime ajustadas para incluir a engine astrologica

### Validado

- testes automatizados da API
- testes e build do frontend
- compose do repositorio pai
