#!/usr/bin/env bash

lm_dmp_dir=${1}
hyp_dir=${2}
dic_file=${3}
test_dir=${4}
test_corpus=${5}
acoustic_dir=${6}
log_dir={7}

for lm in lm_dmp_dir
do
lm_name=$(basename $lm)
nohup pocketsphinx_batch \
 -adcin yes \
 -cepdir ${test_dir}/${test_corpus}_wav \
 -cepext .wav \
 -ctl ${test_dir}/${test_corpus}_test.fileids \
 -lm ${lm} \
 -dict ${dict_file} \
 -hmm ${acoustic_dir}/model_parameters/s0192_spk.cd_cont_1000 \
 -hyp ${test_dir}/${hyp_dir}/${test_corpus}_${lm_name}.hyp &> ${log_dir}/${test_corpus}_${lm_name}.out&
done 

