#!/bin/bash

#input_dir=/Users/joakim/ewk/ewk_mbj_ntuples
input_dir=/share/t3data2/jolsson/EWK/ewk_mbj_ntuples
version="tagEWKqqbb.2.4.37-0-merged-filter"

## test
#files=${input_dir}/${version}/tagEWKqqbb.2.4.37-0.Wh_350p0_0p0.394329.loose_filter.merged

files=$(find ${input_dir}/${version} -name "*.merged" -not -iname "*data*" | xargs)

#tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG700L900_Wh_August8
#tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG900_Wh_August8
#tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG700_Wh_August12
#tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG700_Wh_August12_MnonbbG70L95
#tag=resolved_nJets_MET_Mctbb_mTbmin_MeffG900_Wh_August12_MnonbbG70L95
#tag=resolved_nJets_MET_Mctbb_mTbmin_metsig_MeffG900_Wh_September20

tag=resolved_nJets_met_meff_mTbmin_mCTbb_Wh_January16

suffix=_MET_filter

event_weight="weight_mc*weight_btag*weight_elec*weight_muon*weight_jvt*weight_WZ_2_2"

mkdir -p cuts

python ../Optimization/optimize.py cut $(echo $files) --supercuts=supercuts/supercuts_${tag}.json -o cuts/cuts_${tag}${suffix} --numpy --eventWeight ${event_weight} --weightsFile ../weights_qqbb.json --tree nominal --ncores=12
