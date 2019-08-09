#!/bin/bash
set -e
max_resolution=1024
min_resolution=64

resolution=$max_resolution
resolutions=""
samples=""
while [[ $resolution -ge $min_resolution ]];
do
    
    echo $resolution
    resolutions="$resolution $resolutions"
    resolution=$(($resolution/2))
    samples="1024 $samples"
done

python ../../tools/make_resolutions_perturbations.py \
       --config template/kelvinhelmholtz.xml \
       --resolutions $resolutions \
       --perturbations 0.06 \
       --samples $samples \
       --single_sample_save \
       --do_not_compute_structure \
       --compute_mean_var


