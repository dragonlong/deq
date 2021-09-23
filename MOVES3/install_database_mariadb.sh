#!/bin/bash

# (1) interactive, (2) backup SQL Databases; 3) load MariaDB; 4} convert;

# This script is used to convert mysql databases into MariaDB;
# Author: Xiaolong Li of ARC/Virginia Tech, lxiaol9@vt.edu

#************************* Step 1. request for an interactive job: begin user inputs *******************************
salloc --partition=dev_q --time=2:00:00 --nodes=1 --tasks-per-node=12 -A deqtest

# set macros
DB_NAME=movesdb20210209
DB_OLD_PATH=/groups/deq/Shared/Xiaolong/apps/databases
DB_NEW_PATH=/groups/deq/Shared/Xiaolong/converted_db
mkdir -p ${DB_NEW_PATH}/backupDB

#************************* Step 3. load modules for MariaDB *******************************
module purge
module load cmake/3.17.2 gcc jdk/1.11.0.9 go/1.13.5
export PATH=/groups/deq/cascades/apps/mariadb/10.4.12/bin:$PATH
export PATH=/groups/deq/cascades/models/MOVES3/statics_moves3/MOVES3_src/ant/bin:$PATH

# Note: Please put all the paths needed here, like mysql database, or MOVES3 src files, etc.
movesSetupDir=/groups/deq/Shared/Xiaolong/apps/statics_moves3/

#************************* Step 4. use mysql_install_db, mysqld_safe, mysql for MariaDB database prompt *******************************
runDir=$TMPDIR
#make output databases and data directories
mkdir $runDir/mysql
mkdir $runDir/mariadb/data

#initialize the data directory for mysql
mysql_install_db --socket=$runDir/mariadb/mysql.sock \
                 --datadir=$runDir/mariadb/data \
                 --log-error=$runDir/mariadb/mysql.log \
                 --pid-file=$runDir/mariadb/mysql.pid \
                 --auth-root-authentication-method=normal \
                 --user=$USER

cd $runDir

#start the mysql server(--skip-grant-tables --skip-networking also works for root user login \)
mysqld_safe --defaults-file=$movesSetupDir/my-moves.cnf \
            --socket=$runDir/mariadb/mysql.sock \
            --datadir=$runDir/mariadb/data \
            --log-error=$runDir/mariadb/mysql.log \
            --pid-file=$runDir/mariadb/mysql.pid \
            --port=3306 \
            --user=$USER &

#wait 5 seconds to ensure the server is running
sleep 5

mysql --socket=$runDir/mariadb/mysql.sock --user=root < ${DB_NEW_PATH}/backupDB/${DB_NAME}.sql
cp -r $runDir/mariadb/data/${DB_NAME} ${DB_NEW_PATH}

# [mysql dir]/bin/mysql -h hostname -u root -p
# Create a database on the sql server.    create database [databasename];
# List all databases on the sql server.   show databases;
# Switch to a database.   use [db name];
# To see all the tables in the db.    show tables;
# To see database's field formats.    describe [table name];
