\ProvidesClass{customclass}[2024/09/12 Custom Class]

% Load the ctexart class
\LoadClass[UTF8]{ctexart}

% 导入所需的包
\RequirePackage{amsmath, amsthm, amssymb, amsfonts}
\RequirePackage{thmtools}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{geometry}
\RequirePackage{float}
\RequirePackage[english]{babel}
\RequirePackage{framed}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage[many]{tcolorbox}
\RequirePackage{xeCJK}
\RequirePackage{tikz}
\RequirePackage{indentfirst}
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\RequirePackage{enumitem}
\RequirePackage{ifthen}
\RequirePackage{moresize}
\RequirePackage{graphicx}
\RequirePackage{pifont}

% 设置颜色
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

% 自定义命令
\newcommand{\customsf}[2]{%
    \ifthenelse{\equal{#1}{bold}}{\textbf{\textsf{#2}}}{\textsf{#2}}%
}

% 段落首行缩进
\setlength{\parindent}{2em}

% 设置一个自定义命令，被用于设置封面的字体划线
\newcommand{\HRule}[1]{\rule{\linewidth}{#1}}

% 将引用里面的section 更改为章节，免得出戏
\crefname{section}{章节}{章节}

% 设置默认文本框格式
\tcbset{
    colframe=magenta,
    colback=magenta!12!white,
    boxed title style={colback=magenta},
    breakable,
    enhanced,
    sharp corners,
    boxsep=1pt,
    attach boxed title to top left={yshift=-\tcboxedtitleheight,  yshifttext=-.75\baselineskip},
    boxed title style={boxsep=1pt,sharp corners},
    fonttitle=\bfseries\sffamily,
    drop lifted shadow
}

% 定义一个新的计数器
\newcounter{mytcbcounter}[section]
\renewcommand{\themytcbcounter}{\thesection.\arabic{mytcbcounter}}

\newcommand{\customtcolorbox}[4][]{%
    \newtcolorbox[use counter=mytcbcounter, number within=section, number format=\arabic,#1]{#2}[1][]{
        title={#3~\themytcbcounter},
        colframe=#4,
        colback=#4!12!white,
        boxed title style={colback=#4},
        overlay unbroken and first={
                \node[below right,font=\small,color=#4,text width=.8\linewidth]
                at (title.north east) {##1};
            },
        fontupper=\color{black},
        before skip=8pt,
        after skip=8pt,
        before upper={\parindent=2em}
    }
}

% 使用通用命令创建不同的 tcolorbox 环境
\customtcolorbox{madara}{宇智波斑}{madaracolor}
\customtcolorbox{outsider}{界外魔}{outsiderbackgroundcolor}
\customtcolorbox{justtalk}{火影新编}{talkcolor}
\customtcolorbox{hashirama}{千手柱间}{hashiramacolor}
\customtcolorbox{tobirama}{千手扉间}{tobiramacolor}
\customtcolorbox{mightguy}{迈特凯}{mightguycolor}
\customtcolorbox{cqq}{CQQ}{cqqcolor}
\customtcolorbox{whitehat}{白帽}{whitehatcolor}

\newtcolorbox{remark}[1][]{
    title={\scalebox{1.75}{\raisebox{-.25ex}{\ding{43}}}~Remark},
    colframe=yellow!45!white,
    colback=yellow!45!white,
    coltitle=Red,
    fontupper=\sffamily,
    boxed title style={colback=yellow!45!white},
    boxed title style={boxsep=1ex,sharp corners},%%
    overlay unbroken and first={
            \node[below right,font=\normalsize,color=red,text width=.8\linewidth]
            at (title.north east) {#1};
        }
}

\newtcolorbox{note}[1][]{
    title={\scalebox{1.75}{\raisebox{-0.1ex}{\ding{45}}}~Note},
    colframe=yellow!45!white,
    colback=yellow!45!white,
    coltitle=Red,
    fonttitle=\bfseries\sffamily,
    % fontupper=\frfamily,
    boxed title style={colback=yellow!45!white},
    boxed title style={boxsep=1ex,sharp corners},%%
    overlay unbroken and first={
            \node[below right,font=\normalsize,color=red,text width=.8\linewidth]
            at (title.north east) {#1};
        }
}

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

% 设置文字行距，免得过于拥挤
\setstretch{1.2}

% 设置文字占用页面比例，免得页面过空
\geometry{
    textwidth=5.5in,
    top=1in,
    bottom=0.7in,
    headheight=12pt,
    headsep=25pt,
    footskip=30pt
}
