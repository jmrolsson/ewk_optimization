#!/bin/bash

tag=resolved_nJets_met_meff_mTbmin_mCTbb_Wh_January16

suffix=_MET_filter

mkdir -p plots

python ../Optimization/graph-grid-ewk.py --summary summary/summary_${tag}${suffix}.json --lumi 36.1 -o sensitivities_${tag}${suffix} -b --g-min 300 --g-max 950 --l-min 0 --l-max 350 --x-bin-size 25 --y-bin-size 25
