CUDA_VISIBLE_DEVICES=1 python train.py --name cycada_equalLoss_svhn2mnist_noIdentity_2GA \
    --resize_or_crop=None \
    --loadSize=32 --fineSize=32 --which_model_netD n_layers --n_layers_D 3 \
    --model cycle_gan_semantic \
    --lambda_A 1 --lambda_B 1 --lambda_identity 0 \
    --no_flip --batchSize 100 \
    --dataset_mode mnist_svhn --dataroot /x/jhoffman/ \
    --which_direction BtoA

#--dataroot /x/jhoffman/cyclegan_data/svhn2mnist/