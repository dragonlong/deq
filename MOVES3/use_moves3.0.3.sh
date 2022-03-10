#!/bin/bash

# (1) interactive, (2) source ~/MOVES303_src/env.csh 3) bash getMySQLprompt_MOVES3.sh;

# This script is used to open a mysql terminal to get inside mysql for mysql prompt
# Author: Brian Marshall - ARC/Virginia Tech
# modified by Xiaolong Li of ARC/Virginia Tech, lxiaol9@vt.edu

#************************* Step 1. request for an interactive job: begin user inputs *******************************
salloc --partition=dev_q --time=2:00:00 --nodes=1 --tasks-per-node=4 -A deqtest

#************************* Step 2. load modules & set all needed paths *******************************
module purge
module load cmake/3.17.2 gcc jdk/1.11.0.9 go/1.13.5
export PATH=/groups/deq/cascades/apps/mariadb/10.4.12/bin:$PATH
export PATH=/groups/deq/cascades/models/MOVES3.0.3/statics_moves303/MOVES303_src/ant/bin:$PATH

# Note: Please put all the paths needed here, like mysql database, or MOVES3 src files, etc.
existingInputDatabaseDir=/groups/deq/cascades/models/MOVES3.0.3/statics_moves303/databases/movesdb20220105
movesSetupDir=/groups/deq/cascades/models/MOVES3.0.3/statics_moves303/

#Ensure user has TMPDIR set properly
if [ -z "$TMPDIR" ]; then
    echo "TMPDIR not set.  Have you opened an interactive session?"
    exit;
fi

#************************* Step 3. use mysql_install_db, mysqld_safe, mysql for MariaDB database prompt *******************************
runDir=$TMPDIR
#make output databases and data directories
mkdir $runDir/mysql
mkdir $runDir/mysql/data

#initialize the data directory for mysql
mysql_install_db --socket=$runDir/mysql/mysql.sock \
                 --datadir=$runDir/mysql/data \
                 --log-error=$runDir/mysql/mysql.log \
                 --pid-file=$runDir/mysql/mysql.pid \
                 --auth-root-authentication-method=normal \
                 --user=$USER

# Note: Please copy all needed files besides the database

# we could copy the existing database here, or build the database from mysql from the commented lines
# cp -r $existingInputDatabaseDir/*  $runDir/mysql/data

cd $runDir

#start the mysql server(--skip-grant-tables --skip-networking also works for root user login \)
mysqld_safe --defaults-file=$movesSetupDir/my-moves.cnf \
            --socket=$runDir/mysql/mysql.sock \
            --datadir=$runDir/mysql/data \
            --log-error=$runDir/mysql/mysql.log \
            --pid-file=$runDir/mysql/mysql.pid \
            --port=3306 \
            --user=$USER &

#wait 5 seconds to ensure the server is running
sleep 5

#open mysql terminal
#mysql --socket=$runDir/mysql/mysql.sock --user=root


# ***************************how to create the MOVES3 database using commands******************************#
mysql> CREATE USER 'root'@'%' IDENTIFIED BY 'root';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
cd /groups/deq/cascades/models/MOVES3.0.3/statics_moves303/MOVES303_src/database/Setup
mysql -uroot --force --socket=$runDir/mysql/mysql.sock < CreateMOVESUser.sql
mysql -uroot --socket=$runDir/mysql/mysql.sock < movesdb20220105.sql
#******************************* create ends here ************************************************#''
mkdir -p /groups/deq/cascades/models/MOVES3.0.3/statics_moves303/databases/
cp -r $runDir/mysql/data/movesdb20220105 /groups/deq/cascades/models/MOVES3.0.3/statics_moves303/databases/

mysql --socket=$runDir/mysql/mysql.sock

#NOTE The mysql server is left running
# [mysql dir]/bin/mysql -h hostname -u root -p
# Create a database on the sql server.    create database [databasename];
# List all databases on the sql server.   show databases;
# Switch to a database.   use [db name];
# To see all the tables in the db.    show tables;
# To see database's field formats.    describe [table name];
