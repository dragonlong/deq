0. ant


cd /groups/deq/cascades/models/MOVES3.0.1/statics_moves301/MOVES301_src
module purge
module load cmake/3.17.2 gcc jdk/1.11.0.9 go/1.13.5
export PATH=/groups/deq/cascades/apps/mariadb/10.4.12/bin:$PATH
export PATH=/groups/deq/cascades/models/MOVES3.0.1/statics_moves301/MOVES301_src/ant/bin:$PATH
ant compileall
ant rungui

1. about the go program in MOVER3.0.1;
	- build the program inside;

2. NONROAD: something wrong with NONROAD;
	- /groups/deq/cascades/models/MOVES3.0.1/statics_moves301/MOVES301_src/NONROAD/NR08a;

3. setup.sh:
	- copy and modify;

4. 3 *.txt files:
	-
Let you know;
-
