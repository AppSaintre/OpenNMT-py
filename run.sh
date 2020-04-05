#!/bin/sh

if [ "$1" == "dummy" ]; then
    echo "do nothing..."
elif [ "$1" == "preprocess" ]; then
    onmt_preprocess -train_src ../Datasets/Event-to-Event/11_base/Train_input.txt -train_tgt ../Datasets/Event-to-Event/11_base/Train_output.txt -valid_src ../Datasets/Event-to-Event/11_base/Validation_input.txt -valid_tgt ../Datasets/Event-to-Event/11_base/Validation_output.txt -save_data ../Datasets/Event-to-Event/11_base/evt 
elif [ "$1" == "train" ]; then
    onmt_train -data ../Datasets/Event-to-Event/11_base/evt -save_model ../Pretrain/2g21-evtrev-model -world_size 2 -gpu_ranks 0 1 --train_steps 20000 #use two gpus to train
elif [ "$1" == "train_from" ]; then
    onmt_train -data ../Datasets/Event-to-Event/11_base/evt -save_model ../Pretrain/2g21-model -world_size 2 -gpu_ranks 0 1 --train_steps 60000 --train_from ../Pretrain/2g21-model_step_55000.pt #use two gpus to train
fi
