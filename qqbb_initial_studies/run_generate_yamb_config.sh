#!/bin/bash

#tag=resolved_Meff_mTbmin_Wh_August8
#tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG700L900_Wh_August8
tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG900_Wh_August8

sample=HT_incl_filter
# sample=MET_incl_filter
suffix=

masspoints="300_0 350_0 400_0 450_100 500_0 500_100 600_0"

python ../generate_ymab_config.py --supercuts supercuts/supercuts_${tag}.json --use-summary summary/summary_${tag}_${sample}$suffix.json --outputHash hashes/hases_${tag}_${sample}$suffix/ --masspoints $(echo ${masspoints})
