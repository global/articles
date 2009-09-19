#$Header: /home/cvsroot/abntex/Makefile,v 1.36 2006/09/10 00:25:16 gweber Exp $
#
#expande a versão deste pacote
export VERSION=0.9
export RELEASE=beta2

#altere a linha abaixo se o seu tetex não puder se detetado
#pelo comando kpsewich, na dúvida faça um "make test"
#TEXDIR= /tmp/test
export TEXDIR= ${shell kpsewhich --expand-path='$$TEXMFMAIN'}

export USRLOCAL=/usr/local/bin

#Do "man lyx":
#The system directory is determined by  searching  for  the
#       file  "chkconfig.ltx".
export LYXDIR=${dir ${shell  find /usr/share/lyx -name chkconfig.ltx}}

#diretório corrente onde se expandiu o cvs do abntex
export ABNTEXDIR=$(notdir $(shell pwd))

#diretório para onde vai a documentação compilada
export CDOCDIR=$(shell pwd)/compiled.docs

#diretório para onde estão as contribuições
export CONTRIBDIR=$(shell pwd)/contrib

#diretório onde se encontram os arquivos da homepage
export HPDIR =pagina

#email da pessoa que envia os arquivos pro codigolivre
#edite se precisar
export SUBMITTER=$(shell logname)@$(shell hostname)

#opções para comandos comuns:
export OPS = --symbolic
export OPSF= --symbolic --force
export OPVR= --verbose --recursive
export OPRF= --recursive --force
export OPVF= --verbose --force
#opções comuns para tar
export OPTAR= --owner=0 --group=0 -zchv

homepage-%:
	${MAKE} -C ${HPDIR} $*

contrib-%:
	${MAKE} -C ${CONTRIBDIR} -f ../admin/contrib.mk $*

doc-%:
	${MAKE} -C admin -f documentation.mk $*

#expande o nome do arquivo
export FILE=	$(basename $(notdir $<))

#expande o comando de mudança de diretório
export CDDIR=  cd $(dir $<);

#arquivos dos pacotes
export ABNTEX=abntex-${VERSION}-${RELEASE}
export ABNTEXDOC=${subst abntex,abntex-doc,${ABNTEX}}
export ABNTEXLYX=${subst abntex,abntex-lyx,${ABNTEX}}
export ABNTEXTGZ=${ABNTEX}.tar.gz
export ABNTEXSRCRPM=${ABNTEX}.src.rpm
export ABNTEXRPM=${ABNTEX}.noarch.rpm
export ABNTEXZIP=${ABNTEX}.zip
export ABNTEXDOCTGZ=${ABNTEXDOC}.tar.gz
export ABNTEXDOCRPM=${ABNTEXDOC}.noarch.rpm
export ABNTEXDOCZIP=${ABNTEXDOC}.zip
export ABNTEXLYXRPM=${ABNTEXLYX}.noarch.rpm


#diretórios padrão do rpm (Conectiva)
export RPMS=/usr/src/rpm/RPMS/noarch
export SRPMS=/usr/src/rpm/SRPMS
export SOURCES=/usr/src/rpm/SOURCES
export BUILD=/usr/src/rpm/BUILD

#diretórios padrão do rpm (SuSE)
export RPMS=/usr/src/packages/RPMS/noarch
export SRPMS=/usr/src/packages/SRPMS
export SOURCES=/usr/src/packages/SOURCES
export BUILD=/usr/src/packages/BUILD
export TEMPDIR=/tmp

#diretório para geração de pacotes
export PACKDIR=abntex-${VERSION}

all: doc

doc: doc-all

#O empacotamento para Linux

