FROM mariadb:10.11

WORKDIR /var/lib/mysql

COPY database.sql .

COPY setup.sh .

RUN chmod +x setup.sh

EXPOSE 3306

CMD ["sh", "-c", "docker-entrypoint.sh mysqld & sleep 10 && ./setup.sh && tail -f /dev/null"]

