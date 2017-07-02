#!/bin/bash

input_dir=/Users/joakim/ewk/ewk_mbj_ntuples/histfitter/
version=histfitter_20170521_sig_validation.local
tag=resolved_MctbbG160_mTbmin_Wh_May30

mkdir -p cuts

rooptimize cut ${input_dir}/${version}/*.merged --supercuts=supercuts/supercuts_${tag}.json -o cuts/cuts_${tag} --numpy --eventWeight weight_mc --weightsFile ../weights_qqbb.json --tree nominal --ncores=8
