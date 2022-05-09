#************************* Step 1. request for an interactive job: begin user inputs *******************************
salloc --partition=dev_q --time=12:00:00 --nodes=1 --tasks-per-node=12 -A deqtest

DB_OLD_PATH=/groups/deq/Shared/Xiaolong/apps/databases # contains movesdb20181022, movesdb20201105
DB_NEW_PATH=/groups/deq/Shared/Xiaolong/converted_db

db_array=("movesdb20181022" "movesdb20201105")
chmod u+x convert_database_batch.sh
./convert_database_batch.sh
