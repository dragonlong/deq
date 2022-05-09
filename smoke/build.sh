https://www.cmascenter.org/smoke/documentation/4.8.1/manual_smokev481.pdf
https://www.cmascenter.org/smoke/documentation/4.8.1/html/
https://github.com/cjcoats/ioapi-3.2/blob/master/ioapi/desc3.F90
http://www-c4.ucsd.edu/netCDF/netcdf-guide/guide_10.html
https://docs.unidata.ucar.edu/netcdf-c/current/group__attributes.html
https://github.com/Unidata/netcdf-fortran/blob/main/fortran/nf_attio.F90
Getting Attributes

Functions to get the values of attributes.

For classic format files, the netCDF library reads all attributes into memory when the file is opened with nc_open().

For netCDF-4/HDF5 files, since version 4.7.2, attributes are not read on file open. Instead,
when the first read of a variable attribute is done, all attributes for that variable are read.
Subsequent access to other attributes of that variable will not incur a disk read. Similarly,
when the first NC_GLOBAL attribute is read in a group, all NC_GLOBAL attributes for that group will be read.

(umr) [lxiaol9@calogin1 Linux2_x86_64pg]$ ldd mrggrid
	linux-vdso.so.1 =>  (0x00007ffe29fb7000)
	libpgf90rtl.so => /arcapps/cascades-broadwell-slurm/opt/apps/pgi/18.4/linux86-64/18.4/lib/libpgf90rtl.so (0x00007f467f54e000)
	libpgf90.so => /arcapps/cascades-broadwell-slurm/opt/apps/pgi/18.4/linux86-64/18.4/lib/libpgf90.so (0x00007f467efac000)
	libpgf90_rpm1.so => /arcapps/cascades-broadwell-slurm/opt/apps/pgi/18.4/linux86-64/18.4/lib/libpgf90_rpm1.so (0x00007f467edaa000)
	libpgf902.so => /arcapps/cascades-broadwell-slurm/opt/apps/pgi/18.4/linux86-64/18.4/lib/libpgf902.so (0x00007f467eb96000)
	libpgftnrtl.so => /arcapps/cascades-broadwell-slurm/opt/apps/pgi/18.4/linux86-64/18.4/lib/libpgftnrtl.so (0x00007f467e964000)
	libpgmp.so => /arcapps/cascades-broadwell-slurm/opt/apps/pgi/18.4/linux86-64/18.4/lib/libpgmp.so (0x00007f467e6e3000)
	libnuma.so.1 => /usr/lib/gcc/x86_64-redhat-linux/4.8.5/../../../../lib64/libnuma.so.1 (0x00007f467e4d7000)
	libpthread.so.0 => /usr/lib/gcc/x86_64-redhat-linux/4.8.5/../../../../lib64/libpthread.so.0 (0x00007f467e2ba000)
	libpgmath.so => /arcapps/cascades-broadwell-slurm/opt/apps/pgi/18.4/linux86-64/18.4/lib/libpgmath.so (0x00007f467de03000)
	libpgc.so => /arcapps/cascades-broadwell-slurm/opt/apps/pgi/18.4/linux86-64/18.4/lib/libpgc.so (0x00007f467dbba000)
	librt.so.1 => /usr/lib/gcc/x86_64-redhat-linux/4.8.5/../../../../lib64/librt.so.1 (0x00007f467d9b1000)
	libm.so.6 => /usr/lib/gcc/x86_64-redhat-linux/4.8.5/../../../../lib64/libm.so.6 (0x00007f467d6af000)
	libc.so.6 => /usr/lib/gcc/x86_64-redhat-linux/4.8.5/../../../../lib64/libc.so.6 (0x00007f467d2ec000)
	libgcc_s.so.1 => /usr/lib/gcc/x86_64-redhat-linux/4.8.5/../../../../lib64/libgcc_s.so.1 (0x00007f467d0d5000)
	/lib64/ld-linux-x86-64.so.2 (0x000055a228ed3000)
(umr) [lxiaol9@calogin1 Linux2_x86_64pg]$
/groups/deq/cascades/Emis_Proc/DDM_1_sector/area_emis/2-mrggrid/
/groups/deq/cascades/models/emissions/SMOKE_v4.8.1_ncdf4/subsys/smoke/Linux2_x86_64pg
/groups/deq/cascades/models/emissions/SMOKE_v4.8.1_ncdf4/subsys/smoke/srcs
Makeinclude
https://github.com/cjcoats/ioapi-3.2/blob/master/ioapi/desc3.F90
first CAMx, add it manually, not correct fix
- ncdump --> txt --> add infos --> ncgen;
NCO
http://research.jisao.washington.edu/data_sets/nco/
NACCTT attributes;
https://github.com/nco/pynco
http://nco.sourceforge.net/
conda install -c conda-forge nco

