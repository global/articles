#$Header: /home/cvsroot/abntex/admin/documentation.mk,v 1.1 2005/12/21 16:22:44 gweber Exp $
#tetex standard directories
export TEXINPUTS=../texmf/tex/latex//:
export BIBINPUTS=../texmf/bibtex/bib//:
export BSTINPUTS=../texmf/bibtex/bst//:
export INDEXSTYLE=../texmf/makeindex/abntex//:

export SOURCEDOC=../texmf/doc

#diretório para onde vai a documentação compilada
export CDOCDIR=../compiled.docs


export LATEXDOCDIR=${SOURCEDOC}/latex/abntex
export BIBTEXDOCDIR=${SOURCEDOC}/bibtex/abntex

#script para gerar tabela de símbolos
export GERATSS=../bin/geratss


export LATEXSDOCS=${wildcard ${LATEXDOCDIR}/abnt*.tex} ${wildcard ${LATEXDOCDIR}/tab*.tex}

export BIBTEXSDOCS=${wildcard ${BIBTEXDOCDIR}/*.tex}

export LATEXDOCS=${subst ${LATEXDOCDIR},${CDOCDIR},${LATEXSDOCS}}

export BIBTEXDOCS=${subst ${BIBTEXDOCDIR},${CDOCDIR},${BIBTEXSDOCS}}

export ALLSDOCS=${BIBTEXSDOCS} ${LATEXSDOCS}
export ALLDOCS=${BIBTEXDOCS} ${LATEXDOCS}

export DVIDOCS=${ALLDOCS:.tex=.dvi}
export PDFDOCS=${ALLDOCS:.tex=.pdf}
export PSGZDOCS=${ALLDOCS:.tex=.ps.gz}

#aqui nos alteramos a variavel TEX da regra implicita %.dvi:%.tex
#para as particularidades de cada documento
${CDOCDIR}/abnt-bibtex-doc.dvi: TEX=${LBLBLL}
${CDOCDIR}/abnt-bibtex-doc.pdf: TEX=${LBLBLL}
${CDOCDIR}/abnt-bibtex-alf-doc.dvi: TEX=${LBLL}
${CDOCDIR}/abnt-bibtex-alf-doc.pdf: TEX=${LBLL}
${CDOCDIR}/abnt-classe-doc.dvi: TEX=${LBLL}
${CDOCDIR}/abnt-classe-doc.pdf: TEX=${LBLL}
${CDOCDIR}/tabela-simbolos-doc.dvi: TEX=${LTBLL}
${CDOCDIR}/tabela-simbolos-doc.pdf: TEX=${LTBLL}
${CDOCDIR}/inpi-ex.dvi: TEX=${LLL}

#expande o nome do arquivo
export FILE=	$(basename $(notdir $<))

#expande o comando de mudanca de diretorio
export CDDIR=  cd $(dir $<);

#opções para comandos comuns:
export OPS = --symbolic
export OPSF= --symbolic --force
export OPVR= --verbose --recursive
export OPRF= --recursive --force
export OPVF= --verbose --force

#arquivos dos pacotes
export ABNTEXDOC=${subst abntex,abntex-doc,${ABNTEX}}
export ABNTEXDOCTGZ=${ABNTEXDOC}.tgz
export ABNTEXDOCZIP=${ABNTEXDOC}.zip
export ABNTEXDOCRPM=${ABNTEXDOC}.noarch.rpm

export LATEX=latex

#roda latex e bibtex de modo a resolver todas as referencias
export LBLBLL= cd ${CDOCDIR}; ${LATEX} ${FILE};\
	bibtex ${FILE}; ${LATEX} ${FILE}; \
	bibtex ${FILE}; ${LATEX} ${FILE}; ${LATEX} ${FILE}; ls

#documento com bibliografia simples
export LBLL= cd ${CDOCDIR}; ${LATEX} ${FILE};\
	bibtex ${FILE}; ${LATEX} ${FILE}; ${LATEX} ${FILE}; ls

#documento com bibliografia e lista de tabelas
export LTBLL= cd ${CDOCDIR}; ${LATEX} ${FILE};\
	${GERATSS} ${FILE}; bibtex ${FILE};\
	${LATEX} ${FILE}; ${LATEX} ${FILE}; ls

#documento simples
export LLL= cd ${CDOCDIR}; ${LATEX} ${FILE}; ${LATEX} ${FILE}; ${LATEX} ${FILE}

${CDOCDIR}:
	mkdir ${CDOCDIR}

${BIBTEXDOCS}: ${CDOCDIR}
	cp ${OPF} ${BIBTEXDOCDIR}/$(notdir $@) $@

${LATEXDOCS}: ${CDOCDIR}
	ln ${OPSF} ${LATEXDOCDIR}/$(notdir $@) $@

#dependencia entre dvi<->ps
%.ps: %.dvi
	cd ${CDOCDIR}; \
	dvips -t a4 -o ${FILE}.ps ${FILE}

#compressao do arquivo ps
%.ps.gz: %.ps
	cd ${CDOCDIR}; gzip --force $<

#dependencia entre pdf<->tex
%.pdf: %.tex
	$(subst latex,pdflatex,${TEX})$

#doc-clean remove arquivos intermediarios desnecessarios (exceto *.dvi)
#em compiled.docs
clean:
	cd ${CDOCDIR};\
	rm ${OPVF} *.log *.blg *.bbl *.aux *.toc *.idx *.los *.lot *.out *.ilg\
	*.sigla* *.symbols*

#com clean somente os arquivos fonte sobram
remove:
	rm ${OPRF} ${CDOCDIR}

remove-links:
	cd ${CDOCDIR};\
	rm ${OPVF} *.tex


#cria links dos fontes da documentacao para a criacao de
#documenta�o compilada no diret�io CDOCDIR
links: ${ALLDOCS}

dvi: ${DVIDOCS}

pdf: ${PDFDOCS}

ps: ${PSGZDOCS}

all: dvi ps pdf clean remove-links

test:
	echo "TEXINPUTS:"${TEXINPUTS}
	echo "BIBINPUTS:"${BIBINPUTS}
	echo "GERATSS:"${GERATSS}
