#!/bin/bash

## Give the Job a descriptive name
#PBS -N runjob

## Output and error files
#PBS -o Outputs/outrunjob
#PBS -e Outputs/errorrunjob

## How many machines should we get?
#PBS -l nodes=1:ppn=1

#PBS -l walltime=01:00:00

## Start 
## Run make in the src folder (modify properly)
cd /home/parallel/parlab18/a4/serial
for i in 1024 2048 4096 6144
do
    ./jacobi $i >> jacobi_serial.txt
    ./seidelsor $i >> seidelsor_serial.txt
    ./redblacksor $i >> redblacksor_serial.txt
done
