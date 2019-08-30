#!/bin/bash

find /cluster/work/math/klye/single_sample_structure_functions/experiments_mean_field/ -iname '*.nc' |grep -v mean_0|grep -v mean_1|grep -v variance| awk '{system("bsub -n 1 -W 120:00 python ../python/compute_deviation_from_mean.py --input "$1" --output "gensub(/([0-9]\.nc)/, "deviation_\\1", "g", $1));}'
