#!/bin/bash

# (1) interactive, (2) source ~/MOVES3_src/env.csh 3) bash getMySQLprompt_MOVES3.sh;

# This script is used to open a mysql terminal to get inside mysql for mysql prompt
# Author: Brian Marshall - ARC/Virginia Tech
# modified by Xiaolong Li of ARC/Virginia Tech, lxiaol9@vt.edu

#************************* Step 1. request for an interactive job: begin user inputs *******************************
salloc --partition=dev_q --time=2:00:00 --nodes=1 --tasks-per-node=4 -A deqtest

# #************************* Step 2. load modules & set all needed paths *******************************
module reset; module load foss/2020b
module load EasyBuild
module load CMake/3.18.4-GCCcore-10.2.0
module load Go/1.14
module load Java/11.0.2
module load MariaDB/10.5.9-foss-2020b
export PATH=/fastscratch/deq/models/MOVES3/statics_moves3/MOVES3_src/ant/bin:$PATH

cd /fastscratch/deq/models/MOVES3/statics_moves3/MOVES3_src

# mkdir -p /fastscratch/deq/databases
# mkdir -p /fastscratch/deq/tmp/
# TMPDIR=/fastscratch/deq/tmp/

# set macros
DB_NAME=movesdb20201105
DB_NEW_PATH=/fastscratch/deq/converted_db
mkdir -p ${DB_NEW_PATH}/backupDB

# Note: Please put all the paths needed here, like mysql database, or MOVES3 src files, etc.
existingInputDatabaseDir=/fastscratch/deq/databases/movesdb20201105
movesSetupDir=/fastscratch/deq/models/MOVES3/statics_moves3

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
cp -r $existingInputDatabaseDir/*  $runDir/mysql/data
# # ***************************how to create the MOVES3 database using commands******************************#
# # # mysql> CREATE USER 'root'@'%' IDENTIFIED BY 'root';
# # # mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
# cd /groups/deq/cascades/models/MOVES3/statics_moves3/MOVES3_src/database/Setup
# mysql -uroot --force --socket=$runDir/mysql/mysql.sock < CreateMOVESUser.sql
# mysql -uroot --socket=$runDir/mysql/mysql.sock < movesdb20201105.sql
# #******************************* create ends here ************************************************#''

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


mysql --socket=$runDir/mysql/mysql.sock --user=root < ${DB_NEW_PATH}/backupDB/${DB_NAME}.sql
cp -r $runDir/mysql/data/${DB_NAME} ${DB_NEW_PATH}


#open mysql terminal
#mysql --socket=$runDir/mysql/mysql.sock --user=root

mysql --socket=$runDir/mysql/mysql.sock

#NOTE The mysql server is left running

#
# # ***************************how to create the MOVES3 database using commands******************************#
# mysql> CREATE USER 'root'@'%' IDENTIFIED BY 'root';
# mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
# cd /groups/deq/cascades/models/MOVES3.0.2/sources/MOVES3_src/database/Setup
# mysql -uroot --force --socket=$runDir/mysql/mysql.sock < CreateMOVESUser.sql
# mysql -uroot --socket=$runDir/mysql/mysql.sock < movesdb20210726.sql
# #******************************* create ends here ************************************************#''
# mkdir -p /groups/deq/cascades/models/MOVES3.0.2/sources/databases/
# cp -r $runDir/mysql/data/movesdb20210726 /groups/deq/cascades/models/MOVES3.0.2/sources/databases/
#
# mysql --socket=$runDir/mysql/mysql.sock
#
# #NOTE The mysql server is left running
# # [mysql dir]/bin/mysql -h hostname -u root -p
# # Create a database on the sql server.    create database [databasename];
# # List all databases on the sql server.   show databases;
# # Switch to a database.   use [db name];
# # To see all the tables in the db.    show tables;
# # To see database's field formats.    describe [table name];
#
# #!/bin/sh -xf
# export PATH=MYDIR/MOVES3_src/:$PATH
# cd MYDIR/MOVES3_src
# . setenv.sh
#
# echo "" > MYDIR/scripts/runlog.txt
#
# java -Xmx1200m gov.epa.otaq.moves.master.commandline.MOVESCommandLine -r MYDIR/runspecs/c51041y2017_default_jul_nox_m3_nr_test1.mrs >> MYDIR/scripts/runlog.txt
