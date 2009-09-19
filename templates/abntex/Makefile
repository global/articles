
FILES=abntex

all: $(FILES).tex
	pdflatex $(FILES).tex
	bibtex $(FILES)
	pdflatex $(FILES).tex
	pdflatex $(FILES).tex

clean:
	rm -f *.log *.dvi $(FILES).pdf *.nav *.out *.snm *.toc *.aux $(FILES).ps *bbl *blg
