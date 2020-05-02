
SRC	=	pins.tex

ifneq ($V,1)
Q ?= @
endif


all:		${SRC}
	$Q echo	Generating DVI
	latex  pins.tex

pins.dvi:	pins.tex
	latex  pins.tex

pdf:	pins.dvi
	dvipdf pins.dvi


.PHONY:	clean
clean:
	$Q rm -f *.dvi *.aux *.log *.ps *.toc *.bak *~
