#!/usr/bin/env bash
# The script use miskal utility to add diacritics to Arabic texts. 
# For more information about mishkal, please refer to 
# https://tahadz.com/mishkal and https://github.com/linuxscout/mishkal 

################################
function get_diacritics {
    # change the path to mishkal-console.py according to your system 
    mishkal_py="mishkal/bin/mishkal-console.py"
    input_file=${1}
    output_dir=${2}
    out_name=$(basename ${input_file})
    printf "processing %s\n" ${input_file}
    python ${mishkal_py} -f ${input_file} | grep '^ ' > ${output_dir}/${out_name}
}
################################



################################
# change pathes according to your system 
oov_files="asr-test/oov_all/lines_*"
out_dir="asr-test/oov_all/mishkal"
################################

for oov_file in ${oov_files}
do
    get_diacritics ${oov_file} ${out_dir}
done

printf "done\n"