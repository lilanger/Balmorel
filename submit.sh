#!/bin/sh 
### General options 
### -- specify queue --
#BSUB -q hpc
### -- set the job Name -- 
#BSUB -J Balthub
### -- ask for number of cores (default: 1), 8x16=4,8x32=8
#BSUB -n 10 
### -- specify that the cores must be on the same host -- 
#BSUB -R "span[hosts=1]"
### -- specify that we need XXGB of memory per core/slot, 8x16=8
#BSUB -R "rusage[mem=12GB]"
### -- specify that we want the job to get killed if it exceeds XX GB per core/slot-- 200GB
#BSUB -M 12GB
### -- set walltime limit: hh:mm, 8x24=188
#BSUB -W 72:00 
### -- set the email address -- 
##BSUB -u lilang@dtu.dk
### -- send notification at start -- 
#BSUB -B
### -- send notification at completion -- 
#BSUB -N
### -- Specify the output and error file. %J is the job-id -- 
### -- -o and -e mean append, -oo and -eo mean overwrite -- 
#BSUB -eo error_%J.err 
#BSUB -oo output_%J.out 

# call single runs in terminal with: bsub -env scenario="scenario/folder_name" < submit.sh
# call batch runs in terminal with: bash job.sh

echo "${scenario}"

cd $scenario/model
#/appl/gams/37.1.0/gams Balmorel     --scenario_name $scenario threads=$LSB_DJOB_NUMPROC 
/appl/gams/50.4.1/gams Balmorel     --scenario_name $scenario threads=$LSB_DJOB_NUMPROC 

