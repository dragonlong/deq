#!/bin/csh
# https://github.com/USEPA/CMAQ/blob/master/DOCS/Users_Guide/Tutorials/CMAQ_UG_tutorial_build_library_pgi.md
# cd /groups/deq/Shared/Xiaolong/apps/cmaq_v5.3.1/CCTM/scripts/BLD_CCTM_v531_pgi18.4
# https://dev.to/kojikanao/download-files-from-google-drive-with-curl-wget-5e4o
# https://www.cmascenter.org/ioapi/documentation/all_versions/html/AVAIL.html#v32
# http://cucis.ece.northwestern.edu/projects/PnetCDF/doc/pnetcdf-c/Error-Codes.html#Error-Codes
# https://github.com/Parallel-NetCDF/PnetCDF
# https://github.com/USEPA/CMAQ/blob/master/DOCS/Users_Guide/Appendix/CMAQ_UG_appendixA_model_options.md#config_cmaq.csh
# https://github.com/cjcoats/ioapi-3.2
# https://github.com/USEPA/CMAQ/blob/master/DOCS/Users_Guide/Tutorials/CMAQ_UG_tutorial_benchmark.md
# https://github.com/USEPA/CMAQ/blob/master/DOCS/Users_Guide/Tutorials/CMAQ_UG_tutorial_build_library_pgi.md
# https://github.com/USEPA/CMAQ/blob/master/DOCS/Users_Guide/CMAQ_UG_ch03_preparing_compute_environment.md
https://github.com/Unidata/netcdf-fortran/releases/tag/v4.4.2

CMAQv5.3.1_Benchmark_2Day_Output.tar.gz
CMAQv5.3.1_Benchmark_2Day_Input_20191219.tar.gz

ftp://newftp.epa.gov/exposure/CMAQ/V5_3_1/Benchmark/cmv_c3.tar.gz
ftp://newftp.epa.gov/exposure/CMAQ/V5_3_1/Benchmark/gridded_area.tar.gz
ftp://newftp.epa.gov/exposure/CMAQ/V5_3_1/Benchmark/icbc.tar.gz
/groups/deq/Shared/Xiaolong/apps/cmaq_v5.3.1/data

# echo "Setting up modules"
# module purge
# module load pgi/18.4
# echo "extracting"
# tar -xzf netcdf-c-4.7.4.tar.gz
# cd netcdf-c-4.7.4
# setenv CINSTDIR /groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/netcdf-c4.7.4
# echo "running configure for netcdf-c"
# ./configure --prefix=$CINSTDIR --enable-shared --disable-netcdf-4 --disable-dap >& ../ncf-c_conf.log
# echo "running make check install"
# make check install >& ../ncf-c_make.log
# cd ..


# echo "Setting up modules"
# module purge
# module load pgi/18.4
# echo "extracting netcdf-f"
# tar -xzf netcdf-fortran-4.5.2.tar.gz
# cd netcdf-fortran-4.5.2
# setenv CINSTDIR /groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/netcdf-c4.7.4
# setenv CPPFLAGS -I$CINSTDIR/include
# setenv LDFLAGS "-L$CINSTDIR/lib -lnetcdf"
# setenv FINSTDIR /groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/netcdf-f4.5.2
# setenv LD_LIBRARY_PATH $LD_LIBRARY_PATH\:$CINSTDIR/lib
# setenv PATH $PATH\:$CINSTDIR/bin
# echo "running configure for netcdf-f"
# ./configure --prefix=$FINSTDIR --enable-shared >& ../ncf-f_conf.log
# echo "running make install"
# make install >& ../ncf-f_make.log
# echo "finished"
# cd ..

# #
# echo "loading pgi and openmpi modules"
module purge
module load pgi/18.4
module load mvapich2/2.3.1
# echo "extracting package"
# tar -xzf pnetcdf-1.12.1.tar.gz
# cd pnetcdf-1.12.1
# echo "setting build environment"
# setenv MPICC mpicc
# setenv MPICXX mpicxx
# setenv MPIF77 mpif77
# setenv MPIF90 mpif90
FFLAGS = -O -mp
CFLAGS = -O -mp
# setenv INSTDIR /groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/pnetcdf1.12.1
# echo "MPI C compiler is:"
# which mpicc
# echo "Installation prefix is:"
# which $INSTDIR
# echo "starting configure"
# ./configure --prefix=$INSTDIR --enable-shared >& ../pnetcdf_config.log
# make >& ../pnetcdf_make.log
# make tests >& ../pnetcdf_maketest.log
# make ptest >& ../pnetcdf_makeptest.log
# make install >& ../pnetcdf_makeinstall.log

