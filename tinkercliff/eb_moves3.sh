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
module load MariaDB/10.5.9-foss-2020b
# # Note: Please put all the paths needed here, like mysql database, or MOVES3 src files, etc.
# existingInputDatabaseDir=/groups/deq/cascades/models/MOVES3/statics_moves3/databases/movesdb20201105
# movesSetupDir=/groups/deq/cascades/models/MOVES3/statics_moves3/

cd /fastscratch/deq/models/MOVES3/statics_moves3/MOVES3_src
chmod ug+rwx -R .
export PATH=/fastscratch/deq/models/MOVES3/statics_moves3/MOVES3_src/ant/bin:$PATH

#
csh
setenv PATH /fastscratch/deq/models/MOVES3/statics_moves3/MOVES3_src/ant/bin:$PATH
ant compileall
ant rungui

TMPDIR=/fastscratch/deq/tmp/sql-test


# step 2: custom app path, MariaDB 2020b
setup_app --base /fastscratch/deq/easybuild MariaDB 10.5.9-foss-2020b


# step 3: Install your app in /fastscratch/deq/easybuild/apps/tinkercliffs-rome/MariaDB/10.5.9-foss-2020b/
cd /fastscratch/deq/models/MOVES3/statics_moves3/MOVES3_src


# https://riptutorial.com/go/example/17006/go-build
#>>>>>>>>>>>>>>>>> go progams
env GOOS=linux go build externalcalculatorgo.go
env GOOS=linux go build externalgenerator.go

#>>>>>>>>>>>>>>>>> setenv.sh


#>>>>>>>>>>>>>>>>> all configs


#>>>>>>>>>>>>>>>>> 
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
# module --ignore_cache spider MariaDB
# module reset
# module load MariaDB/10.5.9-foss-2020b
# which MariaDB
# MariaDB
