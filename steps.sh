#!/usr/bin/env bash

bash sphinx-eval/test.sh dmps dicts acoustic test/kacst kacst500 hyp logs


bash sphinx-eval/test3in1dic_gt100.sh dmps dicts acoustic test/kacst kacst500 hyp logs

for h in test/kacst/hyp/*gt100*
do
echo ${h}
perl /usr/local/lib/sphinxtrain/scripts/decode/word_align.pl \
test/kacst/kacst500_test.transcription ${h} | grep 'TOTAL Percent'
done





