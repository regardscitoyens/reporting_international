#!/bin/bash

echo "date;banque;indicateur;pays;valeur;activité filiale" > data/csv/filiales.csv
for banque in data/export/20141231_BNP.csv  data/export/20141231_BPCE.csv  data/export/20141231_CA.csv  data/export/20141231_SG.csv ; do tail -n +2 $banque | awk -F ';' '{if ($11) print "'$banque';FILIALES;"$1";"$11";"$12";"}'; done | sed 's/.csv//' | sed 's|data/export/||' | sed 's/_/;/'  >> data/csv/filiales.csv
for banque in data/export/20141231_CM.csv ; do tail -n +2 $banque | awk -F ';' '{if ($11) print "'$banque';FILIALES;"$1";"$12";"$13";"}'; done | sed 's/.csv//' | sed 's|data/export/||' | sed 's/_/;/' >> data/csv/filiales.csv

echo "date;banque;indicateur;pays;valeur" > data/csv/indicateurs.csv
for banque in data/export/2015* data/export/20141231_BNP.csv  data/export/20141231_BPCE.csv  data/export/20141231_CA.csv  data/export/20141231_SG.csv ; do  tail -n +2 $banque | awk -F ';' 'BEGIN{BANQUE="'$banque'"} {
if ($2) { NB = $2 * 10000000; print BANQUE";Produit Net Bancaire;"$1";"NB } ;
if ($3) { NB = $3 * 10000000; print BANQUE";Resultat avant impot;"$1";"NB } ;
if ($4) { NB = $4 * 10000000; print BANQUE";impot courant;"$1";"NB } ;
if ($5) { NB = $5 * 10000000; print BANQUE";impot différé;"$1";"NB } ;
if ($6) { NB = $6 * 10000000; print BANQUE";impot sur bénéfice;"$1";"NB } ;
if ($7) { NB = $7; print BANQUE";Effectif;"$1";"NB } ;
if ($8) { NB = $8; print BANQUE";NB filiales CBCR;"$1";"NB } ;
if ($9) { NB = $9; print BANQUE";NB filiales périmètre en +;"$1";"NB } ;
if ($10) { NB = $10; print BANQUE";Total filiales;"$1";"NB } ;
if ($7 && $3) {NB = ($3 * 10000000)/ ($7 * 1); print BANQUE";resultats/effectifs;"$1";"NB } ;
if ($3 && $2) {NB = $3 / $2; print BANQUE";resultats/pnb;"$1";"NB } ;

}' ; done | sed 's/.csv//' | sed 's|data/export/||' | sed 's/_/;/' >> data/csv/indicateurs.csv


for banque in data/export/20141231_CM.csv  ; do  tail -n +2 $banque | awk -F ';' 'BEGIN{BANQUE="'$banque'"} {
if ($2) { NB = $2 * 10000000; print BANQUE";Produit Net Bancaire;"$1";"NB } ;
if ($3) { NB = $3 * 10000000; print BANQUE";Resultat avant impot;"$1";"NB } ;
if ($4) { NB = $4 * 10000000; print BANQUE";impot courant;"$1";"NB } ;
if ($5) { NB = $5 * 10000000; print BANQUE";impot différé;"$1";"NB } ;
if ($7) { NB = $7 * 10000000; print BANQUE";impot sur bénéfice;"$1";"NB } ;
if ($8) { NB = $8 * 1; print BANQUE";Effectif;"$1";"NB } ;
if ($9) { NB = $9 * 1; print BANQUE";NB filiales CBCR;"$1";"NB } ;
if ($10) { NB = $10 * 1; print BANQUE";NB filiales périmètre en +;"$1";"NB } ;
if ($11) { NB = $11 * 1; print BANQUE";Total filiales;"$1";"NB } ;
}' ; done | sed 's/.csv//' | sed 's|data/export/||' | sed 's/_/;/' >> data/csv/indicateurs.csv

cat data/csv/filiales.csv > data/csv/tout.csv
tail -n +2 data/csv/indicateurs.csv >> data/csv/tout.csv

