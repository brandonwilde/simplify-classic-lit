#!/bin/bash

# Usage: ./itereval.sh AUTO_SIMPLIFIED_DIR ORIG_SENTS_PATH HUMAN_REF_SENTS_PATH > OUTPUT_TXT_PATH

auto_sents_dir="$1"/*.txt # Path to directory containing auto-simplified text
orig_sents_path=$2
refs_sents_paths=$3

for f in $auto_sents_dir
do
    echo $f
    easse evaluate -m bleu,fkgl,sari,bertscore,f1_token \
    --orig_sents_path $orig_sents_path \
    --refs_sents_paths $refs_sents_paths \
    --test_set custom \
    --quality_estimation \
    --sys_sents_path $f 
done