#!/bin/bash

if [ $# -ge 1 ];
then

  tag=$1

  suffix=""
  if [ $# -ge 2 ];
  then
    suffix=$2
  fi

  mkdir -p summary

  python ../Optimization/optimize.py summary --searchDirectory significances/significances_${tag}${suffix}/ --massWindows mass_windows_qqbb.txt --stop-masses 0 --output summary/summary_${tag}${suffix}.json

else

  echo "error: illegal number of input parameters:"
  echo "cuts.sh tag [suffix]"

fi 
