https://www.unidata.ucar.edu/support/help/MailArchives/netcdf/msg13017.html
# it says netcdf.inc
https://www.unidata.ucar.edu/support/help/MailArchives/netcdf/msg12996.html

https://github.com/gher-ulg/DIVA/issues/6

https://www.camx.com/download/netcdf/

https://docs.unidata.ucar.edu/nug/current/getting_and_building_netcdf.html
https://docs.unidata.ucar.edu/netcdf-c/current/netCDF-CMake.html
https://docs.unidata.ucar.edu/netcdf-c/current/building_netcdf_fortran.html

/groups/deq/cascades/utils/pgi18.4/netcdf/3.6.3/include/netcdf.inc
/groups/deq/cascades/utils/pgi18.4/netcdf-f4.5.2/include
/groups/deq/cascades/utils_intel/intel18.2/netCDF-f/4.5.2/include/


# new era
https://github.com/Unidata/netcdf-c/archive/refs/tags/v4.6.1.tar.gz

/opt/apps/intel18_2/openmpi/4.0.1/bin/mpif90 -c -o IO_NCF/ncf_wrt_vars_species.o -I./Includes -I/opt/apps/intel18_2/openmpi/4.0.1/include -I/groups/deq/cascades/utils_intel/intel18.2/netCDF/4.7.4//include -I/groups/deq/cascades/utils_intel/intel18.2/netCDF-f/4.5.2//include -mcmodel=medium -O2 -align dcommons -extend_source -convert big_endian -DCHUNK  -mieee-fp -I./Modules -module ./Modules IO_NCF/ncf_wrt_vars_species.F90
IO_NCF/ncf_wrt_vars_species.F90(139): error #6404: This name does not have a type, and must have an explicit type.   [NF_DEF_VAR_CHUNKING]
          ierr = nf_def_var_chunking(iounit, spec_varid, &
-----------------^
IO_NCF/ncf_wrt_vars_species.F90(143): error #6404: This name does not have a type, and must have an explicit type.   [NF_DEF_VAR_DEFLATE]
          ierr = nf_def_var_deflate(iounit, spec_varid, NCF_SHUFFLE,  &
-----------------^
compilation aborted for IO_NCF/ncf_wrt_vars_species.F90 (code 1)
make[1]: *** [IO_NCF/ncf_wrt_vars_species.o] Error 1
make[1]: Leaving directory `/groups/deq/Shared/Xiaolong/build/src.v7.10_DDM2_intel'
make: *** [comp_ifort] Error 2
[lxiaol9@calogin1 src.v7.10_DDM2_intel]$

--enable-parallel
NCF_INST  = /groups/deq/cascades/utils_intel/intel18.2/netCDF/4.7.4/
NCFF_INST = /groups/deq/cascades/utils_intel/intel18.2/netCDF-f/4.5.2/

https://camx-wp.azurewebsites.net/Files/CAMxUsersGuide_v7.10.pdf
83


.o ./MPI/nodes_alloc.o ./MPI/nodes_bndconc.o ./MPI/nodes_emiss.o ./MPI/node_send_feed.o ./MPI/node_send_lbc.o ./MPI/node_send_nbc.o ./MPI/nodes_init.o ./MPI/nodes_ipr.update.o ./MPI/nodes_irr.update.o ./MPI/nodes_met.o ./MPI/nodes_met_pig.o ./MPI/nodes_pass.o ./MPI/nodes_pass_sapnts.o ./MPI/nodes_pig_pass.o ./MPI/nodes_send_pig_sample.o ./MPI/nodes_send_rt_sample.o ./MPI/nodes_send_rtrcp_back.o ./MPI/nodes_send_walls_back.o ./MPI/nodes_topc.o ./MPI/nodes_tstep.o ./MPI/nodemass.o ./MPI/broadcast_grid_dimens.o ./MPI/broadcast_procid.o ./MPI/domain_decomp.o ./MPI/iniptr_node.o ./MPI/init_fields_node.o ./MPI/master_pass_xmass.o ./MPI/master_recv_1species_data.o ./MPI/myoffset.o ./MPI/node_send_1species_data.o ./MPI/nodes_send_lslice_back.o ./MPI/nodes_send_pig_back.o ./MPI/nodes_send_pig_misc.o ./MPI/nodes_send_pig_misc_real8.o ./MPI/nodes_send_pig_sum.o ./MPI/nodes_send_puffmass_back.o ./MPI/nodes_pass1.o ./MPI/mpi_feedback.o ./MPI/par_decomp.o ./MPI/par_decomp_bounds.o -L/groups/deq/cascades/utils_intel/intel18.2/netCDF-f/4.5.2//lib -lnetcdff -L/groups/deq/cascades/utils_intel/intel18.2/netCDF/4.7.4//lib -lnetcdf -L./MPI/util -lparlib -lnsl -lutil -lm -ldl
./IO_NCF/ncf_createfile.o: In function `ncf_createfile_':
ncf_createfile.F90:(.text+0x1c8): undefined reference to `nf_set_chunk_cache_'
make[1]: *** [model] Error 1
make[1]: Leaving directory `/groups/deq/Shared/Xiaolong/build/src.v7.10_DDM2_intel'
