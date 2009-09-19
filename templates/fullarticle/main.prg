\def\PROGb{% main.tex:409
\begin{@CPP}%
\NL{1}
\ID{ACTOR}\SP \ID{Edge}\SP \{\SP \KW{public}:\NL{2}
\SP \SP \SP \SP \ID{INTERACTS\_WITH}(\ID{V});\NL{3}
\SP \SP \SP \SP \ID{Edge}(\ID{V}\&\SP \ID{v1},\SP \ID{V}\&\SP \ID{v2});\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE \SP a\SP covariant\SP constructor\ENDNOTE \NL{4}
\SP \SP \SP \SP \KW{void}\SP \ID{set\_first}(\ID{V}*\SP \ID{v});\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE \SP a\SP covariant\SP method\ENDNOTE \NL{5}
\SP \SP \SP \SP \KW{void}\SP \ID{set\_second}(\ID{V}*\SP \ID{v});\SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE \SP another\SP covariant\SP method\ENDNOTE \NL{6}
\SP \SP \SP \SP \ID{V}\&\SP \ID{get\_first}();\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE \SP a\SP method\SP with\SP a\SP covariant\SP return\SP value\ENDNOTE \NL{7}
\SP \SP \SP \SP \NOTE  more definitions \ldots\ENDNOTE \NL{8}
\SP \SP \SP \SP \KW{protected}:\SP \ID{V}\SP *\ID{first},\SP *\ID{second};\SP \SP \NOTE \SP two\SP covariant\SP fields\ENDNOTE \NL{9}
\};\NL{10}
\ID{ACTOR}\SP \ID{Vertex}\SP \{\SP \KW{public}:\NL{11}
\SP \SP \SP \SP \ID{INTERACTS\_WITH}(\ID{E});\NL{12}
\SP \SP \SP \SP \KW{void}\SP \ID{insert\_edge}(\ID{E}\SP *\ID{e});\SP \SP \SP \SP \SP \SP \SP \SP \NOTE \SP a\SP covariant\SP method\ENDNOTE \NL{13}
\SP \SP \SP \SP \KW{void}\SP \ID{delete\_edge}(\ID{E}\SP *\ID{e});\SP \SP \SP \SP \SP \SP \SP \SP \NOTE \SP another\SP covariant\SP method\ENDNOTE \NL{14}
\SP \SP \SP \SP \NOTE  \ldots\ENDNOTE \NL{15}
\SP \SP \SP \SP \KW{protected}:\SP \ID{list}\textless \ID{E}\SP *\textgreater \SP \ID{edges};\SP \SP \SP \SP \NOTE \SP a\SP covariant\SP field\ENDNOTE \NL{16}
\};\NL{17}
\ID{ACTOR}\SP \ID{Graph}\SP \{\SP \KW{public}:\NL{18}
\SP \SP \SP \SP \ID{INTERACTS\_WITH}(\ID{V});\NL{19}
\SP \SP \SP \SP \ID{INTERACTS\_WITH}(\ID{E});\NL{20}
\SP \SP \SP \SP \ID{Graph}(\ID{list}\textless \ID{V}\SP *\textgreater \&\SP \ID{vs},\SP \ID{list}\textless \ID{E}\SP *\textgreater \&\SP \ID{es});\SP \SP \SP \NOTE \SP a\SP doubly\SP covariant\SP constructor\ENDNOTE \NL{21}
\SP \SP \SP \SP \NOTE  \ldots\ENDNOTE \NL{22}
\SP \SP \SP \SP \KW{protected}:\SP \ID{list}\textless \ID{V}\SP *\textgreater \SP \ID{vertices};\SP \ID{list}\textless \ID{E}\SP *\textgreater \SP \ID{edges};\NL{23}
\};\NL{24}
\end{@CPP}%
}%
\def\PROGc{% main.tex:479
\begin{@CPP}%
\NL{1}
\SP \SP \SP \SP \ID{set\_first}(\ID{V}*\SP \ID{v})\NL{2}
\SP \SP \SP \SP \{\NL{3}
\SP \SP \SP \SP \SP \SP \SP \SP \KW{if}\SP (\ID{first}\SP !=\SP 0)\NL{4}
\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \ID{first}{-}\relax \textgreater \ID{delete\_edge}(\ID{this});\NL{5}
\SP \SP \SP \SP \SP \SP \SP \SP \ID{first}\SP =\SP \ID{v};\NL{6}
\SP \SP \SP \SP \SP \SP \SP \SP \ID{v}{-}\relax \textgreater \ID{insert\_edge}(\ID{this})\NL{7}
\SP \SP \SP \SP \}\NL{8}
\end{@CPP}%
}%
\def\PROGd{% main.tex:525
\begin{@CPP}%
\NL{1}
\ID{CONFIGURATION}(\ID{GraphConfig})\NL{2}
\SP \SP \SP \SP \ID{ASSIGN\_ROLE}(\ID{V},\SP \ID{Vertex})\NL{3}
\SP \SP \SP \SP \ID{ASSIGN\_ROLE}(\ID{E},\SP \ID{Edge})\NL{4}
\SP \SP \SP \SP \ID{ASSIGN\_ROLE}(\ID{G},\SP \ID{Graph})\NL{5}
\ID{END\_CONFIGURATION}\NL{6}
\end{@CPP}%
}%
\def\PROGe{% main.tex:550
\begin{@CPP}%
\NL{1}
\ID{GraphConfig}::\ID{V}\SP \ID{v1},\SP \ID{v2},\SP \ID{v3};\NL{2}
\ID{GraphConfig}::\ID{E}\SP \ID{e12}(\ID{v1},\ID{v2}),\SP \ID{e23}(\ID{v2},\SP \ID{v3});\NL{3}
\ID{GraphConfig}::\ID{G}\SP \ID{g}(\ID{CONS}(\&\ID{v1},\ID{CONS}(\&\ID{v2},\SP \&\ID{v3})),\SP \ID{CONS}(\&\ID{e12},\SP \&\ID{e23}));\NL{4}
\end{@CPP}%
}%
\def\PROGf{% main.tex:611
\begin{@CPP}%
\NL{1}
\ID{SPECIALIZED\_ACTOR}(\ID{DEdge},\SP \ID{Edge})\SP \{\SP \KW{public}:\NL{2}
\SP \SP \SP \SP \NOTE  role \cd{V} is inherited\ENDNOTE \NL{3}
\SP \SP \SP \SP \ID{V}*\SP \ID{source}()\SP \KW{const};\SP \ID{V}*\SP \ID{target}()\SP \KW{const};\NL{4}
\SP \SP \SP \SP \NOTE \SP more\SP functionality\ENDNOTE \NL{5}
\SP \SP \SP \SP \KW{protected}:\SP \NOTE \SP \SP new\SP internal\SP staff\ENDNOTE \NL{6}
\};\NL{7}
\ID{SPECIALIZED\_ACTOR}(\ID{DVertex},\SP \ID{Vertex})\SP \{\SP \KW{public}:\NL{8}
\SP \SP \SP \SP \NOTE  role \cd{E} is inherited\ENDNOTE \NL{9}
\SP \SP \SP \SP \NOTE  extend functionality \ldots\ENDNOTE \NL{10}
\SP \SP \SP \SP \KW{protected}:\SP \NOTE \SP new\SP internal\SP staff\ENDNOTE \NL{11}
\};\NL{12}
\ID{SPECIALIZED\_ACTOR}(\ID{DGraph},\SP \ID{Graph})\SP \{\SP \KW{public}:\NL{13}
\SP \SP \SP \SP \NOTE  roles \cd{V} and \cd{E} are inherited\ENDNOTE \NL{14}
\SP \SP \SP \SP \NOTE  new functionality and algorithms\ENDNOTE \NL{15}
\SP \SP \SP \SP \KW{protected}:\SP \NOTE \SP new\SP internal\SP staff\ENDNOTE \NL{16}
\};\NL{17}
\end{@CPP}%
}%
\def\PROGg{% main.tex:672
\begin{@CPP}%
\NL{1}
\ID{CONFIGURATION}(\ID{DGraphConfig})\NL{2}
\SP \SP \SP \SP \ID{ASSIGN\_ROLE}(\ID{V},\SP \ID{DVertex})\NL{3}
\SP \SP \SP \SP \ID{ASSIGN\_ROLE}(\ID{E},\SP \ID{DEdge})\NL{4}
\SP \SP \SP \SP \ID{ASSIGN\_ROLE}(\ID{G},\SP \ID{DGraph})\NL{5}
\ID{END\_CONFIGURATION}\NL{6}
\end{@CPP}%
}%
\def\PROGh{% main.tex:691
\begin{@CPP}%
\NL{1}
\ID{SPECIALIZED\_ACTOR}(\ID{FEdge},\SP \ID{DEdge})\SP \{\SP \KW{public}:\NL{2}
\SP \SP \SP \SP \NOTE  role \cd{V} is inherited\ENDNOTE \NL{3}
\SP \SP \SP \SP \ID{INTERACTS\_WITH}(\ID{F});\NL{4}
\SP \SP \SP \SP \ID{F}*\SP \ID{getFace}()\SP \KW{const}\SP \{\SP \KW{return}\SP \ID{face};\SP \}\NL{5}
\SP \SP \SP \SP \NOTE \SP more\SP functionality\ENDNOTE \NL{6}
\SP \SP \SP \SP \KW{protected}:\SP \SP \ID{F}*\SP \ID{face};\NL{7}
\};\NL{8}
\ID{ACTOR}\SP \ID{Face}\SP \{\SP \KW{public}:\NL{9}
\SP \SP \SP \SP \ID{INTERACTS\_WITH}(\ID{E});\NL{10}
\SP \SP \SP \SP \NOTE  \ldots\ENDNOTE \NL{11}
\SP \SP \SP \SP \KW{protected}:\SP \ID{list}\textless \ID{E}*\textgreater \SP \ID{edges};\NL{12}
\};\NL{13}
\ID{SPECIALIZED\_ACTOR}(\ID{FGraph},\SP \ID{DGraph})\SP \{\SP \KW{public}:\NL{14}
\SP \SP \SP \SP \ID{INTERACTS\_WITH}(\ID{F});\SP \SP \SP \SP \SP \NOTE  roles \cd{V} and \cd{E} are inherited\ENDNOTE \NL{15}
\SP \SP \SP \SP \NOTE  \ldots\ENDNOTE \NL{16}
\SP \SP \SP \SP \KW{protected}:\SP \ID{list}\textless \ID{F}*\textgreater \SP \ID{faces};\NL{17}
\};\NL{18}
\end{@CPP}%
}%
\def\PROGi{% main.tex:723
\begin{@CPP}%
\NL{1}
\ID{CONFIGURATION}(\ID{FGraphConfig})\NL{2}
\SP \SP \SP \SP \ID{ASSIGN\_ROLE}(\ID{V},\SP \ID{DVertex})\NL{3}
\SP \SP \SP \SP \ID{ASSIGN\_ROLE}(\ID{E},\SP \ID{FEdge})\NL{4}
\SP \SP \SP \SP \ID{ASSIGN\_ROLE}(\ID{F},\SP \ID{Face})\NL{5}
\SP \SP \SP \SP \ID{ASSIGN\_ROLE}(\ID{G},\SP \ID{FGraph})\NL{6}
\ID{END\_CONFIGURATION}\NL{7}
\end{@CPP}%
}%
\def\PROGj{% main.tex:766
\begin{@CPP}%
\NL{1}
\ID{ACTOR}\SP \ID{Point}\SP \{\SP \KW{public}:\NL{2}
\SP \SP \SP \SP \ID{INTERACTS\_WITH}(\ID{P});\NL{3}
\SP \SP \SP \SP \ID{SELF\_IS}(\ID{P});\NL{4}
\EMPTYLINE{5}\SP \SP \SP \SP \KW{void}\SP \ID{move}(\KW{int}\SP \ID{dx},\SP \KW{int}\SP \ID{dy})\SP \{\SP \ID{x}\SP +=\SP \ID{dx};\SP \ID{y}\SP +=\SP \ID{dy};\SP \}\NL{6}
\SP \SP \SP \SP \KW{bool}\SP \ID{equal}(\KW{const}\SP \ID{Self}\&\SP \ID{other})\SP \KW{const}\SP \{\SP \KW{return}\SP \ID{x}\SP ==\SP \ID{other}.\ID{x}\SP \&\&\SP \ID{y}\SP ==\SP \ID{other}.\ID{y};\}\NL{7}
\SP \SP \SP \SP \ID{Self}\SP *\ID{neighbor};\SP \NOTE  an auto covariant \kw{public} data member\ENDNOTE \NL{8}
\SP \SP \SP \SP \KW{protected}:\SP \KW{int}\SP \ID{x},\SP \ID{y};\NL{9}
\};\NL{10}
\end{@CPP}%
}%
\def\PROGba{% main.tex:834
\begin{@CPP}%
\NL{1}
\ID{CONFIGURATION}(\ID{PConfig})\NL{2}
\SP \SP \SP \SP \ID{ASSIGN\_ROLE}(\ID{P},\SP \ID{Point})\NL{3}
\ID{END\_CONFIGURATION}\NL{4}
\end{@CPP}%
}%
\def\PROGbb{% main.tex:849
\begin{@CPP}%
\NL{1}
\ID{SPECIALIZED\_ACTOR}(\ID{ColorPoint},\SP \ID{Point})\SP \{\SP \KW{public}:\NL{2}
\SP \SP \SP \SP \ID{SUPER\_IS}(\ID{Point});\SP \NOTE  define the \cd{Super::} name space\ENDNOTE \NL{3}
\SP \SP \SP \SP \NOTE  Role \cd{Self} is inherited\ENDNOTE \NL{4}
\SP \SP \SP \SP \KW{bool}\SP \ID{equal}(\KW{const}\SP \ID{Self}\&\SP \ID{other})\SP \KW{const}\SP \{\NL{5}
\SP \SP \SP \SP \SP \SP \SP \SP \KW{return}\SP \ID{Super}::\ID{equal}(\ID{other})\SP \&\&\SP \ID{color}\SP ==\SP \ID{other}.\ID{color};\}\NL{6}
\SP \SP \SP \SP \NOTE  \kw{public} data member neighbor is inherited, with a covariant change to its type.\ENDNOTE \NL{7}
\SP \SP \SP \SP \KW{protected}:\SP \KW{int}\SP \ID{color};\NL{8}
\};\NL{9}
\end{@CPP}%
}%
\def\PROGbc{% main.tex:870
\begin{@CPP}%
\NL{1}
\KW{class}\SP \ID{X}:\SP \KW{public}\SP \ID{Y}\SP \{\NL{2}
\SP \SP \SP \SP \KW{typedef}\SP \ID{Y}\SP \ID{inherited};\NL{3}
\SP \SP \SP \SP \SP \SP \SP \SP \SP \COMMENT \BSP ...\SP \ENDCOMMENT \SP \}\NL{4}
\}\NL{5}
\end{@CPP}%
}%
\def\PROGbd{% main.tex:893
\begin{@CPP}%
\NL{1}
\ID{CONFIGURATION}(\ID{CPConfig})\NL{2}
\SP \SP \SP \SP \ID{ASSIGN\_ROLE}(\ID{P},\SP \ID{ColorPoint});\NL{3}
\ID{END\_CONFIGURATION}\NL{4}
\end{@CPP}%
}%
\def\PROGbe{% main.tex:919
\begin{@CPP}%
\NL{1}
\KW{typedef}\SP \ID{PConfig}::\ID{P}\SP \ID{point};\NL{2}
\KW{typedef}\SP \ID{CPConfig}::\ID{P}\SP \ID{color\_point};\NL{3}
\EMPTYLINE{4}\ID{point}\SP \ID{p1},\SP \ID{p2};\NL{5}
\ID{color\_point}\SP \ID{cp1},\SP \ID{cp2};\NL{6}
\EMPTYLINE{7}\ID{p1}.\ID{move}(2,3)\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE  call to \Ref{Figure}{Point} definition of \cd{equal}\ENDNOTE \NL{8}
\ID{cp2}.\ID{move}(2,\SP 3);\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE  call to the (actor) inherited method\ENDNOTE \NL{9}
\EMPTYLINE{10}\ID{color\_point}\&\SP \ID{rcp}\SP =\SP \ID{p1};\SP \SP \SP \SP \NOTE  type error! (\cd{color\_point} is not a subtype of \cd{point})\ENDNOTE \NL{11}
\EMPTYLINE{12}\ID{p1}.\ID{equal}(\ID{p2});\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE  call to \Ref{Figure}{Point} definition of \cd{equal}\ENDNOTE \NL{13}
\ID{cp1}.\ID{equal}(\ID{cp2});\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE  call to \Ref{Figure}{ColorPoint} definition of \cd{equal}\ENDNOTE \NL{14}
\ID{p1}.\ID{equal}(\ID{cp1});\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE  type error!\ENDNOTE \NL{15}
\ID{cp1}.\ID{equal}(\ID{p1});\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE  type error!\ENDNOTE \NL{16}
\EMPTYLINE{17}\end{@CPP}%
}%
\def\PROGbf{% main.tex:988
\begin{@CPP}%
\NL{1}
\ID{MATCH\_BOUNDED\_FUNCTION}\NL{2}
\KW{void}\SP \ID{print}(\ID{TYPE}(\ID{Point})\SP \ID{p})\SP \{\NL{3}
\SP \SP \SP \SP \SP \SP \SP \SP \NOTE  \ldots\ENDNOTE \NL{4}
\}\NL{5}
\EMPTYLINE{6}\EMPTYLINE{7}\ID{print}(\ID{p1});\SP \SP \SP \SP \NOTE  print a \cd{point}\ENDNOTE \NL{8}
\ID{print}(\ID{cp1});\SP \SP \SP \NOTE  print a \cd{color\_point}\ENDNOTE \NL{9}
\end{@CPP}%
}%
\def\PROGbg{% main.tex:1057
\begin{@CPP}%
\NL{1}
\SP \SP \SP \SP \ID{p1}.\ID{neighbor}\SP =\SP \&\ID{p2};\NL{2}
\SP \SP \SP \SP \ID{cp1}.\ID{neighbor}\SP =\SP \&\ID{cp2};\NL{3}
\EMPTYLINE{4}\SP \SP \SP \SP \ID{cp1}.\ID{neigbor}\SP =\SP \&\ID{p1};\SP \SP \SP \SP \SP \SP \SP \NOTE  type error! types are \cd{point} are incompatible\ENDNOTE \NL{5}
\SP \SP \SP \SP \ID{p1}.\ID{neighbor}\SP =\SP \&\ID{cp1};\SP \SP \SP \SP \SP \NOTE  type error! even upcasting is not permitted\ENDNOTE \NL{6}
\end{@CPP}%
}%
\def\PROGbh{% main.tex:1090
\begin{@CPP}%
\NL{1}
\SP \SP \SP \SP \KW{template}\SP \textless \KW{typename}\SP \ID{physicianType}\textgreater \NL{2}
\SP \SP \SP \SP \SP \SP \SP \SP \KW{class}\SP \ID{PersonTemplate}\SP \{\SP \KW{public}:\NL{3}
\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \ID{physicianType}\SP \ID{physician};\NL{4}
\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE  \ldots\ENDNOTE \NL{5}
\SP \SP \SP \SP \SP \SP \SP \SP \};\NL{6}
\end{@CPP}%
}%
\def\PROGbi{% main.tex:1098
\begin{@CPP}%
\ID{PersonTemplate}\textless \ID{Doctor}\textgreater \end{@CPP}%
}%
\def\PROGbj{% main.tex:1115
\begin{@CPP}%
\NL{1}
\SP \SP \SP \SP \KW{template}\SP \textless \KW{typename}\SP \ID{patientType}\textgreater \NL{2}
\SP \SP \SP \SP \SP \SP \SP \SP \KW{class}\SP \ID{DoctorTemplate}\SP \{\SP \KW{public}:\NL{3}
\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \ID{list}\textless \ID{patientType}\textgreater \SP \ID{patients};\NL{4}
\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE  \ldots\ENDNOTE \NL{5}
\SP \SP \SP \SP \SP \SP \SP \SP \};\NL{6}
\end{@CPP}%
}%
\def\PROGca{% main.tex:1123
\begin{@CPP}%
\ID{DoctorTemplate}\textless \ID{Person}\textgreater \end{@CPP}%
}%
\def\PROGcb{% main.tex:1124
\begin{@CPP}%
\ID{DoctorTemplate}\textless \ID{Child}\textgreater \end{@CPP}%
}%
\def\PROGcc{% main.tex:1172
\begin{@CPP}%
\NL{1}
\#\ID{define}\SP \ID{CONFIGURATION}(\ID{name})\SP \KW{struct}\SP \ID{name}\SP \{\SP \textbackslash \NL{2}
\SP \SP \SP \SP \KW{typedef}\SP \ID{name}\SP \ID{self};\NL{3}
\EMPTYLINE{4}\#\ID{define}\SP \ID{END\_CONFIGURATION}\SP \};\NL{5}
\EMPTYLINE{6}\#\ID{define}\SP \ID{ASSIGN\_ROLE}(\ID{role},\SP \ID{actor})\SP \textbackslash \NL{7}
\SP \SP \SP \SP \KW{typedef}\SP \ID{actor}\textless \ID{self}\textgreater \SP \ID{role};\NL{8}
\end{@CPP}%
}%
\def\PROGcd{% main.tex:1192
\begin{@CPP}%
\NL{1}
\KW{struct}\SP \ID{GraphConfig}\SP \{\NL{2}
\SP \SP \SP \SP \KW{typedef}\SP \ID{GraphConfig}\SP \ID{self};\NL{3}
\SP \SP \SP \SP \KW{typedef}\SP \ID{Vertex}\textless \ID{self}\textgreater \SP \ID{V};\NL{4}
\SP \SP \SP \SP \KW{typedef}\SP \ID{Edge}\textless \ID{self}\textgreater \SP \ID{E};\NL{5}
\SP \SP \SP \SP \KW{typedef}\SP \ID{Graph}\textless \ID{self}\textgreater \SP \ID{G};\NL{6}
\};\NL{7}
\end{@CPP}%
}%
\def\PROGce{% main.tex:1232
\begin{@CPP}%
\NL{1}
\#\ID{define}\SP \ID{ACTOR}\SP \textbackslash \NL{2}
\SP \SP \SP \SP \KW{template}\SP \textless \KW{typename}\SP \ID{ConfigType}\textgreater \SP \textbackslash \NL{3}
\SP \SP \SP \SP \SP \SP \SP \SP \KW{class}\NL{4}
\EMPTYLINE{5}\#\ID{define}\SP \ID{INTERACTS\_WITH}(\ID{role})\SP \KW{typedef}\SP \KW{typename}\SP \ID{ConfigType}::\ID{role}\SP \ID{role}\NL{6}
\end{@CPP}%
}%
\def\PROGcf{% main.tex:1246
\begin{@CPP}%
\NL{1}
\KW{template}\SP \textless \KW{typename}\SP \ID{ConfigType}\textgreater \NL{2}
\SP \SP \SP \SP \KW{class}\SP \ID{Edge}\SP \{\SP \KW{public}:\NL{3}
\SP \SP \SP \SP \SP \SP \SP \SP \KW{typedef}\SP \KW{typename}\SP \ID{ConfigType}::\ID{V}\SP \ID{V};\NL{4}
\SP \SP \SP \SP \SP \SP \SP \SP \ID{Edge}(\ID{V}\&\SP \ID{v1},\SP \ID{V}\&\SP \ID{v2});\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE \SP a\SP covariant\SP constructor\ENDNOTE \NL{5}
\SP \SP \SP \SP \SP \SP \SP \SP \KW{void}\SP \ID{set\_first}(\ID{V}*\SP \ID{v});\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE \SP a\SP covariant\SP method\ENDNOTE \NL{6}
\SP \SP \SP \SP \SP \SP \SP \SP \KW{void}\SP \ID{set\_second}(\ID{V}*\SP \ID{v});\SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE \SP another\SP covariant\SP method\ENDNOTE \NL{7}
\SP \SP \SP \SP \SP \SP \SP \SP \ID{V}\&\SP \ID{get\_first}();\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE \SP a\SP method\SP with\SP a\SP covariant\SP return\SP value\ENDNOTE \NL{8}
\SP \SP \SP \SP \SP \SP \SP \SP \NOTE  more definitions \ldots\ENDNOTE \NL{9}
\SP \SP \SP \SP \SP \SP \SP \SP \KW{protected}:\SP \ID{V}\SP *\ID{first},\SP *\ID{second};\SP \SP \NOTE \SP two\SP covariant\SP fields\ENDNOTE \NL{10}
\SP \SP \SP \SP \};\NL{11}
\end{@CPP}%
}%
\def\PROGcg{% main.tex:1281
\begin{@CPP}%
\NL{1}
\#\ID{define}\SP \ID{SELF\_IS}(\ID{role})\SP \KW{typedef}\SP \KW{typename}\SP \ID{ConfigType}::\ID{role}\SP \ID{Self}\NL{2}
\#\ID{define}\SP \ID{MY\_ROLE}(\ID{role})\SP \ID{INTERACTS\_WITH}(\ID{role});\SP \ID{SELF\_IS}(\ID{role})\NL{3}
\EMPTYLINE{4}\end{@CPP}%
}%
\def\PROGch{% main.tex:1295
\begin{@CPP}%
\NL{1}
\KW{template}\SP \textless \KW{typename}\SP \ID{ConfigType}\textgreater \SP \textbackslash \NL{2}
\SP \SP \SP \SP \SP \SP \SP \SP \KW{class}\SP \ID{Point}\SP \{\SP \KW{public}:\NL{3}
\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \KW{typedef}\SP \KW{typename}\SP \ID{ConfigType}::\ID{P}\SP \ID{P};\NL{4}
\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \KW{typedef}\SP \KW{typename}\SP \ID{ConfigType}::\ID{P}\SP \ID{Self};\NL{5}
\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \NOTE  \ldots\ENDNOTE \NL{6}
\};\NL{7}
\end{@CPP}%
}%
\def\PROGci{% main.tex:1317
\begin{@CPP}%
\NL{1}
\#\ID{define}\SP \ID{SPECIALIZED\_ACTOR}(\ID{name},\SP \ID{base})\SP \textbackslash \NL{2}
\SP \SP \SP \SP \KW{template}\SP \textless \KW{typename}\SP \ID{ConfigType}\textgreater \SP \textbackslash \NL{3}
\SP \SP \SP \SP \SP \SP \SP \SP \KW{class}\SP \ID{name}:\SP \KW{public}\SP \ID{base}\textless \ID{ConfigType}\textgreater \NL{4}
\EMPTYLINE{5}\#\ID{define}\SP \ID{SUPER\_IS}(\ID{base})\SP \KW{typedef}\SP \ID{base}\textless \ID{ConfigType}\textgreater \SP \ID{Super}\NL{6}
\end{@CPP}%
}%
\def\PROGcj{% main.tex:1331
\begin{@CPP}%
\NL{1}
\KW{template}\SP \textless \KW{typename}\SP \ID{ConfigType}\textgreater \SP \textbackslash \NL{2}
\SP \SP \SP \SP \SP \KW{class}\SP \ID{ColorPoint}:\SP \KW{public}\SP \ID{Point}\textless \ID{ConfigType}\textgreater \SP \{\SP \KW{public}:\NL{3}
\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \KW{typedef}\SP \ID{base}\textless \ID{ConfigType}\textgreater \SP \ID{Super};\NL{4}
\EMPTYLINE{5}\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \KW{bool}\SP \ID{equal}(\KW{const}\SP \ID{Self}\&\SP \ID{other})\SP \KW{const}\SP \{\NL{6}
\SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \SP \KW{return}\SP \ID{Super}::\ID{equal}(\ID{other})\SP \&\&\SP \ID{color}\SP ==\SP \ID{other}.\ID{color};\}\NL{7}
\};\NL{8}
\end{@CPP}%
}%
