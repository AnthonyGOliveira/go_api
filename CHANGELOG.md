# Changelog

Todas as mudanças notáveis deste projeto serão documentadas neste arquivo.

## [0.1.0] - 2025-08-09
### Adicionado
- Estrutura inicial do projeto Go API
- README inicial
- Arquivos de controle: CHANGELOG.md, CONTEXT.md, AGENTS_HISTORY.md

## [0.1.1] - 2025-08-09
### Adicionado
- Dependência github.com/gorilla/mux v1.8.1


### Adicionado
- Documentação das funcionalidades da pasta `infra/` e do `Makefile` no README.md

## [0.3.0] - 2025-08-09
### Adicionado
- Módulo de configuração centralizado (`internal/config/config.go`) para gerenciamento de variáveis de ambiente do banco de dados e servidor.

## [0.2.0] - 2025-08-09
### Adicionado
- Configuração inicial da API HTTP
- Endpoint GET /api/health
- Middleware de logging para requisições
