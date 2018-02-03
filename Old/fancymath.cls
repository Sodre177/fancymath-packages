%A stylesheet for writing fancy assignments, course notes, thesis, etc with mathematics.
%Integrates with the comcom package
%Written by Adam Walsh

%Included for history and reference, do not use.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fancymath}
	      [2016/03/23 v1.0
	       Fancy mathematics document class]

%Based on the article document class
\LoadClass{article}

%Required packages for the stuff constructed in the class itself
\RequirePackage{fancyhdr}
\RequirePackage{ifthen}
\RequirePackage{mathtools}
\RequirePackage{geometry}
\RequirePackage[usenames,dvipsnames]{color}
\RequirePackage{calc}
\RequirePackage{textcomp}
\RequirePackage{graphicx}
\RequirePackage{verbatim}
\RequirePackage{caption}











% Set the page style
\pagestyle{fancy}

%remove the default style
\fancyhead{}
\fancyfoot{}

\newcommand{\assignnum}{}
\newcommand{\coursenum}{}
\newcommand{\coursetitle}{}
\newcommand{\anum}[1]{\renewcommand{\assignnum}{#1}}
\newcommand{\ctitle}[1]{\renewcommand{\coursetitle}{#1}}
\newcommand{\cnum}[1]{\renewcommand{\coursenum}{#1}}

%Set the page geometry
 \geometry{
 a4paper,
 left=20mm,
 right=20mm,
 top=20mm,
 bottom=20mm,
 heightrounded,
 }
%Set header/footer styles
\fancyfoot[L]{\color{Blue}Adam Walsh, \today}
\fancyfoot[C]{\color{Blue}\thepage}
\fancyfoot[R]{\color{Blue}Assignment \assignnum}
\fancyhead[L]{\color{Green}\coursenum{} -- \coursetitle}
\fancyhead[R]{\color{Brown}\thepage}
\renewcommand{\headrule}{\color{Brown}\vbox to 0pt{\hbox to\headwidth{\hrulefill}\vss}}

%\set the line spacing
\renewcommand{\baselinestretch }{1.3}
\headheight=21pt

\setlength\parindent{0pt}

%question counter
\newcounter{quest}
\newcounter{qa}

%Accessibility things
\newcommand{\qnum}[1]{\setcounter{quest}{#1}}

%proof counter


%The maketitle data
\author{\color{Brown}Adam Walsh, Student 44267245}
\title{\color{Brown}\coursenum{} -- Assignment \assignnum}
\date{\color{Brown}\today}



%flags
\newcounter{qflag}
\newcounter{aflag}
\newenvironment{qanda}{\setcounter{quest}{1}\setcounter{qflag}{0}\setcounter{aflag}{1}\stepcounter{qa}}{\setcounter{qa}{0}}


%Make the question and answer formats, whilst checking whether no two questions or answers are grouped together.
\newcommand{\quest}{\setcounter{qflag}{1}\ifthenelse{\value{aflag}=0}{ERROR}{}\setcounter{aflag}{0} \color{white}
.\newline.\color{black}\newline\begin{sloppy}\color{Gray}\!\!\!\!\!\!\!\!\!\!\!\!\!\!Question 
\arabic{quest}\color{black}\newline\end{sloppy}}
\newcommand{\question}{\quest}

\newcommand{\answer}{\fnewline\fnewline\setcounter{aflag}{1}\ifthenelse{\value{qflag}=0}{ERROR}{}\setcounter{qflag}{0} 
\begin{sloppy}\color{Gray}\!\!\!\!\!\!\!\!\!\!\!\!\!\!Answer 
\arabic{quest}\color{black}\addtocounter{quest}{1}\newline\end{sloppy}}

%Set the style of the enum counters
\renewcommand{\theenumi}{\alph{enumi}}
\renewcommand{\theenumii}{\alph{enumii}}
\renewcommand{\theenumiii}{\alph{enumiii}}

%Set the style of the question numbers
\renewcommand{\labelenumi}{\color{Brown}(\theenumi)\color{black}}
\renewcommand{\labelenumii}{\color{Brown}(\theenumii)\color{black}\newline}

\renewenvironment{indent}%
{\begin{list}{}%
				 {\setlength{\topsep}{0pt}}%
				 {\setlength{\parsep}{0pt}}%
         {\setlength{\leftmargin}{0em}}%
         {\setlength{\parskip}{0pt}}%
         {\setlength{\partopsep}{0pt}}%
         {\setlength{\itemsep}{0pt}}%
         \item[]%
}
{\end{list}}
