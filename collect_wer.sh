#!/usr/bin/env bash


for h in hyp/jsc*.hyp
do
echo ${h}
perl /usr/local/lib/sphinxtrain/scripts/decode/word_align.pl \
jsc_test.transcription ${h} | grep 'TOTAL Percent'
done


echo "--------------------------"

for h in hyp/N7*.hyp
do
echo ${h}
perl /usr/local/lib/sphinxtrain/scripts/decode/word_align.pl \
N7_020723_RMC_AR.transcription ${h} | grep 'TOTAL Percent'
done

echo "--------------------------"




test_dirs=$(ls -d asr-test/*"/")
for test_dir in ${test_dirs}
do
echo "" > ${test_dir}acc.all
for f in ${test_dir}align/*
do
acc=$(cat ${f} | grep 'TOTAL Percent' | cut -d' ' -f11)
printf "%s\t%s\n" ${acc} ${f} >> ${test_dir}acc.all
done
sort -n ${test_dir}acc.all > ${test_dir}acc_sorted.all
done

for test_dir in ${test_dirs}
do
cat  ${test_dir}acc_sorted.all
echo "-----------------------------"
done

