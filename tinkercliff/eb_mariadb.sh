# MOVES uses MariaDB, Java, and Go. At minimum, you will need the following:
#
#     MariaDB (version 10.4 or later)
#     Java JDK (version 11)
#     Go (version 1.13 or later)
#


# step 1: get modules
module reset; module load foss/2020b
module load EasyBuild
module load CMake/3.18.4-GCCcore-10.2.0
module load Go/1.14
module load Java/11.0.2
# step 2: custom app path, MariaDB 2020b
setup_app --base /fastscratch/deq/easybuild MariaDB 10.5.9-foss-2020b


# step 3: Install your app in /fastscratch/deq/easybuild/apps/tinkercliffs-rome/MariaDB/10.5.9-foss-2020b/
cd /fastscratch/deq/build/mariadb-10.5.9
mkdir build-mariadb
cd build-mariadb
# cmake .. -LH
cmake .. -DBUILD_CONFIG=mysql_release \
-DPLUGIN_AUTH_PAM=NO -DPLUGIN_AUTH_PAM_V1=NO \
-DWITH_SSL=system -DIGNORE_AIO_CHECK=ON \
-DCMAKE_INSTALL_PREFIX='/fastscratch/deq/easybuild/apps/tinkercliffs-rome/MariaDB/10.5.9-foss-2020b/' \
-DWITH_JEMALLOC=OFF -DCMAKE_SHARED_LINKER_FLAGS='-fuse-ld=bfd' \

		# -DWITH_SAFEMALLO=OFF
        # -DINSTALL_LAYOUT=RPM \
        # -DCMAKE_BUILD_TYPE=RelWithDebInfo
cmake --build . --parallel 8
# >>> 1. camke couldn't find openssl or gnutls
# https://stackoverflow.com/questions/16248775/cmake-not-able-to-find-openssl-library
# http://lists.busybox.net/pipermail/buildroot/2019-February/242149.html
# openssl version

# >>> 2. cmake couldn't find jemalloc
make install

# export PATH=/fastscratch/deq/apps/mariadb/10.5.9/bin:$PATH
# cd /fastscratch/deq/models/MOVES3/statics_moves3/MOVES3_src

# step 4:  Edit the modulefile in /fastscratch/deq/easybuild/modules/tinkercliffs-rome/all/MariaDB/10.5.9-foss-2020b.lua
#     - Set or remove modules to load in the load() line
#     - Edit description and URL
#     - Check the variable names
#     - Edit paths (some packages don't have, e.g., an include/)
#
ls /fastscratch/deq/easybuild/apps/tinkercliffs-rome/MariaDB/10.5.9-foss-2020b/
vim /fastscratch/deq/easybuild/modules/tinkercliffs-rome/all/MariaDB/10.5.9-foss-2020b.lua

# Step 5: append MODULEPATH # to your ~/.bashrc
export MODULEPATH="/fastscratch/deq/easybuild/modules/tinkercliffs-rome/all:$MODULEPATH"

# Step 6: use and test
module --ignore_cache spider MariaDB
module reset
module load MariaDB/10.5.9-foss-2020b
which MariaDB
MariaDB
