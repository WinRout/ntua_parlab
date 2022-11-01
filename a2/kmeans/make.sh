#!/bin/bash

qsub -q parlab make_on_queue.sh
sleep 5
cat make_kmeans.err
sleep 1
cat make_kmeans.out
