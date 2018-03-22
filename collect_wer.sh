#!/usr/bin/env bash
# This script extracts WER for the produced transcriptions. 
# WER is extracted from (.align) files using grep command  

#echo ${#}
# if [ $# -ne 3 ]; then
#     echo "usage: ${0} test_dir out_dir";
#     exit -1;
# fi


################ generic function code ############################
function extract_wer {
    # directory where aligment files are. 
    # this directory assumed to have alignment files generated using different LMs. 
    in_dir=${1} 
    out_dir=${2} # out directory to write the results in. 

    echo "" > ${out_dir}/acc.all # create an empty file 
    for f in ${in_dir}
    do
        # extract accuracy from alignments (produced using different LMs)  
        acc=$(cat ${f} | grep 'TOTAL Percent' | cut -d' ' -f11)
        # write accuracy and filename 
        printf "%s\t%s\n" ${acc} ${f} >> ${out_dir}/acc.all
    done
    # sort lines according to accuracy 
    sort -n -r ${out_dir}/acc.all > ${out_dir}/acc_sorted.all
    # display sorted file on screen 
    cat  ${out_dir}/acc_sorted.all
    echo "-----------------------------"
}


# loop on test corpora 
test_dirs="asr-test/test_corpora"
resut_dir="asr-test/results"
for test_corpus in test_dirs
do 
    extract_wer ${test_dirs} ${resut_dirs}
done 

#################################################
##### collect all results (for all corpora) in one file ########   
echo "" > ${resut_dir}/lm_wer.result # create output file 
cat ${resut_dir}/*sorted.all > ${resut_dir}/lm_wer.result

