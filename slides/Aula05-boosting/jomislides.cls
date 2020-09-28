% Estilo para slides (baseado no estilo da ENSM-SE)
%
% by Jomi
%
% ------------------------------------------------------------------
% ambientes:
% \begin{PartSlide}{title}\end{PartSlide}  
% \begin{Slide}{title}\end{Slide}          
% \begin{Subslide}{subtitle}\end{Subslide} 
% ------------------------------------------------------------------
% comandos:
%
% \SlideHeader{left}{right}          Change the header with a left
%                                    and a right parts
% \SlideFotter{left}{right}          Change the footer with a left
%                                    and a right parts
% \title{...}
% \subtitle{subtitle...}
% \author{...}
% \institution{....}
% \date{...}
% \maketitle                         creates a slide title
%
% \handsout                          formata para imp. em papel
%
% ------------------------------------------------------------------
% Color definitions :
% SlideHeaderColor                   the color of the header
%                                    default = blue
% SlideFooterColor                   the color of the footer
%                                    default = blue
% ------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jomislides}[2002/05/23] 


%
% Required packages
% 
\LoadClass{seminar}

%\usepackage[screen,panelright,code,paneltoc,sectionbreak]{pdfscreen}

\RequirePackage{ifthen}
\RequirePackage{fancybox}
\RequirePackage{color}
\RequirePackage{graphicx}
\RequirePackage{slidesec}
\RequirePackage{url}
\RequirePackage{hyperref}
\RequirePackage{background}
\RequirePackage{pagetrans}
\RequirePackage{pause}
\RequirePackage{enumerate}
\RequirePackage{multicol}
\RequirePackage{tabularx}
\RequirePackage[latin1]{inputenc}
%\RequirePackage{times}
\input{seminar.bug}
\input{seminar.bg2}


\newcommand{\SLIDES@leftheading}{}
\newcommand{\SLIDES@rightheading}{\@date}
\newcommand{\SLIDES@leftfooter}{}
\newcommand{\SLIDES@rightfooter}{\theslide}
\newcommand{\SLIDES@pdftitle}{{\@empty}}
\newcommand{\SLIDES@pdfsubject}{{\@empty}}
\newcommand{\SLIDES@pdfkeywords}{{\@empty}}
\newcommand{\SLIDES@pdfauthor}{{\@empty}}

% pdf bookmarks
\hypersetup{bookmarksopen=true,bookmarksopenlevel=2}


% cores
\hypersetup{colorlinks=true,linkcolor=blue,citecolor=blue,urlcolor=blue}

\definecolor{topcol}{rgb}{1.0,1.0,1.0}
\definecolor{botcol}{rgb}{0.75,0.905,1.0}
\definecolor{medcol}{rgb}{0.90,0.95,1.0}
\definecolor{botcol}{rgb}{1.0,0.905,0.75}
\definecolor{medcol}{rgb}{1.0,0.95,0.90}
% Use following for gradient:
\vpagecolor[topcol]{botcol}
% Use following for solid color:
%\pagecolor{medcol}
\definecolor{mdwblue}{rgb}{0.2,0.2,0.6}
\definecolor{gray}{rgb}{0.7,0.7,0.7}
\definecolor{darkgray}{rgb}{0.1,0.1,0.1}
\definecolor{darkgreen}{rgb}{0.2,0.7,0.2}
% Set default color (used for title, footer, etc.)
%\renewcommand\normalcolor{\color{mdwblue}}

\newcommand{\titleColor}[0]{\color{mdwblue}}
\newcommand{\emphColor}[0]{\color{red}}


% fontes
%\newcommand{\verdana}{\fontencoding{T1}\usefont{T1}{verdana}{m}{n}}
%\newcommand{\comic}{\fontencoding{T1}\usefont{T1}{comic}{m}{n}}
%\newcommand{\comicb}{\fontencoding{T1}\usefont{T1}{comicbd}{m}{n}}
%\newcommand{\trebuc}{\fontencoding{T1}\usefont{T1}{trebuc}{m}{n}}
%\newcommand{\trebucb}{\fontencoding{T1}\usefont{T1}{trebucbd}{m}{n}}
%\newcommand{\monotype}{\fontencoding{T1}\usefont{T1}{monotype}{m}{n}}


%\newcommand{\titlefont}{\comicb}
%\newcommand{\partfont}{\comicb}
%\renewcommand{\normalfont}{\trebuc}
%\newcommand{\emphfont}{\trebucb}

\newcommand{\titlefont}{\sffamily}
\newcommand{\partfont}{\sffamily}
\renewcommand{\normalfont}{\sffamily}
\newcommand{\emphfont}{\sffamily\bf}


