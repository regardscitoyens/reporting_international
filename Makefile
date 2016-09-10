all: data/csv/tout.csv

data/csv/tout.csv: bin/generatecsv.sh data/export/20141231_BNP.csv   data/export/20141231_CA.csv  data/export/20141231_SG.csv   data/export/20151231_BPCE.csv  data/export/20151231_CM.csv data/export/20141231_BPCE.csv  data/export/20141231_CM.csv  data/export/20151231_BNP.csv  data/export/20151231_CA.csv    data/export/20151231_SG.csv
	bash bin/generatecsv.sh
