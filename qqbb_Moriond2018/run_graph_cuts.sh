#!/bin/bash

if [ $# -ge 1 ];
then

  tag=$1

  suffix=""
  if [ $# -ge 2 ];
  then
    suffix=$2
  fi

  mkdir -p plots

  python ../Optimization/graph-cuts-ewk.py --summary summary/summary_${tag}${suffix}.json --lumi 36.1 --outputHash hashes/hases_${tag}${suffix}/  -b --g-min 300 --g-max 950 --l-min 0 --l-max 350 --bin-size 25 --supercuts supercuts/supercuts_${tag}.json --output output_${tag}

else

  echo "error: illegal number of input parameters:"
  echo "cuts.sh tag [suffix]"

fi 
