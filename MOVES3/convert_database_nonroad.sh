#!/bin/bash

# (1) interactive, (2) backup SQL Databases; 3) load MariaDB; 4} convert;

# This script is used to convert mysql databases into MariaDB;
# Author: Xiaolong Li of ARC/Virginia Tech, lxiaol9@vt.edu


#************************* Step 1. request for an interactive job: begin user inputs *******************************
salloc --partition=dev_q --time=2:00:00 --nodes=1 --tasks-per-node=12 -A deqtest

# set macros
DB_NAME=c51041y2017_m301_nr_test1_out
DB_OLD_PATH=/groups/deq/cascades/models/MOVES3.0.1/4-testruns/nonroad_chesterfield/test2_xiaolong/mysql_out/outputs/
DB_NEW_PATH=/groups/deq/Shared/Xiaolong/converted_db
mkdir -p ${DB_NEW_PATH}/backupDB

#************************* Step 2. convert SQL DB into xxx.sql script  *******************************
cd /groups/deq/cascades/models/MOVES3.0.1/statics_moves301_xiaolong/MOVES301_src
module purge
module load cmake/3.17.2 gcc jdk/1.11.0.9 go/1.13.5
export PATH=/groups/deq/cascades/apps/mariadb/10.4.12/bin:$PATH
export PATH=/groups/deq/cascades/models/MOVES3.0.1/statics_moves301_xiaolong/MOVES301_src/ant/bin:$PATH
existingInputDatabaseDir=${DB_OLD_PATH}/${DB_NAME}
movesSetupDir=/groups/deq/cascades/models/MOVES3.0.1/statics_moves301_xiaolong/
#Ensure user has TMPDIR set properly
if [ -z "$TMPDIR" ]; then
    echo "TMPDIR not set.  Have you opened an interactive session?"
    exit;
fi

runDir=$TMPDIR
mkdir $runDir/mysql
mkdir $runDir/mysql/data

#initialize the data directory for mysql
mysql_install_db --socket=$runDir/mysql/mysql.sock \
                 --datadir=$runDir/mysql/data \
                 --log-error=$runDir/mysql/mysql.log \
                 --pid-file=$runDir/mysql/mysql.pid \
                 --user=$USER

cp -r $existingInputDatabaseDir $runDir/mysql/data/

#start the mysql server
mysqld_safe --defaults-file=$movesSetupDir/my-moves.cnf \
            --socket=$runDir/mysql/mysql.sock \
            --datadir=$runDir/mysql/data \
            --log-error=$runDir/mysql/mysql.log \
            --pid-file=$runDir/mysql/mysql.pid \
            --port=3306 \
            --user=$USER &
#wait 5 seconds to ensure the server is running
sleep 5

# dump all old databases
# if not work, try replace '--databases ${DB_NAME}' with '--all-databases'
mysqldump --databases ${DB_NAME} --user=$USER --socket=$runDir/mysql/mysql.sock > ${DB_NEW_PATH}/backupDB/${DB_NAME}.sql
mysqldump --databases ${DB_NAME} --user=root --socket=$runDir/mysql/mysql.sock > ${DB_NEW_PATH}/backupDB/${DB_NAME}.sql

# stop mysql server
mysqladmin --user=root --socket=$runDir/mysql/mysql.sock shutdown


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

http://g2pc1.bu.edu/~qzpeng/manual/MySQL%20Commands.htm
# [mysql dir]/bin/mysql -h hostname -u root -p
# Create a database on the sql server.    create database [databasename];
# List all databases on the sql server.   show databases;
# Switch to a database.   use [db name];
# To see all the tables in the db.    show tables;
# To see database's field formats.    describe [table name];
# Show all data in a table.: SELECT * FROM [table name];

https://zetcode.com/mysql/exportimport/
http://g2pc1.bu.edu/~qzpeng/manual/MySQL%20Commands.htm

[lxiaol9@ca010 tmpfs]$ mysql --socket=$runDir/mysql/mysql.sock --user=root
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 3
Server version: 10.4.12-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases
    -> ;
+----------------------------+
| Database                   |
+----------------------------+
| c51041y2017_m3_nr_test_out |
| information_schema         |
| movesdb20201105            |
| mysql                      |
| performance_schema         |
| test                       |
+----------------------------+
6 rows in set (0.001 sec)

MariaDB [(none)]> use c51041y2017_m3_nr_test_out;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [c51041y2017_m3_nr_test_out]> show tables;
+----------------------------------------+
| Tables_in_c51041y2017_m3_nr_test_out   |
+----------------------------------------+
| activitytype                           |
| baserateoutput                         |
| baserateunits                          |
| bundletracking                         |
| inventory_by_county_fueltype_pollutant |
| inventory_by_sector_scc_pollutant      |
| movesactivityoutput                    |
| moveserror                             |
| moveseventlog                          |
| movesoutput                            |
| movesrun                               |
| movestablesused                        |
| movesworkersused                       |
| rateperdistance                        |
| rateperhour                            |
| rateperprofile                         |
| rateperstart                           |
| ratepervehicle                         |
| startspervehicle                       |
+----------------------------------------+
19 rows in set (0.000 sec)

MariaDB [c51041y2017_m3_nr_test_out]> select *movesoutput
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'movesoutput' at line 1
MariaDB [c51041y2017_m3_nr_test_out]> select movesoutput;
ERROR 1054 (42S22): Unknown column 'movesoutput' in 'field list'
MariaDB [c51041y2017_m3_nr_test_out]> show movesoutput;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'movesoutput' at line 1
MariaDB [c51041y2017_m3_nr_test_out]>
cd /groups/deq/cascades/models/MOVES3/2-applications


python /groups/deq/Shared/ERTAC/Version2.1.1_11-26-2018a/ertac_preprocess.py -o C2.1.1CONUSv16.0_2023_MDE10aHRLY_ --suppress_p
