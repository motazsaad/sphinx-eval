#!/usr/bin/env bash

function get_diacritics {
    diacritics_cmd=${1}    
    input=${2}
    output=${3}
    out_name=$(basename ${input})
    printf "processing %s\n" ${input}
    diacritics_cmd ${input} > ${output}/${out_name}
}

mishkal_cmd="python mishkal/bin/mishkal-console.py -f"
for oov_file in asr-test/oov_all/lines_*
do
    get_diacritics ${mishkal_cmd} ${oov_file} "asr-test/oov_all/mishkal"    
done

printf "done\n"