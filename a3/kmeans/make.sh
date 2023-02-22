#!/bin/bash

qsub -q serial make_on_queue.sh
echo -e "\n"
sleep 5
cat Make_logs/makejob.err
echo -e "\n"
cat Make_logs/makejob.out