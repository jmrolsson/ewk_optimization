#!/bin/bash

tag=resolved_nJets_met_meff_mTbmin_mCTbb_Wh_January16

suffix=_MET_filter

mkdir -p plots

masspoints="350_0 500_0 550_150 650_00"

python ../Optimization/generate_ymab_config.py --supercuts supercuts/supercuts_${tag}.json --use-summary summary/summary_${tag}${suffix}.json --outputHash hashes/hases_${tag}${suffix}/ --masspoints $(echo ${masspoints})
