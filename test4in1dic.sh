#!/usr/bin/env bash
# this script is the same as test.sh except for the dictionary name is fixed  

if [ $# -ne 10 ]; then
    echo "usage ${0} lm_dmp_dir gt dic_dir acoustic_dir test_dir test_corpus wav_dir hyp_dir log_dir dic_name";
    exit -1;
fi

lm_dmp_dir=${1}
gt=${2}
dic_dir=${3}
acoustic_dir=${4}
test_dir=${5}
test_corpus=${6}
wav_dir=${7}
hyp_dir=${8}
log_dir=${9}
dic_name=${10}
# you can comment the line above and use one of dict_names below 
#dic_name=4in1_gt1_var5
#dic_name=3in1_gt1_var5

log_dir=${test_dir}/${log_dir}
hyp_dir=${test_dir}/${hyp_dir}

mkdir -p ${hyp_dir}
mkdir -p ${log_dir}

printf "lm_dmp_dir: %s\n" "${lm_dmp_dir}"
printf "dic_dir: %s\n" "${dic_dir}"
printf "acoustic_dir: %s\n" "${acoustic_dir}"
printf "test_dir: %s\n" "${test_dir}"
printf "test_corpus: %s\n" "${test_corpus}"
printf "wav_dirs: %s\n" "${wav_dir}"
printf "hyp_dir: %s\n" "${hyp_dir}"
printf "log_dir: %s\n" "${log_dir}"
printf "%s\n" "------------------------------"



for lm in ${lm_dmp_dir}/*gt${gt}*
do
printf "lm: %s\n" "${lm}"
lm_name=$(basename $lm)
printf "lm_name: %s\n" "${lm_name}"
#dic_name=$(echo $lm_name | cut -d '.' -f1)
printf "dic_name: %s\n" "${dic_name}"
nohup pocketsphinx_batch \
 -adcin yes \
 -cepdir ${wav_dir} \
 -cepext .wav \
 -ctl ${test_dir}/${test_corpus}_test.fileids \
 -lm ${lm} \
 -dict ${dic_dir}/${dic_name}.dic \
 -hmm ${acoustic_dir}/model_parameters/s0192_spk.cd_cont_1000 \
 -hyp ${hyp_dir}/${test_corpus}_${lm_name}_${dic_name}.hyp &> ${log_dir}/${test_corpus}_${lm_name}_${dic_name}.out&
done 


