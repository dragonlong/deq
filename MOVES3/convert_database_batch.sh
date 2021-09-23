#!/bin/bash
# This script is used to convert mysql databases into MariaDB;
# Author: Xiaolong Li of ARC/Virginia Tech, lxiaol9@vt.edu

#************************* Step 1. request for an interactive job: begin user inputs *******************************
# assume all directories/macros have been properly set


#************************* Step 2. convert sql DB into xxx.sql script  *******************************
module load mysql/5.6.14
existingInputDatabaseDir=${DB_OLD_PATH}/${DB_NAME}
movesSetupDir6=/groups/deq/cascades/models/MOVES/statics_moves2014b

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
mysqld_safe --defaults-file=$movesSetupDir6/my-moves.cnf \
            --socket=$runDir/mysql/mysql.sock \
            --datadir=$runDir/mysql/data \
            --log-error=$runDir/mysql/mysql.log \
            --pid-file=$runDir/mysql/mysql.pid \
            --port=3306 &
#wait 5 seconds to ensure the server is running
sleep 5

# dump all old databases
# if not work, try replace '--databases ${DB_NAME}' with '--all-databases'
for DB_NAME in "${db_array[@]}"; 
do  
    echo '---dumping' ${DB_NAME}
    mysqldump --databases ${DB_NAME} --user=root --socket=$runDir/mysql/mysql.sock > ${DB_NEW_PATH}/backupDB/${DB_NAME}.sql
done

# stop mysql server
mysqladmin --user=root --socket=$runDir/mysql/mysql.sock shutdown 


#************************* Step 3. load modules & set all needed paths *******************************
module purge
module load cmake/3.17.2 gcc jdk/1.11.0.9 go/1.13.5
export PATH=/groups/deq/cascades/apps/mariadb/10.4.12/bin:$PATH
export PATH=/groups/deq/cascades/models/MOVES3/statics_moves3/MOVES3_src/ant/bin:$PATH

# Note: Please put all the paths needed here, like mysql database, or MOVES3 src files, etc. 
movesSetupDir=/groups/deq/Shared/Xiaolong/apps/statics_moves3/

#************************* Step 3. use mysql_install_db, mysqld_safe, mysql for MariaDB database prompt *******************************
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

for DB_NAME in "${db_array[@]}"; 
do  
    echo '---converting' ${DB_NAME}
    mysql --socket=$runDir/mariadb/mysql.sock --user=root < ${DB_NEW_PATH}/backupDB/${DB_NAME}.sql
    echo '---moving to' ${DB_NEW_PATH}
    cp -r $runDir/mariadb/data/${DB_NAME} ${DB_NEW_PATH}
done



# [mysql dir]/bin/mysql -h hostname -u root -p
# Create a database on the sql server.    create database [databasename];
# List all databases on the sql server.   show databases;
# Switch to a database.   use [db name];
# To see all the tables in the db.    show tables;
# To see database's field formats.    describe [table name];
