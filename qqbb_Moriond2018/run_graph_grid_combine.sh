#!/bin/bash

if [ $# -ge 2 ];
then

  tag1=$1
  tag2=$2

  suffix=""
  if [ $# -ge 3 ];
  then
    suffix=$3
  fi

  mkdir -p plots

  python ../Optimization/graph-grid-ewk-combine.py --summary summary/summary_${tag1}${suffix}.json summary/summary_${tag2}${suffix}.json --lumi 36.1 --output sensitivities_combined_${tag1}_${tag2}_${suffix} -b --g-min 300 --g-max 950 --l-min 0 --l-max 350 --x-bin-size 25 --y-bin-size 25

else

  echo "error: illegal number of input parameters:"
  echo "run_graph_grid_combine.sh tag1 tag2 [suffix]"

fi 
