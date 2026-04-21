# Copilot Instructions - Astro Kovesh Parent

## Scope
- This repository is governance/orchestration only.
- Treat `astro-kovesh-api` and `astro-kovesh-web` as independent projects (submodules).
- Keep shared operational docs and cross-system contracts here.

## Responsibilities
- Maintain `docker-compose.yml` and parent `Makefile` for local orchestration.
- Maintain `contracts/` as the source of truth for API-Web compatibility.
- Maintain `docs/` for shared development workflow (Git Flow, release process, etc).
- Keep submodule references coherent across parent branches.

## Submodule Rules
- Parent `main` should point to children `main` commits.
- Parent `develop` should point to children `develop` commits.
- Prefer `.gitmodules` `branch = .` for branch-aligned updates.
- Avoid editing child source code from parent context unless explicitly required.

## Documentation Rules
- Operational docs for cross-repo concerns belong here.
- Domain-specific implementation docs stay in each child repository.
- Contract changes require synchronized doc updates and explicit compatibility notes.

## Quality Bar
- Keep orchestration reproducible and simple.
- Preserve backward compatibility whenever possible.
- Document every intentional contract change in `contracts/`.
