# Environment Contract - API <-> Web

## API

Variaveis minimas esperadas (exemplos):

- `APP_PORT` (default local: `8010`)
- `APP_HOST` (default local: `0.0.0.0`)
- `FRONTEND_URL`
- `CORS_ORIGINS`
- variaveis de provider externo (quando aplicavel)

Exposicao local esperada:

- API em `http://localhost:8010`

## Web

Variaveis minimas:

- `VITE_API_BASE_URL` (obrigatoria)
- `VITE_COSMOS_ENABLED` (opcional)
- `VITE_COSMOS_STARS` (opcional)

Exposicao local esperada:

- Web em `http://localhost:5173`

## Compose conjunto

No repo pai, o `docker-compose.yml` deve:

- construir API a partir de `./astro-kovesh-api/api`
- construir Web a partir de `./astro-kovesh-web`
- injetar variaveis via `.env` de cada repositorio filho
- permitir override de URL da API para o frontend

## CORS

- API deve permitir origem da Web por ambiente.
- Web nunca deve depender de bypass local como regra permanente.
