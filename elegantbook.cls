%%%%%%%%%%%%%%%%%%%%%%
%% start of file `elegantbook.cls'.
%% Copyright 2013-2022 ElegantLaTeX (elegantlatex2e@gmail.com)
%%
%% This work may be distributed and/or modified freely
%% available at https://github.com/ElegantLaTeX/ElegantBook
% 
%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantbook}[2022/04/09 v4.3 ElegantBook document class]


%%%
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}

% ----- Colors -----
\DeclareStringOption[blue]{color}
\DeclareStringOption[en]{lang}
\DeclareStringOption[answer]{result}
\DeclareStringOption[fancy]{mode}
\DeclareStringOption[normal]{device}
\DeclareStringOption[cm]{math}
\DeclareStringOption[marginfalse]{marginpar}
\DeclareStringOption[onecol]{toc}
\DeclareStringOption{scheme}

% ----- backward compatibility
\DeclareVoidOption{green}{\ekv{color=green}}
\DeclareVoidOption{cyan}{\ekv{color=cyan}}
\DeclareVoidOption{blue}{\ekv{color=blue}}
\DeclareVoidOption{gray}{\ekv{color=gray}}
\DeclareVoidOption{black}{\ekv{color=black}}
\DeclareVoidOption{nocolor}{\ekv{color=none}}

\DeclareVoidOption{chinese}{\ekv{scheme=chinese}}

\DeclareStringOption[ctexfont]{chinesefont}
\DeclareVoidOption{ctexfont}{\ekv{chinesefont=ctexfont}}
\DeclareVoidOption{founder}{\ekv{chinesefont=founder}}
\DeclareVoidOption{nofont}{\ekv{chinesefont=nofont}}

\DeclareVoidOption{en}{\ekv{lang=en}}
\DeclareVoidOption{cn}{\ekv{lang=cn}}
\DeclareVoidOption{it}{\ekv{lang=it}}
\DeclareVoidOption{fr}{\ekv{lang=fr}}
\DeclareVoidOption{nl}{\ekv{lang=nl}}
\DeclareVoidOption{hu}{\ekv{lang=hu}}
\DeclareVoidOption{de}{\ekv{lang=de}}
\DeclareVoidOption{mn}{\ekv{lang=mn}}
\DeclareVoidOption{pt}{\ekv{lang=pt}}
\DeclareVoidOption{jp}{\ekv{lang=jp}}

\DeclareVoidOption{fancy}{\ekv{mode=fancy}}
\DeclareVoidOption{simple}{\ekv{mode=simple}}

\DeclareVoidOption{answer}{\ekv{result=answer}}
\DeclareVoidOption{noanswer}{\ekv{result=noanswer}}

\DeclareVoidOption{normal}{\ekv{device=normal}}
\DeclareVoidOption{pad}{\ekv{device=pad}}

\DeclareStringOption[numeric-comp]{citestyle}
\DeclareStringOption[numeric]{bibstyle}

\DeclareVoidOption{newtx}{\ekv{math=newtx}}
\DeclareVoidOption{mtpro2}{\ekv{math=mtpro2}}
\DeclareVoidOption{cm}{\ekv{math=cm}}

\DeclareVoidOption{margintrue}{\ekv{marginpar=margintrue}}
\DeclareVoidOption{marginfalse}{\ekv{marginpar=marginfalse}}


\DeclareVoidOption{onecol}{\ekv{toc=onecol}}
\DeclareVoidOption{twocol}{\ekv{toc=twocol}}

\DeclareStringOption[chapter]{thmcnt}
\DeclareVoidOption{chapter}{\ekv{thmcnt=chapter}}
\DeclareVoidOption{section}{\ekv{thmcnt=section}}

\DeclareStringOption[biber]{bibend}
\DeclareVoidOption{biber}{\ekv{bibend=biber}}
\DeclareVoidOption{bibtex}{\ekv{bibend=bibtex}}


% ----- Math option -----
\newcommand\mailto[1]{\href{mailto:#1}{\nolinkurl{#1}}}

% ----- Title Style -----
\DeclareStringOption[hang]{titlestyle}[hang]
% ----- backward compatibility
\DeclareVoidOption{hang}{\ekv{titlestyle=hang}}
\DeclareVoidOption{display}{\ekv{titlestyle=display}}
% ----- Default Options -----
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessKeyvalOptions*\relax
% \ProcessOptions*\relax
\LoadClass[a4paper,oneside]{book}

\RequirePackage{setspace}

\RequirePackage{csquotes}


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
  urlcolor=winered,
  plainpages=false,
  pdfstartview=FitH,
  pdfborder={0 0 0},
  linktocpage
}

%% device settings
\RequirePackage{geometry}
\ifdefstring{\ELEGANT@device}{normal}{
  \geometry{
    a4paper,
    top=25.4mm, bottom=25.4mm,
    left=20mm, right=20mm,
    headheight=2.17cm,
    headsep=4mm,
    footskip=12mm
  }
  \ifdefstring{\ELEGANT@marginpar}{margintrue}{
    \geometry{
      marginparwidth=5cm, marginparsep=5mm,
      left=2cm,right=7cm}}{\relax}}{
  \relax}

\ifdefstring{\ELEGANT@device}{pad}{
  \geometry{
    paperwidth=7.5in,
    paperheight=10in,
    margin=16mm,
    headheight=2.17cm,
    footskip=4mm
  }}{\relax}


\RequirePackage{indentfirst,comment}
% fontsetting
\ifdefstring{\ELEGANT@math}{mtpro2}{
  \let\Bbbk\relax
  \RequirePackage[lite]{mtpro2}
}{\relax}

\setcounter{tocdepth}{1}
\renewcommand{\baselinestretch}{1.2}

\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{quiet}{fontspec}
\RequirePackage{iftex}

\ifXeTeX
  \RequirePackage[no-math]{fontspec}
  \setmainfont{texgyretermes}[
    UprightFont = *-regular ,
    BoldFont = *-bold ,
    ItalicFont = *-italic ,
    BoldItalicFont = *-bolditalic ,
    Extension = .otf ,
    Scale = 1.0]

  \setsansfont{texgyreheros}[
    UprightFont = *-regular ,
    BoldFont = *-bold ,
    ItalicFont = *-italic ,
    BoldItalicFont = *-bolditalic ,
    Extension = .otf ,
    Scale = 0.9]
\else
  \RequirePackage{newtxtext}
  \RequirePackage[scaled=.90]{helvet}
\fi

\ifdefstring{\ELEGANT@lang}{cn}{
  \ifdefstring{\ELEGANT@chinesefont}{founder}{
    \RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}
    \setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03}]{FZShuSong-Z01}
    \setCJKsansfont[BoldFont={FZHei-B01}]{FZKai-Z03}
    \setCJKmonofont[BoldFont={FZHei-B01}]{FZFangSong-Z02}
    \setCJKfamilyfont{zhsong}{FZShuSong-Z01}
    \setCJKfamilyfont{zhhei}{FZHei-B01}
    \setCJKfamilyfont{zhkai}[BoldFont={FZHei-B01}]{FZKai-Z03}
    \setCJKfamilyfont{zhfs}[BoldFont={FZHei-B01}]{FZFangSong-Z02}
    \newcommand*{\songti}{\CJKfamily{zhsong}}
    \newcommand*{\heiti}{\CJKfamily{zhhei}}
    \newcommand*{\kaishu}{\CJKfamily{zhkai}}
    \newcommand*{\fangsong}{\CJKfamily{zhfs}}}{\relax}

  \ifdefstring{\ELEGANT@chinesefont}{nofont}{
    \RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}}{\relax}

  \ifdefstring{\ELEGANT@chinesefont}{ctexfont}{
    \RequirePackage[UTF8,scheme=plain]{ctex}}{\relax}

  \AfterEndPreamble{
    \setlength\parindent{2\ccwd}}
}{\relax}

\ifcsname heiti\endcsname
  \newcommand{\cbfseries}{\heiti}
\else
  \newcommand{\cbfseries}{\bfseries}
\fi


\ifcsname kaishu\endcsname
  \newcommand{\citshape}{\kaishu}
\else
  \newcommand{\citshape}{\itshape}
\fi
\ifcsname kaishu\endcsname
  \newcommand{\cnormal}{\kaishu}
\else
  \newcommand{\cnormal}{\normalfont}
\fi

\ifcsname fangsong\endcsname
  \newcommand{\cfs}{\fangsong}
\else
  \newcommand{\cfs}{\normalfont}
\fi

\RequirePackage{anyfontsize}
\ifdefstring{\ELEGANT@math}{newtx}{
  \RequirePackage{newtxmath}
  \let\Bbbk\relax
  \RequirePackage{esint}
  %%% use yhmath pkg, uncomment following code
  % \let\oldwidering\widering
  % \let\widering\undefined
  % \RequirePackage{yhmath}
  % \let\widering\oldwidering

  %%% use esvect pkg, uncomment following code
  % \RequirePackage{esvect}

  \DeclareSymbolFont{CMlargesymbols}{OMX}{cmex}{m}{n}
  \let\sumop\relax\let\prodop\relax
  \DeclareMathSymbol{\sumop}{\mathop}{CMlargesymbols}{"50}
  \DeclareMathSymbol{\prodop}{\mathop}{CMlargesymbols}{"51}
}{\relax}


% ----- Handle Colors -----
%% 章节以及页脚图形

\RequirePackage[table]{xcolor}
\ifdefstring{\ELEGANT@color}{green}{
  \definecolor{structurecolor}{RGB}{0,120,2}%
  \definecolor{main}{RGB}{0,120,2}%
  \definecolor{second}{RGB}{230,90,7}%
  \definecolor{third}{RGB}{0,160,152}%
}{\relax}
\ifdefstring{\ELEGANT@color}{cyan}{
  \definecolor{structurecolor}{RGB}{31,186,190}%
  \definecolor{main}{RGB}{59,180,5}%
  \definecolor{second}{RGB}{175,153,8}%
  \definecolor{third}{RGB}{244,105,102}%
}{\relax}
\ifdefstring{\ELEGANT@color}{blue}{
  \definecolor{structurecolor}{RGB}{60,113,183}
  \definecolor{main}{RGB}{0,166,82}%
  \definecolor{second}{RGB}{255,134,24}%
  \definecolor{third}{RGB}{0,174,247}%
}{\relax}
\ifdefstring{\ELEGANT@color}{gray}{
  \definecolor{structurecolor}{RGB}{150,150,150}
  \definecolor{main}{RGB}{150,150,150}%
  \definecolor{second}{RGB}{150,150,150}%
  \definecolor{third}{RGB}{150,150,150}%
}{\relax}
\ifdefstring{\ELEGANT@color}{black}{
  \definecolor{structurecolor}{RGB}{0,0,0}
  \definecolor{main}{RGB}{0,0,0}%
  \definecolor{second}{RGB}{0,0,0}%
  \definecolor{third}{RGB}{0,0,0}%
}{\relax}

%green color
\definecolor{structure1}{RGB}{0,120,2}%
\definecolor{main1}{RGB}{0,120,2}%
\definecolor{second1}{RGB}{230,90,7}%
\definecolor{third1}{RGB}{0,160,152}%
%cyan color
\definecolor{structure2}{RGB}{31,186,190}%
\definecolor{main2}{RGB}{59,180,5}%
\definecolor{second2}{RGB}{175,153,8}%
\definecolor{third2}{RGB}{244,105,102}%
%blue color
\definecolor{structure3}{RGB}{60,113,183}
\definecolor{main3}{RGB}{0,166,82}%
\definecolor{second3}{RGB}{255,134,24}%
\definecolor{third3}{RGB}{0,174,247}%
% gray color
\definecolor{structure4}{RGB}{150,150,150}
\definecolor{main4}{RGB}{150,150,150}%
\definecolor{second4}{RGB}{150,150,150}%
\definecolor{third4}{RGB}{150,150,150}%
% black color
\definecolor{structure5}{RGB}{0,0,0}
\definecolor{main5}{RGB}{0,0,0}%
\definecolor{second5}{RGB}{0,0,0}%
\definecolor{third5}{RGB}{0,0,0}%

% corlor definition
\definecolor{winered}{rgb}{0.5,0,0}
\definecolor{bule}{RGB}{18,29,57}
\colorlet{coverlinecolor}{second}


% ----- Title Style -----
\ifdefstring{\ELEGANT@titlestyle}{hang}{\def\style{hang}}{\relax}
\ifdefstring{\ELEGANT@titlestyle}{display}{\def\style{display}}{\relax}

% reference: 
% https://tex.stackexchange.com/questions/58506/how-to-make-a-new-command-similar-to-author
% https://pastebin.com/C8W4axzV
\newcommand\email[1]{\href{mailto:#1}{\nolinkurl{#1}}}

\global\let\@title\@empty
\global\let\@author\@empty
\global\let\@date\@empty
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\institute}[1]{\gdef\@institute{#1}}
\newcommand{\version}[1]{\gdef\@version{#1}}
\newcommand{\extrainfo}[1]{\gdef\@extrainfo{#1}}

\RequirePackage{mwe}
\newcommand{\logo}[1]{\gdef\@logo{#1}}
\newcommand{\cover}[1]{\gdef\@cover{#1}}

\newcommand{\question}[1]{{\par\citshape #1}\\[0.2ex]}

\RequirePackage{enumerate}
% list/itemize/enumerate setting
\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nolistsep}

\RequirePackage[labelfont={bf,color=structurecolor}]{caption}
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

\AtBeginDocument{
  \setlength{\abovedisplayskip}{3pt}
  \setlength{\belowdisplayskip}{3pt}
  \RequirePackage[flushmargin,stable]{footmisc}
  \setlength{\footnotesep}{12pt}
}



\RequirePackage{graphicx}
%\RequirePackage{enumerate}
\RequirePackage{amsmath,mathrsfs,amsfonts,amssymb}
% \providecommand\qed{}
% \renewcommand{\qed}{\hfill\ensuremath{\square}}
\RequirePackage{booktabs}
\RequirePackage{multicol,multirow}

\RequirePackage{fancyvrb}
\RequirePackage{makecell,lipsum,hologo}
%%中文结构名字


%%   章节设置
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage[title,titletoc,header]{appendix}


\RequirePackage[
  backend=\ELEGANT@bibend,
  citestyle=\ELEGANT@citestyle,
  bibstyle=\ELEGANT@bibstyle]{biblatex}

\ifdefstring{\ELEGANT@lang}{cn}{
  \renewcommand{\baselinestretch}{1.3}
  \renewcommand{\contentsname}{目录}
  \renewcommand{\figurename}{图}
  \renewcommand{\tablename}{表}
  \renewcommand{\partname}{\color{structurecolor}}
  \renewcommand{\thepart}{第\zhnumber{\arabic{part}}部分}
  \renewcommand{\listfigurename}{插图目录}
  \renewcommand{\listtablename}{表格目录}
  \renewcommand{\bibname}{参考文献}
  \newcommand{\ebibname}{参考文献}
  \renewcommand{\appendixname}{附录}
  \renewcommand{\appendixtocname}{附录}
  \renewcommand{\indexname}{索\hspace{2em}引}
  \newcommand\figref[1]{\textbf{图}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{表}~\ref{#1}}
  \newcommand{\authorname}{\citshape 作者：}
  \newcommand{\institutename}{\citshape 组织：}
  \newcommand{\datename}{\citshape 时间：}
  \newcommand{\versionname}{\citshape 版本：}
  \newcommand{\notename}{笔记}
  \renewcommand*{\proofname}{证明}
  \newcommand{\definitionname}{定义}
  \newcommand{\theoremname}{定理}
  \newcommand{\axiomname}{公理}
  \newcommand{\postulatename}{公设}
  \newcommand{\lemmaname}{引理}
  \newcommand{\propositionname}{命题}
  \newcommand{\corollaryname}{推论}
  \newcommand{\examplename}{例题} %
  \newcommand{\instancename}{示例} %
  \newcommand{\problemname}{问题} % 问题
  \newcommand{\exercisename}{练习} % 练习=习题
  \newcommand{\remarkname}{注}
  \newcommand{\assumptionname}{假设}
  \newcommand{\conclusionname}{结论}
  \newcommand{\solutionname}{解}
  \newcommand{\propertyname}{性质}
  \newcommand{\introductionname}{内容提要}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{{\citshape #1}：#2}}
  \newcommand{\updatename}{更新：}
  \newcommand{\historyname}{版本更新历史}
  \newcommand{\beforechap}{第}
  \newcommand{\afterchap}{章}
  \newcommand{\mightguyname}{迈特凯}
}{\relax}


\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\RequirePackage{tikz} %% load tikz without tikz
\usetikzlibrary{backgrounds,calc,shadows,positioning,fit}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
    \node[shape=circle,draw,inner sep=1pt] (char) {#1};}}
%  https://tex.stackexchange.com/questions/7032/good-way-to-make-textcircled-numbers

\newcommand*{\eitemi}{\tikz \draw [baseline, ball color=structurecolor,draw=none] circle (2pt);}
\newcommand*{\eitemii}{\tikz \draw [baseline, fill=structurecolor,draw=none,circular drop shadow] circle (2pt);}
\newcommand*{\eitemiii}{\tikz \draw [baseline, fill=structurecolor,draw=none] circle (2pt);}
\setlist[enumerate,1]{label=\color{structurecolor}\arabic*.}
\setlist[enumerate,2]{label=\color{structurecolor}(\alph*).}
\setlist[enumerate,3]{label=\color{structurecolor}\Roman*.}
\setlist[enumerate,4]{label=\color{structurecolor}\Alph*.}
\setlist[itemize,1]{label={\eitemi}}
\setlist[itemize,2]{label={\eitemii}}
\setlist[itemize,3]{label={\eitemiii}}

\RequirePackage{apptools}

% appendix chapter:

\ifdefstring{\ELEGANT@lang}{cn}{
  \ifdefstring{\ELEGANT@scheme}{chinese}{
    \newcommand{\xchaptertitle}{第\zhnumber{\arabic{chapter}}章} }{
    \newcommand{\xchaptertitle}{第 \thechapter{} 章}} }{
  \newcommand{\xchaptertitle}{\chaptername~\thechapter~}}

\setcounter{secnumdepth}{5}
\titleformat{\chapter}[\style]{\bfseries}{
  \filcenter\LARGE\enspace\bfseries{\color{structurecolor} \IfAppendix{\appendixname\;\thechapter\;}{\xchaptertitle\;}}}{1pt}{
  \LARGE\bfseries\color{structurecolor}\filcenter}[]
\titleformat{\section}[hang]{\bfseries}{
  \Large\bfseries{\color{structurecolor}\thesection}\enspace}{1pt}{%
  \color{structurecolor}\Large\bfseries\filright}
\titleformat{\subsection}[hang]{\bfseries}{
  \large\bfseries\color{structurecolor}\thesubsection\enspace}{1pt}{%
  \color{structurecolor}\large\bfseries\filright}
\titleformat{\subsubsection}[hang]{\bfseries}{
  \large\bfseries\color{structurecolor}\thesubsubsection\enspace}{1pt}{%
  \color{structurecolor}\large\bfseries\filright}

\titlespacing{\chapter}{0pt}{-20pt}{1.3\baselineskip}
%\titlespacing{\subsection}{0pt}{0.5\baselineskip}{-\baselineskip}



%%define the note and proof environment
\RequirePackage{pifont,manfnt,bbding}
\RequirePackage[many]{tcolorbox}
% \newlength{\normalparindent}
% \setlength{\normalparindent}{\parindent}
\ifdefstring{\ELEGANT@mode}{fancy}{
  \tcbset{
    common/.style={
        fontupper=\citshape,
        lower separated=false,
        % before upper={\setlength{\parindent}{\normalparindent}},
        coltitle=white,
        colback=gray!5,
        boxrule=0.5pt,
        fonttitle=\bfseries,
        enhanced,
        breakable,
        top=8pt,
        before skip=8pt,
        attach boxed title to top left={
            yshift=-0.11in,
            xshift=0.15in},
        boxed title style={
            boxrule=0pt,
            colframe=white,
            arc=0pt,
            outer arc=0pt},
        separator sign={.},
        before upper={\setlength{\parindent}{2em}},% 给所有的环境都设置首行缩进
      },
    defstyle/.style={
        common,
        colframe=main,
        colback=main!5,
        colbacktitle=main,
        overlay unbroken and last={
            \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
              \textcolor{main}{$\clubsuit$}};}},
    thmstyle/.style={
        common,
        colframe=second,
        colback=second!5,
        colbacktitle=second,
        overlay unbroken and last={
            \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
              \textcolor{second}{$\heartsuit$}};}},
    propstyle/.style={
        common,
        colframe=third,
        colback=third!5,
        colbacktitle=third,
        overlay unbroken and last={
            \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
              \textcolor{third}{$\spadesuit$}};}},}
  % \newtcbtheorem[auto counter,number within=chapter]{definition}{\definitionname}{defstyle}{def}
  \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt]{definition}{ g o t\label g }{
    common,defstyle,
    IfValueTF={#1}
      {title={\definitionname~\thetcbcounter\ (#1)}}
      {
        IfValueTF={#2}
          {title={\definitionname~\thetcbcounter\ (#2)}}
          {title=\definitionname~\thetcbcounter}
      },
    IfBooleanTF={#3}{label=#4}{label={def:#4}}}
  % \newtcbtheorem[auto counter,number within=chapter]{theorem}{\theoremname}{thmstyle}{thm}
  \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt]{theorem}{ g o t\label g }{
    common,thmstyle,
    IfValueTF={#1}
      {title={\theoremname~\thetcbcounter\ (#1)}}
      {
        IfValueTF={#2}
          {title={\theoremname~\thetcbcounter\ (#2)}}
          {title=\theoremname~\thetcbcounter}
      },
    IfBooleanTF={#3}{label=#4}{label={thm:#4}}}
  % \newtcbtheorem[auto counter,number within=chapter]{postulate}{\postulatename}{thmstyle}{pos}
  \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt]{postulate}{ g o t\label g }{
    common,thmstyle,
    IfValueTF={#1}
      {title={\postulatename~\thetcbcounter\ (#1)}}
      {
        IfValueTF={#2}
          {title={\postulatename~\thetcbcounter\ (#2)}}
          {title=\postulatename~\thetcbcounter}
      },
    IfBooleanTF={#3}{label=#4}{label={pos:#4}}}
  % \newtcbtheorem[auto counter,number within=chapter]{axiom}{\axiomname}{thmstyle}{axi}
  \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt]{axiom}{ g o t\label g }{
    common,thmstyle,
    IfValueTF={#1}
      {title={\axiomname~\thetcbcounter\ (#1)}}
      {
        IfValueTF={#2}
          {title={\axiomname~\thetcbcounter\ (#2)}}
          {title=\axiomname~\thetcbcounter}
      },
    IfBooleanTF={#3}{label=#4}{label={axi:#4}}}
  % \newtcbtheorem[auto counter,number within=chapter]{corollary}{\corollaryname}{thmstyle}{cor}
  \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt]{corollary}{ g o t\label g }{
    common,thmstyle,
    IfValueTF={#1}
      {title={\corollaryname~\thetcbcounter\ (#1)}}
      {
        IfValueTF={#2}
          {title={\corollaryname~\thetcbcounter\ (#2)}}
          {title=\corollaryname~\thetcbcounter}
      },
    IfBooleanTF={#3}{label=#4}{label={cor:#4}}}
  % \newtcbtheorem[auto counter,number within=chapter]{lemma}{\lemmaname}{thmstyle}{lem}
  \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt]{lemma}{ g o t\label g }{
    common,thmstyle,
    IfValueTF={#1}
      {title={\lemmaname~\thetcbcounter\ (#1)}}
      {
        IfValueTF={#2}
          {title={\lemmaname~\thetcbcounter\ (#2)}}
          {title=\lemmaname~\thetcbcounter}
      },
    IfBooleanTF={#3}{label=#4}{label={lem:#4}}}
  % \newtcbtheorem[auto counter,number within=chapter]{proposition}{\propositionname}{propstyle}{pro}
  \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt]{proposition}{ g o t\label g }{
    common,propstyle,
    IfValueTF={#1}
      {title={\propositionname~\thetcbcounter\ (#1)}}
      {
        IfValueTF={#2}
          {title={\propositionname~\thetcbcounter\ (#2)}}
          {title=\propositionname~\thetcbcounter}
      },
    IfBooleanTF={#3}{label=#4}{label={pro:#4}}}


}{\relax}




\ifdefstring{\ELEGANT@mode}{simple}{
  \let\openbox\relax
  \RequirePackage{amsthm}
  \let\proof\relax
  % \let\proofname\relax
  \let\endproof\relax

  % declare a new theorem style
  \newtheoremstyle{defstyle}{3pt}{3pt}{\citshape}{-3pt}{
    \bfseries\color{main}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
  \newtheoremstyle{thmstyle}{3pt}{3pt}{\citshape}{-3pt}{
    \bfseries\color{second}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
  \newtheoremstyle{prostyle}{3pt}{3pt}{\citshape}{-3pt}{
    \bfseries\color{third}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}


  \theoremstyle{defstyle} % definition style
  \newtheorem{definition}{\definitionname}[\ELEGANT@thmcnt]

  \theoremstyle{thmstyle} %theorem style
  \newtheorem{theorem}{\theoremname}[\ELEGANT@thmcnt]
  \newtheorem{lemma}{\lemmaname}[\ELEGANT@thmcnt]
  \newtheorem{corollary}{\corollaryname}[\ELEGANT@thmcnt]
  \newtheorem{postulate}{\postulatename}[\ELEGANT@thmcnt]
  \newtheorem{axiom}{\axiomname}[\ELEGANT@thmcnt]

  \theoremstyle{prostyle} % proposition style
  \newtheorem{proposition}{\propositionname}[\ELEGANT@thmcnt]

}{\relax}

% 自定义环境颜色
\definecolor{mightguycolor}{RGB}{64, 111, 77}
\definecolor{hashiramacolor}{RGB}{255,0,0}
\definecolor{tobiramacolor}{RGB}{169, 166, 171}
\definecolor{madaracolor}{RGB}{68, 89, 210}
\definecolor{mightguycolor}{RGB}{64, 111, 77}
\definecolor{talkcolor}{RGB}{34, 139, 34}
\definecolor{cqqcolor}{RGB}{252, 194, 0}
\definecolor{whitehatcolor}{RGB}{220,220,220}
\definecolor{bluespaceprojekt}{RGB}{100, 149, 237}
\definecolor{outsiderbackgroundcolor}{RGB}{50, 39, 27}
\definecolor{outsidertextcolor}{RGB}{245, 245, 220}

% 自定义的环境
\newcommand{\createMyColorEnv}[5]{
  \ifdefstring{\ELEGANT@mode}{fancy}{
    \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt]{#1}{ g o t\label g }{
      common,propstyle,
      IfValueTF={##1}
        {title={#2~\thetcbcounter\ (##1)}}
        {
          IfValueTF={##2}
            {title={#2~\thetcbcounter\ (##2)}}
            {title=#2~\thetcbcounter}
        },
      IfBooleanTF={##3}{label=##4}{label={might:##4}},
      colframe=#3, % 设置边框颜色
      colback=#3!10, % 设置背景颜色
      colbacktitle=#3, % 设置标题背景颜色
      fontupper=\songti,
      overlay unbroken and last={
          \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
            \textcolor{#3}{#4}};}
    }}{\relax}

  \ifdefstring{\ELEGANT@mode}{simple}{
    \theoremstyle{mightstyle} % proposition style
    \newtheorem{#1}{#2}[\ELEGANT@thmcnt]
  }
}

% 使用函数来设置自定义环境，更改自 prostyle 环境。
% 第一项是源码环境名称、第二项是显示出来的环境名字、第三个是环境颜色
% 第四项是右下角填充的小图案，分为$\clubsuit$，$\heartsuit$，$\spadesuit$，三种图案，后续可能会增加。
% 第五项是计数器，不同的环境应该使用不同的计数器免得自动编号互相影响
\createMyColorEnv{madara}{宇智波斑}{madaracolor}{$\clubsuit$}{mad}
\createMyColorEnv{outsider}{界外魔}{outsider}{$\heartsuit$}{out}
\createMyColorEnv{justtalk}{火影新编}{talkcolor}{$\spadesuit$}{jus}
\createMyColorEnv{hashirama}{千手柱间}{hashiramacolor}{$\clubsuit$}{has}
\createMyColorEnv{tobirama}{千手扉间}{tobiramacolor}{$\heartsuit$}{tob}
\createMyColorEnv{mightguy}{迈特凯}{mightguycolor}{$\spadesuit$}{mig}
\createMyColorEnv{cqq}{CQQ}{cqqcolor}{$\clubsuit$}{cqq}
\createMyColorEnv{whitehat}{白帽}{whitehatcolor}{$\heartsuit$}{whi}

% 设置蓝色空间号的框子
\newtcolorbox[auto counter, number within=section]{bluespace}[1][]{
  reset, % 这一句话可以重置掉所有的预设
  title={\kaishu\scalebox{1.75}{\ding{99} \ding{99}  蓝色空间号
        \ding{99} \ding{99}}}, % 设置标题样式
  colframe=bluespaceprojekt, % 设置边框颜色
  colback=bluespaceprojekt!12!white, % 设置背景颜色
  coltitle=white, % 设置标题颜色
  fontupper=\heiti, % 设置正文字体
  boxed title style={colback=bluespaceprojekt!12!white}, % 设置标题框样式
  boxed title style={boxsep=1ex,sharp corners}, % 设置标题框的边框间距和直角边框
  % overlay unbroken and first={
  %         \node[below right,font=\normalsize,color=red,text width=.8\linewidth]
  %         at (title.north east) {#1}; % 在标题右上角显示自定义文本
  %     },
  halign title=center, % 标题居中
  before upper={\parindent=2em} % 设置首行缩进
}


% main（green-def): example exercise problem solution
% second（orange-thm）: proof note remark  
% third（blue-prop):  assumptions property conclusion custom

%% Example with counter
\newcounter{exam}[chapter]
\setcounter{exam}{0}
\renewcommand{\theexam}{\thechapter.\arabic{exam}}
\newenvironment{example}[1][]{
  \refstepcounter{exam}
  \par\noindent\textbf{\color{main}{\examplename} \theexam #1 }\rmfamily}{
  \par\ignorespacesafterend}

%% Exercise with counter
\newcounter{exer}[chapter]
\setcounter{exer}{0}
\renewcommand{\theexer}{\thechapter.\arabic{exer}}
\newenvironment{exercise}[1][]{
  \refstepcounter{exer}
  \par\noindent\makebox[-3pt][r]{
    \scriptsize\color{red!90}\HandPencilLeft\quad}
  \textbf{\color{main}{\exercisename} \theexer #1 }\rmfamily}{
  \par\ignorespacesafterend}

%% Problem with counter
\newcounter{prob}[chapter]
\setcounter{prob}{0}
\renewcommand{\theprob}{\thechapter.\arabic{prob}}
\newenvironment{problem}[1][]{
  \refstepcounter{prob}
  \par\noindent\textbf{\color{main}{\problemname} \theprob #1 }\rmfamily}{
  \par\ignorespacesafterend}

\newenvironment{note}{
  \par\noindent\makebox[-3pt][r]{
    \scriptsize\color{red!90}\textdbend\quad}
  \textbf{\color{second}\notename} \citshape}{\par}

\newenvironment{proof}{
  \par\noindent\textbf{\color{second}\proofname\;}
  \color{black!90}\cfs}{
  % \hfill$\Box$\quad
  \par}

\newenvironment{solution}{\par\noindent\textbf{\color{main}\solutionname} \citshape}{\par}
\newenvironment{remark}{\noindent\textbf{\color{second}\remarkname}}{\par}
\newenvironment{assumption}{\par\noindent\textbf{\color{third}\assumptionname} \citshape}{\par}
\newenvironment{conclusion}{\par\noindent\textbf{\color{third}\conclusionname} \citshape}{\par}
\newenvironment{property}{\par\noindent\textbf{\color{third}\propertyname} \citshape}{\par}
\newenvironment{custom}[1]{\par\noindent\textbf{\color{third} #1} \citshape}{\par}

\RequirePackage{multicol}
\tcbset{
  introductionsty/.style={
      enhanced,
      breakable,
      colback=structurecolor!10,
      colframe=structurecolor,
      fonttitle=\bfseries,
      colbacktitle=structurecolor,
      fontupper=\citshape,
      attach boxed title to top center={yshift=-3mm,yshifttext=-1mm},
      boxrule=0pt,
      toprule=0.5pt,
      bottomrule=0.5pt,
      top=8pt,
      before skip=8pt,
      sharp corners
    },
}

\newenvironment{introduction}[1][\introductionname]{
  \begin{tcolorbox}[introductionsty,title={#1}]
    \begin{multicols}{2}
      \begin{itemize}[label=\textcolor{structurecolor}{\upshape\scriptsize\SquareShadowBottomRight}]}{
      \end{itemize}
    \end{multicols}
  \end{tcolorbox}}

\RequirePackage{adforn}

\newenvironment{problemset}[1][\xchaptertitle~\exercisename]{
  \vspace*{10pt}
  \begin{center}
    \phantomsection\addcontentsline{toc}{section}{\texorpdfstring{\xchaptertitle~\exercisename}{\exercisename}}
    % \markboth{#1}{\rightmark}
    \markright{#1}
    \textcolor{structurecolor}{\Large\bfseries\adftripleflourishleft~#1~\adftripleflourishright}
  \end{center}
  \begin{enumerate}}{
  \end{enumerate}}

\def\relsec{\endgroup start}
\def\endrelsec{end\begingroup\def \@currenvir {relsec}}

\ifdefstring{\ELEGANT@result}{noanswer}{
  \AtBeginDocument{
    \excludecomment{solution}
    \excludecomment{proof}
    \excludecomment{inline}
  }
}{\relax}


%页眉页脚
\RequirePackage{fancyhdr}
\fancyhf{}


\fancyfoot[c]{\color{structurecolor}\small\thepage}
\if@twoside
  \fancyhead[EL]{\color{structurecolor}\cnormal\leftmark}
  \fancyhead[OR]{\color{structurecolor}\cnormal\rightmark}
\else
  \fancyhead[R]{\color{structurecolor}\cnormal\rightmark}
\fi

\renewcommand{\headrule}{\color{structurecolor}\hrule width\textwidth}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{1pt}
% \renewcommand{\headrule}{}
\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}\renewcommand{\headrule}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\, #1}{}}
\renewcommand{\chaptermark}[1]{\markboth{\xchaptertitle\, #1}{}}


\renewcommand*{\maketitle}{%
  \hypersetup{pageanchor=false}
  \pagenumbering{Alph}
  \begin{titlepage}
    \newgeometry{margin = 0in}
    \parindent=0pt
    \ifdefstring{\ELEGANT@device}{normal}{
      \ifcsname @cover\endcsname
        \includegraphics[width=\linewidth]{\@cover}
      \else
        \includegraphics[width=\linewidth]{example-image}
      \fi
    }{\relax}
    \ifdefstring{\ELEGANT@device}{pad}{
      \ifcsname @cover\endcsname
        \includegraphics[trim=0 26bp 0 26bp,clip=true, width=\linewidth]{\@cover}
      \else
        \includegraphics[trim=0 26bp 0 26bp,clip=true, width=\linewidth]{example-image}
      \fi
    }{\relax}
    \setlength{\fboxsep}{0pt}
    \colorbox{coverlinecolor}{\makebox[\linewidth][c]{\shortstack[c]{\vspace{0.5in}}}}
    \vfill
    \vskip-2ex
    \hspace{2em}
    \parbox{0.8\textwidth}{
      \bfseries\Huge
      \ifcsname @title\endcsname \@title \fi
      \par}
    \vfill
    \vspace{-1.0cm}
    \setstretch{2.5}
    \hspace{2.5em}
    \begin{minipage}[c]{0.67\linewidth}
      {\color{darkgray}\bfseries\Large
        \ifcsname @subtitle\endcsname\@subtitle\\[2ex]\fi}
      \color{gray}\normalsize
      {\renewcommand{\arraystretch}{0.618}
        \begin{tabular}{l}
          % \ifcsname @author\endcsname \authorname \@author\\\fi
          \ifx\@author\empty\else\authorname\cnormal\@author                \\ \fi
          \ifcsname @institute\endcsname \institutename \cnormal\@institute \\ \fi
          % \ifcsname @date\endcsname  \@date\\\fi
          \ifx\@date\empty\else\datename\cnormal\@date                      \\ \fi
          \ifcsname @version\endcsname \cnormal\versionname\@version        \\ \fi
          \ifcsname @bioinfo\endcsname \cnormal\@bioinfo                    \\ \fi
        \end{tabular}}
    \end{minipage}
    \begin{minipage}[c]{0.27\linewidth}
      \begin{tikzpicture}[remember picture,overlay]
        \begin{pgfonlayer}{background}
          \node[opacity=0.8,
            anchor=south east,
            outer sep=0pt,
            inner sep=0pt] at ($(current page.south east) +(-0.8in,1.5in)$) {
            \ifcsname @logo\endcsname\includegraphics[width=4.2cm]{\@logo}\fi};
        \end{pgfonlayer}
      \end{tikzpicture}
    \end{minipage}
    \vfill
    \begin{center}
      \setstretch{1.3}
      \parbox[t]{0.7\textwidth}{\centering \citshape
        \ifcsname @extrainfo\endcsname\@extrainfo\fi}
    \end{center}
    \vfill
  \end{titlepage}
  \restoregeometry
  \thispagestyle{empty}}


\newcommand{\dollar}{\mbox{\textdollar}}

\RequirePackage{listings}
\renewcommand{\ttdefault}{cmtt}
\lstdefinestyle{mystyle}{
  basicstyle=%
  \ttfamily
  \lst@ifdisplaystyle\small\fi
}

\lstset{basicstyle=\ttfamily,style=mystyle,breaklines=true}

\definecolor{lightgrey}{rgb}{0.9,0.9,0.9}
\definecolor{frenchplum}{RGB}{190,20,83}
\lstset{language=[LaTeX]TeX,
  texcsstyle=*\color{winered},
  numbers=none,
  mathescape=false,
  breaklines=true,
  keywordstyle=\color{winered},
  commentstyle=\color{gray},
  emph={elegantpaper,fontenc,fontspec,xeCJK,citestyle,FiraMono,xunicode,figure,fig,image,img,table,itemize,enumerate,ctex,microtype,description,times,booktabs,tabular,PDFLaTeX,XeLaTeX,type1cm,BibTeX,device,color,mode,lang,amsthm,tcolorbox,titlestyle,cite,ctex,listings,base,math,scheme,toc,esint,chinesefont,amsmath,bibstyle,natbib,pgfornament},
  emphstyle={\color{frenchplum}},
  morekeywords={DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKmainfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords,definecolor,extrainfo,logo,cover,subtitle,appendix,chapter,hypersetup,mainmatter,frontmatter,tableofcontents,elegantpar,heiti,kaishu,lstset,pagecolor,zhnumber,marginpar,part,equote,marginnote,bioinfo,datechange,listofchange,lvert,lastpage,songti,heiti,fangsong,setCJKfamilyfont,textbf},
  frame=single,
  tabsize=2,
  rulecolor=\color{structurecolor},
  framerule=0.2pt,
  columns=flexible,
  % backgroundcolor=\color{lightgrey}
}

\newcommand\bmmax{0}
\RequirePackage{bm}

% add the list of change history
\newcommand{\dateinfoline}[2]{
  \noindent\makebox[0pt][r]{%
    \makebox[-3em][r]{%
      \small
      \textbf{\textcolor{structurecolor}{#1}}}\;\;}%
  {\citshape\updatename\ignorespaces#2}}

\newcommand{\datechange}[2]{%
  \noindent{\makebox[\textwidth][r]{\color{structurecolor}\rule{1.15\textwidth}{.4pt}}}
  \dateinfoline{#1}{#2}
  \addcontentsline{dates}{section}{#1 -- #2}}

\newcommand{\listofchanges}{%
  \begingroup
  \renewcommand{\contentsname}{\historyname}
  \let\old@starttoc\@starttoc
  \def\@starttoc##1{
    \old@starttoc{dates}}
  \tableofcontents%
  \endgroup}
% https://tex.stackexchange.com/questions/472931/list-of-all-dates-in-a-document

\newenvironment{change}{
  \begin{enumerate}[label=\small\protect\circled{\arabic*}]}{
  \end{enumerate}}

\addbibresource[location=local]{reference.bib}

\renewcommand\tableofcontents{%
  \hypersetup{linktoc=all, linkcolor=black}
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{\contentsname
    \@mkboth{%
      \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
  \ifdefstring{\ELEGANT@toc}{twocol}{
    \setlength{\columnsep}{2em}
    \begin{multicols}{2}%
      \@starttoc{toc}
    \end{multicols}}{
    \@starttoc{toc}}
  \if@restonecol\twocolumn\fi
  \hypersetup{linkcolor=winered}}


\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
      \hbox{}%
      \thispagestyle{empty}%
      \newpage%
      \if@twocolumn\hbox{}\newpage\fi\fi\fi}


% https://tex.stackexchange.com/questions/56839/chaptername-is-used-even-for-appendix-chapters-in-toc
\usepackage{calc}
\usepackage[titles]{tocloft}
\ifdefstring{\ELEGANT@lang}{cn}{
  \renewcommand{\cftchappresnum}{\beforechap\space}
  \renewcommand{\cftchapaftersnum}{\space\afterchap}
  \setlength{\cftchapnumwidth}{\widthof{\textbf{附录~999}}}
  \g@addto@macro\appendix{%
    \addtocontents{toc}{%
      \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
      \protect\renewcommand{\protect\cftchapaftersnum}{}%
    }%
  }
}{
  \renewcommand{\cftchappresnum}{\chaptername\space}
  \renewcommand{\cftchapaftersnum}{\space}
  \setlength{\cftchapnumwidth}{\widthof{\textbf{Appendix~9}}}
  \g@addto@macro\appendix{%
    \addtocontents{toc}{%
      \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
      \protect\renewcommand{\protect\cftchapaftersnum}{}%
      \setlength{\cftchapnumwidth}{\widthof{\textbf{Appendix~999}}}
    }%
  }
}

% restore the tt default family to lmodern tt family
\renewcommand\ttdefault{lmtt}