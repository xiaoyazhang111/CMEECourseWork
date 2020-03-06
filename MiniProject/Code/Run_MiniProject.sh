# Author: Xiaoya Zhang/xiaoya.zhang19@imperial.ac.uk
# Script: Run_MiniProject.sh
# Desc: run all the scripts
# Date: Mar 2020

echo -e "Compiling .tex file..."
latex MiniProject.tex
echo -e "preparing data and nlls fitting"
python3 DataPrep.py
Rscript NLLSfitting.py

#!/bin/bash
pdflatex $1.tex
pdflatex $1.tex
bibtex $1
pdflatex $1.tex
pdflatex $1.tex


## Cleanup

rm *.aux
rm *.dvi
rm *.log
rm *.bbl


open MiniProject.pdf


# exit