#!/usr/bin/env bash
# The script use miskal utility to diacritize Arabic text. 
# https://tahadz.com/mishkal


function get_diacritics {
    mishkal_cmd="mishkal/bin/mishkal-console.py"
    input=${1}
    output=${2}
    out_name=$(basename ${input})
    printf "processing %s\n" ${input}
    python ${mishkal_cmd} -f ${input} | grep '^ ' > ${output}/${out_name}
}

for oov_file in asr-test/oov_all/lines_*
do
    get_diacritics ${oov_file} "asr-test/oov_all/mishkal"    
done

printf "done\n"