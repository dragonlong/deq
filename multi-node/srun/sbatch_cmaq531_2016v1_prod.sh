#!/bin/bash

#SBATCH --job-name=cmaq531_prod
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=32
#SBATCH -t 72:00:00
#SBATCH -p normal_q
#SBATCH -A deqtest
#SBATCH --reservation=DEQ
#SBATCH --mail-type=ALL
#SBATCH --mail-user=Jin-Sheng.Lin@deq.virginia.gov

# If modules are needed, source modules environment:
#. /etc/profile.d/modules.sh

# Add any modules you might require:
module load pgi/18.4
module load openmpi/3.1.2

cd /groups/deq/cascades/sims/CMAQ5.3/trial/scripts

# Below here enter the commands to start your job

# Simple single process examples:

# Run the program a.out

csh ./srun_cctm.v531_pgi_2016fh_12OTC2_prod.csh >& srun_cctm.v531_pgi_2016fh_12OTC2_prod.log

#rm CTM_LOG_*

exit;
