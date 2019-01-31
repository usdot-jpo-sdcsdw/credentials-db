FROM mysql:5.5

ENV USERS_TABLE_NAME=users
ENV ADMINS_TABLE_NAME=admins
ENV USERNAME_COLUMN_NAME=username
ENV USERNAME_COLUMN_TYPE=char(128)
ENV PASSWORD_COLUMN_NAME=password
ENV PASSWORD_COLUMN_TYPE=char(64)

RUN mv /entrypoint.sh /mysql-docker-entrypoint.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh