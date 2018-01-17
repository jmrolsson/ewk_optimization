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

  python ../Optimization/graph-grid-ewk.py --summary summary/summary_${tag}${suffix}.json --lumi 36.1 -o sensitivities_${tag}${suffix} -b --g-min 300 --g-max 950 --l-min 0 --l-max 350 --x-bin-size 25 --y-bin-size 25

else

  echo "error: illegal number of input parameters:"
  echo "cuts.sh tag [suffix]"

fi 
