#!/bin/bash
set -e
datadir=/cluster/work/math/klye/single_sample_structure_functions
for experiment in cloudshock fbb kh rm shockvortex;
do
    for resolution in  64 128 256 512 1024;
    do
	for p in `seq 1 1`
	do
	    for deviation_file in ${datadir}/experiments_mean_field/${experiment}/*/N${resolution}/*deviation_*.nc;
	    do
		output_name=${deviation_file//deviation/deviation_structure}
		output_name=${output_name//.nc/}
		bsub -W 120:00 -R "rusage[ngpus_excl_p=8,mem=8000]" ../alsvinn_structure_build_folder/structure_standalone \
		    -i $deviation_file \
		    -o ${output_name} \
		    --samples 1024 \
		    --number-of-h $(( ($resolution*32)/1024)) \
		    --nx $resolution \
		    --ny $resolution \
		    --nz 1 \
		    --platform cuda \
		    --p ${p} \
		    --equation euler2
	    done
	    for mean_file in ${datadir}/experiments_mean_field/${experiment}/*/N${resolution}/*meanassample*.nc;
	    do
		output_name=${mean_file//meanassample/mean_structure}
		output_name=${output_name//.nc/}
		bsub -W 120:00 -R "rusage[ngpus_excl_p=8,mem=8000]" ../alsvinn_structure_build_folder/structure_standalone \
		    -i $mean_file \
		    -o ${output_name} \
		    --samples 1 \
		    --number-of-h $(( ($resolution*32)/1024)) \
		    --nx $resolution \
		    --ny $resolution \
		    --nz 1 \
		    --platform cuda \
		    --p ${p} \
		    --equation euler2
	    done
	done
    done


done