#>>>>>>>>>>>>>>> adapted script
# #!/bin/csh
# # rm -rf logs/ ioapi/ m3tools/ HTML/ tests/
# # cat ioapi/Makefile && cat ioapi/Makeinclude.${BIN}
# # cat m3tools/Makefile
# # vim m3tools/Makefile && LIBS = -L${OBJDIR} -lioapi -L${CINSTDIR}/lib -lnetcdf -L${FINSTDIR}/lib -lnetcdff -L${PINSTDIR}/lib -lpnetcdf  $(OMPLIBS) $(ARCHLIB) $(ARCHLIBS)
# # LIBS = -L${OBJDIR} -lioapi -L/groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/netcdf-c4.7.4/lib -lnetcdf -L/groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/netcdf-f4.5.2/lib -lnetcdff -L/groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/pnetcdf1.12.1/lib -lpnetcdf $(OMPLIBS) $(ARCHLIB) $(ARCHLIBS)
# # BASEDIR=/groups/deq/Shared/Xiaolong/build/ioapi_3.2
module purge
module load pgi/18.4
module load mvapich2/2.3.1

mkdir ioapi_3.2 && cd ioapi_3.2 && cp ../ioapi-3.2.tar.gz .
tar -xzvf ioapi-3.2.tar.gz
setenv BASEDIR `pwd`
setenv BIN Linux2_x86_64pgmpi
setenv INSTALL /groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/ioapi3.2-mpi

mkdir $BASEDIR/$BIN
mkdir -p $INSTALL/$BIN

setenv CINSTDIR /groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/netcdf-c4.7.4
setenv FINSTDIR /groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/netcdf-f4.5.2
setenv PINSTDIR /groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/pnetcdf1.12.1
setenv PATH $PATH\:$CINSTDIR/bin\:$FINSTDIR/bin\:$PINSTDIR/bin
setenv LD_LIBRARY_PATH $LD_LIBRARY_PATH\:$CINSTDIR/lib\:$FINSTDIR/lib\:$PINSTDIR/lib
echo $LD_LIBRARY_PATH
setenv INCLUDE "-I$CINSTDIR/include -I$FINSTDIR/include -I$PINSTDIR/include"

cd $BASEDIR/$BIN
ln -s $CINSTDIR/lib/libnetcdf.a
ln -s $FINSTDIR/lib/libnetcdff.a
ln -s $PINSTDIR/lib/libpnetcdf.a

cp Makefile.template Makefile
cp ioapi/Makefile.pncf ioapi/Makefile
cp m3tools/Makefile.pncf m3tools/Makefile
make configure
# #  configure sub folders Makefile
# vim ioapi/Makefile && vim ioapi/Makeinclude.${BIN}
# vim m3tools/Makefile
-------------------------------------
make >& ../../ioapi_make.log
make install >& ../../ioapi_install.log

# # test
# cp -r tests/ ${IOAPIDIR}/
# ./ioapitest.csh '/groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/ioapi3.2-mpi' 'Linux2_x86_64pgmpi'

# >>>>>>>>>>>>>>>>>>>>>>>> CMAQ v5.3.1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< # 
# https://github.com/USEPA/CMAQ/blob/master/DOCS/Users_Guide/Tutorials/CMAQ_UG_tutorial_benchmark.md
cd /groups/deq/Shared/Xiaolong/build/CMAQv5.3.1
set CMAQ_HOME = /groups/deq/Shared/Xiaolong/apps/cmaq_v5.3.1 
./bldit_project.csh

# in config
# 
cd /groups/deq/Shared/Xiaolong/apps/cmaq_v5.3.1
cp /groups/deq/Shared/Xiaolong/build/CMAQv5.3.1/config_cmaq.csh /groups/deq/Shared/Xiaolong/apps/cmaq_v5.3.1/
cp /groups/deq/Shared/Xiaolong/build/CMAQv5.3.1/CCTM/scripts/bldit_cctm.csh /groups/deq/Shared/Xiaolong/apps/cmaq_v5.3.1/CCTM/scripts

