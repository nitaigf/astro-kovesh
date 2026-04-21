# Astro Kovesh - Project Understanding

## Purpose

Astro Kovesh is an astrology product split into three repositories:

- parent repo: orchestration, contracts, shared docs and local compose
- API repo: public astrology API
- Web repo: public demo/consumer for the API

The main free product is the public API. The website is a showcase and consumption layer for that API.

## Repository Layout

- `astro-kovesh/`: parent repo (`git@github.com:nitaigf/astro-kovesh.git`)
- `astro-kovesh-api/`: Git submodule (`git@github.com:nitaigf/astro-kovesh-api.git`)
- `astro-kovesh-web/`: Git submodule (`git@github.com:nitaigf/astro-kovesh-web.git`)

The parent repo tracks child commits through Git submodules and keeps integration contracts in `contracts/`.

## Branching Model

- `main`: production
- `develop`: integration
- submodules should stay aligned with the parent branch
- `.gitmodules` uses `branch = .` so parent `main` should point to child `main`, and parent `develop` should point to child `develop`

## Product Flow

1. The user provides date, time and location.
2. The API normalizes the input.
3. The API geocodes text locations when coordinates are not provided.
4. The API resolves the timezone for the coordinates.
5. The API converts local time to UTC.
6. The API calculates astrological data.
7. The Web app renders the normalized input, planetary positions, ascendant, houses, aspects and an SVG chart wheel.

## API Stack

- Python 3.12+
- FastAPI
- Pydantic v2
- Uvicorn
- Geopy with Nominatim
- TimezoneFinder
- Swiss Ephemeris via `pyswisseph` when the runtime supports native extensions

## Web Stack

- SolidJS
- Vite
- TypeScript
- Bun
- Three.js

## Runtime and Deployment

- local API URL: `http://localhost:8010`
- local Web URL: `http://localhost:5173`
- local orchestration: root `docker-compose.yml`
- API deployment target: Vercel project rooted at `astro-kovesh-api/api`
- Web deployment target: Vercel project rooted at `astro-kovesh-web`

## Public Contract

- health endpoint: `GET /health`
- main endpoint: `POST /v1/chart`
- frontend must use only versioned endpoints under `/v1/*`
- API errors should use:

```json
{
  "detail": {
    "code": "string",
    "message": "string"
  }
}
```

Important `detail.code` values currently used:

- `invalid_datetime`
- `geocoding_failed`
- `geocoding_quota_exceeded`
- `timezone_resolution_failed`
- `external_service_failed`
- `rate_limit_exceeded`
- `astrology_engine_unavailable`

## Scope and Constraints

- no database
- no cache
- no user accounts
- no admin panel
- no queues
- no billing
- no textual interpretation engine

The system is intentionally stateless in this phase.

## Notable Architecture Decisions

- the parent repo is documentation and integration glue, not the main source tree
- web and API are deployable independently
- local compose is used to exercise the full stack together
- Swiss Ephemeris is optional by runtime; if unavailable, the API should stay up and return `503` for chart calculation instead of crashing
- geocoding and timezone resolution are abstracted into services for future replacement

## Current Operational Notes

- there is no persistent storage layer in the current implementation
- geocoding depends on external provider availability and quota
- the API has in-memory rate limiting, which is enough for local/simple protection but is not a distributed rate limiter
- release compatibility is tracked in `contracts/release-compatibility.md`

## Source of Truth Files

- parent overview: `README.md`
- contracts: `contracts/*.md`
- API details: `astro-kovesh-api/README.md`
- Web details: `astro-kovesh-web/README.md`
- branch workflow: `docs/GIT_FLOW.md`
