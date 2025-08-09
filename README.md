# Go API

Este projeto é uma API simples desenvolvida em Go para gerenciamento de itens, permitindo buscar e criar itens via requisições HTTP.

## Estrutura do Projeto

```
go_api
├── cmd/
│   └── main.go          # Ponto de entrada da aplicação
├── internal/
│   ├── handler/
│   │   └── handler.go   # Handlers HTTP
│   └── service/
│       └── service.go   # Lógica de negócio
├── go.mod               # Dependências do módulo
├── go.sum               # Checksums das dependências
├── README.md            # Documentação do projeto
├── CHANGELOG.md         # Histórico de alterações
├── CONTEXT.md           # Contexto e decisões do projeto
└── AGENTS_HISTORY.md    # Histórico de interações de agentes
```

## Como iniciar o projeto

1. **Clone o repositório:**
   ```
   git clone https://github.com/AnthonyGOliveira/go_api.git
   cd go_api
   ```

2. **Instale as dependências:**
   ```
   go mod tidy
   ```

3. **Execute a aplicação:**
   ```
   go run cmd/main.go
   ```

## API

### Buscar itens

- **Endpoint:** `GET /items`
- **Descrição:** Retorna a lista de itens cadastrados.

### Criar item

- **Endpoint:** `POST /items`
- **Descrição:** Cria um novo item. Requer um corpo JSON com os dados do item.

## Controle de alterações

Consulte o arquivo [`CHANGELOG.md`](CHANGELOG.md) para o histórico de alterações do projeto.

## Contexto e histórico de agentes

- [`CONTEXT.md`](CONTEXT.md): decisões de arquitetura, contexto e informações relevantes.
- [`AGENTS_HISTORY.md`](AGENTS_HISTORY.md): histórico de interações de agentes (IA, bots, revisores automáticos).

## Licença

Este projeto está licenciado sob a