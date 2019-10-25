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
	    for xa in 0.4 0.6;
	    do
		for ya in 0.4 0.6;
		do
		    for xb in 0.4 0.6;
		    do
			for yb in 0.4 0.6;
			do
			    submit python ../python/make_histograms_two_point.py \
				--input_basename "${basepath}/cloudshock/p0_06/N{resolution}/cloudshock_functional${time_integrated}_identity_${time}.nc" \
				--title "Cloudshock ${time_integrated}" \
				--point_a_x ${xa} \
				--point_a_y ${ya} \
				--point_b_x ${xb} \
				--point_b_y ${yb}
			
			done
		    done
		done
	    done
    done
done
