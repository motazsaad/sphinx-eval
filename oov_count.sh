#!/usr/bin/env bash

################ generic code ###########################
function get_oov_count {
    test_dir=${1}
    printf "processing %s\n" ${test_dir}
    # create a directory to store oov frequencis 
    mkdir -p ${test_dir}/oov_freq
    for oov_file in ${test_dir}/oov/*.oov
    do
        oov_name=$(basename ${oov_file})
        cat ${oov_file} | tr ' ' '\n' | sort | uniq -c | sort -nr > ${test_dir}/oov_freq/${oov_name}.freq
    done
    test_name=$(basename ${test_dir})
    cat ${test_dir}/oov/*.oov | tr ' ' '\n' | sort | uniq -c | sort -nr > ${test_dir}/oov_freq/${test_name}_all_oov.freq
    cat ${test_dir}/oov/*.oov | tr ' ' '\n' | sort | uniq -c | sort -nr | \
    awk '{print $2}' | head -n 300 | tr '\n' ' ' > asr-test/oov_all/words_${test_name}.oov
    cat ${test_dir}/oov/*.oov | tr ' ' '\n' | sort | uniq -c | sort -nr | \
    awk '{print $2}' | head -n 300  > asr-test/oov_all/lines_${test_name}.oov 
    split -l 45 -a 4 -d asr-test/oov_all/lines_${test_name}.oov asr-test/oov_all/lines_${test_name}_
}
################## end of generic code ####################


# change your arguments below according to your system 
# oov count kacst
test_corpus="asr-test/kacst"
get_oov_count ${test_corpus}

# oov count N7_020723_RMC_AR
test_corpus="asr-test/N7_020723_RMC"
get_oov_count ${test_corpus}

# oov count N7_040810_MED_AR
test_corpus="asr-test/N7_040810_MED"
get_oov_count ${test_corpus}

# oov count jsc
test_corpus="asr-test/jsc"
get_oov_count ${test_corpus}


printf "done!\n"