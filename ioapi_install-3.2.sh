#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>. matthew
#!/bin/csh
echo "Setting up modules"
cd /groups/deq/Shared/lxiaol9/build/
module purge
module load intel/18.2 hdf5/1.8.16 cmake/3.10.3
echo "extracting"
tar -xzf netcdf-c-4.7.4.tar.gz
cd netcdf-c-4.7.4
CINSTDIR='/home/lxiaol9/pkg/netCDF/4.7.4'
echo "running configure for netcdf-c"
./configure --prefix=$CINSTDIR --enable-shared --disable-netcdf-4 --disable-dap >& ../ncf-c_conf.log
echo "running make check install"
make check install >& ../ncf-c_make.log
cd ..


echo "Setting up modules"
module purge
module load intel/18.2 hdf5/1.8.16 cmake/3.10.3
echo "extracting netcdf-f"
tar -xzf netcdf-fortran-4.5.2.tar.gz
cd netcdf-fortran-4.5.2
CINSTDIR='/home/lxiaol9/pkg/netCDF/4.7.4'
export CFLAGS="-I${CINSTDIR}/include"
export CPPFLAGS="-I${CINSTDIR}/include"
export LDFLAGS="-L${CINSTDIR}/lib -lnetcdf"
export FINSTDIR=/home/lxiaol9/pkg/netCDF-f/4.5.2
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CINSTDIR/lib
export PATH=$PATH:$CINSTDIR/bin
echo "running configure for netcdf-f"
./configure --prefix=$FINSTDIR --enable-shared >& ../ncf-f_conf.log
echo "running make install"
make install 2>&1 | tee ../ncf-f_make.log
echo "finished"

#>>>>>>>>>>>>>>> setup ioapi
echo "Setting up ioapi"
module purge
module load intel/18.2 hdf5/1.8.16 cmake/3.10.3
export CINSTDIR='/home/lxiaol9/pkg/netCDF/4.7.4'
export FINSTDIR='/home/lxiaol9/pkg/netCDF-f/4.5.2'
export IOAPIDIR='/home/lxiaol9/pkg/ioapi/3.2/'
export LIBS=-L${OBJDIR} -lioapi -L${FINSTDIR}/lib -lnetcdff -L${CINSTDIR}/lib -lnetcdf $(OMPLIBS) $(ARCHLIB) $(ARCHLIBS)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CINSTDIR/lib:$FINSTDIR/lib
export PATH=$PATH:$CINSTDIR/bin:$FINSTDIR/bin
mkdir ioapi_3.2 && cd ioapi_3.2
tar -xzvf ioapi-3.2.tar.gz
export BIN='Linux2_x86_64ifort'
export BASEDIR=/groups/deq/Shared/lxiaol9/build/ioapi_3.2
export INSTALL=${IOAPIDIR}
echo ${INSTALL}
echo ${BIN}
echo ${BASEDIR}
# for the base version
# seems to configure sub folders Makefile
make configure
make

# test
cp -r tests/ ${IOAPIDIR}/
./ioapitest.csh '/home/lxiaol9/pkg/ioapi/3.2/' 'Linux2_x86_64ifort'
