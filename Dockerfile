FROM postgres:alpine

COPY ./install-extensions.sql /docker-entrypoint-initdb.d
