#!/bin/bash
head -n 1 data/csv/banques.pivot.csv | sed 's/;/,/g' > html/data/par_pays.csv
grep '2014-12-31;resultats/effectifs' data/csv/banques.pivot.csv | sed 's/;/,/g' >> html/data/par_pays.csv
