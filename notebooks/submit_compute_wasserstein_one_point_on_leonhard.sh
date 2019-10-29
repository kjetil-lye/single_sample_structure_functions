#!/bin/bash
set -e
if [ "$#" -eq 0 ]; 
then
    USE_DEFAULT_COMMAND=1
else
    USE_DEFAULT_COMMAND=0
    SINGLE_SAMPLE_STRUCTURE_SUBMIT_COMMAND="$@"
fi
echo "Using submission command: ${SINGLE_SAMPLE_STRUCTURE_SUBMIT_COMMAND}"
    
function submit {
    if [[ ${USE_DEFAULT_COMMAND} -eq 1 ]];
    then
	bsub -n 1 -W 120:00 -R 'rusage[mem=64000]' "$@"
    else
	${SINGLE_SAMPLE_STRUCTURE_SUBMIT_COMMAND} "$@"
    fi
}

basepath='/cluster/work/math/klye/single_sample_structure_functions/experiments_full_time_average/'

export PYTHONPATH=../python:$PYTHONPATH
module load texlive
for reference in '--reference' '';
do
    for time_integrated in "" "_time_integrated";
    do
	for exponent in 1 2;
	do
	    time=1;
	    if [[ "$time_integrated" == "_time_integrated" ]];
	    then
		time=0;
	    fi

	    submit python ../python/compute_one_point_wasserstein.py \
		--input_basename "${basepath}/kh/p0_06/N{resolution}/kh_functional${time_integrated}_identity_${time}.nc" \
		--title "Kelvin-Helmholtz ${time_integrated}" \
		--exponent ${exponent} \
		${reference}
	    
	    submit python ../python/compute_one_point_wasserstein.py \
		--input_basename "${basepath}/rm/p0_06/N{resolution}/rm_functional${time_integrated}_identity_${time}.nc" \
		--title "Richtmeyer-Meshkov ${time_integrated}" \
		--exponent ${exponent} \
		${reference}

	    submit python ../python/compute_one_point_wasserstein.py \
		--input_basename "${basepath}/shockvortex/p0_06/N{resolution}/shockvortex_functional${time_integrated}_identity_${time}.nc" \
		--title "Shockvortex ${time_integrated}" \
		--exponent ${exponent} \
		${reference}

	    submit python ../python/compute_one_point_wasserstein.py \
		--input_basename "${basepath}/cloudshock/p0_06/N{resolution}/cloudshock_functional${time_integrated}_identity_${time}.nc" \
		--title "Cloudshock ${time_integrated}" \
		--exponent ${exponent} \
		${reference}

	    for H in 0.125 0.5 0.75;
	    do
		submit python ../python/compute_one_point_wasserstein.py \
		    --input_basename "${basepath}/fbb/H${H//./_}/N{resolution}/euler_fbb_functional${time_integrated}_identity_${time}.nc" \
		    --title "Fractional Brownian bridge \$H=${H}\$ ${time_integrated}" \
		    --exponent ${exponent} \
		    ${reference}
	    done

	    for H in 0.125 0.5 0.75;
	    do
		submit python ../python/compute_one_point_wasserstein.py \
		    --input_basename "${basepath}/fbb_short_time/H${H//./_}/N{resolution}/euler_fbb_functional${time_integrated}_identity_${time}.nc" \
		    --title "Fractional Brownian bridge \$H=${H}\$ short time ${time_integrated}" \
		    --exponent ${exponent} \
		    ${reference}
	    done



	done
    done
done
