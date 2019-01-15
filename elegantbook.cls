%%%%%%%%%%%%%%%%%%%%%%
%% start of file `elegantbook.cls'.
%% Copyright 2013-2019 ElegantLaTeX (ddswhu@126.com)
%%
%% This work may be distributed and/or modified freely
%% available at https://ddswhu.me/resource/
% %
%% Last Modification 2018-12-06
%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantbook}[2018/12/06 v3.00 ElegantBook document class]

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}

% ----- Colors -----
\DeclareStringOption[green]{color}[green]
% ----- backward compatibility
\DeclareVoidOption{green}{\ekv{color = green}}
\DeclareVoidOption{cyan}{\ekv{color = cyan}}
\DeclareVoidOption{blue}{\ekv{color = blue}}
\DeclareVoidOption{nocolor}{\ekv{color = none}}

% ----- Math option -----
\newcommand\mailto[1]{\href{mailto:#1}{\nolinkurl{#1}}}

% ----- Title Style -----
\DeclareStringOption[hang]{titlestyle}[hang]
% ----- backward compatibility
\DeclareVoidOption{hang}{\ekv{titlestyle = hang}}
\DeclareVoidOption{display}{\ekv{titlestyle = display}}
% ----- Default Options -----
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessKeyvalOptions*\relax
% \ProcessOptions*\relax
\LoadClass[12pt,a4paper,openany]{book}

% font setting for text and math
\RequirePackage[T1]{fontenc}
\RequirePackage{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage[scale=0.85]{newtxtt}  
\RequirePackage{type1cm}

\usepackage[UTF8,space=auto,scheme=plain]{ctex}
\usepackage{indentfirst}
\setlength\parindent{2em}

% ----- Handle Colors -----
%% 章节以及页脚图形

\RequirePackage{xcolor}
\ifdefstring{\ELEGANT@color}{green}{
  \definecolor{main}{RGB}{0,120,2}%
  \definecolor{second}{RGB}{230,90,7}%
  \definecolor{third}{RGB}{0,160,152}%
}{\relax}

\ifdefstring{\ELEGANT@color}{cyan}{
  \definecolor{main}{RGB}{0,175,152}%
  \definecolor{second}{RGB}{239,126,30}%
  \definecolor{third}{RGB}{120,8,13}%
}{\relax}

\ifdefstring{\ELEGANT@color}{blue}{
  \definecolor{main}{RGB}{20,50,104}%
  \definecolor{second}{RGB}{180,50,131}%
  \definecolor{third}{RGB}{7,127,128}%
}{\relax}

\definecolor{winered}{rgb}{0.5,0,0}

\AtBeginDocument{
\input{base.tex}
}

\providecommand{\base}{
\begin{tikzpicture}[scale=0.2]
\triz{0}{0}
\ellz{128}
\intz{149}
\ellz{170}
\intz{191}
\ellz{212}
\triz{341}{180}
\end{tikzpicture}}
%\newcommand*{\base}{
%}

% ----- Title Style -----
\ifdefstring{\ELEGANT@titlestyle}{hang}{\def\style{hang}}{\relax}
\ifdefstring{\ELEGANT@titlestyle}{display}{\def\style{display}}{\relax}

\newtoks\zhtitle
\newtoks\entitle
\newtoks\email
\newtoks\version
\newtoks\enend
\newtoks\zhend

%%数学字体宏包



%%中文结构名字
\renewcommand{\contentsname}{目\hspace{2em}录}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\renewcommand{\partname}{部分}
\renewcommand{\listfigurename}{\bfseries 插图目录}
\renewcommand{\listtablename}{\bfseries 表格目录}
\renewcommand{\bibname}{\bfseries 参考文献}
\renewcommand{\appendixname}{\bfseries 附\hspace{2em}录}
\renewcommand{\indexname}{\bfseries 索\hspace{2em}引}

% more pretty font
\linespread{1.3}
\RequirePackage{microtype}


\RequirePackage{booktabs}
\RequirePackage{multicol}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fancyvrb}
\graphicspath{{image/}{figure/}{fig/}{img/}}

%% 常用宏包
\RequirePackage{graphicx}
\RequirePackage{enumerate}
\RequirePackage{amsmath,mathrsfs,amsfonts}
\RequirePackage{booktabs}
\linespread{1.3}

\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\newcommand*{\myquote}[1]{\def\@myquote{#1}}

\newcommand*{\logo}[1]{
 \def\@logo{\includegraphics[width=0.3\textwidth]{#1}
 }
}

%% 水印壁纸
\RequirePackage{wallpaper}
\newcommand*{\cover}[1]{\def\@cover{
  \ThisTileWallPaper{\paperwidth}{\paperheight}{#1}
 }
}



%% 页面设置

\RequirePackage{hyperref}

\AtBeginDocument{
  \hypersetup{
    pdftitle = {\the\zhtitle\the\zhend},
    pdfauthor = {\@author}
  }
}

\hypersetup{
			breaklinks,
      unicode,
			bookmarksnumbered=true,
			bookmarksopen=true,
			pdfsubject=\@author \@title Book,
			pdfkeywords={ElegantBook},
			pdfcreator={XeLaTeX with ElegantBook class},
			colorlinks,
      linkcolor=main,
      citecolor=winered,
			plainpages=false,
			pdfstartview=FitH,
			pdfborder={0 0 0},
			linktocpage
}

\RequirePackage{geometry}
\geometry{
			a4paper,
			left=27mm,  %% or inner=23mm
			right=27mm, %% or outer=18mm
			top=25.4mm, bottom=25.4mm,
			headheight=2.17cm,
			headsep=4mm,
			footskip=12mm
}

%%   章节设置
\RequirePackage[center,pagestyles]{titlesec}
\renewcommand{\chaptername}{第 \thechapter\;章}

\titleformat{\chapter}[\style]{\bfseries}
{\filcenter\LARGE\enspace\bfseries{\color{main}\chaptername}\enspace}{1pt}{\bfseries\color{main}\LARGE\filcenter}[\filcenter\base]


\titleformat{\section}[hang]{\bfseries}
{\hspace{-2.45em}\Large\bfseries{\color{main}\thesection}\enspace}{1pt}{\color{main}\Large\bfseries\filright}

\titleformat{\subsection}[hang]{\bfseries}
{\large\bfseries\color{main}\thesubsection\enspace}{1pt}{\color{main}\large\bfseries\filright}

\titlespacing{\chapter}{0pt}{0pt}{1.5\baselineskip}
%\titlespacing{\subsection}{0pt}{0.5\baselineskip}{-\baselineskip}




\RequirePackage{caption}
\captionsetup{labelfont = bf}

% list/itemize/enumerate setting
\RequirePackage[shortlabels]{enumitem}
\setlist{nolistsep}

% caption settings 
\RequirePackage[font=small,labelfont={bf}]{caption} 
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}


\definecolor{bule}{RGB}{18,29,57}



\RequirePackage[most]{tcolorbox}

\tcbset{
    common/.style={
        fontupper=\kaishu,
        lower separated=false,
        coltitle=white,
        colback=gray!10,
        fonttitle=\bfseries,
        enhanced,
        breakable,
        top=8pt,
        before skip=8pt,
        attach boxed title to top left={yshift=-0.11in,xshift=0.15in},
        boxed title style={boxrule=0pt,colframe=white,arc=0pt,outer arc=0pt},
    },
    defstyle/.style={
        common,
        colframe=main,  
        colbacktitle=main, 
        overlay unbroken and last={\node[anchor=south east, outer sep=6pt] at (\textwidth-width,0) {\textcolor{main}{$\clubsuit$}}; }
    },
    thmstyle/.style={
        common,
        colframe=second,  
        colbacktitle=second, 
        overlay unbroken and last={\node[anchor=south east, outer sep=6pt] at (\textwidth-width,0) {\textcolor{second}{$\heartsuit$}}; }
    },
    propstyle/.style={
        common,
        colframe=third,  
        colbacktitle=third, 
        overlay unbroken and last={\node[anchor=south east, outer sep=6pt] at (\textwidth-width,0) {\textcolor{third}{$\spadesuit$}}; }
    },
}

\newtcbtheorem[auto counter,number within=chapter]{definition}{Definition}{defstyle}{def}
\newtcbtheorem[auto counter,number within=chapter]{theorem}{Theorem}{thmstyle}{thm}
\newtcbtheorem[auto counter,number within=chapter]{proposition}{Proposition}{propstyle}{prop}
\newtcbtheorem[auto counter,number within=chapter]{corollary}{Corollary}{thmstyle}{cor}
\newtcbtheorem[auto counter,number within=chapter]{lemma}{Lemma}{thmstyle}{lemma}



%% Example with counter
\newcounter{example}[chapter]
\renewcommand{\theexample}{\thechapter.\arabic{example}}
\newenvironment{example}{\par\noindent\textbf{Example\,\refstepcounter{example}\theexample: }\color{black!90}}{\par}

%% Exercise with counter
\newcounter{exercise}[chapter]
\renewcommand{\theexercise}{\thechapter.\arabic{exercise}}
\newenvironment{exercise}{\par\noindent\textbf{Exercise\,\refstepcounter{exercise}\theexercise: }}{\par}

%%define the note and proof environment
\RequirePackage{pifont,manfnt}
\newenvironment{note}{\par\itshape\noindent{\makebox[0pt][r]{\scriptsize\color{red!90}\textdbend\quad}\textbf{Note:}}}{\par}
\newenvironment{proof}{\par\noindent\textbf{Proof:}\color{black!90}\small}{\hfill$\Box$\quad\par}

\newenvironment{remark}{\noindent\textbf{Remarks:}}{\par}
\newenvironment{assumption}{\par\noindent\textbf{Assumptions:}}{\par}
\newenvironment{conclusion}{\par\noindent\textbf{Conclusions:}}{\par}
\newenvironment{solution}{\par\noindent\textbf{Solution:}}{\par}
\newenvironment{property}{\par\noindent\textbf{Properties:}}{\par}






%页眉页脚

\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\fancyhf{}
\fancyhead[EL,OR]{\color{main}--\thepage/\pageref{LastPage}--}
\fancyhead[ER]{\color{main}\em\nouppercase\leftmark{}}
\fancyhead[OL]{\color{main}\em\nouppercase\rightmark}
\fancyfoot[c]{\base}
\renewcommand{\headrule}{\color{main}\hrule width\textwidth}
\pagestyle{fancy}

\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}\renewcommand{\headrule}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\; #1}{} }
\renewcommand{\chaptermark}[1]{\markboth{\chaptername \; #1\;}{}}





\DeclareSymbolFont{cmlargesymbols}{OMX}{cmex}{m}{n}
\DeclareMathSymbol{\intop}{\mathop}{cmlargesymbols}{"5A}
  \def\int{\intop\nolimits}
\DeclareMathSymbol{\ointop}{\mathop}{cmlargesymbols}{"49}
  \def\oint{\ointop\nolimits}
\DeclareMathSymbol{\sumop}{\mathop}{cmlargesymbols}{"58}
  \let\sum\sumop
\DeclareMathSymbol{\prodop}{\mathop}{cmlargesymbols}{"59}
  \let\prod\prodop

\newcommand\figref[1]{\textbf{Figure}~\ref{#1}}
\newcommand\tabref[1]{\textbf{Table}~\ref{#1}}



%%封面

\def\maketitle{%
\thispagestyle{empty}
% \@cover
\vfill
\vspace*{2cm}
\begin{center}
\color{second}
\rule{0.8\textwidth}{2pt}\\
\Huge {\color{main} \bfseries \the\entitle } {\color{second} \bfseries \the\enend}\\
{\Huge \bfseries{\color{main} \the\zhtitle } \the\zhend}\\
\rule{0.8\textwidth}{2pt}
\end{center}
\vskip3ex
\begin{figure}[htp]
\centering
\@logo
\end{figure}
\begin{center}
\begin{minipage}{0.65\textwidth}
\indent\centering\color{bule}\@myquote
\end{minipage}
\end{center}
\vfill
\vspace{2cm}
\begin{flushright}
\color{second}
\rule{0.45\textwidth}{1pt}\\
作者：{\color{main}\@author}\\
时间：{\color{main}\today}\\
邮箱: \hyperlink{\the\email}{\the\email}\\
\rule{0.45\textwidth}{1pt}
\end{flushright}
\vfill
\begin{center}
\color{second} Version: \the\version
\end{center}
\vfil\eject
}




\RequirePackage{natbib}
\setlength{\bibsep}{0.0pt}
\def\bibfont{\footnotesize}