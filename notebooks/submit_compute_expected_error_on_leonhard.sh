#!/bin/bash
set -e
function submit {
    bsub -n 1 -W 120:00 -R 'rusage[mem=64000]' "$@"
}

basepath='/cluster/work/math/klye/single_sample_structure_functions/experiments_full_time_average/'

export PYTHONPATH=../python:$PYTHONPATH
module load texlive
for reference in '--reference' '';
do
    for time_integrated in "" "_time_integrated";
    do
	    time=1;
	    if [[ "$time_integrated" == "_time_integrated" ]];
	    then
		time=0;
	    fi

	    submit python ../python/compute_expected_error.py \
		--input_basename "${basepath}/kh/p0_06/N{resolution}/kh_functional${time_integrated}_identity_${time}.nc" \
		--title "Kelvin-Helmholtz ${time_integrated}" \
		${reference}
	    
	    submit python ../python/compute_expected_error.py \
		--input_basename "${basepath}/rm/p0_06/N{resolution}/rm_functional${time_integrated}_identity_${time}.nc" \
		--title "Richtmeyer-Meshkov ${time_integrated}" \
		${reference}

	    submit python ../python/compute_expected_error.py \
		--input_basename "${basepath}/shockvortex/p0_06/N{resolution}/shockvortex_functional${time_integrated}_identity_${time}.nc" \
		--title "Shockvortex ${time_integrated}" \
		${reference}

	    submit python ../python/compute_expected_error.py \
		--input_basename "${basepath}/cloudshock/p0_06/N{resolution}/cloudshock_functional${time_integrated}_identity_${time}.nc" \
		--title "Cloudshock ${time_integrated}" \
		${reference}

	    for H in 0.125 0.5 0.75;
	    do
		submit python ../python/compute_expected_error.py \
		    --input_basename "${basepath}/fbb/H${H//./_}/N{resolution}/euler_fbb_functional${time_integrated}_identity_${time}.nc" \
		    --title "Fractional Brownian bridge \$H=${H}\$ ${time_integrated}" \
		    ${reference}
	    done

	    for H in 0.125 0.5 0.75;
	    do
		submit python ../python/compute_expected_error.py \
		    --input_basename "${basepath}/fbb_short_time/H${H//./_}/N{resolution}/euler_fbb_functional${time_integrated}_identity_${time}.nc" \
		    --title "Fractional Brownian bridge \$H=${H}\$ short time ${time_integrated}" \
		    ${reference}
	    done



    done
done
