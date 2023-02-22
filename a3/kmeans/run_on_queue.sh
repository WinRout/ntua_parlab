#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_kmeans_nik

## Output and error files
#PBS -o Outputs/run_kmeans.out
#PBS -e Outputs/run_kmeans.err

## How many machines should we get? 
#PBS -l nodes=dungani:ppn=8

##How long should the job run for?
#PBS -l walltime=00:10:00

## Start 
## Run make in the src folder (modify properly)

cd /home/parallel/parlab18/a3/kmeans
export CUDA_VISIBLE_DEVICES=2
# sizes='32 64 128 256 512 1024 2048'
sizes='256'

# coordinates='16'
coordinates='16'

#centers='64'
centers='16'

loop_threashold='10'
# loop_threashold='100''

block_size='32 64 128 256 512 1024'

progs=(
	#kmeans_seq
	kmeans_cuda_naive
	kmeans_cuda_transpose
	kmeans_cuda_shared
	#kmeans_cuda_all_gpu
)

for size in $sizes; do
	for coord in $coordinates; do
		for center in $centers; do
			filename=Execution_logs/Sz-${size}_Coo-${coord}_Cl-${center}.csv 
			echo "Implementation,blockSize,av_loop_t,min_loop_t,max_loop_t,time_cpu,time_gpu,time_transfers" >> $filename
			for prog in "${progs[@]}"; do
				if [[ $prog == 'kmeans_seq' ]]; then
					./${prog} -s $size -n $coord -c $center -l $loop_threashold
				fi
				for bs in $block_size; do
					if [[ $prog == 'kmeans_cuda_naive' ]]; then
						./${prog} -s $size -n $coord -c $center -l $loop_threashold -b $bs
					elif [[ $prog == 'kmeans_cuda_transpose' ]]; then
						./${prog} -s $size -n $coord -c $center -l $loop_threashold -b $bs
					elif [[ $prog == 'kmeans_cuda_shared' ]]; then
						./${prog} -s $size -n $coord -c $center -l $loop_threashold -b $bs
					elif [[ $prog == 'kmeans_cuda_all_gpu' ]]; then
						./${prog} -s $size -n $coord -c $center -l $loop_threashold -b $bs
					fi
				done
			done
		done
	done
done
