%%%%%%%%%%%%%%%%%%%%%%
%% start of file `elegantbook.cls'.
%% Copyright 2013-2019 ElegantLaTeX (ElegantLaTeX2e@gmail.com)
%%
%% This work may be distributed and/or modified freely
%% available at http://elegantlatex.tk/download/
%% and  http://ddswhu.com/download/
% %
%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantbook}[2014/01/20 v2.00 ElegantBook document class]

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
\DeclareBoolOption[true]{mathpazo}
\DeclareComplementaryOption{mtpro}{mathpazo}
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

% ----- Handle Colors -----
%% 章节以及页脚图形
\newcommand*{\base}[1]{
 \def\@base{\includegraphics[scale=0.3]{#1}
 }
}
\RequirePackage{xcolor}
\ifdefstring{\ELEGANT@color}{green}{
  \definecolor{main}{RGB}{0,120,2}%
  \definecolor{seco}{RGB}{230,90,7}%
  \definecolor{thid}{RGB}{0,160,152}%
  \base{greenbase.pdf}%
}{\relax}

\ifdefstring{\ELEGANT@color}{cyan}{
  \definecolor{main}{RGB}{0,175,152}%
  \definecolor{seco}{RGB}{239,126,30}%
  \definecolor{thid}{RGB}{120,8,13}%
  \base{cyanbase.pdf}%
}{\relax}

\ifdefstring{\ELEGANT@color}{blue}{
  \definecolor{main}{RGB}{20,50,104}%
  \definecolor{seco}{RGB}{180,50,131}%
  \definecolor{thid}{RGB}{7,127,128}%
  \base{bluebase.pdf}%
}{\relax}


% ----- Handle Math option -----
\ifELEGANT@mathpazo
  \RequirePackage{mathpazo}
  \newcommand{\mbf}{\mathbf}
\else
  \AtBeginDocument{\usepackage{mtpro2}}
\fi
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

%% 常用宏包
\RequirePackage{graphicx}
\RequirePackage{enumerate}
\RequirePackage{amsmath,mathrsfs,amsfonts}
\RequirePackage{booktabs}
\linespread{1.3}

\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\newcommand*{\myquote}[1]{\def\@myquote{#1}}

\newcommand*{\logo}[1]{
 \def\@logo{\includegraphics[height=5.8cm]{#1}
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
 bookmarksnumbered  =true,
 bookmarksopen      =true,
 pdfsubject         =\@author \@title Book,
 pdfkeywords        ={ElegantBook},
 pdfcreator         ={XeLaTeX with ElegantBook class},
 colorlinks,
 linkcolor          =main,
 plainpages         =false,
 pdfstartview       =FitH,
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

\renewcommand{\chaptername}{第 \thechapter 章}

\titleformat{\chapter}[\style]{\bfseries}
{\filcenter\LARGE\enspace\bfseries{\color{main}\chaptername}\enspace}{1pt}{\bfseries\color{main}\LARGE\filcenter}[\filcenter\@base]

\titleformat{\section}[hang]{\sffamily}
{\hspace{-2.45em}\Large\bfseries{\color{main}\thesection}\enspace}{1pt}{\color{main}\Large\bfseries\filright}

\titleformat{\subsection}[hang]{\sffamily}
{\large\bfseries\color{main}\thesubsection\enspace}{1pt}{\color{main}\large\bfseries\filright}

\titlespacing{\chapter}{0pt}{0pt}{1.5\baselineskip}
%\titlespacing{\subsection}{0pt}{0.5\baselineskip}{-\baselineskip}


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

\RequirePackage{caption}
\captionsetup{labelfont = bf}


%%字体设置
\RequirePackage{fontenc}
\RequirePackage[no-math,cm-default]{fontspec}
\defaultfontfeatures{Mapping=tex-text}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}
\setmainfont[Ligatures=TeX]{Minion Pro} %  (\textrm)
\setsansfont{Myriad Pro} %  (\textsf)
\setmonofont{Inconsolata}%Palatino Linotype
%-中文字体设置-%
\RequirePackage{xeCJK}
\setCJKmainfont[BoldFont={黑体},ItalicFont={楷体}]{华文中宋}%方正书宋_GBK Adobe Song Std L
\setCJKsansfont[BoldFont={黑体}]{方正中等线简体}
\setCJKmonofont{方正中等线简体}
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt

\setCJKfamilyfont{new}{方正苏新诗柳楷简体}
\setCJKfamilyfont{note}{方正启体简体}
\newfontfamily\gara{Adobe Garamond Pro}

%% 定理\引理\定义样式设置
\RequirePackage{environ}
\RequirePackage{tikz}
\usetikzlibrary{shapes,decorations}

\definecolor{bule}{RGB}{18,29,57}
\definecolor{bablue}{RGB}{248,248,248}

%define the style of tikz newthemsty
\tikzstyle{newthemsty}
          =[draw=main, fill=blue!10,very thick,rectangle,
           rounded corners, inner sep=10pt, inner ysep=20pt]
\tikzstyle{newthemstytitle}
          =[fill=main, text=blue!10]

\tikzstyle{newdefinitionsty}
          =[draw=seco, fill=yellow!20,very thick,rectangle,
           rounded corners, inner sep=10pt, inner ysep=20pt,
           text=black,fill opacity=0.9]
\tikzstyle{newdefinitionstytitle}
         =[fill=seco, text=white]

\tikzstyle{newpropositionsty}
          =[draw=thid, fill=bablue,very thick,rectangle,
           rounded corners, inner sep=10pt, inner ysep=20pt,
           text=black,fill opacity=0.9]
\tikzstyle{newpropositionstytitle}
         =[fill=thid, text=white]

%%define the "newthem" environment
\newcounter{Newthem}[chapter]
\renewcommand{\theNewthem}{\thechapter.\arabic{Newthem}}
\NewEnviron{newthem}[1][{}]{%
\begin{figure}[!htb]
\noindent\centering
\begin{tikzpicture}
\node[newthemsty] (box){
     \begin{minipage}{0.93\columnwidth}
        \sffamily\refstepcounter{Newthem}\BODY
     \end{minipage}};
\node[newthemstytitle,right=10pt] at (box.north west){
     \bf\textsf{Theorem \theNewthem\; #1}};
\node[newthemstytitle, rounded corners] at (box.east) {$\clubsuit$};
\end{tikzpicture}
\end{figure}}

%%define the "newlemma" environment
\newcounter{Newlemma}[chapter]
\renewcommand{\theNewlemma}{\thechapter.\arabic{Newlemma}}
\NewEnviron{newlemma}[1][{}]{%
\begin{figure}[!htb]
\noindent\centering
\begin{tikzpicture}
\node[newthemsty] (box){
     \begin{minipage}{0.93\columnwidth}
        \sffamily \refstepcounter{Newlemma}\BODY
     \end{minipage}};
\node[newthemstytitle,right=10pt] at (box.north west){
     \bf\textsf{Lemma \theNewlemma\; #1}};
\node[newthemstytitle, rounded corners] at (box.east) {$\clubsuit$};
\end{tikzpicture}
\end{figure}}

%%define the "newcorol" environment
\newcounter{Newcorol}[chapter]
\renewcommand{\theNewcorol}{\thechapter.\arabic{Newcorol}}
\NewEnviron{newcorol}[1][{}]{%
\begin{figure}[!htb]
\noindent\centering
\begin{tikzpicture}
\node[newthemsty] (box){
     \begin{minipage}{0.93\columnwidth}
        \sffamily\refstepcounter{Newcorol}\BODY
     \end{minipage}};
\node[newthemstytitle,right=10pt] at (box.north west){
     \bf\textsf{Corollary \theNewcorol\; #1}};
\node[newthemstytitle, rounded corners] at (box.east) {$\clubsuit$};
\end{tikzpicture}
\end{figure}}

%% define the "proposition" environment
\newcounter{Newprop}[chapter]
\renewcommand{\theNewprop}{\thechapter.\arabic{Newprop}}
\NewEnviron{newprop}[1][{}]{%
\begin{figure}[!htb]\noindent\centering
\begin{tikzpicture}
\node[newpropositionsty] (box){
     \begin{minipage}{0.93\columnwidth}
        \sffamily\refstepcounter{Newprop}\BODY
     \end{minipage}};
\node[newpropositionstytitle,right=10pt] at (box.north west){
     \bf\textsf{Proposition \theNewprop\; #1}};
\node[newpropositionstytitle, rounded corners] at (box.east) {$\spadesuit$};
\end{tikzpicture}
\end{figure}}


%%define the "newdef" environment
\newcounter{Newdefinition}[chapter]
\renewcommand{\theNewdefinition}{\thechapter.\arabic{Newdefinition}}
\NewEnviron{newdef}[1][{}]{%
\begin{figure}[!htb]\noindent\centering
\begin{tikzpicture}
\node [newdefinitionsty] (dbox){\begin{minipage}{0.93\textwidth}\itshape\refstepcounter{Newdefinition}\BODY\end{minipage}};
\node[newdefinitionstytitle, right=10pt] at (dbox.north west) {\bf\textsf{Definition \theNewdefinition\; #1}};
\node[newdefinitionstytitle, rounded corners] at (dbox.east) {$\heartsuit$};
\end{tikzpicture}
\end{figure}}


%% Example with counter
\newcounter{Newexam}[chapter]
\renewcommand{\theNewexam}{\thechapter.\arabic{Newexam}}
\newenvironment{example}{\par\noindent\textbf{Example\,\refstepcounter{Newexam}\theNewexam: }\color{black!90}}{\par}

%% Exercise with counter
\newcounter{Newexer}[chapter]
\renewcommand{\theNewexer}{\thechapter.\arabic{Newexer}}
\newenvironment{exercise}{\par\noindent{\makebox[0pt][r]{\color{main}\ding{50}\;\;}}\textbf{Exercise\,\refstepcounter{Newexer}\theNewexer: }}{\par}

%%define the note and newproof environment
\RequirePackage{pifont,manfnt}
\newenvironment{note}{\par\itshape\CJKfamily{note}\gara\noindent{\makebox[0pt][r]{\scriptsize\color{red!90}\textdbend\quad}\textbf{Note:}}}{\par}

\newenvironment{remark}{\par\itshape\CJKfamily{note}\gara\noindent{\makebox[0pt][r]{\color{red!90}\ding{96}\quad}\textbf{Remarks:}}}{\par}


\newenvironment{assumption}{\par\noindent\textbf{Assumptions: }\color{black!90}}{\par}

\newenvironment{conclusion}{\par\noindent\textbf{Conclusions: }}{\par}

\newenvironment{property}{\par\noindent\textbf{Properties: }}{\par}

\newenvironment{newproof}{\par\noindent{\makebox[0pt][r]{\color{main}\ding{43}\;\;}\textbf{Proof:}}\color{black!90}\small}{\hfill$\Box$\quad\par}

\newenvironment{solution}{\par\noindent{\makebox[0pt][r]{\color{main}\ding{46}\;\;}\textbf{Solution:}}\small}{\hfill$\Box$\quad\par}

\newenvironment{custom}[1]{\par\noindent{\makebox[0pt][r]{\color{main}\ding{34}\;\;}\textbf{#1:}}\small}{\par}
%页眉页脚

\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\fancyhf{}
\fancyhead[EL,OR]{\color{main}--\thepage/\pageref{LastPage}--}
\fancyhead[ER]{\color{main}\em\nouppercase\leftmark{}}
\fancyhead[OL]{\color{main}\em\nouppercase\rightmark}
\fancyfoot[c]{\@base}
\renewcommand{\headrule}{\color{main}\hrule width\textwidth}
\pagestyle{fancy}

\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}\renewcommand{\headrule}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\; #1}{} }
\renewcommand{\chaptermark}[1]{\markboth{\chaptername \; #1\;}{}}



%\let\origdoublepage\cleardoublepage
%\newcommand{\clearemptydoublepage}{%
%  \clearpage
%  {\pagestyle{empty}\origdoublepage}%
%}
%\let\cleardoublepage\clearemptydoublepage

%\RequirePackage{nextpage}
%\cleartooddpage[\thispagestyle{empty}]
%\cleartoevenpage[\thispagestyle{empty}]
%%封面

\def\maketitle{%
\thispagestyle{empty}
\@cover
\vfill
\vspace*{2cm}
\begin{center}
\color{seco}
\rule{0.8\textwidth}{2pt}\\
\Huge {\color{main} \bfseries \the\entitle } {\color{seco} \bfseries \the\enend}\\
{\Huge \CJKfamily{new}{\color{main} \the\zhtitle } \the\zhend}\\
\rule{0.8\textwidth}{2pt}
\end{center}
\vskip3ex
\begin{figure}[htp]
\centering
\@logo
\end{figure}
\begin{center}
\begin{minipage}{0.65\textwidth}
\Eindent\color{bule}\@myquote
\end{minipage}
\end{center}
\vfill
\vspace{2cm}
\begin{flushright}
\color{seco}
\rule{0.45\textwidth}{1pt}\\
整理：{\color{main}\@author}\\
整理时间：{\color{main}\today}\\
Email: \hyperlink{\the\email}{\the\email}\\
\rule{0.45\textwidth}{1pt}
\end{flushright}
\vfill
\begin{center}
\color{seco} Version: \the\version
\end{center}
\vfil\eject
}


%%中文两个字符缩进
%----字宽/缩进-----
%----CJK字符宽度
%\f@size = 当前字符大小数值（pt/pt）
%\p@ = 1pt
\def\elegant@CJKChar@size{\hskip \f@size \p@}
%----定义字宽
%字宽 = 字符宽度 + 字符间距 = 相邻字符中心的间距
\newdimen\elegant@CJKChar@size@dimen
\settowidth\elegant@CJKChar@size@dimen{\elegant@CJKChar@size\CJKglue}
%----用户接口
%负责刷新字宽和段落缩进
\newcommand{\CJKsetfontspace}{%
%刷新字宽
\settowidth\elegant@CJKChar@size@dimen{\elegant@CJKChar@size\CJKglue}%
%刷新段落缩进
%判断段落缩进是否被设置为0（如果是表示要求不缩进）
\ifdim\parindent=0pt%
\relax%
\else%
\parindent2\elegant@CJKChar@size@dimen%
\fi%
}
\newcommand{\Eindent}{\CJKsetfontspace\parindent2\elegant@CJKChar@size@dimen}
\newcommand{\Enoindent}{\parident\z@}
%----自动执行
\AtBeginDocument{\Eindent}



