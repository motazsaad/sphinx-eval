#!/usr/bin/env bash
# This script align words in (hyp and trs) texts 


function align {
    test_dir=${1}
    transcription=${2}
    printf "processing \n%s\n%s\n------------\n" ${test_dir} ${transcription}
    mkdir -p ${test_dir}/align
    align_dir=${test_dir}/align
    for hyp in ${test_dir}/hyp/*gt*00*
    do
    hyp_name=$(basename $hyp)
    perl /usr/local/lib/sphinxtrain/scripts/decode/word_align.pl \
    ${test_dir}/${transcription} ${hyp} > ${align_dir}/${hyp_name}.align
    done


}


# word align kacst
test_corpus="asr-test/kacst"
trs=kacst500_test.transcription
align ${test_corpus} ${trs}


# word align N7_020723_RMC_AR
test_corpus="asr-test/N7_020723_RMC"
trs=N7_020723_RMC_AR_test.transcription
align ${test_corpus} ${trs}




# word align N7_040810_MED_AR
test_corpus="asr-test/N7_040810_MED"
trs=N7_040810_MED_AR_test.transcription
align ${test_corpus} ${trs}


# word align jsc
test_corpus="asr-test/jsc"
trs=jsc_test.transcription
align ${test_corpus} ${trs}







