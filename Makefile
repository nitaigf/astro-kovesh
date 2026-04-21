.PHONY: help up down logs ps config rebuild

help:
	@echo "Targets disponíveis:"
	@echo "  make up       - Sobe API e Web em background"
	@echo "  make down     - Para e remove containers"
	@echo "  make logs     - Exibe logs de API e Web"
	@echo "  make ps       - Lista containers do compose"
	@echo "  make config   - Valida docker-compose.yml"
	@echo "  make rebuild  - Rebuild completo e sobe em background"

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f api web

ps:
	docker compose ps

config:
	docker compose config

rebuild:
	docker compose up --build -d
