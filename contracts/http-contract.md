# HTTP Contract - API <-> Web

## Base

- API base URL definida externamente no frontend por `VITE_API_BASE_URL`
- Todos os endpoints consumidos pelo frontend devem ser versionados em `/v1/*`

## Endpoint principal

### `POST /v1/chart`

Body JSON esperado:

- `date` em formato ISO (`YYYY-MM-DD`)
- `time` em formato `HH:mm` ou `HH:mm:ss`
- `location.query` para busca textual
- ou `location.lat` + `location.lng` para coordenadas
- `timezone` opcional
- `zodiac_mode`: `tropical` ou `sidereal`
- `house_system`: `placidus`, `koch` ou `whole_sign`

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

- `422`: validacao semantica/estrutura
- `404`: localizacao nao encontrada
- `429`: limite de requisicoes
- `500`: erro interno inesperado
- `503` + `detail.code=astrology_engine_unavailable`: engine astrológica indisponivel

Codigos `detail.code` relevantes:

- `invalid_datetime`
- `geocoding_failed`
- `geocoding_quota_exceeded`
- `timezone_resolution_failed`
- `external_service_failed`
- `rate_limit_exceeded`
- `astrology_engine_unavailable`

## Regras de evolucao

- Mudancas breaking exigem nova versao de endpoint ou plano de migracao.
- Mudancas aditivas (novos campos opcionais) sao permitidas sem quebrar clientes.
- Remocao/renomeacao de campos deve ser previamente comunicada e versionada.
