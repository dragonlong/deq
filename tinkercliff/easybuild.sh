# https://github.com/easybuilders/easybuild
# https://github.com/easybuilders/easybuild-easyconfigs

# # using existing packages
# eb -S netcdf
# eb -D $CFGS3/w/WRF/WRFv4_netCDF-Fortran_separate_path.patch
# eb -D WRFv4_netCDF-Fortran_separate_path.patch
# eb -D netCDF-4.7.4-gompi-2
# eb -S netcdf
#
# # dry run
# eb -Dr
# # actual build and install
# eb -r


# step 1: get modules
module reset; module load foss/2020b
module load EasyBuild

# step 2: custom app path, julia 2020b
setup_app --base /fastscratch/deq/easybuild julia 1.6.1-foss-2020b

# step 3: Install your app in /fastscratch/deq/easybuild/apps/tinkercliffs-rome/julia/1.6.1-foss-2020b/
vim Make.user
cat Make.user
vim deps/blas.mk
module reset
module load foss/2020b
module spider CMake
module load CMake/3.18.4-GCCcore-10.2.0
make -j 32
make install

# step 4:  Edit the modulefile in /fastscratch/deq/easybuild/modules/tinkercliffs-rome/all/julia/1.6.1-foss-2020b.lua
#     - Set or remove modules to load in the load() line
#     - Edit description and URL
#     - Check the variable names
#     - Edit paths (some packages don't have, e.g., an include/)
#
ls /fastscratch/deq/easybuild/apps/tinkercliffs-rome/julia/1.6.1-foss-2020b/
vim /fastscratch/deq/easybuild/modules/tinkercliffs-rome/all/julia/1.6.1-foss-2020b.lua

# Step 5: append MODULEPATH # to your ~/.bashrc
export MODULEPATH="/fastscratch/deq/easybuild/modules/tinkercliffs-rome/all:$MODULEPATH"


# Step 6: use and test
module --ignore_cache spider julia
module reset
module load julia/1.6.1-foss-2020b
which julia
julia