setenv NETCDF_DIR /groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/netcdf-c4.7.4
setenv NETCDFF_DIR /groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/netcdf-f4.5.2
setenv PNETCDF_DIR /groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/pnetcdf1.12.1

cd /groups/deq/Shared/Xiaolong/apps/cmaq_v5.3.1/
source config_cmaq.csh pgi 18.4
cd CCTM/scripts
./bldit_cctm.csh pgi 18.4 | & tee bldit.cctm.log

# >>> make 
# PNETCDF= -L/groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/pnetcdf1.12.1/lib -lpnetcdf
IOAPI  = -L$(LIB)/ioapi/lib -lioapi
 92  NETCDF = -L$(LIB)/netcdff/lib -lnetcdff -L$(LIB)/netcdf/lib -lnetcdf
 93  PNETCDF = -L/groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/pnetcdf1.12.1/lib -lpnetcdf
 94  LIBRARIES = $(IOAPI) $(NETCDF) $(PNETCDF)
 95 
 96  BASE_INC = .
 97  MPI_INC  = $(LIB)/mpi/include
 98 

#>>>>>>>>>>> test 
cp CMAQ531_2016v1_2016_prod/scripts/prod_srun_cctm.v531_pgi_2016fh_12OTC2.csh /groups/deq/Shared/Xiaolong/apps/cmaq_v5.3.1/CCTM/scripts/TC2_example.csh
cp /groups/deq/cascades/models/AirQ/CMAQ/CMAQ_v5.3.1/CMAQ_REPO/config_cmaq.csh /groups/deq/Shared/Xiaolong/apps/cmaq_v5.3.1/CCTM/scripts/config_example.sh

cd /groups/deq/Shared/Xiaolong/apps/cmaq_v5.3.1/CCTM/scripts
./run_cctm_Bench_2016_12SE1.csh |& tee cctm.log

for f in *.tar.gz
do
	echo "extract $f"
	tar -xf $f
done

setenv LD_LIBRARY_PATH $(LIB)/ioapi/lib:$(LIB)/netcdff/lib:/groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/pnetcdf1.12.1/lib:$LD_LIBRARY_PATH

LIB=/groups/deq/Shared/Xiaolong/apps/cmaq_v5.3.1/lib/x86_64/pgi18.4
export LD_LIBRARY_PATH=/groups/deq/Shared/Xiaolong/apps/cmaq_v5.3.1/lib/x86_64/pgi18.4/ioapi/lib:/groups/deq/Shared/Xiaolong/apps/cmaq_v5.3.1/lib/x86_64/pgi18.4/netcdff/lib:/groups/deq/Shared/Xiaolong/build/pgi18.4/mvapich2_2.3.1/pnetcdf1.12.1/lib:$LD_LIBRARY_PATH
https://doc-0g-3o-docs.googleusercontent.com/docs/securesc/sg5pss7jq6s2eoo98bso1fr9iolsv5r9/8l1bbion657690mph3hu8atlj3i8q723/1602175275000/17427763035850986461/12383894144224241427/1m_v5BicazdxcDt23CRXxneqx5i6Y9AUD?e=download&authuser=0&nonce=4ervsvrmeilgs&user=12383894144224241427&hash=rrapr3g1bpfl

# https://drive.google.com/file/d/1NM1UDdZnwHwiNDxhcP-nndaWj24m-90L/view
# https://drive.google.com/file/d/1R1Ez1q_J-Wl939GxHQoGerrUSh2ZffnR/view?usp=sharing
# https://drive.google.com/file/d/1rOpXXk1QLVDrDppxuLGcoF1T35JdyGg6/view?usp=sharing
https://drive.google.com/file/d/16dIl2tl4vXVSgtka_qPCmDphjJE3yr-u/view?usp=sharing
export fileid=16dIl2tl4vXVSgtka_qPCmDphjJE3yr-u
export filename=obman.zip
wget --save-cookies cookies.txt 'https://docs.google.com/uc?export=download&id='$fileid -O- \
     | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p' > confirm.txt

wget --load-cookies cookies.txt -O $filename "https://docs.google.com/uc?export=download&id='$fileid'&confirm="$(<confirm.txt)
# curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=${fileId}" > /dev/null
# code1="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"  
# curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${code1}&id=${fileId}" -o ${fileName}



