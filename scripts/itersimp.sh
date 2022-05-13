#!/bin/bash

muss_unsup_only="muss_en_mined"
muss_sup_and_unsup="muss_en_wikilarge_mined"
input="/Users/melissalopez/Documents/Montclair-CompLing/muss/muss_system_outputs/ml_input/classic_lit_complex.txt"
output_dir="/Users/melissalopez/Documents/Montclair-CompLing/muss/muss_system_outputs/ml_output"
control_setting=$1 # Enter "default" or "match_humans"

echo "Generating access simplifications"
/Users/melissalopez/miniconda3/envs/access/bin/python \
/Users/melissalopez/Documents/Montclair-CompLing/access/scripts/generate.py \
< $input

for training in $muss_unsup_only $muss_sup_and_unsup
do
    echo "** Generating $training simplifications **"
    echo ""$output_dir"/classic_lit_simplified_"$training"_"$control_setting".txt"
    /Users/melissalopez/miniconda3/envs/muss/bin/python scripts/simplify.py \
    --model-name $training \
    $input \
    ""$output_dir"/classic_lit_simplified_"$training"_"$control_setting".txt"
done