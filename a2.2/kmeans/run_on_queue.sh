#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_kmeans

## Output and error files
#PBS -o run_kmeans.out
#PBS -e run_kmeans.err

## How many machines should we get? 
#PBS -l nodes=sandman:ppn=64

##How long should the job run for?
#PBS -l walltime=00:20:00

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd /home/parallel/parlab18/a2.2/kmeans/

for i in 1 2 4 8 16 32 64
do
    export OMP_NUM_THREADS=$i
    export GOMP_CPU_AFFINITY=0-$i
    ./kmeans_omp_nosync_lock -s 8 -n 8 -c 16 -l 10 >> ./output_8/kmeans_omp_nosync_lock.out
    ./kmeans_omp_pthread_mutex_lock -s 8 -n 8 -c 16 -l 10 >> ./output_8/kmeans_omp_pthread_mutex_lock.out
    ./kmeans_omp_pthread_spin_lock -s 8 -n 8 -c 16 -l 10 >> ./output_8/kmeans_omp_pthread_spin_lock.out
    ./kmeans_omp_tas_lock -s 8 -n 8 -c 16 -l 10 >> ./output_8/kmeans_omp_tas_lock.out
    ./kmeans_omp_ttas_lock -s 8 -n 8 -c 16 -l 10 >> ./output_8/kmeans_omp_ttas_lock.out
    ./kmeans_omp_array_lock -s 8 -n 8 -c 16 -l 10 >> ./output_8/kmeans_omp_array_lock.out
    ./kmeans_omp_clh_lock -s 8 -n 8 -c 16 -l 10 >> ./output_8/kmeans_omp_clh_lock.out
    ./kmeans_omp_critical -s 8 -n 8 -c 16 -l 10 >> ./output_8/kmeans_omp_critical.out
done
