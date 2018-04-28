% !TEX root = thesis.tex

% ILLC Disseration style.
%
% Author: Marco Vervoort
% Based on a Latex 2.09 style file by Maarten de Rijke,
% and the Book document class for Latex 2e.
% Code for chapter heads by Martin Stokhof.
% Code for optional arguments to theorem-like environments, and for part-headers in the same style as chapter-headers, by Julian Schloder
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{illcdiss}[2001/07/18 ILLC Dissertation Style]
\newcommand{\@mult}{1.2}
\newcommand{\@typesizeopt}{12pt}
\DeclareOption{10pt}{%
   \renewcommand{\@mult}{1}
   \renewcommand{\@typesizeopt}{10pt}
}
\DeclareOption{11pt}{%
   \renewcommand{\@mult}{1.1}
   \renewcommand{\@typesizeopt}{11pt}
}
\DeclareOption{12pt}{%
   \renewcommand{\@mult}{1.2}
   \renewcommand{\@typesizeopt}{12pt}
}
\DeclareOption{openbib}{%  To provide backwards compatibility with versions
   \AtEndOfPackage{%       of the book class that do not use @openbib@code
      \renewcommand\@openbib@code{%
         \addtolength{\leftmargin}{\bibindent}
         \setlength{\itemindent}{-\bibindent}
         \setlength{\listparindent}{\itemindent}
         \setlength{\parsep}{\z@}
      }
      \renewcommand\newblock{\par}
   }
   \PassOptionsToClass{\CurrentOption}{book}
}
\newcommand{\@papersizeopt}{a4paper}
\DeclareOption{a4paper}{\renewcommand{\@papersizeopt}{a4paper}}
\DeclareOption{a5paper}{\renewcommand{\@papersizeopt}{a5paper}}
\DeclareOption{b5paper}{\renewcommand{\@papersizeopt}{b5paper}}
\DeclareOption{letterpaper}{\renewcommand{\@papersizeopt}{letterpaper}}
\DeclareOption{legalpaper}{\renewcommand{\@papersizeopt}{legalpaper}}
\DeclareOption{executivepaper}{\renewcommand{\@papersizeopt}{executivepaper}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[\@papersizeopt,\@typesizeopt]{book}
\RequirePackage{graphicx}
\RequirePackage{latexsym}
%
%       To provide backwards compatibility with versions of the book class that
%       do not define \@openbib@code, \newblock, \paperwidth or \paperheight:
%
\providecommand{\@openbib@code}{}
\providecommand{\newblock}{\hskip .11em\@plus.33em\@minus.07em}
\providecommand{\paperwidth}{\pagewidth}
\providecommand{\paperheight}{\pageheight}
%
%   New values for some lengths, proportional to fontsize
%
\newcommand{\setmlength}[3]{\setlength{#1}{#3}\setlength{#1}{#2#1}}
\setmlength{\textheight}{\@mult}{0.613\paperheight}%18.2cm for a4paper
\setmlength{\textwidth}{\@mult}{0.576\paperwidth}%12.1cm for a4paper
\setmlength{\headheight}{\@mult}{12pt}
\setmlength{\headsep}{\@mult}{18pt}
\setmlength{\topskip}{\@mult}{10pt}
\setmlength{\footskip}{\@mult}{25pt}

\setlength{\topmargin}{0.5\paperheight}
\addtolength{\topmargin}{-0.5\textheight}
\addtolength{\topmargin}{-0.5\headheight}
\addtolength{\topmargin}{-0.5\headsep}
\addtolength{\topmargin}{-0.5\footskip}
\addtolength{\topmargin}{-1in}
\setlength{\oddsidemargin}{0.5\paperwidth}
\addtolength{\oddsidemargin}{-0.5\textwidth}
\addtolength{\oddsidemargin}{-1in}
\setlength{\evensidemargin}{\oddsidemargin}
%
%   Chapterheads: chapternr, horizontal line, chaptertitle
%       Vertical spaces are proportional to fontsize
%       Note that, as opposed to in book.cls, here the definition
%       of \@makechapterhead does _not_ end with a \nobreak command
%       but with a \mbox{}, since we'd rather not have the chapter
%       head move to the next page even if that would result in
%       the chapter head being the _only_ thing on the page.
%
\newlength{\@spacebeforechapterhead}
\setmlength{\@spacebeforechapterhead}{\@mult}{15pt}
\newlength{\@spaceinchapterhead}
\setmlength{\@spaceinchapterhead}{\@mult}{3.5pt}
\newlength{\@spaceafterchapterhead}
\setmlength{\@spaceafterchapterhead}{\@mult}{80pt}

\renewcommand{\@makechapterhead}[1]{{%
   \vspace*{\@spacebeforechapterhead}%
   \parindent 0pt \Large\bfseries
   \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
         \@chapapp\enspace\thechapter
      \fi
   \fi
   \interlinepenalty\@M
   \vspace*{\@spaceinchapterhead}%
   \hrule
   \vspace*{\@spaceinchapterhead}%
   {\hfill \LARGE \bfseries #1}%
   \mbox{}\par
   \mbox{}\par
   \mbox{}\par
   \mbox{}\par
   \mbox{}\par
   \mbox{}\par
%   \vspace*{\@spaceafterchapterhead}\vspace{\stretch{0.01}\par\mbox{}\par
}}

\renewcommand{\@makeschapterhead}[1]{{%
   \vspace*{\@spacebeforechapterhead}%
   \parindent 0pt \Large\bfseries
   \phantom{\@chapapp}%
   \interlinepenalty\@M
   \vspace*{\@spaceinchapterhead}%
   \hrule
   \vspace*{\@spaceinchapterhead}%
   {\hfill \LARGE \bfseries #1}%
   \mbox{}\par
   \mbox{}\par
   \mbox{}\par
   \mbox{}\par
   \mbox{}\par
   \mbox{}\par
% Note: the above works better when there is little text on the first
% page of the chapter
%   \vspace*{\@spaceafterchapterhead}\vspace{\stretch{0.01}}\par\mbox{}\par
}}

%% Part Header and ToC

%% convert numbers to words; a hack, but whose dissertation has more than 5 parts?
\newcommand{\@numtoword}[1]{
\ifnum\numexpr#1=1\relax One%
\else\ifnum\numexpr#1=2\relax Two%
\else\ifnum\numexpr#1=3\relax Three%
\else\ifnum\numexpr#1=4\relax Four%
\else\ifnum\numexpr#1=5\relax Five%
\else #1%
\fi\fi\fi\fi\fi
}

%redefines part number to be a word
\renewcommand\thepart{\@numtoword{\arabic{part}}}

%this is literally as from the book class, but removes the vertical centering
\renewcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{empty}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \secdef\@part\@spart}

% redefines ToC entry and Parthead to contain ``Part [Number]''
% aligns Parthead with the ILLC horizontal bar style
\def\@part[#1]#2{%
\ifnum \c@secnumdepth >-2\relax
  \refstepcounter{part}%
  \addcontentsline{toc}{part}{Part\thepart: #1}
\else
  \addcontentsline{toc}{part}{\hspace*{\fill} #1\hspace*{\fill}}%
\fi
\markboth{}{}%
{\centering
    \interlinepenalty\@M
    \vspace*{25pt}%
    \ifnum \c@secnumdepth >-2\relax
        {\Large\bfseries Part\thepart}
    \fi
    \vspace*{7.5pt}%
    \hrule
    \vspace*{3.5pt}%
 \LARGE \bfseries #2\strut\par
}%
}

% version for part* (no number, used for appendix as \part*{Appendix})
\def\@spart#1{%
  \addtocontents{toc}{\protect\contentsline{part}{\hspace*{\fill}\hspace*{1em}#1\hspace*{\fill}}{\relax}{chapter}}
\markboth{}{}%
{\centering
    \interlinepenalty\@M
    \vspace*{25pt}%
    \phantom{\Large\bfseries Part}
    \vspace*{7.5pt}%
    \hrule
    \vspace*{3.5pt}%
 \LARGE \bfseries #1\strut\par
}%
}

% Redefines the ToC style for part entries; centred, no page number

\renewcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.00em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
       \centering
        \large \bfseries\parindent\z@ #1\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}

  %\addtocontents{toc}{\protect\contentsline{part}{\hspace*{\fill}\hspace*{2em}Part\thepart: #1\hspace*{\fill}}{\relax}{chapter}}

%
%   No pagenumber or headers on skipped pages with cleardoublepage
%
\renewcommand{\cleardoublepage}{%
   \clearpage\if@twoside \ifodd\c@page\else
   \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi
}
%
%   Theorems: {\bf number.} {\sc type.} {\rm description} \it contents
%
\def\@begintheorem#1#2{%
   \trivlist% changing this in '\begin{trivlist}' yields an error
   \item[\hspace{\labelsep}{\upshape\bfseries #2.}\ {\scshape #1.}]%
   \itshape
}

\renewcommand{\@opargbegintheorem}[3]{%
   \trivlist% changing this in `\begin{trivlist}' yields an error
   \item[\hspace{\labelsep}{\upshape\bfseries #2.}\ {\scshape #1}\ {\upshape (#3)}.]%
   \itshape
}
%
%   Chapters, sections and other environments are redefined here to no
%       longer cause uppercased headings. Headings are italized instead of
%       slanted. The bibliography and index appear in the table of contents.
%
\if@twoside
   \renewcommand{\ps@headings}{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\itshape\leftmark}%
      \def\@oddhead{{\itshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
      \def\chaptermark##1{\markboth{%
         \ifnum \c@secnumdepth >\m@ne
            \if@mainmatter \@chapapp\ \thechapter. \ \fi
         \fi
         ##1}{}}%
      \def\sectionmark##1{\markright{%
         \ifnum \c@secnumdepth >\z@ \thesection. \ \fi
         ##1}}%
   }
\else
   \renewcommand{\ps@headings}{%
      \let\@oddfoot\@empty
      \def\@oddhead{{\itshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
      \def\chaptermark##1{\markright{%
         \ifnum \c@secnumdepth >\m@ne
            \if@mainmatter \@chapapp\ \thechapter. \ \fi
         \fi
         ##1}}
   }
\fi

\renewcommand{\ps@myheadings}{%
   \let\@oddfoot\@empty\let\@evenfoot\@empty
   \def\@evenhead{\thepage\hfil\itshape\leftmark}%
   \def\@oddhead{{\itshape\rightmark}\hfil\thepage}%
   \let\@mkboth\@gobbletwo
   \let\chaptermark\@gobble
   \let\sectionmark\@gobble
}
\renewcommand{\tableofcontents}{%
   \if@twocolumn
      \@restonecoltrue\onecolumn
   \else
      \@restonecolfalse
   \fi
   \chapter*{\contentsname
        \@mkboth{\contentsname}{\contentsname}}%    Headings not uppercased
   \@starttoc{toc}%
   \if@restonecol\twocolumn\fi
}

\renewcommand{\listoffigures}{%
   \if@twocolumn
      \@restonecoltrue\onecolumn
   \else
      \@restonecolfalse
   \fi
   \chapter*{\listfigurename
      \@mkboth{\listfigurename}{\listfigurename}}%  Headings not uppercased
   \@starttoc{lof}%
   \if@restonecol\twocolumn\fi
}

\renewcommand{\listoftables}{%
   \if@twocolumn
      \@restonecoltrue\onecolumn
   \else
      \@restonecolfalse
   \fi
   \chapter*{\listtablename
      \@mkboth{\listtablename}{\listtablename}}%    Headings not uppercased
   \@starttoc{lot}%
   \if@restonecol\twocolumn\fi
}

\renewenvironment{thebibliography}[1]{%
   \chapter*{\bibname
      \@mkboth{\bibname}{\bibname}}%            Headings not uppercased
   \addcontentsline{toc}{chapter}{Bibliography}%    Add to table-of-contents
   \list{\@biblabel{\arabic{enumiv}}}{%
      \settowidth\labelwidth{\@biblabel{#1}}%
      \leftmargin\labelwidth
      \advance\leftmargin\labelsep
      \@openbib@code
      \usecounter{enumiv}%
      \let\p@enumiv\@empty
      \renewcommand{\theenumiv}{\arabic{enumiv}}%
   }%
   \sloppy\clubpenalty4000\widowpenalty4000%
   \sfcode`\.=\@m
}{%
   \def\@noitemerr{%
      \@latex@warning{Empty `thebibliography' environment}%
   }%
   \endlist
}

\renewenvironment{theindex}{%
   \cleardoublepage%                               Start on a right-hand page
   \if@twocolumn
      \@restonecolfalse
   \else
      \@restonecoltrue
   \fi
   \columnseprule \z@
   \columnsep 35\p@
   \twocolumn[\phantom{\Large\bf\chaptername}%
              \@makeschapterhead{\indexname}]%
   \@mkboth{\indexname}{\indexname}%           Headings not uppercased
   \addcontentsline{toc}{chapter}{Index}%      Add to table-of-contents
   \thispagestyle{plain}\parindent\z@
   \parskip\z@ \@plus .3\p@\relax
   \let\item\@idxitem
}{%
   \if@restonecol\onecolumn\else\clearpage\fi
}
%
%   Define new end-matter environments
%
\newenvironment{thesymbols}{%
   \cleardoublepage%                             Start on a right-hand page
   \if@twocolumn
      \@restonecolfalse
   \else
      \@restonecoltrue
   \fi
   \columnseprule \z@
   \columnsep 35\p@
   \twocolumn[\phantom{\Large\bf\chaptername}%
              \@makeschapterhead{List of symbols}]%
   \@mkboth{List of symbols}{List of symbols}%   Headings not uppercased
   \addcontentsline{toc}{chapter}{List of Symbols}% Add to table-of-contents
   \thispagestyle{plain}\parindent\z@
   \parskip\z@ \@plus .3\p@\relax
   \let\item\@idxitem
}{%
   \if@restonecol\onecolumn\else\clearpage\fi
}

\newcommand{\acknowledgments}{%
   \chapter*{Acknowledgments}%
   \addcontentsline{toc}{chapter}{Acknowledgments}%
   \markboth{Acknowledgments}{Acknowledgments}%
}

\newcommand{\introduction}{%
   \chapter*{Introduction}%
   \addcontentsline{toc}{chapter}{Introduction}%
   \markboth{Introduction}{Introduction}%
}

\newcommand{\samenvatting}{%
   \chapter*{Samenvatting}%
   \addcontentsline{toc}{chapter}{Samenvatting}%
   \markboth{Samenvatting}{Samenvatting}%
}

\newcommand{\abstract}{%
   \chapter*{Abstract}%
   \addcontentsline{toc}{chapter}{Abstract}%
   \markboth{Abstract}{Abstract}%
}

\newcommand{\conclusion}{%
   \chapter*{Conclusion}%
   \addcontentsline{toc}{chapter}{Conclusion}%
   \markboth{Conclusion}{Conclusion}%
}

\newcommand{\curriculum}{%
   \chapter*{Curriculum Vitae}
   \addcontentsline{toc}{chapter}{Curriculum Vitae}
   \markboth{Curriculum Vitae}{Curriculum Vitae}
}
%
%   Italized theorem-like environments
%
\newtheorem{theorem}{Theorem}[section]
\newtheorem{conjecture}[theorem]{Conjecture}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}
%
%   Non-italized theorem-like environments:
%
\newtheorem{@tdefinition}[theorem]{Definition}
\def\@definition{\@ifnextchar[{\@ndefinition}{\@sdefinition}}
\def\@ndefinition[#1]{\begin{@tdefinition}[#1]\upshape}
\def\@sdefinition{\begin{@tdefinition}\upshape}
\newenvironment{definition}{\@definition}{\end{@tdefinition}}

\newtheorem{@tremark}[theorem]{Remark}
\def\@remark{\@ifnextchar[{\@nremark}{\@sremark}}
\def\@nremark[#1]{\begin{@tremark}[#1]\upshape}
\def\@sremark{\begin{@tremark}\upshape}
\newenvironment{remark}{\@remark}{\end{@tremark}}

\newtheorem{@texample}[theorem]{Example}
\def\@example{\@ifnextchar[{\@nexample}{\@sexample}}
\def\@nexample[#1]{\begin{@texample}[#1]\upshape}
\def\@sexample{\begin{@texample}\upshape}
\newenvironment{example}{\@example}{\end{@texample}}

\newtheorem{@tconvention}[theorem]{Example}
\def\@convention{\@ifnextchar[{\@nconvention}{\@sconvention}}
\def\@nconvention[#1]{\begin{@tconvention}[#1]\upshape}
\def\@sconvention{\begin{@tconvention}\upshape}
\newenvironment{convention}{\@convention}{\end{@tconvention}}

\newtheorem{@tfact}[theorem]{Fact}
\def\@fact{\@ifnextchar[{\@nfact}{\@sfact}}
\def\@nfact[#1]{\begin{@tfact}[#1]\upshape}
\def\@sfact{\begin{@tfact}\upshape}
\newenvironment{fact}{\@fact}{\end{@tfact}}

\newtheorem{@tquestion}[theorem]{Question}
\def\@question{\@ifnextchar[{\@nquestion}{\@squestion}}
\def\@nquestion[#1]{\begin{@tquestion}[#1]\upshape}
\def\@squestion{\begin{@tquestion}\upshape}
\newenvironment{question}{\@question}{\end{@tquestion}}

% \newenvironment{proof}[1][Proof]{\noindent{\bf #1:}\newline}{\hfill $\Box$ \newline}
% Malvin: We need something after \newline to prevent empty=underfull hboxes!
\newenvironment{proof}[1][Proof]{\noindent{\bf #1:}\newline}{\hfill$\Box$\newline\phantom{.}}
% Malvin: in some proofs we want to place the end box manually:
\newenvironment{proofwithmanualqed}[1][Proof]{\noindent{\bf #1:}\newline}{}
\newcommand{\manualqedhere}{\hfill$\Box$\newline\phantom{.}}
%
%   Symbols for AmsTex and ILLC
%
\newcommand{\illclogo}[1]{%
   \includegraphics[width=#1]{img/illclogo}%
}
\newcommand{\illcnotextlogo}[1]{%
   \includegraphics[width=#1]{img/illc_no_text_logo}%
}

\endinput
