#!/bin/bash -x
#SBATCH --job-name=stylegan2
#SBATCH --nodes=1
#SBATCH --output=%j_out.out
#SBATCH --error=%j_err.out
#SBATCH --time=158:00:00
#SBATCH --gres=gpu:2

### Optionally, change 5-digit MASTER_PORT as you wish, ensuring it's not duplicated with others
### Adjust WORLD_SIZE based on your setup (gpus/node * num_nodes)
# export MASTER_PORT=<your_choice_of_port>
# export WORLD_SIZE=<number_of_gpus>

# ### Uncomment below if you need to get the first node name as master address
# echo "NODELIST="${SLURM_NODELIST}
# master_addr=$(scontrol show hostnames "$SLURM_JOB_NODELIST" | head -n 1)
# export MASTER_ADDR=$master_addr
# echo "MASTER_ADDR="$MASTER_ADDR

# Activate Conda environment
# Replace '/path/to/miniconda3' with your actual path to Miniconda3
source /path/to/miniconda3/etc/profile.d/conda.sh
conda activate <your_environment_name>

# Replace with the path to your training script and adjust other parameters as necessary
srun python /path/to/your/project/stylegan2-ada-pytorch/trainv1.py \
--outdir=/path/to/output/directory \
--cfg=auto \
--data=/path/to/your/dataset.zip \
--resume=/path/to/your/snapshot_file.pkl \
--gpus=4 \
--batch=32 \
--kimg=4000 \
--snap=25

# Add any additional notes or comments here
