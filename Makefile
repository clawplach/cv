SHELL = /bin/sh

.SUFFIXES:
.SUFFIXES: .tex

COMPILER = xelatex
spellchecker = aspell -t -c
srcdir = $(PWD)
builddir = $(srcdir)/build
directories = $(builddir)

all : $(directories) spellcheck *.pdf

$(directories) :
	@-mkdir -p $@

.PHONY: spellcheck
vpath %.tex sections
spellcheck : *.tex
	$(spellchecker) $<
vpath

%.pdf : %.tex
	$(COMPILER) -output-directory=$(builddir) $<
	# The compiler needs rerun to incorporate PGF/TikZ input
	$(COMPILER) -output-directory=$(builddir) $<

.PHONY: clean
clean :
	@-rm -rf $(builddir)
