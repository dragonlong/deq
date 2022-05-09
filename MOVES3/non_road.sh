ps -ax | g sshfs | awk '{print $1}' | xargs -I@ | echo @
fusermount -u YOUR_MNT_DIR
sudo umount -l YOUR_MNT_DIR
sudo diskutil umount Downloads/ARChome
umount -f ~/Downloads/ARChome
#

sshfs lxiaol9@cascades1.arc.vt.edu:/groups/deq/Shared/Xiaolong/build/src.v7.10_DDM2_intel/ /home/dragonx/ARCwork/ -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3


sshfs lxiaol9@cascades1.arc.vt.edu:/groups/deq/Shared/Xiaolong/ICBC_2ndOrder /home/dragonx/ARCwork/ -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
sshfs lxiaol9@cascades1.arc.vt.edu:/groups/deq/Shared/Xiaolong/build/ /home/dragonx/ARCnew/ -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
sshfs lxiaol9@cascades1.arc.vt.edu:/groups/deq/cascades/models/MOVES3/4-testruns/nonroad_chesterfield_2tests /home/dragonx/ARCwork/ -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
sshfs lxiaol9@cascades1.arc.vt.edu:/groups/deq/cascades/models/MOVES3/4-testruns/nonroad_chesterfield_2tests /home/dragonx/ARCwork/ -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3

sshfs lxiaol9@cascades1.arc.vt.edu:/groups/deq/cascades/models/MOVES3.0.1/4-testruns/nonroad_chesterfield/ /home/dragonx/ARCwork/ -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
sshfs lxiaol9@cascades1.arc.vt.edu:/groups/deq/cascades/models/MOVES3.0.1/statics_moves301_xiaolong /home/dragonx/ARChome/ -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
salloc --partition=dev_q --time=2:00:00 --nodes=1 --tasks-per-node=4 -A deqtest
sshfs lxiaol9@cascades1.arc.vt.edu:/groups/deq/cascades/models /home/dragonx/ARCwork/ -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
# step 1: run the jobs
cd /groups/deq/cascades/models/MOVES3/4-testruns/nonroad_chesterfield_2tests/test1_xiaolong/

#!/bin/sh -xf
export PATH=MYDIR/MOVES3_src/:$PATH
cd MYDIR/MOVES3_src
. setenv.sh

echo "" > MYDIR/scripts/runlog.txt

java -Xmx1200m gov.epa.otaq.moves.master.commandline.MOVESCommandLine -r MYDIR/runspecs/c51041y2017_default_jul_nox_m3_nr_test1.mrs >> MYDIR/scripts/runlog.txt


# step 2: extract the database



#!/bin/bash

>databases;
>use c51041y2017_m3_nr_test_out;
>show tables;
>select * from movesoutput into outfile "/groups/deq/Shared/Xiaolong/data/movesoutput.txt";
>exit;


/groups/deq/cascades/models/MOVES3/4-testruns/nonroad_chesterfield_2tests/test1_xiaolong/

# step 3:
# post-processing: https://www.perl.com/pub/2004/08/09/commandline.html/
perl -c
