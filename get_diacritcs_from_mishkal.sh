#!/usr/bin/env bash

function get_diacritics {
    input=${1}
    output=${2}
    out_name=$(basename ${input})
    printf "processing %s\n" ${input}
    python mishkal/bin/mishkal-console.py -f ${input} | grep '^ ' > ${output}/${out_name}
}

for oov_file in asr-test/oov_all/lines_*
do
    get_diacritics ${oov_file} "asr-test/oov_all/mishkal"    
done

printf "done\n"