#!/usr/bin/env bash

if [ $# -ne 7 ]; then
    echo "usage ${0} lm_dmp_dir dic_dir acoustic_dir test_dir test_corpus hyp_dir log_dir";
    exit -1;
fi

lm_dmp_dir=${1}
dic_dir=${2}
acoustic_dir=${3}
test_dir=${4}
test_corpus=${5}
hyp_dir=${6}
log_dir=${7}

log_dir=${test_dir}/${log_dir}
hyp_dir=${test_dir}/${hyp_dir}

mkdir -p ${hyp_dir}
mkdir -p ${log_dir}

printf "lm_dmp_dir %s\n" "${lm_dmp_dir}"
printf "dic_dir %s\n" "${dic_dir}"
printf "acoustic_dir %s\n" "${acoustic_dir}"
printf "test_dir %s\n" "${test_dir}"
printf "test_corpus %s\n" "${test_corpus}"
printf "hyp_dir %s\n" "${hyp_dir}"
printf "log_dir %s\n" "${log_dir}"

for lm in lm_dmp_dir
do
lm_name=$(basename $lm)
dic_name=$(echo $lm_name | cut -d '.' -f1)
nohup pocketsphinx_batch \
 -adcin yes \
 -cepdir ${test_dir}/${test_corpus}_wav \
 -cepext .wav \
 -ctl ${test_dir}/${test_corpus}_test.fileids \
 -lm ${lm} \
 -dict ${dic_dir}/${dic_name} \
 -hmm ${acoustic_dir}/model_parameters/s0192_spk.cd_cont_1000 \
 -hyp ${test_dir}/${hyp_dir}/${test_corpus}_${lm_name}.hyp &> ${log_dir}/${test_corpus}_${lm_name}.out&
done 


