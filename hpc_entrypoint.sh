#!/bin/bash
set -e

echo '----------------------------------------------------'
echo ' SLURM_CLUSTER_NAME = '$SLURM_CLUSTER_NAME
echo '    SLURMD_NODENAME = '$SLURMD_NODENAME
echo '        SLURM_JOBID = '$SLURM_JOBID
echo '     SLURM_JOB_USER = '$SLURM_JOB_USER
echo '    SLURM_PARTITION = '$SLURM_JOB_PARTITION
echo '  SLURM_JOB_ACCOUNT = '$SLURM_JOB_ACCOUNT
echo '----------------------------------------------------'

#TeamCity Output
cat << EOF
##teamcity[buildNumber '$SLURM_JOBID']
EOF

echo "Load HPC modules"
module load anaconda

echo "Activate Environment"
source activate enhancer
export TRANSFORMERS_OFFLINE=True
export PYTHONPATH=${PYTHONPATH}:/scratch/c.sistc3/enhancer
export HYDRA_FULL_ERROR=1

echo $PYTHONPATH

source ~/mlflow_settings.sh

echo "Making temp dir"
mkdir temp
pwd

#python transcriber/tasks/embeddings/timit.py --directory /scratch/$USER/TIMIT/data/lisa/data/timit/raw/TIMIT/TRAIN --output ./data/train
#python transcriber/tasks/embeddings/timit.py --directory /scratch/$USER/TIMIT/data/lisa/data/timit/raw/TIMIT/TEST --output ./data/test
python noisyspeech_synthesizer.py
echo "files"
#mkdir /scratch/c.sistc3/MS-SNSD/DNS10
mv ./CleanSpeech_testing/ /scratch/c.sistc3/MS-SNSD/DNS10
mv ./NoisySpeech_testing/ /scratch/c.sistc3/MS-SNSD/DNS10
ls /scratch/c.sistc3/MS-SNSD/DNS10
#python enhancer/cli/train.py
