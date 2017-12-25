#!/usr/bin/env bash


gt=200
dmps_dir=selected_dmps
#dic_name=4in1_gt1_mishkal_var7
#dic_name=4in1_gt1_tashkeel_var7
dic_name=4in1_gt1_harakat_var7
#dic_name=4in1_gt1_var5

# kacst
bash sphinx-eval/test4in1dic.sh ${dmps_dir} ${gt} dicts acoustic asr-test/kacst kacst500 \
asr-test/kacst/kacst500_wav hyp logs ${dic_name}

#########################################################

# N7_020723_RMC_AR
bash sphinx-eval/test4in1dic.sh ${dmps_dir} ${gt} dicts acoustic asr-test/N7_020723_RMC N7_020723_RMC_AR \
/home/motaz/mod_home/speechdata/elra/sphinx_files/speech_test_wav hyp logs ${dic_name}

#########################################################

# N7_040810_MED_AR
bash sphinx-eval/test4in1dic.sh ${dmps_dir} ${gt} dicts acoustic asr-test/N7_040810_MED N7_040810_MED_AR \
/home/motaz/mod_home/speechdata/elra/sphinx_files/speech_test_wav hyp logs ${dic_name}

#########################################################

# jsc
bash sphinx-eval/test4in1dic.sh ${dmps_dir} ${gt} dicts acoustic asr-test/jsc jsc \
asr-test/jsc/jsc_wav hyp logs ${dic_name}

