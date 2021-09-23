#!/bin/sh -xf
export PATH=MYDIR/MOVES3_src/:$PATH
cd MYDIR/MOVES3_src
. setenv.sh

echo "" > MYDIR/scripts/runlog.txt

java -Xmx1200m gov.epa.otaq.moves.master.commandline.MOVESCommandLine -r MYDIR/runspecs/c51041y2017_default_jul_nox_m3_nr_test1.mrs >> MYDIR/scripts/runlog.txt
