%%Identification
%%The class identifies itself and the LaTeX version needed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exampaper}[2026/11/17 Example LaTeX Exam Paper class]

% Preliminary defintitions, needed ny the options
\newcommand{\headlinecolor}{\normalcolor}
\RequirePackage{xcolor}
\definecolor{slcolor}{HTML}{882B21}

\RequirePackage[scaled=0.92]{helvet}
\renewcommand{\familydefault}{\sfdefault} % Make sans-serif (Helvetica/Arial) default


% This part handles the optionspassed to the class
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{green}{\renewcommand{\headlinecolor}{\color{green}}}
\DeclareOption{red}{\renewcommand{\headlinecolor}{\color{slcolor}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[twocolumn]{article}

% Body of the class.
% Most of the declarations appear here.
% For a start, let us redefine the maletitle function
\renewcommand{\maketitle}
{
\input{paperDetails}
\onecolumn
\begin{center} {\Huge\bfseries \MakeUppercase{Technological University Dublin}\par} \end{center}
\begin{center} {\Large\bfseries \MakeUppercase{\@campus}\par} \end{center}
\begin{center} {\Huge\bfseries \@programmeTitle\par} \end{center}
\begin{center} {\Large\bfseries \@programmeCode\par} \end{center}
\begin{center} {\Large\bfseries \@moduleCode\par} \end{center}
\begin{center} {\Large\bfseries \@moduleTitle\par} \end{center}
}

% in .cls 
\def\@campus{} 
\newcommand{\campus}[1]{% 
\gdef\@campus{#1}%
}

\def\@programmeCode{} 
\newcommand{\programmeCode}[1]{% i
\gdef\@programmeCode{#1}%
}

\def\@programmeTitle{} 
\newcommand{\programmeTitle}[1]{% i
\gdef\@programmeTitle{#1}%
}

\def\@moduleTitle{} 
\newcommand{\moduleTitle}[1]{% i
\gdef\@moduleTitle{#1}%
}

\def\@moduleCode{} 
\newcommand{\moduleCode}[1]{% i
\gdef\@moduleCode{#1}%
}