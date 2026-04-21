# Astro Kovesh (Parent Repo)

Repositorio de governanca e orquestracao do ecossistema Astro Kovesh.

Este repositorio nao contem o codigo-fonte principal de API/Web diretamente.
Ele referencia dois projetos independentes e centraliza contratos, regras e operacao conjunta.

## Repositorios filhos

- API: `nitaigf/astro-kovesh-api`
- Web: `nitaigf/astro-kovesh-web`

## Estrutura

```text
.
├── astro-kovesh-api/          # submodulo
├── astro-kovesh-web/          # submodulo
├── contracts/                 # contratos API <-> Web
├── docs/                      # documentacao operacional compartilhada
├── .github/copilot-instructions.md
├── docker-compose.yml         # orquestracao local dos dois sistemas
├── Makefile                   # atalhos para compose e operacao
└── README.md
```

## Submodulos

Objetivo:

- branch `main` do pai usa filhos em `main`
- branch `develop` do pai usa filhos em `develop`

Configuracao recomendada em `.gitmodules`:

```ini
[submodule "astro-kovesh-api"]
  path = astro-kovesh-api
  url = git@github.com:nitaigf/astro-kovesh-api.git
  branch = .
[submodule "astro-kovesh-web"]
  path = astro-kovesh-web
  url = git@github.com:nitaigf/astro-kovesh-web.git
  branch = .
```

Comandos uteis:

```bash
git submodule sync --recursive
git submodule update --init --recursive
# Atualiza filhos para a branch de mesmo nome da branch atual do pai
git submodule update --remote --recursive
```

## Operacao local

Subir stack completa:

```bash
make up
```

Parar stack:

```bash
make down
```

Logs:

```bash
make logs
```

Validar compose:

```bash
make config
```

## Contratos

A pasta `contracts/` define:

- `http-contract.md`: endpoints, versionamento e semantica de erro
- `environment-contract.md`: variaveis e portas esperadas entre sistemas
- `release-compatibility.md`: matriz de compatibilidade e checks minimos

Mudancas de contrato devem ser acompanhadas por:

- atualizacao de testes nos repositorios filhos
- atualizacao da documentacao relevante
- versionamento apropriado quando houver breaking change
