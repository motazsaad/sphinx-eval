#!/usr/bin/env bash



function align {
    test_dir=${1}
    transcription=${2}
    mkdir -p ${test_corpus}/align/
    align_dir=${test_corpus}/align
    for hyp in ${test_corpus}/hyp/*gt100*
    do
    perl /usr/local/lib/sphinxtrain/scripts/decode/word_align.pl \
    ${test_corpus}/${transcription} ${hyp} > ${align_dir}${hyp}.align
    done


}


# word align kacst
test_corpus="asr-test/kacst/"
trs=kacst500_test.transcription
align ${test_corpus} ${trs}


# word align N7_020723_RMC_AR
test_corpus="asr-test/N7_020723_RMC"
trs=N7_020723_RMC_AR_test.transcription
align ${test_corpus} ${trs}




# word align N7_040810_MED_AR
test_corpus="asr-test/N7_040810_MED/"
trs=N7_040810_MED_AR_test.transcription
align ${test_corpus} ${trs}


# word align jsc
test_corpus="asr-test/jsc/"
trs=jsc_test.transcription
align ${test_corpus} ${trs}







