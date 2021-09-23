/groups/deq/cascades/models/emissions/SMOKE_v47_INTEL/subsys
mkdir -p /groups/deq/Shared/Xiaolong/SMOKE_v47_INTEL/
cp -r /groups/deq/cascades/models/emissions/SMOKE_v47_INTEL/subsys/ /groups/deq/Shared/Xiaolong/SMOKE_v47_INTEL/
cp -r /groups/deq/cascades/models/emissions/SMOKE_v47_INTEL/data/ /groups/deq/Shared/Xiaolong/SMOKE_v47_INTEL/

# create symbolic link to ioapi lib in subsys/ioapi/$BIN?
/groups/deq/cascades/utils_intel/intel18.2/ioapi/3.2
/groups/deq/cascades/models/emissions/SMOKE_v4.8/subsys/smoke


# 
setenv SMK_HOME /groups/deq/Shared/Xiaolong/build/SMOKE_v4.8
setenv SMK_HOME /groups/deq/cascades/models/emissions/SMOKE_v4.8
#>>>>>>>>>>>>>>>> now we have both Makeinclude__intel, and source file
# need to fix data
csh
module purge
module load intel/18.2 hdf5/1.8.16 cmake/3.10.3

setenv SMK_HOME /groups/deq/cascades/models/emissions/SMOKE_v47_INTEL/
setenv SMK_HOME /groups/deq/Shared/Xiaolong/SMOKE_v47_INTEL

# export SMK_HOME /groups/deq/Shared/Xiaolong/SMOKE_v47_INTEL
source ASSIGNS.nctox.cmaq.cb05_soa.us12-nc
mkdir -p $SMK_HOME
					
ifort -I/groups/deq/cascades/utils_intel/intel18.2/ioapi/3.2/ioapi/fixed_src \
-I/groups/deq/cascades/models/emissions/SMOKE_v47_INTEL/subsys/smoke/src/inc \
-I/groups/deq/cascades/utils_intel/intel18.2/ioapi/3.2/Linux2_x86_64ifort \
                -extend-source 132 -zero \
                -O3 -unroll -stack_temps -safe_cray_ptr -convert big_endian -assume byterecl \
                -traceback -xHost \
                -DAUTO_ARRAYS=1 -DF90=1 -DFLDMN=1 -DFSTR_L=int -DIOAPI_NO_STDOUT=1 -DAVOID_FLUSH=1 -DBIT32=1 \
                -o normbeis3 normbeis3.o rdb3fac.o rdb4fac.o rdb4fac_csv.o normbeis314.o normbeis361.o libemmod.a libsmoke.a libfileset.a \
                -L/groups/deq/cascades/models/emissions/SMOKE_v47_INTEL/subsys/smoke/src/../Linux2_x86_64ifort -lfileset -lsmoke -lemmod -lfileset -lsmoke \
                -L/groups/deq/cascades/utils_intel/intel18.2/ioapi/3.2/Linux2_x86_64ifort -lioapi\
                -L/groups/deq/cascades/utils_intel/intel18.2/netCDF/4.7.4/lib -lnetcdf -lnetcdff

                    -L/home/lxiaol9/pkg/netCDF-f/4.5.2/lib -lnetcdff \

/groups/deq/cascades/models/emissions/SMOKE_v4.8/subsys/smoke/Linux2_x86_64ifort