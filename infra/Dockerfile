# Usa a imagem oficial (tag estável Alpine para menor tamanho)
FROM postgres:15-alpine

# Variáveis padrão (substitua por um .env em produção)
ENV POSTGRES_USER=dev
ENV POSTGRES_DB=goapi
ENV PGDATA=/var/lib/postgresql/data/pgdata

# Copia scripts SQL / shell de inicialização (executados apenas no primeiro startup)
# Coloque aqui seus arquivos .sql ou .sh
COPY docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/

# Expondo porta padrão
EXPOSE 5432

# Volume declarado (o usuário que rodar o container pode sobrescrever com -v)
VOLUME ["/var/lib/postgresql/data"]

# Healthcheck simples (usa pg_isready embutido na imagem postgres)
HEALTHCHECK --interval=10s --timeout=5s --start-period=10s --retries=5 \
  CMD pg_isready -U "$POSTGRES_USER" || exit 1

# A imagem oficial já define ENTRYPOINT/CMD apropriados, então não os reescrevemos.
