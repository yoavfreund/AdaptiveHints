#!/bin/bash

article=$1

latex "${article}.tex"
bibtex "${article}" 
latex "${article}.tex" 
latex "${article}.tex" 
pdflatex -ddvipdfmDownloadBase14=true "${article}.tex"
dvips  -Pdownload35 "${article}.dvi" 

echo ""
echo "################ CHECK THAT FONTS ARE EMBEDDED: ##########################"
echo "Are all fonts embedded for ${article}.ps?"
ps2pdf "${article}.ps" tmp.pdf
pdffonts tmp.pdf
rm tmp.pdf
echo "Are all fonts embedded for ${article}.pdf?"
pdffonts "${article}.pdf"
