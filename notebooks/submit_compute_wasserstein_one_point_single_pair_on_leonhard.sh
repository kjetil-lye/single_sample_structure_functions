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
time=1;

for resolution in 64 128 256 512;
do
    multi_x=8
    multi_y=64
    total=$((${multi_x}*${multi_y}))

    bsub -W 120:00 -n $total -R 'rusage[mem=500]' mpirun -np ${total} \
	python ../python/compute_single_pair_wasserstein.py \
	--file_a "${basepath}/kh/p0_06/N${resolution}/kh_functional_identity_${time}.nc" \
	--file_b "${basepath}/kh/p0_06/N1024/kh_functional_identity_${time}.nc" \
	--outfile "wasserstein_one_point_kh_0_06_${resolution}_1024" \
	--multi_x ${multi_x} \
	--multi_y ${multi_y}

    bsub -W 120:00 -n $total -R 'rusage[mem=500]' mpirun -np ${total} \
	python ../python/compute_single_pair_wasserstein.py \
	--file_a "${basepath}/rm/p0_06/N${resolution}/rm_functional_identity_${time}.nc" \
	--file_b "${basepath}/rm/p0_06/N1024/rm_functional_identity_${time}.nc" \
	--outfile "wasserstein_one_point_rm_0_06_${resolution}_1024" \
	--multi_x ${multi_x} \
	--multi_y ${multi_y}

    bsub -W 120:00 -n $total -R 'rusage[mem=500]' mpirun -np ${total} \
	python ../python/compute_single_pair_wasserstein.py \
	--file_a "${basepath}/shockvortex/p0_06/N${resolution}/shockvortex_functional_identity_${time}.nc" \
	--file_b "${basepath}/shockvortex/p0_06/N1024/shockvortex_functional_identity_${time}.nc" \
	--outfile "wasserstein_one_point_shockvortex_0_06_${resolution}_1024" \
	--multi_x ${multi_x} \
	--multi_y ${multi_y}

    bsub -W 120:00 -n $total -R 'rusage[mem=500]' mpirun -np ${total} \
	python ../python/compute_single_pair_wasserstein.py \
	--file_a "${basepath}/cloudshock/p0_06/N${resolution}/cloudshock_functional_identity_${time}.nc" \
	--file_b "${basepath}/cloudshock/p0_06/N1024/cloudshock_functional_identity_${time}.nc" \
	--outfile "wasserstein_one_point_cloudshock_0_06_${resolution}_1024" \
	--multi_x ${multi_x} \
	--multi_y ${multi_y}

    for H in 0.125 0.5 0.75;
    do
	bsub -W 120:00 -n $total -R 'rusage[mem=500]' mpirun -np ${total} \
	    python ../python/compute_single_pair_wasserstein.py \
	    --file_a "${basepath}/fbb_short_time/H${H//./_}/N${resolution}/euler_fbb_functional_identity_${time}.nc" \
	    --file_b "${basepath}/fbb_short_time/H${H//./_}/N1024/euler_fbb_functional_identity_${time}.nc" \
	    --outfile "wasserstein_one_point_fbb_short_time_H${H//./_}_0_06_${resolution}_1024" \
	    --multi_x ${multi_x} \
	    --multi_y ${multi_y}
    done
done
