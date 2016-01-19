# Define compilation programs:
#
TEX = pdflatex
BIB = bibtex
#
# Base name of the document:
#
DOCUMENT = TM16
#
# All tex files used:
#
DEPENDENCIES=*.tex
#
# This line helps prevent make from getting confused in the case where you
# have a file named 'clean'.
#
.PHONY: clean
#
# Generic instruction for compiling tex files.
#
%.pdf: %.tex
	$(TEX) -halt-on-error $<
	$(TEX) -halt-on-error $<
#
# Main instructions, including dependencies:
#
main.pdf: $(DOCUMENT).tex $(DEPENDENCIES)
	$(TEX) -halt-on-error $(DOCUMENT).tex
	$(TEX) -halt-on-error $(DOCUMENT).tex
	$(BIB) $(DOCUMENT)
	$(TEX) -halt-on-error $(DOCUMENT).tex
	$(TEX) -halt-on-error $(DOCUMENT).tex
#
# This will compile the document
#
all: clean $(DOCUMENT).pdf
#
# GNU make pre-defines $(RM).  The - in front of $(RM) causes make to
# ignore any errors produced by $(RM).
#
clean:
	- $(RM) -f *.aux *.toc *.out *.log *.bbl *.blg *.wrt *~
	- $(RM) -f */*.aux */*.toc */*.out */*.log */*.bbl */*.blg */*.wrt *~
#
vclean:	clean
	- $(RM) $(DOCUMENT).pdf
