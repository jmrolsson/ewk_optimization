#!/bin/bash

tag=resolved_nJets_MET_meff_mCTbb_mTbmin_Wh_January16

suffix=_MET_filter

mkdir -p plots

python ../Optimization/graph-cuts-ewk.py --summary summary/summary_${tag}${suffix}.json --lumi 36.1 --outputHash hashes/hases_${tag}${suffix}/  -b --g-min 300 --g-max 950 --l-min 0 --l-max 350 --bin-size 25 --supercuts supercuts/supercuts_${tag}.json --output output_${tag}
