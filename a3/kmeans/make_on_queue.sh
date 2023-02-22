#!/bin/bash

## Give the Job a descriptive name
#PBS -N make_kmeans

## Output and error files
#PBS -o Make_logs/makejob.out
#PBS -e Make_logs/makejob.err

## How many machines should we get? 
#PBS -l nodes=dungani:ppn=1

##How long should the job run for?
#PBS -l walltime=00:00:30

## Start 
## Run make in the src folder (modify properly)

cd /home/parallel/parlab18/a3/kmeans
make
