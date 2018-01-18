#!/bin/bash

if [ $# -ge 3 ] 
then

  input_dir=$1
  version=$2
  tag=$3

  suffix=""
  if [ $# -ge 4 ] 
  then
    suffix=$4
  fi

  files=$(find ${input_dir}/${version} -name "*.merged" -not -iname "*data*" | xargs)

  event_weight="weight_mc*weight_btag*weight_elec*weight_muon*weight_jvt*weight_WZ_2_2"

  mkdir -p cuts

  python ../Optimization/optimize.py cut $(echo $files) --supercuts=supercuts/supercuts_${tag}.json --output cuts/cuts_${tag}${suffix} --numpy --eventWeight ${event_weight} --weightsFile ../weights_qqbb.json --tree nominal --ncores=12

else

  echo "Error: Illegal number of input parameters:"
  echo "cuts.sh input_dir version tag [suffix]"

fi 
