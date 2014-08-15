set -x

INPUT=report.tex
TMP=./tmp
#DIR=./latex 


rm report.pdf 2> /dev/null; 
pdflatex -halt-on-error -output-directory $TMP $INPUT && evince $TMP/report.pdf 

