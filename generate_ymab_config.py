from root_optimize import plotting
import os
import csv
import json
import re

def get_cuts(args, cut_hash):
  filename = os.path.join(args.outputHash, '{0}.json'.format(cut_hash))
  # print(filename)
  if not os.path.exists(filename): return []
  with open(filename) as f:
    cuts = json.load(f)
    cuts_list = []
    for cut in cuts:
      pivot = cut.get('pivot')
      selections = cut.get('selections')
      cuts_list.append(selections.format(*pivot))
    return cuts_list

def cuts_to_label(cuts_str):
  cuts_label = ''
  cuts_dict = {'&&':'_', '>':'G', '<':'L', '==':'Eq', '>=':'Geq', '<=':'Leq',
               'baseline_electrons_n':'nElectrons',
               'baseline_muons_n':'nMuons',
               'jets_n':'nJets',
               'bjets_n':'nBJets',
               'met':'met',
               'meff_4j':'meff',
               'minv_bb':'mbb',
               'minv_non_bb':'mNonbb',
               'dphi_sum4jet':'dphiSum4jet',
               'dphi_min':'dphiMin',
               'mct_bb':'mctbb',
               'mTb_min':'mTbMin'
               }
  for s in cuts_str.split():
    try:
      s = re.sub('\.', 'p', s)
      cuts_label += cuts_dict[s]
    except KeyError:
      cuts_label += s
  cuts_label = re.sub('nElectronsEq0_nMuonsEq0', 'leptonveto', cuts_label)
  return cuts_label

if __name__ == '__main__':
  import argparse
  import subprocess

  class CustomFormatter(argparse.ArgumentDefaultsHelpFormatter):
    pass

  __version__ = subprocess.check_output(['git', 'describe', '--always'], cwd=os.path.dirname(os.path.realpath(__file__))).strip()
  __short_hash__ = subprocess.check_output(['git', 'rev-parse', '--short', 'HEAD'], cwd=os.path.dirname(os.path.realpath(__file__))).strip()

  parser = argparse.ArgumentParser(description='Joakim Olsson v.{0}'.format(__version__),
                                   formatter_class=lambda prog: CustomFormatter(prog, max_help_position=30))
  parser.add_argument('--summary', type=str, required=True, help='Summary json')
  parser.add_argument('--outputHash', type=str, required=True, help='Directory where outputHash files are located')
  parser.add_argument('--supercuts', type=str, required=True, help='Supercuts file detailing all selections used')
  parser.add_argument('--masspoints', nargs='+', type=str, metavar='<mC1N2_mN1>', required=False, help='Masspoints for which to generate the config file', default='300_100')
  parser.add_argument('-o', '--output', type=str, required=False, help='Name to put in output filenames', default='output')
  parser.add_argument('-b', '--batch', dest='batch_mode', action='store_true', help='Enable batch mode for ROOT.')

  # parse the arguments, throw errors if missing any
  args = parser.parse_args()

  import ROOT
  ROOT.PyConfig.IgnoreCommandLineOptions = True
  ROOT.gROOT.SetBatch(args.batch_mode)

  import numpy as np

  summary = json.load(file(args.summary))

  for m in args.masspoints:

    for s in summary:
      m_c1n2 = float(m.split('_')[0])
      m_n1 = float(m.split('_')[1])
      if not (s['m_c1n2'] == m_c1n2 and s['m_n1'] == m_n1): continue
      print('\n----> Masspoint: {}'.format(m))
      cuts = get_cuts(args, s['hash'])
      cuts_str = ''
      for i,cut in enumerate(cuts):
        if i == len(cuts)-1:
          cuts_str += cut
        else:
          cuts_str += cut + r' && '
      cuts_label = cuts_to_label(cuts_str)
      print('{0:s}'.format(cuts_str))
      print('optimization_Wh_{0:.0f}_{1:.0f}_{2:s}'.format(m_c1n2, m_n1, cuts_label))
