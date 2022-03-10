# >>>>>>>>>>>>>>>> take MOVES3.0.3 for example <<<<<<<<<<<<<<<<<<<<<<<#
# please refer to https://github.com/USEPA/EPA_MOVES_Model/tree/dev/v3.0.3
# by xiaolong li, lxiaol9@vt.edu, written in Jan. 2022

# >>>>>>>>>>> step 0. prepare corrsponding versions of MariaDB, Java, and GO;
      # MariaDB>=10.4
      # Java JDK (version 11)
      # Go>=1.13
module purge
module load cmake/3.17.2 gcc
cd /groups/deq/Shared/Xiaolong/build/mariadb-10.4.12/build-mariadb
cmake .. -LH
cmake .. -DBUILD_CONFIG=mysql_release -DWITH_SSL=system -DCMAKE_INSTALL_PREFIX='/groups/deq/cascades/apps/mariadb/10.4.12' -DWITH_JEMALLOC=OFF
        # -DWITH_SAFEMALLO=OFF
cmake --build . --parallel 5
make install

# >>>>>>>>>>>>> step 1. test MariaDB installation and generate new databases
# todo

!# step 2. compile Java, Go, Fortran codes in MOVES3
cd /groups/deq/cascades/models/MOVES3.0.1/statics_moves301_xiaolong/MOVES301_src
module purge
module load cmake/3.17.2 gcc jdk/1.11.0.9 go/1.13.5
export PATH=/groups/deq/cascades/apps/mariadb/10.4.12/bin:$PATH
export PATH=/groups/deq/cascades/models/MOVES3.0.1/statics_moves301_xiaolong/MOVES301_src/ant/bin:$PATH

!# step 2.1 compile all java programs
chmod ug+x ant/bin/ant
ant compileall
ant rungui

!# step 2.2 built the two go programs, in MOVES303_src/calc/externalcalculatorgo, and MOVES303_src/generators/externalgenerator;
cd ./calc/
env GOOS=linux go build externalcalculatorgo.go
cd ../generators/
env GOOS=linux go build externalgenerator.go

!# step 2.3 built the fortran programs in NONROAD:  MOVES303_src/NONROAD/NR08a/SOURCE/nonroad.o;
cd ../NONROAD/NR08a/SOURCE/
make

# >>>>>>>>>>>>>>>>>> step 3. modify the setup.sh: change the new global path, check .jar files one by one;

! # >>>>>>>>>>>>>>>>>> step 4. modify the three .txt files accordingly: manyworkers.txt; MOVESConfiguration.txt; WorkerConfiguration.txt;

#>>>>>>>>>>>>>>>>>>>>> to prepare for using MOVES3, using below commands
# bash shell
cd /groups/deq/cascades/models/MOVES3.0.1/statics_moves301_xiaolong/MOVES301_src
module purge
module load cmake/3.17.2 gcc jdk/1.11.0.9 go/1.13.5
export PATH=/groups/deq/cascades/apps/mariadb/10.4.12/bin:$PATH
export PATH=/groups/deq/cascades/models/MOVES3.0.1/statics_moves301_xiaolong/MOVES301_src/ant/bin:$PATH

# or csh
csh
cd /groups/deq/cascades/models/MOVES3.0.1/statics_moves301_xiaolong/MOVES301_src
module purge
module load cmake/3.17.2 gcc jdk/1.11.0.9 go/1.13.5
setenv PATH /groups/deq/cascades/apps/mariadb/10.4/bin:$PATH
setenv PATH /groups/deq/cascades/models/MOVES3.0.1/statics_moves301_xiaolong/MOVES301_src/ant/bin:$PATH


# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Knowledge base for MOVES3 installation <<<<<<<<<<<<<<<<<<<<<< #
# https://github.com/USEPA/EPA_MOVES_Model
# https://mariadb.com/kb/en/source-building-mariadb-on-centos/
# https://mariadb.com/kb/en/generic-build-instructions/
# https://mariadb.org/get-involved/getting-started-for-developers/get-code-build-test/
# https://centos.pkgs.org/7/centos-x86_64/gnutls-devel-3.3.29-9.el7_6.x86_64.rpm.html
# https://mariadb.com/kb/en/authentication-from-mariadb-104/
