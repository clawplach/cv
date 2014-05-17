xelatex:
	xelatex cv.tex

clean:
	-rm -f *.log *.aux *.bbl *.bcf *.blg *.ilg *.toc *.lof *.lot *.idx *.ind *.out *.run.xml

cleanall: clean
	-rm -f *.dvi *.xdv *.ps *.pdf

.PHONY: xelatex clean
