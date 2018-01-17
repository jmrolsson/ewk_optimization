#! /bin/bash

#input_dir="/Users/joakim/ewk/ewk_mbj_ntuples"
input_dir="/share/t3data2/jolsson/EWK/ewk_mbj_ntuples"
version="tagEWKqqbb.2.4.37-0-merged-filter"

##tag="resolved_nJets_met_meff_mTbmin_mCTbb_Wh_January16"

##tag="resolved_nJetsGeq4Leq5_met_meff_mTbmin_mCTbb_Wh_January16"

##tag="resolved_nJetsGeq4Leq5_metG200_metsig_meff_mTbmin_mCTbb_Wh_January16"

##tag="resolved_nJetsGeq4Leq5_metG200_meff_mTbmin_mCTbb_mT2minv0_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meffG1000_mTbmin_mCTbb_mT2minv0_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meffL1000_mTbmin_mCTbb_mT2minv0_Wh_January16"

##tag="resolved_nJetsGeq4Leq5_metG200_meff_mTbmin_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meff_mCTbb_Wh_January16"

##tag="resolved_nJetsGeq4Leq5_metG200_meff_mTbmin_mCTbb_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meffG700L900_mTbmin_mCTbb_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meffG700L800_mTbmin_mCTbb_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meffG700L1000_mTbmin_mCTbb_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meffG800L900_mTbmin_mCTbb_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meffG900L1000_mTbmin_mCTbb_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meffG900L1100_mTbmin_mCTbb_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meffG900L1200_mTbmin_mCTbb_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meffG1000L1100_mTbmin_mCTbb_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meffG1000L1200_mTbmin_mCTbb_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meffG700_mTbmin_mCTbb_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meffG900_mTbmin_mCTbb_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meffG1000_mTbmin_mCTbb_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meffG1100_mTbmin_mCTbb_Wh_January16"
##tag="resolved_nJetsGeq4Leq5_metG200_meffG1200_mTbmin_mCTbb_Wh_January16"

##tag="resolved_nJetsGeq4Leq5_metG200_meffG1000_mTbminG140_mCTbbG140_mbb_mnonbb_Wh_January16"

##tag1="resolved_nJetsGeq4Leq5_metG200_meffG700_mTbmin_mCTbb_mnonbbG70L95_Wh_January16"
##tag3="resolved_nJetsGeq4Leq5_metG200_meffG700L1000_mTbmin_mCTbb_mnonbbG70L95_Wh_January16"
##tag2="resolved_nJetsGeq4Leq5_metG200_meffG1000_mTbmin_mCTbb_mnonbbG70L95_Wh_January16"

tag1="resolved_nJets_met_meff_mTbmin_mCTbb_Wh_January16"
tag2="resolved_nJets_met_meff_mTbmin_mCTbb_mnonbbG70L95_Wh_January16"
tag3="resolved_nJets_met_meffG700_mTbmin_mCTbb_mnonbbG70L95_Wh_January16"
tag4="resolved_nJets_met_meffG700L1000_mTbmin_mCTbb_mnonbbG70L95_Wh_January16"
tag5="resolved_nJets_met_meffG1000_mTbmin_mCTbb_mnonbbG70L95_Wh_January16"

suffix="_MET_filter"

## The cuts part usually takes the longer time to run (by far...)

for tag in $tag1 $tag2 $tag3 $tag4 $tag5; do

  echo "Creating cuts..."
  ./cuts.sh ${input_dir} ${version} ${tag} ${suffix}
  
  ## All of the below steps run relatively quickly
  
  echo "Optimizing significances..."
  ./optimize.sh  ${tag} ${suffix}
  
  echo "Creating summary..."
  ./summary.sh  ${tag} ${suffix}
  
  echo "Creating hash-cut dictionaries..."
  ./hash.sh  ${tag} ${suffix}
  
  echo "Creating mC1N2 vs. mN1 plots of optimal cuts..."
  ./run_graph_cuts.sh  ${tag} ${suffix}
  
  echo "Creating mC1N2 vs. mN1 plots of optimal Zn..."
  ./run_graph_grid.sh  ${tag} ${suffix}
done
