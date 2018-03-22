# sphinx-eval

This project is a set of bash scripts that helps to evaluate CMU sphinx ASR system. These scripts can be used after you have the decoder output. 

## collect_wer.sh
This script extracts WER for the produced transcriptions. WER is extracted from (.align) files using grep command  

## get_oov.py 
This program obtain the list of OOV from ref and hyp files. The benefits is that you can get a list of words that the decoder failed to produce to add it to the system somehow, so it can be recognized in the system. 

```usage: get_oov.py [-h] --ref REF --hyp HYP --oov OOV```

## get_oov.sh
This script get OOV words for a transciption with respect the hyp. This script uses get_oov.py to get OOV words for a bunch of files. 

## get_diacritcs_from_mishkal 
The script use miskal utility to add diacritics to Arabic texts. 

For more information about mishkal, please refer to https://tahadz.com/mishkal and https://github.com/linuxscout/mishkal 

## ppl.sh 
This script gets perplexity (PPL) of a text given a languge model (LM). The script computes PPL for bunch of texts given bunch of LMs. 

## word_align.sh
This script align words in (hyp and trs) texts using word_align.sh script 

