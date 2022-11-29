#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_fw

## Output and error files
#PBS -o run_fw.out
#PBS -e run_fw.err

## How many machines should we get? 
#PBS -l nodes=sandman:ppn=64

##How long should the job run for?
#PBS -l walltime=01:00:00

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd /home/parallel/parlab18/a2/FW
##rm fw.out
for size in 1024 2048 4096
do
    for i in 1 2 4 8 16 32 64
    do
        export OMP_NUM_THREADS=$i
        ##./fw $size >> fw.csv
        ./fw_sr $size 16 >> fw_sr_16.csv
        ./fw_sr $size 64 >> fw_sr_64.csv
        ./fw_sr $size 128 >> fw_sr_128.csv
        ./fw_sr $size 256 >> fw_sr_256.csv
    done
done
# ./fw_sr <SIZE> <BSIZE>
# ./fw_tiled <SIZE> <BSIZE>
