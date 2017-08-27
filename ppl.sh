#!/usr/bin/env bash



for test_text in asr-test/test_txt/*
do
    test_name=$(basename $test_text)
    printf "test text: %s\n---------\n\n" ${test_name}
    for lm in lms/*gt100_pruned8*
    do
        lm_name=$(basename $lm)
        printf "applying %s\n" ${lm_name}
        ngram -lm ${lm} -ppl ${test_text} > asr-test/ppl_dir/${lm_name}_${test_name}.ppl
        printf "%s\n" "------------------"
    done
    printf "%s\n" "====================================="
    printf "%s\n" "====================================="
    for ppl_file in asr-test/ppl_dir/*${test_name}.ppl
    do
        ppl=`grep ppl= ${ppl_file} | awk '{ printf ("%.1f\n", $6)}'`
        oov=`grep OOVs ${ppl_file}  | awk '{ print $7}'`
        words=`grep words ${ppl_file}  | awk '{ print $5}'`
        oov_rate=$(python -c "print($oov/float($words)*100)")
        printf "%s ppl\t %.1f %%oov\t %s\n" ${ppl} ${oov_rate} ${ppl_file} >> asr-test/ppl_dir/${test_name}_results.txt
    done
    sort -n asr-test/ppl_dir/${test_name}_results.txt > asr-test/ppl_dir/${test_name}_results_sorted.txt
done


cat asr-test/ppl_dir/*jsc*sorted.txt > asr-test/lm_ppl.result
echo "--------------------------------" >> asr-test/lm_ppl.result
cat asr-test/ppl_dir/*kacst500*sorted.txt >> asr-test/lm_ppl.result
echo "--------------------------------" >> asr-test/lm_ppl.result
cat asr-test/ppl_dir/*N7_02*sorted.txt >> asr-test/lm_ppl.result
echo "--------------------------------" >> asr-test/lm_ppl.result
cat asr-test/ppl_dir/*N7_04*sorted.txt >> asr-test/lm_ppl.result

