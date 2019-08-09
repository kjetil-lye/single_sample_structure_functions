#!/bin/bash
set -e
max_resolution=2048
min_resolution=32

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
python ../../tools/make_resolutions_hurst_fbm.py \
       --config template/euler_fbb.xml \
       --resolutions $resolutions \
       --hurst_indices 0.125 0.5 0.75 \
       --samples $samples \
       --single_sample_save \
       --do_not_compute_structure \
       --compute_mean_var

