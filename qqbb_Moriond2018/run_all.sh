#! /bin/bash

#input_dir="/Users/joakim/ewk/ewk_mbj_ntuples"
input_dir="/share/t3data2/jolsson/EWK/ewk_mbj_ntuples"
version="tagEWKqqbb.2.4.37-0-merged-filter"

#tag="resolved_nJets_met_meff_mTbmin_mCTbb_Wh_January16"
#tag="resolved_nJetsGeq4Leq5_met_meff_mTbmin_mCTbb_Wh_January16"
#tag="resolved_nJetsGeq4Leq5_metG200_metsig_meff_mTbmin_mCTbb_Wh_January16"
tag="resolved_nJetsGeq4Leq5_metG200_meff_mTbmin_mCTbb_mT2minv0_Wh_January16"

suffix="_MET_filter"

# The cuts part usually takes the longer time to run (by far...)

echo "Creating cuts..."
./cuts.sh ${input_dir} ${version} ${tag} ${suffix}

# All of the below steps run relatively quickly

echo "Optimizing significances..."
./optimize.sh  ${tag} ${suffix}

echo "Creating summary..."
./summary.sh  ${tag} ${suffix}

echo "Creating hash-cut dictionaries..."
./summary.sh  ${tag} ${suffix}

echo "Creating summary plots of optimal cuts..."
./run_graph_cuts.sh  ${tag} ${suffix}

echo "Creating mC1N2 vs. mN1 plots of optimal cuts..."
./run_graph_cuts.sh  ${tag} ${suffix}

echo "Creating mC1N2 vs. mN1 plots of optimal Zn..."
./run_graph_grid.sh  ${tag} ${suffix}
