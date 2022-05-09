# https://github.com/Unidata/netcdf-c/releases?page=2


cd {SRC_DIR}
tar xvzf hdf5-1.12.0.tar.gz
cd hdf5-1.12.0
setenv LDFLAGS -L{BLD_DIR}/zlib-1.2.11
./configure --prefix={BLD_DIR}/hdf5-1.12.0 --enable-fortran
make
make install

#!/bin/csh
echo "Setting up modules"
cd /groups/deq/Shared/lxiaol9/build/
module purge
module load intel/18.2 hdf5/1.8.16 cmake/3.10.3
# echo "extracting"
# tar -xzf netcdf-c-4.6.1.tar.gz
cd netcdf-c-4.6.1
CINSTDIR='/groups/deq/cascades/utils_intel/intel18.2/netCDF/4.6.1'
echo "running configure for netcdf-c"
./configure --prefix=$CINSTDIR --enable-shared --disable-dap >& ./ncf-c_conf.log
echo "running make check install"
make
make install 2>&1 | tee ncf-c_make.log
# make check install >& ./ncf-c_make.log
cd ..

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/groups/deq/cascades/utils_intel/intel18.2/netCDF/4.6.1/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/groups/deq/cascades/utils_intel/intel18.2/netCDF-f/4.4.5/lib
setenv LD_LIBRARY_PATH $LD_LIBRARY_PATH:/groups/deq/cascades/utils_intel/intel18.2/netCDF/4.6.1/lib
setenv LD_LIBRARY_PATH $LD_LIBRARY_PATH:/groups/deq/cascades/utils_intel/intel18.2/netCDF-f/4.4.5/lib
# https://github.com/Unidata/netcdf-fortran/archive/refs/tags/v4.4.5.tar.gz

echo "Setting up modules"
module purge
module load intel/18.2 hdf5/1.8.16 cmake/3.10.3 mvapich2/2.2
# echo "extracting netcdf-f"
# tar -xzf netcdf-fortran-4.4.5.tar.gz
cd netcdf-fortran-4.4.5
CINSTDIR='/groups/deq/cascades/utils_intel/intel18.2/netCDF/4.6.1'
export CFLAGS="-I${CINSTDIR}/include"
export CPPFLAGS="-I${CINSTDIR}/include"
export LDFLAGS="-L${CINSTDIR}/lib -lnetcdf"
export FINSTDIR=/groups/deq/cascades/utils_intel/intel18.2/netCDF-f/4.4.5
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CINSTDIR/lib
export PATH=$PATH:$CINSTDIR/bin
echo "running configure for netcdf-f"
./configure --prefix=$FINSTDIR --enable-shared 2>&1 | tee ./ncf-f_conf.log
echo "running make install"
make install 2>&1 | tee ./ncf-f_make.log
echo "finished"


# >>>>
# Xiaolong, using mvapich2, and intel 18.2,
make COMPILER=ifort CONFIG=v7.10.MXLAYER.MXPTSRC1900k.MXFDDM_MXTRSP MPI=mvapich NCF=NCF4_C IEEE=true 2>&1 | tee make_mvapich2_4.6.1.log
# with PGI and mvapich2/2.2
make COMPILER=ifort CONFIG=v7.10.MXLAYER.MXPTSRC1050k MPI=mvapich NCF=NCF4 IEEE=true 2>&1 | tee make_mvapich2_1050k.log

make COMPILER=pgf CONFIG=v7.10.MXLAYER.MXPTSRC950k MPI=mvapich NCF=NCF3 IEEE=true > & make_pgf_ncf3_mxlayer_mxptsrc950k_ieee.log
