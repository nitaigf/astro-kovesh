# Backlog - Next Cycle

## Objetivo

Consolidar o marco `0.1.0` e preparar a proxima iteracao de produto com foco em confiabilidade, experiencia de uso e evolucao do dominio astrologico.

## Prioridade Alta

- adicionar tratamento de estados de loading e erro mais orientado ao usuario no frontend
- exibir de forma mais clara quando a engine astrologica estiver indisponivel
- revisar mensagens de erro do backend para textos mais amigaveis no consumo web
- adicionar testes cobrindo o fluxo principal ponta a ponta entre frontend e API
- revisar limites e comportamento de rate limit em ambiente serverless

## Prioridade Media

- melhorar a visualizacao do mapa com mais pontos astrológicos e legenda
- suportar exibicao de pontos adicionais alem de planetas e ascendente
- documentar exemplos de chamadas da API com payloads reais
- criar changelog operacional por release no repositório pai
- adicionar pagina ou secao de ajuda com explicacao dos parametros astrologicos

## Prioridade Baixa

- avaliar hospedagem alternativa para a API caso a Vercel imponha limites futuros ao runtime nativo
- adicionar observabilidade minima com logs estruturados e monitoramento basico
- preparar estrategia de versionamento semantico e tags por repositorio
- estudar exportacao de resultado em formato compartilhavel

## Riscos e Decisoes em Aberto

- confirmar se a Vercel continuara sendo o host definitivo da API
- decidir o nivel de aprofundamento astrologico da resposta sem tornar o payload pesado demais
- decidir se a proxima fase prioriza UX do frontend ou expansao da API
