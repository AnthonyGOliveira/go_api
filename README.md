# Go API

Este projeto é uma API simples desenvolvida em Go para gerenciamento de itens, permitindo buscar e criar itens via requisições HTTP.

## Estrutura do Projeto


```
go_api
├── cmd/
│   └── main.go                        # Ponto de entrada da aplicação
├── internal/
│   ├── handler/
│   │   └── handler.go                 # Handlers HTTP
│   └── service/
│       └── service.go                 # Lógica de negócio
├── infra/                             # Infraestrutura do projeto
│   ├── Dockerfile                     # Docker para banco de dados
│   ├── .env                           # Variáveis de ambiente do banco
│   └── docker-entrypoint-initdb.d/
│       └── 01-init.sql                # Script de criação/seed do banco
├── go.mod                             # Dependências do módulo (inclui gorilla/mux)
├── go.sum                             # Checksums das dependências
├── Makefile                           # Tarefas automatizadas (build, run, docker, etc)
├── README.md                          # Documentação do projeto
├── CHANGELOG.md                       # Histórico de alterações
├── CONTEXT.md                         # Contexto e decisões do projeto
└── AGENTS_HISTORY.md                  # Histórico de interações de agentes
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
   # Dependência principal: github.com/gorilla/mux
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

### Health check

- **Endpoint:** `GET /api/health`
- **Descrição:** Retorna status de saúde da API.


## Middleware

- Middleware de logging registra cada requisição recebida no servidor.

## Infraestrutura (`infra/`)

A pasta `infra/` contém recursos para infraestrutura do projeto, incluindo:

- **Dockerfile**: Define a imagem Docker para a aplicação, facilitando a criação de ambientes reprodutíveis.
- **docker-entrypoint-initdb.d/**: Scripts de inicialização do banco de dados, como o `01-init.sql`, que prepara o banco com tabelas e dados iniciais ao subir o container.

## Makefile

O `Makefile` automatiza tarefas comuns do projeto, como:

- **build**: Compila a aplicação.
- **run**: Executa a aplicação localmente.
- **test**: Roda os testes automatizados.
- **docker-build**: Constrói a imagem Docker.
- **docker-up**: Sobe os containers definidos (ex: aplicação e banco de dados).
- **docker-down**: Para e remove os containers.

Consulte o próprio arquivo para mais detalhes e comandos disponíveis.

## Controle de alterações

Consulte o arquivo [`CHANGELOG.md`](CHANGELOG.md) para o histórico de alterações do projeto.

## Contexto e histórico de agentes

- [`CONTEXT.md`](CONTEXT.md): decisões de arquitetura, contexto e informações relevantes.
- [`AGENTS_HISTORY.md`](AGENTS_HISTORY.md): histórico de interações de agentes (IA, bots, revisores automáticos).

## Licença

Este projeto está licenciado sob a