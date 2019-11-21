#!/bin/bash
set -e
function submit {
    bsub -n 1 -W 24:00 -R 'rusage[mem=2048]' "$@"
}

basepath='/cluster/work/math/klye/single_sample_structure_functions/experiments_full_time_average/'

export PYTHONPATH=../python:$PYTHONPATH
module load texlive
for reference in '--reference' '';
do
    for time_integrated in "" "_time_integrated";
    do
	for stats in "mean" "variance" "single_sample";
	do
	    time=1;
	    if [[ "$time_integrated" == "_time_integrated" ]];
	    then
		time=0;
	    fi
	    vmax=""
	    if [[ "$stats" == "variance" ]];
	    then
		vmax="--vmax 0.0025"
	    fi
	    submit python ../python/compute_convergence.py \
		--input_basename "${basepath}/shockvortex/p0_06/N{resolution}/shockvortex_functional${time_integrated}_identity_${time}.nc" \
		--title "Shockvortex ${time_integrated}" \
		--statistic_name ${stats}  \
		${reference} \
		${vmax}

	    vmax=""
	    if [[ "$stats" == "variance" ]];
	    then
		vmax="--vmax 200"
	    fi
	    
	    if [[ "$stats" == "mean" ]];
	    then
		vmax="--vmax 20"
	    fi

	    if [[ "$stats" == "single_sample" ]];
	    then
		vmax="--vmax 200"
	    fi
	    

	    submit python ../python/compute_convergence.py \
		--input_basename "${basepath}/cloudshock/p0_06/N{resolution}/cloudshock_functional${time_integrated}_identity_${time}.nc" \
		--title "Cloudshock ${time_integrated}" \
		--statistic_name ${stats}  \
		${reference} \
		${vmax}

	done
    done
done
