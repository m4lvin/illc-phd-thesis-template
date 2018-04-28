
MYTEX = /usr/bin/pdflatex

MYTEXARGS = -interaction=nonstopmode -synctex=1

SHELL = /bin/bash

thesis.pdf: *.tex *.cls *.bib
	$(MYTEX) $(MYTEXARGS) thesis
	biber thesis
	$(MYTEX) $(MYTEXARGS) thesis
	$(MYTEX) $(MYTEXARGS) thesis
	$(MYTEX) $(MYTEXARGS) thesis

.PHONY: quick prettyerrors clean todo colorpages diffpdf

quick:
	$(MYTEX) $(MYTEXARGS) thesis

# See https://github.com/stefanhepp/pplatex
prettyerrors:
	tools/ppdflatex $(MYTEXARGS) thesis

clean:
	rm -f *.aux *.log *.out *.snm *.toc *.vrb *.nav *.synctex.gz *.blg *.bbl *.fdb_latexmk *.fls *.ind *.idx *.ilg *.bcf *.run.xml

todo:
	@grep -inr TODO *.tex || true
	@grep -inr FIXME *.tex || true
	@grep -nr NOTE *.tex || true
	@((grep -inr TODO *.tex ; grep -inr FIXME *.tex; grep -nr NOTE *.tex) | wc -l) || true

sha256check:
	sha256sum thesis.pdf
	make prettyerrors
	sha256sum thesis.pdf

chapters = 1 2 3

# See http://www.grapenthin.org/toolbox/check_repeats.html
check:
	tools/check_repeats 01_acknowledgments.tex
	tools/check_repeats 02_introduction.tex
	tools/check_repeats 03_symbols.tex
	$(foreach a, $(chapters), tools/check_repeats $(a)0_chapter$(a).tex;)
	tools/check_repeats 90_conclusion.tex
	tools/check_repeats 93_samenvatting.tex
	tools/check_repeats 95_abstract.tex
	tools/check_repeats bibliography.bib

dsurl = https://www.illc.uva.nl/PhDProgramme/current-candidates/other/Latexhelp/ILLCDiss/illcdissertations.tex

update-illcdissertations.tex:
	wget $(dsurl) -O illcdissertations.tex

pages.txt: thesis.pdf
	gs -o - -sDEVICE=inkcov thesis.pdf | tail -n +4 | sed '/^Page*/N;s/\n//'| sed -E '/Page [0-9]+ 0.00000 0.00000 0.00000 / d' > pages.txt

colorpages: pages.txt
	@echo "color pages:"
	@cat pages.txt | grep -v "0.00000  0.00000  0.00000"
	@echo -n "number of color pages: "
	@cat pages.txt | grep -v "0.00000  0.00000  0.00000" | grep -v "Processing pages" | wc -l

CHANGED.pdf: CHANGED.md
	pandoc CHANGED.md -o CHANGED.pdf --variable=geometry:a4paper

diffpdf:
	diffpdf thesis-committee-version.pdf ./thesis.pdf

titlepage-only.pdf:
	pdftk thesis.pdf cat 5 6 output titlepage-only.pdf
