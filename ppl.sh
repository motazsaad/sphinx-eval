#!/usr/bin/env bash
# This script gets perplexity (PPL) of a text given a languge model (LM). 
# The script computes PPL for bunch of texts given bunch of LMs. 

#echo ${#}
# if [ $# -ne 3 ]; then
#     echo "usage: ${0} test_dir lm_dir ppl_dir";
#     exit -1;
# fi


################ generic function code ############################
function computer_ppl {
    test_dir=${1} # input dir 
    lm_dir=${2} # LMs dir 
    ppl_dir=${3} # output dir 
    for test_text in ${test_dir}
    do
        test_name=$(basename $test_text)
        printf "test text: %s\n---------\n\n" ${test_name}
        for lm in ${lm_dir}
        do
            lm_name=$(basename $lm)
            printf "applying %s\n" ${lm_name}
            ngram -lm ${lm} -ppl ${test_text} > ${ppl_dir}/${lm_name}_${test_name}.ppl
            printf "%s\n" "------------------"
        done
        printf "%s\n" "====================================="
        printf "%s\n" "====================================="
        for ppl_file in ${ppl_dir}/*${test_name}.ppl
        do
            ppl=`grep ppl= ${ppl_file} | awk '{ printf ("%.1f\n", $6)}'`
            oov=`grep OOVs ${ppl_file}  | awk '{ print $7}'`
            words=`grep words ${ppl_file}  | awk '{ print $5}'`
            oov_rate=$(python -c "print($oov/float($words)*100)")
            printf "%s ppl\t %.1f %%oov\t %s\n" ${ppl} ${oov_rate} ${ppl_file} \
            >> ${ppl_dir}/${test_name}_results.txt
        done
        sort -n ${ppl_dir}/${test_name}_results.txt > \
        ${ppl_dir}${test_name}_results_sorted.txt
    done
################ end of generic function code ############################


# You can change here accoridng to your paths 
test_dir="asr-test/test_txt/*" # input dir 
ppl_dir="asr-test/ppl_dir" # output dir 
lm_dir="lms/*gt100_pruned8*" # LMs dir 
final_result_dir="asr-test"
outfile="lm_ppl.result"
computer_ppl ${test_dir} ${ppl_dir} ${lm_dir}


# sort results for each corpus and collected it in the outfile 
cat ${ppl_dir}/*jsc*sorted.txt > ${final_result_dir}/${outfile}
echo "--------------------------------" >> ${final_result_dir}/${outfile}
cat ${ppl_dir}/*kacst500*sorted.txt >> ${final_result_dir}/${outfile}
echo "--------------------------------" >> ${final_result_dir}/${outfile}
cat ${ppl_dir}/*N7_02*sorted.txt >> ${final_result_dir}/${outfile}
echo "--------------------------------" >> ${final_result_dir}/${outfile}
cat ${ppl_dir}/*N7_04*sorted.txt >> ${final_result_dir}/${outfile}

