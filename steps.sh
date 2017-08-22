#!/usr/bin/env bash


#usage bash sphinx-eval/test3in1dic_gt100.sh lm_dmp_dir dic_dir acoustic_dir test_dir test_corpus wav_dir hyp_dir log_dir

bash sphinx-eval/test.sh dmps dicts acoustic test/kacst kacst500 hyp logs

# kacst 
bash sphinx-eval/test3in1dic_gt100.sh dmps dicts acoustic test/kacst kacst500 \
test/kacst/kacst500_wav hyp logs

# evaluate kacst
for h in test/kacst/hyp/*gt100*
do
echo ${h}
perl /usr/local/lib/sphinxtrain/scripts/decode/word_align.pl \
test/kacst/kacst500_test.transcription ${h} | grep 'TOTAL Percent'
done

#########################################################

# N7_020723_RMC_AR
bash sphinx-eval/test3in1dic_gt100.sh dmps dicts acoustic test/N7_020723_RMC N7_020723_RMC_AR \
/home/msaad/speechdata/elra/sphinx_files/speech_test_wav hyp logs

# evaluate N7_020723_RMC_AR
for h in  test/N7_020723_RMC/hyp/*gt100*
do
echo ${h}
perl /usr/local/lib/sphinxtrain/scripts/decode/word_align.pl \
test/N7_020723_RMC/N7_020723_RMC_AR_test.transcription ${h} | grep 'TOTAL Percent'
done


#########################################################

# N7_040810_MED_AR
bash sphinx-eval/test3in1dic_gt100.sh dmps dicts acoustic test/N7_040810_MED N7_040810_MED_AR \
/home/msaad/speechdata/elra/sphinx_files/speech_test_wav hyp logs

# evaluate N7_040810_MED_AR
for h in  test/N7_040810_MED/hyp/*gt100*
do
echo ${h}
perl /usr/local/lib/sphinxtrain/scripts/decode/word_align.pl \
test/N7_040810_MED/N7_040810_MED_AR_test.transcription ${h} | grep 'TOTAL Percent'
done


#########################################################


# jsc
bash sphinx-eval/test3in1dic_gt100.sh dmps dicts acoustic test/jsc jsc \
test/jsc/jsc_wav hyp logs

# evaluate jsc
for h in  test/jsc/hyp/*gt100*
do
echo ${h}
perl /usr/local/lib/sphinxtrain/scripts/decode/word_align.pl \
test/jsc/jsc_test.transcription ${h} | grep 'TOTAL Percent'
done




