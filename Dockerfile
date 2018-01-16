FROM mysql:5.5

ENV USERS_TABLE_NAME=users
ENV ADMINS_TABLE_NAME=admins
ENV USERNAME_COLUMN_NAME=username
ENV USERNAME_COLUMN_TYPE=char(128)
ENV PASSWORD_COLUMN_NAME=password
ENV PASSWORD_COLUMN_TYPE=char(64)

COPY credentials-db-docker-entrypoint.sh /credentials-db-docker-entrypoint.sh

RUN chmod +x /credentials-db-docker-entrypoint.sh

ENTRYPOINT ["/credentials-db-docker-entrypoint.sh"]
CMD ["mysqld"]