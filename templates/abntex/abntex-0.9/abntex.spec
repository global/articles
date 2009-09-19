# $Header: /home/cvsroot/abntex/admin/abntex.spec,v 1.6 2006/09/10 00:32:03 gweber Exp $
%define VERSION 0.9
%define rel beta2
%define texdir /usr/share/texmf
%define lyxdir /usr/share/lyx
%define bindir /usr/local/bin
Summary: LaTeX macros for writing documents following the ABNT norms.
Summary(pt_BR): Macros para LaTeX que implementam normas da ABNT.
Name: abntex
Version: %VERSION
Release: %rel
License: LPPL
Group: TeX
URL: http://abntex.codigolivre.org.br
Source: abntex-%{version}-%{rel}.tar.gz
Requires: tetex
%if %suse_version > 800
BuildRequires: tetex, te_latex, lyx
%endif
%description
With the abnTeX macros you will be able to write LaTeX
documents which conform to several norms from ABNT
(Brazilian Association for Technical Norms). In addition there
are macros for writing automated lists of abbreviations and
symbols and a style for writing patent applications for INPI.
You can also use these style with LyX.

%description -l pt_BR
As macros abnTeX possibilitam escrever documentos latex
em conformidade com as diversas normas da ABNT (Associação
Brasileira de Normas Técnicas). Além disso estão incluídas
macros para a confeção automatizada de listas de abreviaturas
e símbolos e um estilo para escrever requerimentos de patentes
para o INPI. Você também pode usar esses estilos com LyX.


%package doc
Summary: Precomipled (dvi, ps, pdf) documentation for the abnTeX macro package.
Summary(pt_BR): Documentação precompilada (dvi, ps, pdf) para o pacote de macros abnTeX.
Group: TeX

%description doc
Ready-to-use precompiled dvi, pdf, ps documentation of the abnTeX package.

%description doc -l pt_BR
Documentação em dvi, pdf, ps precompilado pronto para uso
do pacote abnTeX.

%package lyx
Requires: abntex >= %version, lyx >= 1.1
Summary: abnTeX layout styles for the use with LyX.
Summary(pt_BR): Estilos abnTeX para uso com LyX.
Group: Editors

%description lyx
abnTeX layout styles for the use with LyX.

%description lyx -l pt_BR
Estilos abnTeX para uso com LyX.

%changelog
* Sat Sep 9 2006 Gerald Weber <gweber@codigolivre.org.br>
abnt.cls
- Corrigido erro de digitação reportado nos bugs 200450 e 200451

tabela-simbolos.sty
- Corrigido erro na definição de \Bsymboltable, bug 200435
- inicializado o contador Ocorrencias em 1000, bug 200435

tabela-simbolos-doc.tex
- Removido \usepackage{html}

%changelog
* Fri May 30 2003 Gerald Weber <gweber@codigolivre.org.br>
Corrigido o bug 137.

* Tue Mar 19 2003 Gerald Weber <gweber@codigolivre.org.br>
Adicionado o pacote lyx.

%changelog
* Tue Nov 27 2002 Gerald Weber <gweber@codigolivre.org.br>
Correção de bug na classe abnt.cls.

* Tue Nov 19 2002 Gerald Weber <gweber@codigolivre.org.br>
First release as rpm package.

%prep
rm -rf $RPM_BUILD_DIR/%{name}-%{version}
%setup
%build
make doc

%install
make install

%post
texhash

%files
%defattr(-, root, root)
%doc LEIAME LEIAME.linux LEIAME.make LEIAME.administracao
%{texdir}/bibtex/bib/abntex
%{texdir}/bibtex/bst/abntex
%{texdir}/doc/bibtex/abntex
%{texdir}/doc/latex/abntex
%{texdir}/makeindex/abntex
%{texdir}/tex/latex/abntex
%{bindir}/geratss

%files doc
%defattr(-, root, root)
%doc compiled.docs/*

%files lyx
%defattr(-, root, root)
%{lyxdir}/layouts/abnt.layout


%postun
texhash
