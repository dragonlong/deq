
#************************* Step 1. request for an interactive job: begin user inputs *******************************
salloc --partition=dev_q --time=2:00:00 --nodes=1 --tasks-per-node=4 -A deqtest


#************************* Step 2. load modules & set all needed paths *******************************
module purge
module load cmake/3.17.2 gcc jdk/1.11.0.9 go/1.13.5
export PATH=/groups/deq/cascades/apps/mariadb/10.4.12/bin:$PATH
export PATH=/groups/deq/cascades/models/MOVES3/statics_moves3/MOVES3_src/ant/bin:$PATH

# Note: Please put all the paths needed here, like mysql database, or MOVES3 src files, etc.
existingInputDatabaseDir=/groups/deq/cascades/models/MOVES3/statics_moves3/databases/movesdb20201105
movesSetupDir=/groups/deq/cascades/models/MOVES3/statics_moves3/

module reset; module load foss/2020a
export PATH=/work/lxiaol9/deq/apps/mariadb/10.5.9/bin:$PATH
cd /work/lxiaol9/deq/models/MOVES3/statics_moves3/MOVES3_src

# mkdir -p /work/lxiaol9/deq/databases
# mkdir -p /work/lxiaol9/deq/tmp/
TMPDIR=/work/lxiaol9/deq/tmp/

# set macros
DB_NAME=movesdb20201105
DB_OLD_PATH=/groups/deq/Shared/Xiaolong/apps/databases
DB_NEW_PATH=/groups/deq/Shared/Xiaolong/converted_db
mkdir -p ${DB_NEW_PATH}/backupDB

# Note: Please put all the paths needed here, like mysql database, or MOVES3 src files, etc.
existingInputDatabaseDir=/work/lxiaol9/deq/databases/movesdb20201105
movesSetupDir=/work/lxiaol9/deq/models/MOVES3/statics_moves3


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
