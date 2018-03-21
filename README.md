# sphinx-eval

This project is a set of bash scripts that helps to evaulate CMU sphinx ASR system. 


## collect_wer.sh
This script compute WER for the produced transcription. 

## get_oov.py 
This program obtain the list of OOV from ref and hyp files

```usage: get_oov.py [-h] --ref REF --hyp HYP --oov OOV```

## get_oov.sh
This script get OOV words for a transciption with respect the hyp.

## get_diacritcs_from_mishkal 
The script use miskal utility to diacritize Arabic text. 

https://tahadz.com/mishkal

## ppl.sh 
This script gets preplixity of the between texts and LMs. 

## word_align 
This script align words in (hyp and trs) texts. 