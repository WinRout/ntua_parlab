#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_kmeans

## Output and error files
#PBS -o run_kmeans.out
#PBS -e run_kmeans.err

## How many machines should we get? 
#PBS -l nodes=1:ppn=64

##How long should the job run for?
#PBS -l walltime=00:10:00

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd /home/parallel/parlab18/a2/kmeans/

# rm kmeans_seq.out 
# ./kmeans_seq -s 256 -n 16 -c 16 -l 10 >> kmeans_seq.out
rm kmeans_seq_conf2.out
./kmeans_seq -s 256 -n 1 -c 4 -l 10 >> kmeans_seq_conf2.out

# rm kmeans_omp_naive.out 
# for i in 1 2 4 8 16 32 64
# do
#    export OMP_NUM_THREADS=$i
#    ./kmeans_omp_naive -s 256 -n 16 -c 16 -l 10 >> kmeans_omp_naive.out
# done

# rm kmeans_omp_naive_affinity.out
# rm kmeans_omp_reduction_conf1.out
# rm kmeans_omp_reduction_conf2.out
#rm kmeans_omp_reduction_conf1_fs.out
#rm kmeans_omp_reduction_conf2_fs.out
#for i in 1 2 4 8 16 32 64
#do
    #export OMP_NUM_THREADS=$i
    #export GOMP_CPU_AFFINITY=0-$i
    # ./kmeans_omp_naive -s 256 -n 16 -c 16 -l 10 >> kmeans_omp_naive_affinity.out
    #./kmeans_omp_reduction -s 256 -n 16 -c 16 -l 10 >> kmeans_omp_reduction_conf1_fs.out
    #./kmeans_omp_reduction -s 256 -n 1 -c 4 -l 10 >> kmeans_omp_reduction_conf2_fs.out
done