export PACKLIST= ${PACKDIR}/Makefile ${PACKDIR}/abntex.spec\
	  ${PACKDIR}/*.lst \
	  ${PACKDIR}/LEIAME ${PACKDIR}/LEIAME.make ${PACKDIR}/LEIAME.linux \
	  ${PACKDIR}/LEIAME.administracao \
	  ${PACKDIR}/texmf ${PACKDIR}/bin ${PACKDIR}/lyx ${PACKDIR}/admin

export DOCLIST = ${PACKDIR}/$(notdir ${CDOCDIR})

#principal pacote que contém os programas fontes do abnTeX
linux-tgz:
	sed "s/ABNTEXVERSION/${VERSION}/;s/ABNTEXRELEASE/${RELEASE}/" admin/abntex.spec > abntex.spec;\
	cd ..; \
	ln ${OPSF} ${ABNTEXDIR} ${PACKDIR}; \
	rm ${OPVR} ${ABNTEXTGZ};\
	tar ${OPTAR}  --exclude-from ${ABNTEXDIR}/exc.lst -f ${ABNTEXTGZ} ${PACKLIST};\
	rm ${PACKDIR}

#pacote opcional com a documentação precompilada em dvi, pdf, ps
linux-doc-tgz: doc
	cd ..; \
	ln ${OPSF} ${ABNTEXDIR} ${PACKDIR}; \
	rm ${OPVR} ${ABNTEXDOCTGZ};\
	tar ${OPTAR} -f ${ABNTEXDOCTGZ} ${DOCLIST};\
	rm ${PACKDIR}

#install e uninstall específico para tetex localizado em ${TEXDIR}
install-tex:
	cp ${OPVR} --preserve texmf/* ${TEXDIR}

install-lyx:
ifneq (${LYXDIR},)
	cp ${OPVR} --preserve lyx/* ${LYXDIR}
endif

install-bin:
	cp ${OPVR} --preserve bin/* ${USRLOCAL}

post-install:
	texhash

install: install-tex install-bin install-lyx

#instalação mínima a partir de um diretório cvs/abntex útil para testes
#não inclui documentação
install-from-cvs:
	cp ${OPVR} --parents texmf/bibtex/*/abntex/*.b* $(TEXDIR)/..
	cp ${OPVR} --parents texmf/tex/latex/abntex/*.cls $(TEXDIR)/..
	cp ${OPVR} --parents texmf/tex/latex/abntex/*.sty $(TEXDIR)/..
	texhash

uninstall-tex:
	rm ${OPRF} ${TEXDIR}/doc/latex/abntex;\
	rm ${OPRF} ${TEXDIR}/doc/bibtex/abntex
	rm ${OPRF} ${TEXDIR}/bibtex/bst/abntex;\
	rm ${OPRF} ${TEXDIR}/bibtex/bib/abntex;\
	rm ${OPRF} ${TEXDIR}/tex/latex/abntex;\

uninstall-lyx:
ifneq (${LYXDIR},)
	rm ${OPRF} ${LYXDIR}abnt.layout;
endif

uninstall-bin:
	rm ${OPRF} ${USRLOCAL}/geratss

uninstall: uninstall-tex uninstall-lyx uninstall-bin
	texhash

#verifica se todos os pacotes necessários existem no seu sistema
check-rpm-install:
	rpm -q cvs
	rpm -q rpm-build
	rpm -q lyx

#para montar pacotes tipo rpm será melhor você ser root.
noarch-rpm:
	if test "$(shell whoami)" == "root" ; then \
        cp --backup=numbered ../${ABNTEXTGZ} ${SOURCES}; \
	rpmbuild -ta --target=noarch --clean ${SOURCES}/${ABNTEXTGZ};\
	else\
	echo "you should be root to do this";\
	fi

windows-zip:
	cd ../; \
	rm ${OPVF} ${ABNTEXZIP};\
	ln ${OPSF} ${ABNTEXDIR} ${PACKDIR}; \
	zip -r ${ABNTEXZIP} ${PACKDIR} -x@${ABNTEXDIR}/zipexcl.lst;\
	rm ${PACKDIR}

windows-doc-zip: doc
	cd ../; \
	rm ${OPVF} ${ABNTEXDOCZIP};\
	ln ${OPSF} ${ABNTEXDIR} ${PACKDIR}; \
	zip -r ${ABNTEXDOCZIP} ${PACKDIR}/compiled.docs;\
	rm ${PACKDIR}

new-release: doc linux-tgz linux-doc-tgz windows-zip windows-doc-zip noarch-rpm

new-contrib: contrib-tgz contrib-zip

upload:
	echo "open upload.codigolivre.org.br" > upload.ftp;\
	echo "user anonymous ${SUBMITTER}" >> upload.ftp;\
	echo "cd incoming" >> upload.ftp;\
	echo "passive" >> upload.ftp;\
	echo "put ../${ABNTEXTGZ} ${ABNTEXTGZ}" >> upload.ftp;\
	echo "put ../${ABNTEXDOCTGZ} ${ABNTEXDOCTGZ}" >> upload.ftp;\
	echo "put ../${ABNTEXZIP} ${ABNTEXZIP}" >> upload.ftp;\
	echo "put ../${ABNTEXDOCZIP} ${ABNTEXDOCZIP}" >> upload.ftp;\
	echo "put ${SRPMS}/${ABNTEXSRCRPM} ${ABNTEXSRCRPM}" >> upload.ftp;\
	echo "put ${RPMS}/${ABNTEXRPM} ${ABNTEXRPM}" >> upload.ftp;\
	echo "put ${RPMS}/${ABNTEXDOCRPM} ${ABNTEXDOCRPM}" >> upload.ftp;\
	echo "put ${RPMS}/${ABNTEXLYXRPM} ${ABNTEXLYXRPM}" >> upload.ftp;\
	echo "quit" >> upload.ftp
	ftp -v -n < upload.ftp
	rm upload.ftp

test:
	echo "diretório corrente:" ${ABNTEXDIR}
	echo "caminho para o tetex:" ${TEXDIR}
	echo "caminho para o LyX:" ${LYXDIR}
	echo "${LATEXDOCS}"