export PATH=/groups/deq/cascades/apps/anaconda3/bin:$PATH' if in bash, or '
setenv PATH /groups/deq/cascades/apps/anaconda3/bin:$PATH
second CMAQ, SMOKE
/groups/deq/cascades/Emis_Proc/DDM_RegionWide/N80_mrggrid
NCO netcdf
cp /groups/deq/cascades/apps/anaconda3/envs/deq/lib/* /groups/deq/cascades/apps/anaconda3/lib/

(equipose) [lxiaol9@calogin1 equipose]$ which ncap2
~/miniconda3/envs/equipose/bin/ncap2
(equipose) [lxiaol9@calogin1 equipose]$ ldd ~/miniconda3/envs/equipose/bin/ncap2
        linux-vdso.so.1 =>  (0x00007fff277db000)
	libnco-5.0.6.so => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/libnco-5.0.6.so (0x00007f6f57751000)
	libnetcdf.so.19 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/libnetcdf.so.19 (0x00007f6f575c7000)
	libgsl.so.25 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/libgsl.so.25 (0x00007f6f572c0000)
	libstdc++.so.6 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/libstdc++.so.6 (0x00007f6f57115000)
	libm.so.6 => /lib64/libm.so.6 (0x00007f6f56dfa000)
	libgomp.so.1 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/libgomp.so.1 (0x00007f6f56d13000)
	libgcc_s.so.1 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/libgcc_s.so.1 (0x00007f6f56cfe000)
	libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f6f56ae1000)
	libc.so.6 => /lib64/libc.so.6 (0x00007f6f5671e000)
	libexpat.so.1 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/./libexpat.so.1 (0x00007f6f566ed000)
	libcurl.so.4 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/./libcurl.so.4 (0x00007f6f5664c000)
	libcblas.so.3 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/./libcblas.so.3 (0x00007f6f543d1000)
	libudunits2.so.0 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/./libudunits2.so.0 (0x00007f6f543b0000)
	libmfhdf.so.0 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/./libmfhdf.so.0 (0x00007f6f54383000)
	libdf.so.0 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/./libdf.so.0 (0x00007f6f542d5000)
	libhdf5_hl.so.200 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/./libhdf5_hl.so.200 (0x00007f6f542b0000)
	libhdf5.so.200 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/./libhdf5.so.200 (0x00007f6f53ea8000)
	libzip.so.5 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/./libzip.so.5 (0x00007f6f53e8a000)
	/lib64/ld-linux-x86-64.so.2 (0x00005594f65cd000)
	librt.so.1 => /lib64/librt.so.1 (0x00007f6f53c81000)
	libdl.so.2 => /lib64/libdl.so.2 (0x00007f6f53a7d000)
	libnghttp2.so.14 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/././libnghttp2.so.14 (0x00007f6f53a53000)
	libssh2.so.1 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/././libssh2.so.1 (0x00007f6f53a0f000)
	libssl.so.1.1 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/././libssl.so.1.1 (0x00007f6f5397e000)
	libcrypto.so.1.1 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/././libcrypto.so.1.1 (0x00007f6f536ad000)
	libgssapi_krb5.so.2 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/././libgssapi_krb5.so.2 (0x00007f6f5365a000)
	libz.so.1 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/././libz.so.1 (0x00007f6f53640000)
	libgfortran.so.5 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/././libgfortran.so.5 (0x00007f6f53496000)
	libjpeg.so.9 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/././libjpeg.so.9 (0x00007f6f53457000)
	libbz2.so.1.0 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/././libbz2.so.1.0 (0x00007f6f53442000)
	libkrb5.so.3 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/./././libkrb5.so.3 (0x00007f6f5336b000)
	libk5crypto.so.3 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/./././libk5crypto.so.3 (0x00007f6f53350000)
	libcom_err.so.3 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/./././libcom_err.so.3 (0x00007f6f5334a000)
	libkrb5support.so.0 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/./././libkrb5support.so.0 (0x00007f6f5333b000)
	libkeyutils.so.1 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/./././libkeyutils.so.1 (0x00007f6f53333000)
	libresolv.so.2 => /lib64/libresolv.so.2 (0x00007f6f53119000)
	libquadmath.so.0 => /home/lxiaol9/miniconda3/envs/equipose/bin/../lib/./././libquadmath.so.0 (0x00007f6f530de000)

#.........................................................................
# Version "$Id$"
# SMOKE
# Copyright (C) 2005 Baron Advanced Meteorological Systems, LLC., and
# (C) 2016 UNC Institute for the Environment
# Distributed under the GNU GENERAL PUBLIC LICENSE version 2
# See file "GPL.txt" for conditions of use.
#.........................................................................
# Include file for making SMOKE
#
#.........................................................................
#  Environment Variables:
#       BIN     machine/OS/compiler/mode type. Shows up as suffix
#               for "Makeinclude.${BIN}" to determine compilation
#               flags, and in ${OBJDIR} and $(INSTALL) to determine
#               binary directories
#       INSTDIR installation-directory root, used for "make install":
#               SMOKE executables will be installed in ${INSTDIR}
#.........................................................................
#  Directories:
#       ${BASEDIR}  is the root directory for the SMOKE source and
#                   the (machine/compiler/flag-specific) binary
#                   object/library/executable directories.
#       ${SRCDIR}   is the source directory for this Makefile
#       ${INCDIR}   is the source directory for SMOKE INCLUDE-files
#       ${IODIR}    is the source directory for the I/O API library
#       ${OBJDIR}   is the current machine/compiler/flag-specific
#                   build-directory
#.........................................................................

SMK_HOME = /groups/deq/cascades/models/emissions/SMOKE_v4.8.1_ncdf4

#BIN = Linux2_x86_64ifort
BIN = Linux2_x86_64pg

BASEDIR = ${SMK_HOME}/subsys/smoke/src
INCDIR  = ${BASEDIR}/inc
OBJDIR  = ${BASEDIR}/../${BIN}

#IOBASE  = ${SMK_HOME}/subsys/ioapi
IOBASE  = /groups/deq/cascades/utils/pgi18.4/ioapi/ioapi-3.2
IODIR   = ${IOBASE}/ioapi
IOBIN   = ${IOBASE}/${BIN}
IOINC   = ${IODIR}/fixed_src

#INSTDIR = /somewhere/apps/${BIN}

INSTDIR = /groups/deq/cascades/models/emissions/SMOKE_v4.8.1_ncdf4/subsys/smoke/${BIN}

##  Architecture dependent stuff

include ${IODIR}/Makeinclude.${BIN}

#FC = ifort
FC = pgf90

#F90 = $(FC)

# IFLAGS = -I${IOINC} -I${INCDIR} -I${IOBIN}                #  Intel, Absoft, Pathscale, UNIX Fortran
# IFLAGS = -I${IOINC} -I${INCDIR} -I${IOBIN}                #  GNU   Fortran
# IFLAGS = -I${IOINC} -I${INCDIR} -M${IOBIN}                #  Sun   Fortran
 IFLAGS = -I${IOINC} -I${INCDIR} -module ${OBJDIR} -module ${IOBIN}    #  PGI Fortran:  order *important*

# EFLAG = -extend-source 132 -zero                       #  Intel Fortran
# EFLAG = -ffixed-line-length-132  -fno-backslash       #  GNU   Fortran
 EFLAG = -Mextend -Mbackslash                          #  PGI Fortran
# EFLAG = -e                                            #  Sun   Fortran
# EFLAG = -W132                                         #  Absoft   Fortran

FFLAGS  = ${IFLAGS} ${EFLAG} ${DEFINEFLAGS} ${PARFLAGS} ${FOPTFLAGS} ${ARCHFLAGS}

LDFLAGS = ${IFLAGS} ${DEFINEFLAGS} ${ARCHFLAGS}

ARFLAGS = rv

SMKLIB = -L${OBJDIR} -lsmoke

########  netCDF-4 needs "-lnetcdff -lnetcdf":

#NCFLIB = /groups/deq/cascades/utils/pgi18.4/netcdf/3.6.3/lib
#NCFLIB = /groups/deq/cascades/utils/pgi18.4/mcm/netcdf-f4.5.2/lib

#NCFLIB = /groups/deq/cascades/utils/pgi18.4/ioapi/ioapi-3.2/Linux2_x86_64pg

NCFLIB  = /groups/deq/cascades/utils_intel/intel18.2/netCDF/4.7.4/lib
NCFFLIB = /groups/deq/cascades/utils_intel/intel18.2/netCDF-f/4.5.2/lib

# IOLIB = -L$(IOBIN) -lioapi -lnetcdff -lnetcdf ${PVMLIBS}
#  IOLIB = -L$(IOBIN) -lioapi -lnetcdff -lnetcdf
  IOLIB = -L$(IOBIN) -lioapi -L$(NCFFLIB) -lnetcdff -L$(NCFLIB) -lnetcdf

########  Note that we must resolve the  %^&$*! circular dependency
########  between libfileset and libsmoke:

LIBS = -L${OBJDIR} -lfileset -lsmoke -lemmod -lfileset -lsmoke \
       ${IOLIB} $(OMPLIBS) $(ARCHLIB) $(ARCHLIBS)

VPATH  =  ${OBJDIR}

######## I/O API INCLUDE-file definitions...

IOINCS = \
 ${IOINC}/CONST3.EXT    ${IOINC}/FDESC3.EXT  \
 ${IOINC}/IODECL3.EXT   ${IOINC}/NETCDF.EXT  \
 ${IOINC}/PARMS3.EXT

######## Module definitions...
