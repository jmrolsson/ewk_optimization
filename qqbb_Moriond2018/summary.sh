#!/bin/bash

tag=resolved_nJets_MET_meff_mCTbb_mTbmin_Wh_January16

suffix=_MET_filter

mkdir -p summary

python ../Optimization/optimize.py summary --searchDirectory significances/significances_${tag}${suffix}/ --massWindows mass_windows_qqbb.txt --stop-masses 0 --output summary/summary_${tag}${suffix}.json
