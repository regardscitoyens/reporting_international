all: data/csv/tout.csv html/data/par_pays.csv

data/csv/tout.csv: bin/generatecsv.sh data/export/20141231_BNP.csv   data/export/20141231_CA.csv  data/export/20141231_SG.csv   data/export/20151231_BPCE.csv  data/export/20151231_CM.csv data/export/20141231_BPCE.csv  data/export/20141231_CM.csv  data/export/20151231_BNP.csv  data/export/20151231_CA.csv    data/export/20151231_SG.csv
	bash bin/generatecsv.sh

data/csv/banques.pivot.csv: data/csv/tout.csv

html/data/par_pays.csv: data/csv/banques.pivot.csv bin/generate_cartodata.sh
	bash bin/generate_cartodata.sh
