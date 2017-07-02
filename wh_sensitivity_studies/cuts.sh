#!/bin/bash

input_dir=/Users/joakim/ewk/ewk_mbj_ntuples/histfitter
#input_dir=/share/t3data2/jolsson/EWK/ewk_mbj_ntuples/histfitter
version="2.4.28-0-1-77-gd12fe93"

files=$(find ${input_dir}/${version}/ -not -iname *data* | xargs)

tag=resolved_MctbbG160_mTbmin_Wh_May30

mkdir -p cuts

rooptimize cut $files --supercuts=supercuts/supercuts_${tag}.json -o cuts/cuts_${tag} --numpy --eventWeight weight_mc --weightsFile ../weights_qqbb.json --tree nominal --ncores=8