sed -i "s|;AfriqueduSud;|;Afrique du Sud;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Algerie;|;Algérie;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;ArabieSaoudite;|;Arabie Saoudite;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Bahrein;|;Bahreïn;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Bresil;|;Brésil;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;BurkinaFaso;|;Burkina Faso;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;CoreeduSud;|;Corée du Sud;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;CoréeduSud;|;Corée du Sud;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Coted'Ivoire;|;Côte d'Ivoire;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Côted'Ivoire;|;Côte d'Ivoire;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Emirats Arabes Unis;|;Émirats Arabes Unis;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;EmiratsArabesUnis;|;Émirats Arabes Unis;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;ÉmiratsArabesUnis;|;Émirats Arabes Unis;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;ÉtatsUnisd’Amérique;|;États-Unis;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Etats-Unis;|;États-Unis;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Grande-Bretagne;|;Royaume-Uni;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;GrandeBretagne;|;Royaume-Uni;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Grece;|;Grèce;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Guinéeéquatoriale;|;Guinée Équatoriale;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Guinée ;|;Guinée;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Hong Kong;|;Hong-Kong;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;HongKong;|;Hong-Kong;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Ile de Man;|;Île de Man;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;ÎleMaurice;|;Île Maurice;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;IlesCaimans;|;Îles Caïmans;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Iles Caïmans;|;Îles Caïmans;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;IlesCaïmans;|;Îles Caïmans;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;IlesCayman;|;Îles Caïmans;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Indonesie;|;Indonésie;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Koweit;|;Koweït;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Norvege;|;Norvège;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;NouvelleCalédonie;|;Nouvelle-Calédonie;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;PaysBas;|;Pays-Bas;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Polynésiefrançaise;|;Polynésie Française;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;PolynésieFrançaise;|;Polynésie Française;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;RepubliquedeCoree;|;Corée du Sud;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Republiquetcheque;|;République Tchèque;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;RepubliqueTcheque;|;République Tchèque;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Républiquetchèque;|;République Tchèque;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;RépubliqueTchèque;|;République Tchèque;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Roumanie ;|;Roumanie;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Russie ;|;Russie;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Senegal;|;Sénégal;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Suede;|;Suède;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Suisse ;|;Suisse;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Taiwan;|;Taïwan;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Thailande;|;Thaïlande;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;VietNam;|;Vietnam;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 

sed -i "s|;Asset management;|;Asset Management;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;bank;|;Banque;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Bank services;|;Banque;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Banque;|;Bank;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Banque de Détail;|;Banque de détail;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Banque de financement et activité de marché;|;Banque de Financement et d'Investissement;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Banque de Proximité à l'International;|;Banque de Proximité;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Banque de Proximité en France;|;Banque de Proximité;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Corporate and investment Banking;|;Corporate and Investment Banking;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Credit insurance and related services;|;Credit insurance;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Finance company (audio-visual);|;Finance company;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Group real estate management companies;|;Group real estate management company;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;guarantee company;|;Guarantee company;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Insurance brokerage advisory services;|;Insurance brokerage;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Insurance companies'holding company;|;Insurance company;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;insurance;|;Insurance;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;insurance UCITS;|;Insurance UCITS;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;investment company;|;Investment;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Investment company;|;Investment;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Investment Parners;|;Investment;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;investment Partners;|;Investment;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Investment Partners;|;Investment;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;IT Services;|;IT services;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Leasing Solutions;|;Leasing solutions;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;office space;|;Office space;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Personal investors;|;Personal Investors;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;portfolio management;|;Portfolio management;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;private Equity;|;Private Equity;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Private equity;|;Private Equity;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Real estate and non real estate Leasing;|;Real estate and non real estate leasing;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Real estate invesment;|;Real estate investment;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;real estate leasing;|;Real estate leasing;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;services company;|;Services company;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|; Services Financiers Spécialisés;|;Services Financiers Spécialisés;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Specialist financing;|;Specialist Financing;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 
sed -i "s|;Sructured finance;|;Structured finance;|" data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv 



sed -i 's/;$//' data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv
sed -i 's/ *$//' data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv
 
sed -i 's/^\([0-9][0-9][0-9][0-9]\)\([0-9][0-9]\)/\1-\2-/' data/csv/filiales.csv data/csv/indicateurs.csv data/csv/tout.csv

tail -n +2 data/csv/indicateurs.csv | awk -F ';' '{table[$3][$1";"$2";"$4] = $5}
END{ 
	for ( a in table ) { head = head ";" a}  ; print "date;banque;pays"head ; 
	for ( a in table ) { for ( b in table[a] ) { lines[b] = 1}  }
	for ( line in lines ) { l = line ; for ( a in table ) { l = l ";" table[a][line] ; } print l ;}
}' > data/csv/indicateurs.pivot.csv

