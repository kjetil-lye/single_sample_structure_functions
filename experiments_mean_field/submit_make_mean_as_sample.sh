#!/bin/bash

find /cluster/work/math/klye/single_sample_structure_functions/experiments_mean_field/ -iname '*_mean_*.nc' | awk '{system("bsub -n 1 -W 120:00 python ../python/make_mean_as_sample.py --input "$1)}'
