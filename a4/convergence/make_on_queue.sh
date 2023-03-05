#!/bin/bash

## Give the Job a descriptive name
#PBS -N make_mpi

## Output and error files
#PBS -o Makejob/makejob.out
#PBS -e Makejob/makejob.err

## How many machines should we get? 
#PBS -l nodes=1:ppn=1

##How long should the job run for?
#PBS -l walltime=00:10:00

## Start 
## Run make in the src folder (modify properly)

mkdir -p ${HOME}/tmp
export TMPDIR=${HOME}/tmp

module load openmpi/1.8.3
cd /home/parallel/parlab18/a4/convergence
make

rm -r ${HOME}/tmp