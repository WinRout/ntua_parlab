#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_gif

## Output and error files
#PBS -o run_gif.out
#PBS -e run_gif.err

## How many machines should we get? 
#PBS -l nodes=1:ppn=8

##How long should the job run for?
#PBS -l walltime=00:10:00

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd /home/parallel/parlab18/a1/

export OMP_NUM_THREADS=8
./Game_Of_Life_gif 100 1000