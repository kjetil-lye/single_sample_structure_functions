#!/bin/bash
set -e
function submit {
    bsub -n 1 -W 24:00 -R 'rusage[mem=4096]' "$@"
}

basepath='/cluster/work/math/klye/single_sample_structure_functions/experiments_full_time_average/'

export PYTHONPATH=../python:$PYTHONPATH
for time_integrated in "" "_time_integrated";
do
    for stats in "mean" "variance" "single_sample";
    do

	submit python ../python/compute_convergence.py \
	       --input_basename "${basepath}/kh/p0_06/N{resolution}/kh_functional${time_integrated}_identity_1.nc" \
	       --title "Kelvin-Helmholtz ${time_integrated}" \
	       --statistic_name ${stats}
	
	submit python ../python/compute_convergence.py \
	       --input_basename "${basepath}/rm/p0_06/N{resolution}/rm_functional${time_integrated}_identity_1.nc" \
	       --title "Richtmeyer-Meshkov ${time_integrated}" \
	       --statistic_name ${stats}

	submit python ../python/compute_convergence.py \
	       --input_basename "${basepath}/shockvortex/p0_06/N{resolution}/shockvortex_functional${time_integrated}_identity_1.nc" \
	       --title "Shockvortex ${time_integrated}" \
	       --statistic_name ${stats}

	submit python ../python/compute_convergence.py \
	       --input_basename "${basepath}/cloudshock/p0_06/N{resolution}/cloudshock_functional${time_integrated}_identity_1.nc" \
	       --title "Cloudshock ${time_integrated}" \
	       --statistic_name ${stats}

	for H in 0.125 0.5 0.75;
	do
	    submit python ../python/compute_convergence.py \
		--input_basename "${basepath}/fbb/H${H//./}/N{resolution}/euler_fbb_functional${time_integrated}_identity_1.nc" \
		--title "Fractional Brownian bridge \$H=${H}\$ ${time_integrated}" \
		--statistic_name ${stats}
	done



    done
done
