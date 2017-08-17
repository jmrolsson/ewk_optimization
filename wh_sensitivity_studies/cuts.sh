#!/bin/bash

#input_dir=/Users/joakim/ewk/ewk_mbj_ntuples/histfitter
input_dir=/share/t3data2/jolsson/EWK/ewk_mbj_ntuples/histfitter
version="2.4.28-0-1-77-gd12fe93"
#version="2.4.28-0-1-77-gd12fe93-ht-filter"
# version="2.4.28-0-1-77-gd12fe93-met-filter"
files=$(find ${input_dir}/${version} -name "*.merged" -not -iname "*data*" | xargs)

# tag=resolved_MctbbG160_mTbmin_Wh_May30
#tag=resolved_nJets_MET_Meff_Mctbb_mTbmin_Wh_July19
#tag=resolved_MET_Meff_Mctbb_mTbmin_Wh_July26
#tag=resolved_nBJets_MET_Meff_Mctbb_mTbmin_Wh_July26
#tag=resolved_nJets_MET_Meff_Mctbb_mTbmin_Wh_July31
#tag=resolved_nJets_MET_Meff_Mctbb_mTbmin_Wh_August1
#tag=resolved_MET_Meff_Mctbb_mTbmin_Wh_August7
#tag=resolved_Meff_mTbmin_Wh_August8
#tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG700L900_Wh_August8
#tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG900_Wh_August8
tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG700_Wh_August12
#tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG700_Wh_August12_MnonbbG70L95
#tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG900_Wh_August12_MnonbbG70L95
suffix=
#suffix=_HT_filter
#suffix=_MET_filter

mkdir -p cuts
rooptimize cut $(echo $files) --supercuts=supercuts/supercuts_${tag}.json -o cuts/cuts_${tag}${suffix} --numpy --eventWeight "weight_mc" --weightsFile ../weights_qqbb.json --tree nominal --ncores=8
