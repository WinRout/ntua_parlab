#!/bin/bash

## Give the Job a descriptive name
#PBS -N makejob

## Output and error files
#PBS -o Makejob/outmakejob
#PBS -e Makejob/errormakejob

## How many machines should we get?
#PBS -l nodes=1:ppn=1

#PBS -l walltime=00:05:00

## Start 
## Run make in the src folder (modify properly)
cd /home/parallel/parlab18/a4/serial
make
