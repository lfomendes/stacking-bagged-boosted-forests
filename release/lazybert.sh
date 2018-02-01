#!/bin/bash

dataset_dir=$1
output_dir=$2
n_jobs=$3
trials=5
k=100
seed=42
cv=3

datasets=('acm')

################################################################################
#				 					${dataset} 									   #
################################################################################ 
for dataset in ${datasets}
do
	echo 'Dataset:'
	echo ${dataset}

	echo 'Model:'
	echo 'RF'
	# Random Forest
	method=rf
	python ../python/main.py -m ${method} -g 1 -j ${n_jobs} --cv ${cv} -s ${seed} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

	echo 'Model:'
	echo 'lazy'
	# Lazy Random Forest
	method=lazy
	python ../python/main.py -m ${method} --cv ${cv} -k ${k} -g 1 -s ${seed} -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

	echo 'Model:'
	echo 'Broof'
	# BROOF
	method=broof
	python ../python/main.py -m ${method} --cv ${cv} -g 1 -j ${n_jobs} -s ${seed} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

	echo 'Model:'
	echo 'Bert'
	# BERT
	method=bert
	python ../python/main.py -m ${method} --cv ${cv} -g 1 -j ${n_jobs} -s ${seed} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

	echo 'Model:'
	echo 'Lazy Broof'
	# Lazy BROOF
	method=lazyBroof
	python ../python/main.py -m ${method} -k ${k} --cv ${cv} -g 1 -j ${n_jobs} -s ${seed} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

	echo 'Model:'
	echo 'Lazy Bert'
	# Lazy BERT
	method=lazyBert
	python ../python/main.py -m ${method} -k ${k} --cv ${cv} -g 1 -j ${n_jobs} -s ${seed} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}
done
