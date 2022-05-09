http://www.camx.com/files/camxusersguide_v7-00.pdf
page 49

1. NETCDF: 
Acceptable entries for NCF are:
    NCF3    - NetCDF support with NetCDF libraries from version 3.
    NCF4_C  - NetCDF support with NetCDF libraries from version 4 that
              include compression (HDF5 and Zlib)
    NCF4_NC - NetCDF support with NetCDF libraries from version 4 that
              do not include compression
    False   - no NETCD support (default)

2. MPI: need to change in the Makefile
systems. Acceptable entries for MPI are:
    mpich  (for MPICH1/2)
    mpich3 
    mvapich
    openmpi (PGF and IFORT only)

3. compiler: 
Acceptable entries for COMPILER are:
    pgf         -- PGF90 for Linux
    pgfomp      -- PGF90 w/OMP for Linux
    ifort       -- IFORT for Linux
    ifortomp    -- IFORT w/OMP for Linux
    gfortran    -- GFortran for Linux
    gfortranomp -- GFortran w/OMP for Linux
    oracle      -- Oracle Sun Studio for Linux
    oracleomp   -- Oracle Sun Studio w/OMP for Linux
    absoft      -- ABSoft for Mac OSX
    absoftomp   -- ABSoft w/OMP for Mac OSX


# 7.0, 
module load pgi/18.4
module load openmpi/3.1.2
make COMPILER=pgf CONFIG=v7.00.MXLAYER.MXPTSRC950k MPI=mvapich NCF=NCF3 IEEE=true > & make_pgf_ncf3_mxlayer_mxptsrc950k_ieee.log
