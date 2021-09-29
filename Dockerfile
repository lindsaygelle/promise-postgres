FROM postgres:alpine

ENV POSTGRES_DB=promise \
    POSTGRES_PASSWORD=postgres \
    POSTGRES_USER=postgres

COPY ./install-extensions.sql /docker-entrypoint-initdb.d
