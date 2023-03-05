#!/bin/bash

qsub -q parlab make_on_queue.sh
echo -e "\n"
sleep 5
cat Makejob/errormakejob
echo -e "\n"
cat Makejob/outmakejob