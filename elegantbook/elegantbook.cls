%%%%%%%%%%%%%%%%%%%%%%
%% start of file `elegantbook.cls'.
%% Copyright 2013-2019 ElegantLaTeX (elegantlatex2e@gmail.com)
%%
%% This work may be distributed and/or modified freely
%% available at https://github.com/ElegantLaTeX/ElegantBook
% %
%% Last Modification 2019-02-25
%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantbook}[2019/02/24 v3.06 ElegantBook document class]

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}

% ----- Colors -----
\DeclareStringOption[green]{color}
\DeclareStringOption[en]{lang}
% ----- backward compatibility
\DeclareVoidOption{green}{\ekv{color = green}}
\DeclareVoidOption{cyan}{\ekv{color = cyan}}
\DeclareVoidOption{blue}{\ekv{color = blue}}
\DeclareVoidOption{plain}{\ekv{color = plain}}
\DeclareVoidOption{nocolor}{\ekv{color = none}}
\DeclareVoidOption{en}{\ekv{lang=en}}
\DeclareVoidOption{cn}{\ekv{lang=cn}}
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
\LoadClass[12pt,a4paper,oneside,openany]{book}

\RequirePackage{indentfirst}
\setlength\parindent{2em}

% fontsetting
\RequirePackage{ifxetex}
\ifxetex
	\RequirePackage{fontenc}
	\RequirePackage[no-math]{fontspec}
	\setmainfont{Times New Roman}[NFSSFamily=ntxtlf]
	\setsansfont{Arial}
	%\setmonofont[Scale=0.9]{Courier New}
	\RequirePackage{xeCJK}
	\RequirePackage{xunicode}
	\setCJKmainfont[BoldFont={SimHei},ItalicFont={KaiTi}]{SimSun}
	\setCJKsansfont[BoldFont={SimHei},ItalicFont={KaiTi}]{KaiTi}
	\setCJKmonofont[BoldFont={SimHei},ItalicFont={KaiTi},Scale=0.7]{Microsoft YaHei}
	\XeTeXlinebreaklocale "zh"
	\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt
	\RequirePackage{newtxmath}
	%\DeclareSymbolFont{operators}{OT1}{ntxtlf}{m}{n}
	%\SetSymbolFont{operators}{bold}{OT1}{ntxtlf}{b}{n}
	\setCJKfamilyfont{zhsong}{SimSun}
	\setCJKfamilyfont{zhhei}{SimHei}
	\setCJKfamilyfont{zhkai}{KaiTi}
	\setCJKfamilyfont{zhfs}{FangSong}
	\newcommand*{\songti}{\CJKfamily{zhsong}} 
	\newcommand*{\heiti}{\CJKfamily{zhhei}}   
	\newcommand*{\kaishu}{\CJKfamily{zhkai}} 
	\newcommand*{\fangsong}{\CJKfamily{zhfs}} 
\else
	\RequirePackage{fontenc}
	\RequirePackage{newtxtext}
	\RequirePackage{newtxmath}
	\RequirePackage[UTF8, scheme=plain]{ctex}
\fi
\RequirePackage[scale=0.7]{FiraMono}
%

% font setting for text and math
% \RequirePackage[T1]{fontenc}
% \RequirePackage{newtxtext}
% \RequirePackage{newtxmath}
% \RequirePackage[scale=0.85]{newtxtt}  
\RequirePackage{anyfontsize}

\DeclareSymbolFont{cmlargesymbols}{OMX}{cmex}{m}{n}
\DeclareMathSymbol{\intop}{\mathop}{cmlargesymbols}{"5A}
  \def\int{\intop\nolimits}
\DeclareMathSymbol{\ointop}{\mathop}{cmlargesymbols}{"49}
  \def\oint{\ointop\nolimits}
\DeclareMathSymbol{\sumop}{\mathop}{cmlargesymbols}{"58}
  \let\sum\sumop
\DeclareMathSymbol{\prodop}{\mathop}{cmlargesymbols}{"59}
  \let\prod\prodop


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
\ifdefstring{\ELEGANT@color}{plain}{
	\definecolor{main}{RGB}{50,50,50}%
	\definecolor{second}{RGB}{50,50,50}%
	\definecolor{third}{RGB}{50,50,50}%
}{\relax}

%green color
\definecolor{main1}{RGB}{0,120,2}
\definecolor{second1}{RGB}{230,90,7}
\definecolor{third1}{RGB}{0,160,152}
%cyan color
\definecolor{main2}{RGB}{0,175,152}
\definecolor{second2}{RGB}{239,126,30}
\definecolor{third2}{RGB}{120,8,13}
%blue color
\definecolor{main3}{RGB}{20,50,104}
\definecolor{second3}{RGB}{180,50,131}
\definecolor{third3}{RGB}{7,127,128}


% corlor definition
\definecolor{winered}{rgb}{0.5,0,0}
\definecolor{bule}{RGB}{18,29,57}


\newcommand{\base}[2]{%
	\nointerlineskip \vspace{0.1\baselineskip}\hspace{\fill}
	{\color{#1}
		\resizebox{0.3\linewidth}{1.5ex}
		{{%
				{\begin{tikzpicture}
					\node  (C) at (0,0) {};
					\node (D) at (4,0) {};
					\path (C) to [ornament=#2] (D);
					\end{tikzpicture}}}}}%
	\hspace{\fill}
	\par\nointerlineskip \vspace{0.1\baselineskip}
}

% ----- Title Style -----
\ifdefstring{\ELEGANT@titlestyle}{hang}{\def\style{hang}}{\relax}
\ifdefstring{\ELEGANT@titlestyle}{display}{\def\style{display}}{\relax}


\newtoks\email
\newtoks\version
\newtoks\institute
\newtoks\subtitle


\RequirePackage{enumerate}
% list/itemize/enumerate setting
\RequirePackage[shortlabels]{enumitem}
\setlist{nolistsep}

% caption settings 
\RequirePackage{caption}
\captionsetup{labelfont = bf}
\RequirePackage[font=small,labelfont={bf,color=main}]{caption} 
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

%% 常用宏包
\linespread{1.3}
\RequirePackage{microtype}
\RequirePackage{graphicx}
%\RequirePackage{enumerate}
\RequirePackage{amsmath,mathrsfs,amsfonts}
\RequirePackage{booktabs}
\RequirePackage{multicol}
\RequirePackage{xcolor}
\RequirePackage{fancyvrb}
\RequirePackage{makecell,lipsum,texnames,setspace}


%%中文结构名字
\ifdefstring{\ELEGANT@lang}{en}{
\newcommand\figref[1]{\textbf{Figure}~\ref{#1}}
\newcommand\tabref[1]{\textbf{Table}~\ref{#1}}
\renewcommand{\chaptername}{Chapter \thechapter}
}{\relax}
\ifdefstring{\ELEGANT@lang}{cn}{
\renewcommand{\contentsname}{目录}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\renewcommand{\partname}{第 \thepart\; 部分}
\renewcommand{\listfigurename}{插图目录}
\renewcommand{\listtablename}{表格目录}
\renewcommand{\bibname}{参考文献}
\renewcommand{\appendixname}{附录}
\renewcommand{\indexname}{索引}
\newcommand\figref[1]{\textbf{图}~\ref{#1}}
\newcommand\tabref[1]{\textbf{表}~\ref{#1}}
\renewcommand{\chaptername}{第 \thechapter\;章}
}{\relax}



\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\RequirePackage{tikz}
\usetikzlibrary{backgrounds,calc,shadows}
\usepackage[object=vectorian]{pgfornament} %% 

\newcommand*{\eitemi}{\tikz \draw [baseline, ball color=main, draw=main] circle (2pt);}
\newcommand*{\eitemii}{\tikz \draw [baseline, fill=main,draw=main,circular drop shadow] circle (2pt);}
\newcommand*{\eitemiii}{\tikz \draw [baseline, fill=main,draw=main] circle (2pt);}
\setlist[enumerate,1]{label=\color{main}\arabic*.}
\setlist[enumerate,2]{label=\color{main}(\alph*).}
\setlist[enumerate,3]{label=\color{main}\Roman*.}
\setlist[enumerate,4]{label=\color{main}\Alph*.}
\setlist[itemize,1]{label={\eitemi}}
\setlist[itemize,2]{label={\eitemii}}
\setlist[itemize,3]{label={\eitemiii}}

\RequirePackage{natbib}
\setlength{\bibsep}{0.0pt}
\def\bibfont{\footnotesize}


%% 页面设置
\RequirePackage{geometry}
\geometry{
	a4paper,
%	left=27mm,  %% or inner=23mm
%	right=27mm, %% or outer=18mm
	top=25.4mm, bottom=25.4mm,
	headheight=2.17cm,
	headsep=4mm,
	footskip=12mm
}

\RequirePackage{hyperref}
\hypersetup{
	breaklinks,
	unicode,
	linktoc=all,
	bookmarksnumbered=true,
	bookmarksopen=true,
	pdfkeywords={ElegantBook},
	colorlinks,
	linkcolor=winered,
	citecolor=winered,
	urlcolor  = winered,
	plainpages=false,
	pdfstartview=FitH,
	pdfborder={0 0 0},
	linktocpage
}


%%   章节设置
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage{apptools}
\RequirePackage[toc,page]{appendix}


\titleformat{\chapter}[\style]{\bfseries}
{\filcenter\LARGE\enspace\bfseries{\color{main}\IfAppendix{\appendixname}{\chaptername}\enspace}}{1pt}{\bfseries\color{main}\LARGE\filcenter}[\filcenter\base{main}{88}]

\titleformat{\section}[hang]{\bfseries}
{\hspace{-2.45em}\Large\bfseries{\color{main}\thesection}\enspace}{1pt}{\color{main}\Large\bfseries\filright}

\titleformat{\subsection}[hang]{\bfseries}
{\hspace{-2.45em}\large\bfseries\color{main}\thesubsection\enspace}{1pt}{\color{main}\large\bfseries\filright}

\titleformat{\subsubsection}[hang]{\bfseries}
{\hspace{-2.45em}\large\bfseries\color{main}\thesubsection\enspace}{1pt}{\color{main}\large\bfseries\filright}


\titlespacing{\chapter}{0pt}{0pt}{1.5\baselineskip}
%\titlespacing{\subsection}{0pt}{0.5\baselineskip}{-\baselineskip}




% list/itemize/enumerate setting
\RequirePackage[shortlabels]{enumitem}
\setlist{nolistsep}

\RequirePackage[most]{tcolorbox}

\tcbset{
    common/.style={
        fontupper=\itshape,
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
        % separator sign={:},
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

\newtcbtheorem[auto counter,number within=chapter]{definition}{
	\ifdefstring{\ELEGANT@lang}{en}{Definition}{定义}
}{defstyle}{def}

\newtcbtheorem[auto counter,number within=chapter]{theorem}{
	\ifdefstring{\ELEGANT@lang}{en}{Theorem}{定理}
}{thmstyle}{thm}

\newtcbtheorem[auto counter,number within=chapter]{proposition}{
	\ifdefstring{\ELEGANT@lang}{en}{Proposition}{命题}
}{propstyle}{pro}

\newtcbtheorem[auto counter,number within=chapter]{corollary}{
	\ifdefstring{\ELEGANT@lang}{en}{Corollary}{推论}
}{thmstyle}{cor}

\newtcbtheorem[auto counter,number within=chapter]{lemma}{
	\ifdefstring{\ELEGANT@lang}{en}{Lemma}{引理}
}{thmstyle}{lem}


%% Example with counter
\newcounter{exam}[chapter]
\setcounter{exam}{0}
\renewcommand{\theexam}{\thechapter.\arabic{exam}}
\newenvironment{example}[1][]{
 		\refstepcounter{exam}\par\medskip\noindent \textbf{\color{main}{
 			\ifdefstring{\ELEGANT@lang}{en}{Example}{例}
 		}~\theexam #1: }\rmfamily %
 	}{
 		\par\medskip\ignorespacesafterend %
 	}

%% Exercise with counter
\newcounter{exer}[chapter]
\setcounter{exer}{0}
\renewcommand{\theexer}{\thechapter.\arabic{exer}}
\newenvironment{exercise}[1][]{
 		\refstepcounter{exer}\par\medskip\noindent \textbf{\color{main}{
 			\ifdefstring{\ELEGANT@lang}{en}{Exercise}{练习}
 		}~\theexer #1: }\rmfamily %
 	}{
 		\par\medskip\ignorespacesafterend %
 	}

%% Exercise with counter
\newcounter{prob}[chapter]
\setcounter{prob}{0}
\renewcommand{\theprob}{\thechapter.\arabic{prob}}
\newenvironment{problem}[1][]{
 		\refstepcounter{prob}\par\medskip\noindent \textbf{\color{main}{
 			\ifdefstring{\ELEGANT@lang}{en}{Problem}{例题}
 		}~\theprob #1: }\rmfamily %
 	}{
 		\par\medskip\ignorespacesafterend %
 	}

%%define the note and proof environment
\RequirePackage{pifont,manfnt}

\newenvironment{note}{\par\noindent{\makebox[0pt][r]{\scriptsize\color{red!90}\textdbend\quad}\textbf{\color{main}
	\ifdefstring{\ELEGANT@lang}{en}{Note:}{注意：}
}}\itshape}{\par}

\newenvironment{proof}{\par\noindent\textbf{\color{main}
	\ifdefstring{\ELEGANT@lang}{en}{Proof:}{证明：}
}\color{black!90}\small}{\hfill$\Box$\quad\par}
\newenvironment{remark}{\noindent\textbf{\color{main}
	\ifdefstring{\ELEGANT@lang}{en}{Remark:}{注：}
}}{\par}
\newenvironment{assumption}{\par\noindent\textbf{\color{main}
	\ifdefstring{\ELEGANT@lang}{en}{Assumption:}{假设：}
}}{\par}
\newenvironment{conclusion}{\par\noindent\textbf{\color{main}
	\ifdefstring{\ELEGANT@lang}{en}{Conclusion:}{结论：}
}}{\par}
\newenvironment{solution}{\par\noindent\textbf{\color{main}
	\ifdefstring{\ELEGANT@lang}{en}{Solution:}{解：}
}}{\par}
\newenvironment{property}{\par\noindent\textbf{\color{main}
	\ifdefstring{\ELEGANT@lang}{en}{Property:}{性质：}
}}{\par}



%页眉页脚
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\fancyhf{}
\fancyhead[EL,OR]{\color{main}--\thepage/\pageref*{LastPage}--}
\fancyhead[ER]{\color{main}\em\nouppercase\leftmark{}}
\fancyhead[OL]{\color{main}\em\nouppercase\rightmark}
\fancyfoot[c]{\base{main}{88}}
\renewcommand{\headrule}{\color{main}\hrule width\textwidth}
\pagestyle{fancy}

\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}\renewcommand{\headrule}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\; #1}{} }
\renewcommand{\chaptermark}[1]{\markboth{\chaptername \; #1\;}{}}

%%封面
\newcommand*{\equote}[1]{\def\@equote{#1}}

\newcommand*{\logo}[1]{
 \def\@logo{\includegraphics[width=0.3\textwidth]{#1}
 }
}
\newcommand*{\cover}[1]{
 \def\@logo{\includegraphics[width=\linewidth]{cover.jpg}
 }
}

\renewcommand*{\maketitle}{%
\hypersetup{pageanchor=false}
\begin{titlepage}
	\newpage
	\newgeometry{margin = 0in}
	\parindent=0pt
	\renewcommand\baselinestretch{2.5}
	\includegraphics[width=\linewidth]{cover.jpg}
	\setlength{\fboxsep}{0pt}
	\colorbox{second}{\makebox[\linewidth][c]{\shortstack[c]{\vspace{0.5in}}}}
	\vfill
	\hfill
	\hspace{2em}
	\begin{minipage}[c]{0.68\linewidth}
		{\bfseries\Huge \@title\\}
		{\color{darkgray}\bfseries\Large \the\subtitle\\[2ex]}
		\color{gray}\kaishu\normalsize
		{\renewcommand{\arraystretch}{0.618}
		\begin{tabular}{l} 
			\ifdefstring{\ELEGANT@lang}{en}{\textbf{Author: }}{\textbf{作者：}}\@author \\
			\ifdefstring{\ELEGANT@lang}{en}{\textbf{Institute: }}{\textbf{组织：}}\the\institute\\
			\ifdefstring{\ELEGANT@lang}{en}{\textbf{Update: }}{\textbf{更新：}}\@date\\
			\ifdefstring{\ELEGANT@lang}{en}{\textbf{Version: }}{\textbf{版本：}}\the\version \\ 
		\end{tabular}}
	\end{minipage}
	\begin{minipage}[c]{0.27\linewidth}
	\begin{tikzpicture}[remember picture,overlay]
		\begin{pgfonlayer}{background}
		  \node[opacity=0.8,anchor=south east,outer sep=0pt,inner sep=0pt] at ($(current page.south east) +(-0.8in,1.5in)$) {\includegraphics[width=0.7\textwidth]{logo.png}};
		\end{pgfonlayer}
	\end{tikzpicture}
	\end{minipage}
	\vfill
	\centerline{\itshape \@equote}
	\vfill
	\restoregeometry
\end{titlepage}
\thispagestyle{empty}
}

\RequirePackage{listings} 
\definecolor{lightgrey}{rgb}{0.9,0.9,0.9}
\definecolor{frenchplum}{RGB}{190,20,83}
\lstset{language=[LaTeX]TeX,
	texcsstyle=*\bf\color{winered}\ttfamily,
	basicstyle=\ttfamily,
	numbers=none,
	breaklines=true,
	keywordstyle=\bf\color{winered}\ttfamily,
	commentstyle=\color{gray},
	emph={elegantpaper,fontenc,fontspec,xeCJK,FiraMono,xunicode,newtxmath,figure,fig,image,img,table,itemize,enumerate,newtxtext,newtxtt,ctex,microtype,description,times,newtx,booktabs,tabular,PDFLaTeX,XeLaTeX,type1cm,BibTeX,device,color,mode,lang,amsthm,tcolorbox,titlestyle},
	emphstyle={\color{frenchplum}},
	morekeywords={DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKmainfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords,definecolor,equote,logo,cover,subtitle,appendix,chapter,hypersetup,mainmatter,tableofcontents},
	frame=none,
	tabsize=2,
	rulecolor=\color{main},
}

\bibliographystyle{aer}


