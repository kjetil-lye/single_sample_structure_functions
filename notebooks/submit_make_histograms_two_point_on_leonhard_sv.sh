#!/bin/bash
set -e
function submit {
    bsub -n 1 -W 120:00 -R 'rusage[mem=1024]' "$@"
}

basepath='/cluster/work/math/klye/single_sample_structure_functions/experiments_full_time_average/'

export PYTHONPATH=../python:$PYTHONPATH
module load texlive
for reference in '';
do
    for time_integrated in "";
    do
	    time=1;
	    if [[ "$time_integrated" == "_time_integrated" ]];
	    then
		time=0;
	    fi

	    submit python ../python/make_histograms_two_point.py \
		--input_basename "${basepath}/shockvortex/p0_06/N{resolution}/shockvortex_functional${time_integrated}_identity_${time}.nc" \
		--title "Shockvortex ${time_integrated}" \
		--point_a_x 0.7 0.8 0.9 0.4 0.5 0.6 \
		--point_a_y 0.4 0.5 0.6 0.7 0.8 0.9 \
		--point_b_x 0.8 0.7 0.7 0.5 0.4 0.5 \
		--point_b_y 0.5 0.4 0.4 0.8 0.7 0.7

    done
done
