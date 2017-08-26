#!/usr/bin/env bash


#usage bash sphinx-eval/test3in1dic_gt100.sh lm_dmp_dir dic_dir acoustic_dir test_dir test_corpus wav_dir hyp_dir log_dir

bash sphinx-eval/test.sh dmps dicts acoustic asr-test/kacst kacst500 hyp logs

# kacst 
bash sphinx-eval/test3in1dic_gt100.sh dmps dicts acoustic asr-test/kacst kacst500 \
asr-test/kacst/kacst500_wav hyp logs


#########################################################

# N7_020723_RMC_AR
bash sphinx-eval/test3in1dic_gt100.sh dmps dicts acoustic asr-test/N7_020723_RMC N7_020723_RMC_AR \
/home/msaad/speechdata/elra/sphinx_files/speech_test_wav hyp logs



#########################################################

# N7_040810_MED_AR
bash sphinx-eval/test3in1dic_gt100.sh dmps dicts acoustic asr-test/N7_040810_MED N7_040810_MED_AR \
/home/msaad/speechdata/elra/sphinx_files/speech_test_wav hyp logs


#########################################################


# jsc
bash sphinx-eval/test3in1dic_gt100.sh dmps dicts acoustic asr-test/jsc jsc \
asr-test/jsc/jsc_wav hyp logs




