#!/bin/bash

qsub -q parlab make_on_queue.sh

sleep 5
cat Makejob/makejob.err
echo -e "\n"
cat Makejob/makejob.out
echo -e "\n"