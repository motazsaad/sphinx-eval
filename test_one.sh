#!/usr/bin/env bash




lm_dmp_dir=dmps
dic_dir=dicts
acoustic_dir=acoustic
test_dir=test/kacst
test_corpus=kacst500
hyp_dir=hyp
log_dir=logs

log_dir=${test_dir}/${log_dir}
hyp_dir=${test_dir}/${hyp_dir}

mkdir -p ${hyp_dir}
mkdir -p ${log_dir}

printf "lm_dmp_dir: %s\n" "${lm_dmp_dir}"
printf "dic_dir: %s\n" "${dic_dir}"
printf "acoustic_dir: %s\n" "${acoustic_dir}"
printf "test_dir: %s\n" "${test_dir}"
printf "test_corpus: %s\n" "${test_corpus}"
printf "hyp_dir: %s\n" "${hyp_dir}"
printf "log_dir: %s\n" "${log_dir}"

lm=dmps/cnn_2010.gt10_pruned8.lm.DMP
printf "lm: %s\n" "${lm}"
lm_name=$(basename $lm)
printf "lm_name: %s\n" "${lm_name}"
dic_name=$(echo $lm_name | cut -d '.' -f1)
printf "dic_name: %s\n" "${dic_name}"
nohup pocketsphinx_batch \
 -adcin yes \
 -cepdir ${test_dir}/${test_corpus}_wav \
 -cepext .wav \
 -ctl ${test_dir}/${test_corpus}_test.fileids \
 -lm ${lm} \
 -dict ${dic_dir}/${dic_name}.dic \
 -hmm ${acoustic_dir}/model_parameters/s0192_spk.cd_cont_1000 \
 -hyp ${hyp_dir}/${test_corpus}_${lm_name}.hyp &> ${log_dir}/${test_corpus}_${lm_name}.out&


