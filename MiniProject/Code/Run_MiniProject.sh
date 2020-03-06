echo "Compiling .tex file..."
latex MiniProject.tex


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