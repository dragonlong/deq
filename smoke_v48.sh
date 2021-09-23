cd /groups/deq/cascades/models/emissions/SMOKE_v4.8/subsys/smoke/src

# prepare env
module purge
module load intel/18.2 hdf5/1.8.16 cmake/3.10.3
setenv SMK_HOME /groups/deq/cascades/models/emissions/SMOKE_v4.8
cd ../assigns/
source ASSIGNS.nctox.cmaq.cb05_soa.us12-nc

# now build
make &> xiaolong_intel.log