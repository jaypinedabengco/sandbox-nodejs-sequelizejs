#!/bin/bash

#ADD local db creds here
#Don't forget to update the configs/default.json content
export SEQUELIZE_DB_NAME="sample_db_for_sequelize"
export SEQUELIZE_DB_HOST="localhost"
export SEQUELIZE_DB_USERNAME="root"
export SEQUELIZE_DB_PASSWORD="password"
export SEQUELIZE_DB_PORT=3306
export SEQUELIZE_DB_DIALECT="mysql" # DIALECTS : 'mysql'|'mariadb'|'sqlite'|'postgres'|'mssql'
export SEQUELIZE_MODEL_OUTPUT="./models"

#install sequelize globally (comment out if already installed)
sudo npm install -g sequelize-auto

if test "$SEQUELIZE_DB_DIALECT" = 'mysql'; then
    sudo npm install -g mysql
fi

if test "$SEQUELIZE_DB_DIALECT" = 'mariadb'; then
    sudo npm install -g mysql
fi

if test "$SEQUELIZE_DB_DIALECT" = 'sqlite'; then
    sudo npm install -g sqlite
fi

if test "$SEQUELIZE_DB_DIALECT" = 'postgres'; then
    sudo npm install -g pg-hstore
fi

if test "$SEQUELIZE_DB_DIALECT" = 'mssql'; then
   sudo npm install -g tedious
fi

sequelize-auto -o $SEQUELIZE_MODEL_OUTPUT -d $SEQUELIZE_DB_NAME -h $SEQUELIZE_DB_HOST -u $SEQUELIZE_DB_USERNAME -p $SEQUELIZE_DB_PORT -x $SEQUELIZE_DB_PASSWORD -e $SEQUELIZE_DB_DIALECT