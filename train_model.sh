#!/bin/sh

python3 train.py --dataroot ../standard_format/ --checkpoints_dir checkpoints --display_id -1 --preprocess none --name 1000samples_basic --input_nc 1 --output_nc 1 --max_dataset_size 1000 --n_epochs 100 --n_epochs_decay 100 --save_epoch_freq 5
