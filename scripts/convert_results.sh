#!/bin/bash
cd "$( cd "$( dirname "$0" )" && pwd )"

../git/mondo-sam/reporting/convert_results.py --source /home/iqlabs/development/emdw-mc-master/export/results/json \
--jsonfile /home/iqlabs/development/emdw-mc-master/export/results.json \
--csvfile /home/iqlabs/development/emdw-mc-master/export/results.csv
