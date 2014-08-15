set -x

INPUT=report.tex
TMP=./tmp
#DIR=./latex 

test -d $TMP || mkdir $TMP

rm report.pdf 2> /dev/null; 
pdflatex -halt-on-error -output-directory $TMP $INPUT && evince $TMP/report.pdf 

