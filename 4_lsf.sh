#BSUB -J KAT               # Specify the job name
#BSUB -W 24:00                # Specify the maximum runtime in "hours:minutes"
#BSUB -o %x.%j.out            # Determine where the output will be written
#BSUB -e %x.%j.err            # The same goes for the error file
 
#BSUB -n 2                        # Specify the number of CPUS
#BSUB -M 5000                     # Specify the RAM PER CPU in MB that your job will use.
#BSUB -gpu "num=1"                # Specify the number of GPUs
#BSUB -R "span[hosts=1]"          # run on a single host
#BSUB -q batch_v100

# Receive email notifications.  Specify when to receive emails.
#BSUB -u Duong.Tran@de.bosch.com        # Specify the email address for notifications
# #BSUB -B                        # receive email when job starts
#BSUB -N                          # receive email when job ends
 
# The SLURM variables $SSD and $HDD and $SRC are not defined for LSF. Please
# work in /fs/scratch/rng_cr_bcai_dl/$USER or your home directory instead.
# Also access your data directly from /fs/scratch/rng_cr_bcai_dl . No copying of
# data onto local drives (which do not exist) is required.
 
. /fs/applications/lsf/latest/conf/profile.lsf  # THIS LINE IS MANDATORY
. /fs/applications/modules/current/init/bash    # THIS LINE IS MANDATORY
 
set -e # Exit on any error. Do not put this line before the two mandatory ones.
 
module load conda

# 1. Specify conda env
source activate KAT

# 2. Specify your work directory here
# cd ~/
 
# 3. Perform experiments
NAME='chkp'
DATASET_DIR=unbalanced
torchrun --nproc_per_node=1 train_KAT.py \
  --train_data $DATASET_DIR \
  --eval_data $DATASET_DIR \
  --model_size large \
  --lr 0.00003 \
  --optim adamw \
  --scheduler linear \
  --weight_decay 0.01 \
  --text_maxlength 64 \
  --per_gpu_batch_size 1 \
  --n_context 40 \
  --total_step 8000 \
  --warmup_step 1000 \
  --name $NAME \
  --checkpoint_dir $NAME \
  --accumulation_steps 1 \
#  --use_gpt
#  --seed 3


# No longer exit on any error.
set +e
