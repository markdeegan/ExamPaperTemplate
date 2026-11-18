%%Identification
%%The class identifies itself and the LaTeX version needed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exampaper}[2026/11/17 Example LaTeX Exam Paper class]

% Preliminary defintitions, needed ny the options
\newcommand{\headlinecolor}{\normalcolor}
\RequirePackage{xcolor}
\definecolor{slcolor}{HTML}{882B21}

% we want headers and footers
\RequirePackage{fancyhdr}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% switch font to Helvetica, which looks like Arial
\RequirePackage[scaled=0.92]{helvet}
\renewcommand{\familydefault}{\sfdefault} % Make sans-serif (Helvetica/Arial) default

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{transparent}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set the watermark,
% TODO, make this optional,controlled with a switch
\RequirePackage[printwatermark]{xwatermark}
\newwatermark*[allpages,color=red!25,angle=45,scale=4,xpos=0,ypos=0]{\texttransparent{0.3}{SOLUTIONS}}

\newif\ifsolutions 
\solutionsfalse 
\DeclareOption{solutions}{% 
\solutionstrue } 
\ProcessOptions\relax

% This part handles the optionspassed to the class
\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%define the header style for the title page
\fancypagestyle{coverpage}{
\fancyhf{} % clear ALL header and footer fields 
\fancyhead[R]{
\mdseries Programme Code: \bfseries \@programmeCode\\
\mdseries Shared With: \bfseries \@programmeCode\\
\mdseries Module Code: \bfseries \@moduleCode\\
\mdseries CRN: \bfseries \@moduleCode}
\mdseries
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt} 
} % end defintiion ot the header for the title page

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% define the header style for main pages
\fancypagestyle{mainpages}
{ \fancyhf{} % clear everything 
% Footer i
\fancyfoot[C]{\thepage} 
% Optional header 
\fancyhead[R]{\@moduleCode: \@moduleTitle} 
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.4pt} 
} % end definition of the header style for non-title pages

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% define a new command to create a horizontal rule of given dimensions
\newcommand{\sectiondivider}{%
    \par\medskip
    \centerline{\rule{0.3\linewidth}{0.4pt}}
    \medskip
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{geometry}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Body of the class.
% Most of the declarations appear here.
% For a start, let us redefine the maletitle function
\renewcommand{\maketitle}
{
\input{paperDetails}
\onecolumn
% hide page numbering and reset page numbers
\pagestyle{coverpage}
\newgeometry{left=1cm, right=1cm}
% give the header some space
\setlength{\headheight}{50pt} 
% separate the main text (title) from the header
\setlength{\headsep}{20pt}

\begin{center} {\Huge\bfseries \MakeUppercase{Technological University Dublin}\par} \end{center}
\begin{center} {\Large\bfseries \MakeUppercase{\@campus}\par} \end{center}
\begin{center} {\Huge\bfseries \@programmeTitle\par} \end{center}
\begin{center} {\Large\bfseries \@programmeYear\par} \end{center}
\sectiondivider
\begin{center} {\Large\bfseries \@semester\par} \end{center}
\begin{center} {\Large\bfseries EXAMINATIONS \@academicYear\par} \end{center}
\sectiondivider
\begin{center} {\Huge\bfseries \@moduleTitle\par} \end{center}
\begin{center} {\Large \@internalExaminers\par} \end{center}
\begin{center} {\Large \@externalExaminers\par} \end{center}
\begin{center} {\Large\bfseries Exam Duration: \@examDuration\par} \end{center}
\restoregeometry
% force new page at end of title page
\clearpage
% set page numbering to arabic, 1,2,3
\pagenumbering{arabic}
\pagestyle{mainpages}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@campus{City Campus}
\ProcessOptions\relax
\newcommand{\campus}[1]{% 
\gdef\@campus{#1}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@programmeCode{} 
\newcommand{\programmeCode}[1]{% i
\gdef\@programmeCode{#1}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@programmeTitle{} 
\newcommand{\programmeTitle}[1]{% i
\gdef\@programmeTitle{#1}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@moduleTitle{} 
\newcommand{\moduleTitle}[1]{% i
\gdef\@moduleTitle{#1}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@programmeYear{Specify Programme Year} 
\newcommand{\programmeYear}[1]{% i
\gdef\@programmeYear{#1}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@moduleCode{} 
\newcommand{\moduleCode}[1]{% i
\gdef\@moduleCode{#1}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@instructions{Answer 4 Questions\\All questions carry equal marks}
\newcommand{\instructions}[1]{% i
\gdef\@instructions{#1}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@academicYear{2026/27}
\newcommand{\academicYear}[1]{% i
\gdef\@academicYear{#1}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@semester{Semester 1}
\newcommand{\semester}[1]{% i
\gdef\@semester{#1}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@examDuration{2 Hours}
\newcommand{\examDuration}[1]{% i
\gdef\@examDuration{#1}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@internalExaminers{}
\newcommand{\internalExaminers}[1]{% i
\gdef\@internalExaminers{#1}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@externalExaminers{}
\newcommand{\externalExaminers}[1]{% i
\gdef\@externalExaminers{#1}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Counters, numbering styles Questions, Sub-Questions etc.
\newcounter{question} 
\newcounter{questionpart}[question] 
\renewcommand{\thequestion}{\arabic{question}} 
\renewcommand{\thequestionpart}{\alph{questionpart}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{xparse}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NewDocumentCommand{\question}{m}{% 
\refstepcounter{question}% 
\setcounter{questionpart}{0}% 
\section*{Question \thequestion\quad #1}% 
} 

\NewDocumentCommand{\questionpart}{m}{% 
\refstepcounter{questionpart}% 
\subsection*{(\thequestionpart)\quad #1}% 
}

\NewDocumentCommand{\exammarks}{m}{% 
\unskip\nobreak 
\hfill \mbox{[#1~\ifnum#1=1 mark\else marks\fi]}% 
}

\RequirePackage{comment} 
\ifsolutions 
\NewDocumentEnvironment{answer}{}{% 
\par\smallskip 
\noindent\textbf{Answer} 
\par\smallskip 
}
{% 
\par\medskip
} 
\else 
\excludecomment{answer} 
\fi