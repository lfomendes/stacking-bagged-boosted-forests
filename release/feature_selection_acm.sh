#!/bin/bash

dataset_dir=$1
output_dir=$2
n_jobs=$3
trials=5
k=100
seed=42
cv=3

datasets=('acm')
method=rf

################################################################################
#				 					${dataset} 									   #
################################################################################
for dataset in ${datasets}
do
	echo 'Dataset:'
	echo ${dataset}

    echo 'RF' 'max_features': 'sqrt', 'criterion': 'gini'

    python ../python/main.py -m ${method} --fs l1 --criterion gini -t 200 -i 200 -f 'sqrt' -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset}_l1 ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}_l1

    python ../python/main.py -m ${method} --fs RFECV --criterion gini -t 200 -i 200 -f 'sqrt' -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset}_RFECV ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}_RFECV

    python ../python/main.py -m ${method} --fs importance --criterion gini -t 200 -i 200 -f 'sqrt' -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset}_importance ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}_importance

    python ../python/main.py -m ${method} --criterion gini -t 200 -i 200 -f 'sqrt' -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset}_nosf ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}_nosf
done

method=bert

for dataset in ${datasets}
do
	echo 'Dataset:'
	echo ${dataset}

    echo 'BERT' 'max_features': 'sqrt', 'criterion': 'gini'

    python ../python/main.py -m ${method} --fs l1 --criterion gini -t 8 -i 200 -f 'sqrt' -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset}_l1 ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}_l1

    python ../python/main.py -m ${method} --fs RFECV --criterion gini -t 8 -i 200 -f 'sqrt' -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset}_RFECV ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}_RFECV

    python ../python/main.py -m ${method} --fs importance --criterion gini -t 8 -i 200 -f 'sqrt' -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset}_importance ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}_importance

    python ../python/main.py -m ${method} --criterion gini -t 8 -i 200 -f 'sqrt' -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset}_nosf ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}_nosf
done