#!/bin/bash
set -e
max_resolution=2048
min_resolution=32

resolution=$max_resolution
resolutions=""

while [[ $resolution -ge $min_resolution ]];
do
    
    echo $resolution

    resolutions="$resolution $resolutions"
    resolution=$(($resolution/2))



done
python ../../tools/make_resolutions_hurst_fbm.py \
       --config template/euler_fbb.xml \
       --resolutions $resolutions \
       --hurst_indices 0.125 0.5 0.75

