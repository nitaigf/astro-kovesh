# Git Flow - Ecossistema Astro Kovesh

Padrao de branching para o repositorio pai e para os repositorios filhos.

## Branches principais

- `main`: versoes estaveis em producao
- `develop`: integracao continua de features

## Branches de suporte

- `feature/*`: desenvolvimento de funcionalidades
- `release/*`: preparacao de versao
- `hotfix/*`: correcoes urgentes em producao

## Regra de alinhamento entre pai e submodulos

No repositorio pai:

- branch `main` deve referenciar commits dos filhos em `main`
- branch `develop` deve referenciar commits dos filhos em `develop`

Recomendacao: em `.gitmodules`, definir `branch = .` para cada submodulo.

## Fluxo diario

1. Trabalhe no repositorio filho correto (`astro-kovesh-api` ou `astro-kovesh-web`).
2. Faça commit e push no filho na branch correspondente (`main`/`develop`/feature).
3. No repositorio pai, atualize o ponteiro do submodulo e gere commit do superprojeto.
4. Mantenha `main` e `develop` sincronizadas conforme politica de release.

## Convencoes

- Features: nomes curtos e descritivos, ex.: `chart-validation`
- Releases/Hotfixes: versionamento semantico, ex.: `0.1.0`, `0.1.1`
- Alteracoes contratuais devem atualizar `contracts/`

## Referencia

- Cheatsheet: https://danielkummer.github.io/git-flow-cheatsheet/