\newcommand{\allFontsSF}{
  \renewcommand{\titlefont}{\sffamily}
  \renewcommand{\partfont}{\sffamily}
  \renewcommand{\normalfont}{\sffamily}
  \renewcommand{\emphfont}{\sffamily\bf}
}

% ambientes PartSlide, Slide e SubSlide
\def\theslidepartheading{}

\newcommand{\newpart}[1]{
  \hypertarget{\theslide.-1}{}\pdfbookmark[-1]{#1}{\theslide}
  \gdef\theslidepartheading{#1}}

\newenvironment{PartSlide}[1]{%title
  \begin{slide}
    \SlideHeader{}{}
    \SlideFooter{}{\theslide}
    \newpart{#1}
    \begin{center}
      \Huge{\titleColor\partfont{#1}}
    \end{center}
  }{%
  \end{slide}}

\newenvironment{Slide}[1]{%title
  \begin{slide}
    \hypertarget{\theslide.0}{}\pdfbookmark[0]{#1}{\theslide}
    \slideheading{#1}
  }{%
  \end{slide}}

\newenvironment{Subslide}[1]{%subtitle
  \begin{slide}
    \slidesubheading{#1}
  }{%
  \end{slide}}

\renewcommand{\makeslideheading}[1]{%
   \begin{flushleft}
     {\Large{\titleColor\titlefont{#1}}\vspace{.2cm}}
   \end{flushleft}}




% cabeçalho e rodapé
\newcommand{\SlideHeaderColor}[0]{\color{darkgray}}
\newcommand{\SlideFooterColor}[0]{\color{black}}

\newcommand{\SlideHeader}[2]{%
  \renewcommand{\SLIDES@leftheading}{#1}
  \renewcommand{\SLIDES@rightheading}{#2}}
\newcommand{\SlideFooter}[2]{%
  \renewcommand{\SLIDES@leftfooter}{#1}
  \renewcommand{\SLIDES@rightfooter}{#2}}


% itens
\renewcommand{\labelitemi}{\textcolor{magenta}{$\bullet$}}
\renewcommand{\labelitemii}{\textcolor{magenta}{$\star$}}
\renewcommand{\labelitemiii}{\textcolor{cyan}{$\ast$}}
\renewcommand{\labelitemiv}{\textcolor{cyan}{$\circ$}}

% enfatizado
\renewcommand{\emph}[1]{{\emphColor\emphfont{#1}}}


% início do documento
\RequirePackage{colortbl}
\AtBeginDocument{%
  \normalfont
  \newpagestyle{filets}%
      {\begin{tabularx}{\textwidth}{X l r@{}}
          & {\SlideHeaderColor\textsf{\tiny\SLIDES@leftheading}}
          & {\SlideHeaderColor\textsf{\tiny\SLIDES@rightheading}} \\
          \arrayrulecolor{magenta}\hline
       \end{tabularx}
      }
      {\SlideFooterColor
        \begin{tabularx}{\textwidth}{@{}Xr@{}}
          \arrayrulecolor{magenta}\hline
          \textsf{\tiny\SLIDES@leftfooter} & \textsf{\tiny\SLIDES@rightfooter}
        \end{tabularx}
      }
    
  \slideframe{none}
  \slidepagestyle{filets}
  \slideclearpagetrue
}

%
% para impressão
%
\newcommand{\handsout}[0]{%
  \allFontsSF
  \vpagecolor[white]{white}
  \renewcommand{\pause}[0]{}
  \renewcommand{\titleColor}[0]{\color{black}}
  \renewcommand{\emphColor}[0]{\color{black}}
  \hypersetup{colorlinks=false}
}

\IfFileExists{.handsout}{\handsout}{}


% maketitle
%
\def\institution#1{\gdef\@institution{#1}}
\def\subtitle#1{\gdef\@subtitle{#1}}


\renewcommand{\maketitle}{
  \begin{slide}
    \SlideFooter{}{}
    \SlideHeader{}{}
    \gdef\theslidepartheading{\@title}

  \begin{center}
    \hypertarget{\theslide.-1}{}\pdfbookmark[-1]{\@title}{\theslide}
    {\Large{\titleColor\emphfont{\textbf{\@title}}}}

    {\normalsize{\@subtitle}}

    \vspace{\stretch{1}}
    {\large{\@author}}

    %\vspace{\stretch{2}}
    {\normalsize{\@institution}}
    
    \vspace{\stretch{2}}
    \vspace{1cm}{\small\@date}
  \end{center}
  \end{slide}

  \hypersetup{pdftitle=\@title,pdfauthor=\@author}
  \hypersetup{pdfcreator={\LaTeX\ with package \flqq jomislides\frqq}}
}


