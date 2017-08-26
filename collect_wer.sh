#!/usr/bin/env bash


test_dirs=$(ls -d asr-test/*"/")
for test_dir in ${test_dirs}
do
echo "" > ${test_dir}acc.all
for f in ${test_dir}align/*
do
acc=$(cat ${f} | grep 'TOTAL Percent' | cut -d' ' -f11)
printf "%s\t%s\n" ${acc} ${f} >> ${test_dir}acc.all
done
sort -n -r ${test_dir}acc.all > ${test_dir}acc_sorted.all
done

for test_dir in ${test_dirs}
do
cat  ${test_dir}acc_sorted.all
echo "-----------------------------"
done

