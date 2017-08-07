#!/bin/bash

tag=resolved_nJets_MET_Meff_Mctbb_mTbmin_Wh_August1

sample=_HT_incl_filter
#sample=_MET_incl_filter

python ../graph-grid.py --summary summary/summary_${tag}${sample}.json --lumi 36 -o sensitivities_${tag}${sample} -b --g-min 250 --g-max 750 --l-min 0 --l-max 250 --x-bin-size 50 --y-bin-size 50
