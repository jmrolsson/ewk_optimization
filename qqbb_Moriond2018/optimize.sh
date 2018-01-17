#!/bin/bash

tag=resolved_nJets_met_meff_mTbmin_mCTbb_Wh_January16

suffix=_MET_filter

mkdir -p significances

python ../Optimization/optimize.py optimize --signal 394\*.json --bkgd $(cat bkgdFiles${suffix} | sed "s/$/.json/g" | tr '\n' ' ') --searchDirectory cuts/cuts_${tag}${suffix}/ --o significances/significances_${tag}${suffix} --lumi 36 --bkgdUncertainty 0.30 --bkgdStatUncertainty 0.30 --insignificanceBkgd 1.0 --insignificanceSignal 3.0
