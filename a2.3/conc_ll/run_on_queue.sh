#!/bin/bash

## Give the Job a descriptive name
#PBS -N conc_ll

## Output and error files
#PBS -o run_conc_ll.out
#PBS -e run_conc_ll.err

## How many machines should we get? 
#PBS -l nodes=sandman:ppn=64

##How long should the job run for?
#PBS -l walltime=01:00:00

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd /home/parallel/parlab18/a2.3/conc_ll/

for s in 1024 8192
do
    for d in 0 10 40 50
    do
        c=$((100-$d-$d))

        export MT_CONF=0
        ./x.serial $s $c $d $d >> ./output/serial_$s.out

        for i in 1 2 4 8 16 32 64
        do
            export MT_CONF=`seq -s, 0 1 $(($i-1))`
            ./x.cgl $s $c $d $d  >> ./output/cgl_$s.out
            ./x.fgl $s $c $d $d >> ./output/fgl_$s.out
            ./x.lazy $s $c $d $d >> ./output/lazy_$s.out
            ./x.nb $s $c $d $d >> ./output/nv_$s.out
            ./x.opt $s $c $d $d >> ./output/opt_$s.out
        done
        export MT_CONF=`seq -s, 0 1 63`,`seq -s, 0 1 63`
        ./x.cgl $s $c $d $d  >> ./output/cgl_$s.out
        ./x.fgl $s $c $d $d >> ./output/fgl_$s.out
        ./x.lazy $s $c $d $d >> ./output/lazy_$s.out
        ./x.nb $s $c $d $d >> ./output/nv_$s.out
        ./x.opt $s $c $d $d >> ./output/opt_$s.out
    done
done
