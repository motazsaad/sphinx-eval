#!/usr/bin/env bash



function get_oov_words {
    test_dir=${1}
    transcription=${2}
    printf "processing \n%s\n%s\n------------\n" ${test_dir} ${transcription}
    mkdir -p ${test_dir}/oov
    oov_dir=${test_dir}/oov
    for hyp in ${test_dir}/hyp/*gt*00*
    do
        printf "%s\n" ${hyp}
        hyp_name=$(basename ${hyp})
        python ~/asr_dev/sphinx-eval/get_oov.py \
        --ref ${test_dir}/${transcription} --hyp ${hyp} --oov ${oov_dir}/${hyp_name}.oov
    done


}


# word align kacst
test_corpus="asr-test/kacst"
trs=kacst500_test.transcription
get_oov_words ${test_corpus} ${trs}


# word align N7_020723_RMC_AR
test_corpus="asr-test/N7_020723_RMC"
trs=N7_020723_RMC_AR_test.transcription
get_oov_words ${test_corpus} ${trs}




# word align N7_040810_MED_AR
test_corpus="asr-test/N7_040810_MED"
trs=N7_040810_MED_AR_test.transcription
get_oov_words ${test_corpus} ${trs}


# word align jsc
test_corpus="asr-test/jsc"
trs=jsc_test.transcription
get_oov_words ${test_corpus} ${trs}







