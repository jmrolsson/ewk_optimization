#!/bin/bash

tag=resolved_nJets_MET_Meff_Mctbb_mTbmin_Wh_August1

sample=_HT_incl_filter
#sample=_MET_incl_filter

python ../graph-cuts.py --summary summary/summary_${tag}${sample}.json --lumi 36 --outputHash hashes/hases_${tag}${sample}/  -b --g-min 250 --g-max 750 --l-min 0 --l-max 250 --bin-size 50 --supercuts supercuts/supercuts_${tag}.json
