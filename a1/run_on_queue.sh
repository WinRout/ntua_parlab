#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_gol

## Output and error files
#PBS -o run_gol.out
#PBS -e run_gol.err

## How many machines should we get? 
#PBS -l nodes=1:ppn=8

##How long should the job run for?
#PBS -l walltime=00:10:00

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd /home/parallel/parlab18/a1/

for i in 1 2 4 6 8
do
    export OMP_NUM_THREADS=$i
    ./Game_Of_Life 64 1000 >> test64.out
    ./Game_Of_Life 1024 1000 >> test1024.out 
    ./Game_Of_Life 4096 1000 >> test4096.out 
done 
