#!/bin/bash

# tag=resolved_MctbbG160_mTbmin_Wh_May30
# tag=resolved_nJets_MET_Meff_Mctbb_mTbmin_Wh_July19
#tag=resolved_MET_Meff_Mctbb_mTbmin_Wh_July26
#tag=resolved_nBJets_MET_Meff_Mctbb_mTbmin_Wh_July26
#tag=resolved_nJets_MET_Meff_Mctbb_mTbmin_Wh_July31
#tag=resolved_nJets_MET_Meff_Mctbb_mTbmin_Wh_August1
#tag=resolved_MET_Meff_Mctbb_mTbmin_Wh_August7
#tag=resolved_Meff_mTbmin_Wh_August8
#tag=resolved_Meff_mTbmin_Wh_August8
#tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG700L900_Wh_August8
#tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG900_Wh_August8
tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG700_Wh_August12

# for sample in inclusive MET HT; do
#   rooptimize optimize --signal 0000\*.json --bkgd $(cat bkgdFiles_${sample}_no_filter | sed "s/$/.json/g" | tr '\n' ' ') --searchDirectory cuts/cuts_${tag}/ --o significances/significances_${tag}_${sample}_no_filter --lumi 35 --bkgdUncertainty 0.30 --bkgdStatUncertainty 0.30 --insignificanceBkgd 1.0 --insignificanceSignal 3.0
# done;

sample=HT_incl_filter
suffix=_HT_filter
# sample=MET_incl_filter
# suffix=_MET_filter
rooptimize optimize --signal 1000\*.json --bkgd $(cat bkgdFiles_${sample} | sed "s/$/.json/g" | tr '\n' ' ') --searchDirectory cuts/cuts_${tag}${suffix}/ --o significances/significances_${tag}_${sample} --lumi 36 --bkgdUncertainty 0.30 --bkgdStatUncertainty 0.30 --insignificanceBkgd 1.0 --insignificanceSignal 3.0
#rooptimize optimize --signal 1000\*.json --bkgd $(cat bkgdFiles_${sample} | sed "s/$/.json/g" | tr '\n' ' ') --searchDirectory cuts/cuts_${tag}${suffix}/ --o significances/significances_${tag}_${sample} --lumi 36 --bkgdUncertainty 0.30 --bkgdStatUncertainty 0.30
