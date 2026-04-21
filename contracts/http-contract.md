# HTTP Contract - API <-> Web

## Base

- API base URL definida externamente no frontend por `VITE_API_BASE_URL`
- Todos os endpoints consumidos pelo frontend devem ser versionados em `/v1/*`

## Endpoint principal

### `GET /v1/chart`

Parâmetros esperados:

- dados de nascimento (data/hora)
- localizacao (cidade/pais) ou coordenadas
- timezone derivada/fornecida conforme regra da API

Resposta de sucesso:

- payload JSON com dados astrológicos normalizados

## Semantica de erro

Formato minimo esperado:

```json
{
  "detail": {
    "code": "string",
    "message": "string"
  }
}
```

Codigos relevantes para o frontend:

- `400`: entrada invalida
- `422`: validacao semantica/estrutura
- `429`: limite de requisicoes
- `500`: erro interno inesperado
- `503` + `detail.code=astrology_engine_unavailable`: engine astrológica indisponivel

## Regras de evolucao

- Mudancas breaking exigem nova versao de endpoint ou plano de migracao.
- Mudancas aditivas (novos campos opcionais) sao permitidas sem quebrar clientes.
- Remocao/renomeacao de campos deve ser previamente comunicada e versionada.
