#!/bin/bash

if [ $# -ge 1 ];
then

  tag=$1

  suffix=""
  if [ $# -ge 2 ];
  then
    suffix=$2
  fi

  mkdir -p significances

  python ../Optimization/optimize.py optimize --signal 394\*.json --bkgd $(cat bkgdFiles${suffix} | sed "s/$/.json/g" | tr '\n' ' ') --searchDirectory cuts/cuts_${tag}${suffix}/ --output significances/significances_${tag}${suffix} --lumi 36.1 --bkgdUncertainty 0.30 --bkgdStatUncertainty 0.30 --insignificanceBkgd 1.0 --insignificanceSignal 3.0


else

  echo "error: illegal number of input parameters:"
  echo "cuts.sh tag [suffix]"

fi 
