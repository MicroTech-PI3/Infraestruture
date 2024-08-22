#! /bin/bash

username="root"
password="$MARIADB_ROOT_PASSWORD"

sql_file="/var/lib/mysql/database.sql"

wait_for_mysql() {
    until mariadb -u"$username" -p"$password" &>/dev/null; do
        echo "Waiting for MySQL server to start..."
        sleep 1
    done
}

wait_for_mysql

mariadb -u"$username" -p"$password" <<EOF
source $sql_file
EOF