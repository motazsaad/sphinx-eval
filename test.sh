#!/usr/bin/env bash


for lm in ~/lms/data/lms/newswire*pruned*DMP
do

lm_name=$(basename $lm)
dic_name=$(sed 's/pruned[0-9]*.lm.DMP/.dic/g' <<< ${lm_name})

nohup pocketsphinx_batch \
 -adcin yes \
 -cepdir jsc_wav \
 -cepext .wav \
 -ctl jsc_test.fileids \
 -lm ${lm} \
 -dict ~/lms/data/dicts/${dic_name} \
 -hmm model_parameters/s0192_spk.cd_cont_1000 \
 -hyp hyp/jsc_${lm_name}.hyp &> out/jsc_${lm_name}.out&

nohup pocketsphinx_batch \
 -adcin yes \
 -cepdir kacst_wav \
 -cepext .wav \
 -ctl kacst2_test.fileids \
 -lm ${lm} \
 -dict ~/lms/data/dicts/${dic_name} \
 -hmm model_parameters/s0192_spk.cd_cont_1000 \
 -hyp hyp/kacst2_${lm_name}.hyp &> out/kacst2_${lm_name}.out&


nohup pocketsphinx_batch \
 -adcin yes \
 -cepdir ~/speechdata/elra/sphinx_files/speech_test_wav \
 -cepext .wav \
 -ctl N7_020723_RMC_AR.fileids \
 -lm ${lm} \
 -dict ~/lms/data/dicts/${dic_name} \
 -hmm model_parameters/s0192_spk.cd_cont_1000 \
 -hyp hyp/N7_020723_RMC_AR_${lm_name}.hyp &> out/N7_020723_RMC_AR_${lm_name}.out&



done 

