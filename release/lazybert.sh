#!/bin/bash

dataset_dir=$1
output_dir=$2
n_jobs=$3
trials=5
k=200
seed=42
cv=0

datasets=('spambase')

################################################################################
#				 					${dataset} 									   #
################################################################################ 
for dataset in ${datasets}
do
	echo 'Dataset:'
	echo ${dataset}

	#echo 'Model:'
	#echo 'RF'
	# Random Forest
	#method=rf
	#python ../python/main.py -m ${method} -g 1 -j ${n_jobs} --cv ${cv} -s ${seed} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

	#echo 'Model:'
	#echo 'xt'
	# Random Forest
	#method=xt
	#python ../python/main.py -m ${method} -g 1 -j ${n_jobs} --cv ${cv} -s ${seed} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

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

done


# echo 'Broof'
# method=broof
# dataset=spambase
# python ../python/main.py -m ${method} -t 8 -i 100 -f 0.08 -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

# echo 'Bert'
# method=bert
# dataset=spambase
# python ../python/main.py -m ${method} --criterion entropy -t 8 -i 200 -f 0.3 -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

# echo 'LazyRF'
# dataset=spambase
# method=lazy
# python ../python/main.py -m ${method} -t 100 -k ${k} -f 0.08 --criterion gini -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}

# echo 'LazyBert'
# dataset=spambase
# method=lazybert
# python ../python/main.py -m ${method} --criterion entropy -t 8 -k ${k} -f 0.3 -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}


echo 'LazyBroof'
method=broof
dataset=spambase
python ../python/main.py -m ${method} -k ${k} -t 8 -i 100 -f 0.08 -g 1 -j ${n_jobs} --trials ${trials} --o ${output_dir}/results_${method}_${dataset} ${dataset_dir}/${dataset}.svm > ${output_dir}/grid_${method}_${dataset}
