FROM postgres
ENV POSTGRES_USER freezer
ENV POSTGRES_DB freezer


COPY freeze.sql /docker-entrypoint-initdb.d/


