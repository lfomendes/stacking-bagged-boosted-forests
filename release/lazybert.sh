#!/bin/bash

dataset_dir=$1
output_dir=$2
n_jobs=$3
trials=5
k=200
seed=42
cv=0

datasets=('20ng')

################################################################################
#				 					${dataset} 									   #
################################################################################ 
#for dataset in ${datasets}
#do
#	echo 'Dataset:'
#	echo ${dataset}

#	echo 'Model:'
#	echo 'RF'
	# Random Forest
#	method=rf
#	python ../python/main.py -m ${method} -g 1 -j ${n_jobs} --cv ${cv} -s ${seed} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

#	echo 'Model:'
#	echo 'xt'
	# Random Forest
#	method=xt
#	python ../python/main.py -m ${method} -g 1 -j ${n_jobs} --cv ${cv} -s ${seed} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

	# echo 'Model:'
	# echo 'lazy'
	# # Lazy Random Forest
	# method=lazy
	# python ../python/main.py -m ${method} --cv ${cv} -k ${k} -g 1 -s ${seed} -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

	#echo 'Model:'
	#echo 'Broof'
	# BROOF
	#method=broof
	#python ../python/main.py -m ${method} --cv ${cv} -g 1 -j ${n_jobs} -s ${seed} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

	#echo 'Model:'
	#echo 'Bert'
	# BERT
	#method=bert
	#python ../python/main.py -m ${method} --cv ${cv} -g 1 -j ${n_jobs} -s ${seed} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

	#echo 'Model:'
	#echo 'Lazy Broof'
	# Lazy BROOF
	#method=lazybroof
	#python ../python/main.py -m ${method} -k ${k} --cv ${cv} -g 1 -j ${n_jobs} -s ${seed} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

	# echo 'Model:'
	# echo 'Lazy Bert'
	# # Lazy BERT
	# method=lazybert
	# python ../python/main.py -m ${method} -k ${k} --cv ${cv} -g 1 -j ${n_jobs} -s ${seed} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

#done


#echo 'Broof'
#method=broof
dataset=20ng
#python ../python/main.py -m ${method} -t 8 -i 100 -f 'log2' -g 1 --criterion gini -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

#echo 'Bert'
#method=bert::wq

#python ../python/main.py -m ${method} --criterion gini -t 8 -i 200 -f 'log2' -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

#echo 'LazyRF'
#method=lazy
#python ../python/main.py -m ${method} -t 100 -k ${k} -f 'log2' --criterion gini -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

echo 'LazyBert'
method=lazybert
python ../python/main.py -m ${method} -k 500 -i 100 --criterion gini -t 8 -k ${k} -f 'log2' -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

echo 'LazyBroof'
method=lazybroof
python ../python/main.py -m ${method} -k 500 -t 8 -i 100 -f 'log2' -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}
