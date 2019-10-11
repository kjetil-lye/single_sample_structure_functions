#!/bin/bash
set -e
function submit {
    bsub -n 1 -W 24:00 -R 'rusage[mem=4096]' "$@"
}

basepath='/cluster/work/math/klye/single_sample_structure_functions/experiments_full_time_average/'

    
for time_integrated in "" "_time_integrated";
do
    for stats in "mean" "variance" "single_sample";
    do

	submit python ../compute_convergence.py \
	       --input_basename "${basepath}/kh/p0_06/N{resolution}/kh_functional${time_integrated}_identity_1.nc" \
	       --title "Kelvin-Helmholtz ${time_integrated}" \
	       --staticstic_name ${stats}
	
	submit python ../compute_convergence.py \
	       --input_basename "${basepath}/rm/p0_06/N{resolution}/rm_functional${time_integrated}_identity_1.nc" \
	       --title "Richtmeyer-Meshkov ${time_integrated}" \
	       --staticstic_name ${stats}
    done
done
