#!/bin/bash

# tag=resolved_MctbbG160_mTbmin_Wh_May30
#tag=resolved_nJets_MET_Meff_Mctbb_mTbmin_Wh_July19
#tag=resolved_MET_Meff_Mctbb_mTbmin_Wh_July26
#tag=resolved_nJets_MET_Meff_Mctbb_mTbmin_Wh_July31
tag=resolved_nJets_MET_Meff_Mctbb_mTbmin_Wh_August1
# for sample in inclusive MET HT; do
#   rooptimize hash --supercuts supercuts/supercuts_${tag}.json --use-summary summary/summary_${tag}_${sample}_no_filter.json -o hashes/hases_${tag}_${sample}_no_filter/
# done;

sample=HT_incl_filter
#sample=MET_incl_filter
suffix=
rooptimize hash --supercuts supercuts/supercuts_${tag}.json --use-summary summary/summary_${tag}_${sample}$suffix.json -o hashes/hases_${tag}_${sample}$suffix/
