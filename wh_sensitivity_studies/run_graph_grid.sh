#!/bin/bash

#tag=resolved_nJets_MET_Meff_Mctbb_mTbmin_Wh_August1
#tag=resolved_MET_Meff_Mctbb_mTbmin_Wh_August7
#tag=resolved_Meff_mTbmin_Wh_August8
#tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG700L900_Wh_August8
#tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG900_Wh_August8
tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG700_Wh_August12

sample=_HT_incl_filter
#sample=_MET_incl_filter

python ../graph-grid.py --summary summary/summary_${tag}${sample}.json --lumi 36 -o sensitivities_${tag}${sample} -b --g-min 250 --g-max 750 --l-min 0 --l-max 250 --x-bin-size 50 --y-bin-size 50
