# https://mariadb.com/kb/en/source-building-mariadb-on-centos/
# https://mariadb.com/kb/en/generic-build-instructions/
# https://mariadb.org/get-involved/getting-started-for-developers/get-code-build-test/
# https://centos.pkgs.org/7/centos-x86_64/gnutls-devel-3.3.29-9.el7_6.x86_64.rpm.html
# https://github.com/USEPA/EPA_MOVES_Model
# https://mariadb.com/kb/en/authentication-from-mariadb-104/
# https://arc.vt.edu/tinkercliffs/

# module purge
# module load cmake/3.17.2 gcc

module reset; module load foss/2020a
module load CMake/3.16.4-GCCcore-9.3.0 Go/1.14
# cd /work/lxiaol9/deq/build/mariadb-10.4.12/build-mariadb
# cd /work/lxiaol9/deq/build/mariadb-10.5.9
# mkdir build-mariadb
# cd build-mariadb
# # cmake .. -LH
# cmake .. -DBUILD_CONFIG=mysql_release \
# -DPLUGIN_AUTH_PAM=NO -DPLUGIN_AUTH_PAM_V1=NO \
# -DWITH_SSL=system -DIGNORE_AIO_CHECK=ON \
# -DCMAKE_INSTALL_PREFIX='/work/lxiaol9/deq/apps/mariadb/10.5.9' \
# -DWITH_JEMALLOC=OFF -DCMAKE_SHARED_LINKER_FLAGS='-fuse-ld=bfd' \

# 		# -DWITH_SAFEMALLO=OFF
#         # -DINSTALL_LAYOUT=RPM \
#         # -DCMAKE_BUILD_TYPE=RelWithDebInfo
# cmake --build . --parallel 5
# # >>> 1. camke couldn't find openssl or gnutls
# # https://stackoverflow.com/questions/16248775/cmake-not-able-to-find-openssl-library
# # http://lists.busybox.net/pipermail/buildroot/2019-February/242149.html
# # openssl version

# # >>> 2. cmake couldn't find jemalloc
# make install DESTDIR="/work/lxiaol9/deq/apps/mariadb/10.5.9"

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
