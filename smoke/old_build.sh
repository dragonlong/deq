Building NETCDF, IOAPI and SMOKE on NewRiver
Following are the steps to build netcdf-3.6.3, ioapi-3.1, and smoke-3.7 for pgi compiler. Start with loading pgi compiler:      $ module load pgi
NETCDF-3.6.3
Following flags worked for configuring netcdf:
$ setenv CC pgcc
$ setenv CFLAGS "-O2 -Msignextend -V"
$ setenv FC pgf90
$ setenv F90 pgf90
$ setenv FFLAGS "-O2 -w -V"
$ setenv CXX ""
$ setenv CPPFLAGS "-DNDEBUG -DpgiFortran"

$ ./configure -prefix=<install_dir>  >& config.log
$ make >& make.log
$ make check >& make_check.log
$ make install
The compiled binaries would be in <install_dir>

IOAPI-3.1
$ setenv BIN Linux2_x86_64pg
$ cd ioapi

Set following flags in Makeinclude.Linux2_x86_64pg:
AR   = ar
CC   = pgcc
FC   = pgf90
#M4   = m4
CPP  = cpp
LINK = $(CC)
MODI = "-module "       ## Module-include-directory command
MFLAGS    = -fast # -Mnoupcase
OMPFLAGS  = # -mp
OMPLIBS   = # -lmp
COPTFLAGS = -O2 -DNDEBUG -Msignextend
FOPTFLAGS = -O2 -V -Mnosecond_underscore
FPPFLAGS  = -DF90=1
FSFLAGS   = -Msave
ARCHFLAGS = -DFLDMN=1 -DAUTO_ARRAYS=1 -DF90=1 -DNDEBUG
PARFLAGS  =
LIBDIR    = $(SRCDIR)/../lib
BINDIR    = $(SRCDIR)/../bin
ARCHLIB   =
# PVMLIBS   = -L$(PVM_ROOT)/lib/$(PVM_ARCH) -lpvm3
# M4DEFFILE = $(PVM_ROOT)/conf/$(PVM_ARCH).m4

Change BASEDIR in Makefile.nocpl to ioapi-3.1 base directory path.
$ cp Makefile.nocpl Makefile
$ make >& make.log
$ make fixed_src

Link libnetcdf.a from previously build netcdf library to $BASEDIR/$BIN
$ cd ../m3tools
Change BASEDIR in Makefile.nocpl to ioapi-3.1 base directory path.
$ cp Makefile.nocpl Makefile
$ make >& make.log
The compiled binaries would be in $BASEDIR/$BIN

SMOKE-3.7
$ setenv SMK_HOME <Smoke base directory>

Include this in $SMK_HOME/scripts/platform
setenv SMOKE_EXE Linux2_x86_64pg
if ( $SMOKE_EXE == Linux2_x86_64pg ) then
    setenv FC       pgf90
    setenv FFLAG    "-O2 -Msave -Mbackslash -Mbyteswapio -Kieee -Mextend -Bstatic"
    #setenv FFLAG    "-O3 -132 -save -zero -static -traceback -openmp"
    setenv DBGFLAG  "-g -cm -132 -save -zero -i-static -traceback"
else
    if ( ! $?FC || ! $?FFLAG || ! $?DBGFLAG ) then
       echo ""
       if ( ! $?FC ) echo "--> Compiler variable FC undefined..."
       if ( ! $?FFLAG ) echo "--> Compiler flag variable FFLAG undefined..."
       if ( ! $?DBGFLAG ) echo "--> Compiler flag variable DBGFLAG undefined..."
       echo ""
       echo "--> Set the variables above to proceed..."
       echo ""
       exit( 1 )
     endif
endif
exit( 0 )

$ source $SMK_HOME/scripts/platform

Link datshift, jul2greg and libioapi.a from <ioapi_basedir>/$BIN to $SMK_HOME/subsys/ioapi/$BIN
Copy *.EXT from <ioapi_basedir>/ioapi/fixed_src to $SMK_HOME/subsys/ioapi_includes
Link libnetcdf.a to $SMK_HOME/subsys/netcdf/$BIN

$ source $SMK_HOME/subsys/smoke/assigns/ASSIGNS.nctox.cmaq.cb05_soa.us12-nc
$ cd $SMK_HOME/subsys/smoke/scripts/make
$ ./Makeall
