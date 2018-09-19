# Makefile for generating presentation $(TARGET).pdf from $(TARGET).tex

TARGET = $(shell ls *.tex | cut -f 1 -d ".")

#figuras
FIG = $(shell find . -name "*.fig")
DIA = $(shell find . -name "*.dia")
FIGPDF = $(FIG:.fig=.pdf) $(DIA:.dia=.pdf)

LATEX=pdflatex
#TEXINPUTS=../../comum/pp4:$TEXINPUTS

PUBLIC_HTML = /home/fabricio/public_html/ia/slides

all: $(TARGET).ps

$(TARGET).pdf: $(TARGET)-tmp.pdf
	java -classpath ../../comum/pp4/pp4p.jar de.tu_darmstadt.sp.pp4.PPower4 $(TARGET)-tmp.pdf $(TARGET).pdf

$(TARGET)-tmp.pdf: $(TARGET).tex  $(FIGPDF) $(TARGET).bbl jomislides.cls
	$(LATEX) $(TARGET).tex
	mv $(TARGET).pdf $(TARGET)-tmp.pdf

%.eps: %.dia
	dia -e $@ $(@:.eps=.dia) 2> /dev/null

%.eps: %.fig
	fig2dev -L eps $(@:.eps=.fig) $@

%.pdf: %.eps
	epstopdf $(@:.pdf=.eps) > $@


$(TARGET).bbl:
	make bib

bib:
	@if ( grep "\\\\bibliography{" $(TARGET).tex > /dev/null ); then \
		$(LATEX) $(TARGET).tex; \
		bibtex $(TARGET); \
		$(LATEX) $(TARGET).tex; \
	else \
		touch $(TARGET).bbl; \
	fi


$(TARGET).ps:
	@touch .handsout
	@rm $(TARGET)-tmp.pdf || true
	make $(TARGET).pdf
	acroread -toPostScript $(TARGET).pdf
	@rm .handsout 2> /dev/null || true
	@rm $(TARGET).pdf 2> /dev/null
	@rm $(TARGET)-tmp.pdf || true
	$(LATEX) $(TARGET).tex
	$(LATEX) $(TARGET).tex
	mv $(TARGET).pdf $(TARGET)-tmp.pdf
	make $(TARGET).pdf
#	pdftops $(TARGET).pdf $(TARGET).ps
#	dvips $(TARGET) -o
#	gv -seascape $(TARGET).ps
#	pdftops $(TARGET).pdf $(TARGET).ps

#$(TARGET).pdf: $(TARGET).dvi
#	dvipdfm $(TARGET)
#	acroread $(TARGET).pdf


handsout: $(TARGET).ps
	mpage -4 -R -o $(TARGET).ps > $(TARGET)-4x1.ps
	ps2pdf $(TARGET)-4x1.ps $(TARGET)-4x1.pdf

view: $(TARGET).pdf
#	xdvi -paper a4r -s 4 $(TARGET)
	acroread $(TARGET).pdf

publicaPDF:
	make handsout
	cp $(TARGET)-4x1.pdf $(PUBLIC_HTML)
	cp $(TARGET).pdf $(PUBLIC_HTML)
	make clean

clean:
	@rm .handsout 2> /dev/null || true
	@rm -rf auto 2> /dev/null || true
	@rm *~ 2> /dev/null || true
	@rm *.bak 2> /dev/null || true
	@rm $(TARGET).dvi  2> /dev/null || true
	@rm $(TARGET)-4x1.*  2> /dev/null || true
	@rm $(TARGET).ps  2> /dev/null || true
	@rm -f $(TARGET)-tmp.pdf *.log \
            *.aux *.bbl *.blg *.out  2> /dev/null || true

