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

  masspoints="350_0 500_0 550_150 650_00"

  python ../Optimization/generate_ymab_config.py --supercuts supercuts/supercuts_${tag}.json --use-summary summary/summary_${tag}${suffix}.json --outputHash hashes/hases_${tag}${suffix}/ --masspoints $(echo ${masspoints})

else

  echo "error: illegal number of input parameters:"
  echo "cuts.sh tag [suffix]"

fi 
