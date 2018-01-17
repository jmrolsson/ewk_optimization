#!/bin/bash

if [ $# -ge 1 ];
then

  tag=$1

  suffix=""
  if [ $# -ge 2 ];
  then
    suffix=$2
  fi

  mkdir -p hashes

  python ../optimization/optimize.py hash --supercuts supercuts/supercuts_${tag}.json --use-summary summary/summary_${tag}${suffix}.json -o hashes/hases_${tag}${suffix}/

else

  echo "error: illegal number of input parameters:"
  echo "cuts.sh tag [suffix]"

fi 
