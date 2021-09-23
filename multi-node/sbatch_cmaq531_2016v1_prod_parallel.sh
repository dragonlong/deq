#!/bin/bash

#SBATCH --job-name=cmaq531_prod
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=32
#SBATCH -t 72:00:00
#SBATCH -p normal_q
# #SBATCH -A deqtest
#SBATCH --reservation=DEQ
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lxiaol9@vt.edu


# Add any modules you might require:
module load pgi/18.4
module load openmpi/3.1.2

cd /groups/deq/Shared/Xiaolong/CMAQ531_2016v1_2016_prod/scripts

# Below here enter the commands to start your job

# Simple single process examples:


csh ./srun_cctm.v531_pgi_2016fh_12OTC2_prod.csh >& srun_cctm.v531_pgi_2016fh_12OTC2_prod_parallel.log


#rm CTM_LOG_*

exit;
