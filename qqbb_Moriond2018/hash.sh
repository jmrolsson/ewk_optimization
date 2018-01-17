#!/bin/bash

tag=resolved_nJets_met_meff_mTbmin_mCTbb_Wh_January16

suffix=_MET_filter

mkdir -p hashes

python ../Optimization/optimize.py hash --supercuts supercuts/supercuts_${tag}.json --use-summary summary/summary_${tag}${suffix}.json -o hashes/hases_${tag}${suffix}/
