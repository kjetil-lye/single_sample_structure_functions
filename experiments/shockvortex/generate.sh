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

python ../../tools/make_resolutions_perturbations.py \
       --config template/shockvortex.xml \
       --resolutions $resolutions \
       --perturbations 0.06 \

