% The UoO Sciences Division exam class for LaTeX.
%---------------------------------------------------------------------
% Identifications
%---------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
%\ProvidesClass{otagoexam}[2005/01/01 UoO Physics Exam v0.1, by mdbarrett]
%\ProvidesClass{otagoexam}[2012/05/06 UoO Physics Exams v0.2, by Jevon]
%\ProvidesClass{otagoexam}[2023/04/05 UoO Sciences Exams v0.3, by lechszym]
%\ProvidesClass{otagoexam}[2023/05/01 UoO Sciences Exams v0.4, by lechszym]
%\ProvidesClass{otagoexam}[2023/09/04 UoO Sciences Exams v0.5, by lechszym]
\ProvidesClass{otagoexam}[2024/03/21 UoO Sciences Exams v0.6, by lechszym]
%---------------------------------------------------------------------
% Initial Code
%----------------------------------------------------------
\RequirePackage{ifthen}

%-----------
% (none)
%---------------------------------------------------------------------
% Option declaration
%---------------------------------------------------------------------
\newcommand{\@examptsize}{12pt}
\DeclareOption{10pt}{\renewcommand{\@examptsize}{10pt}}
\DeclareOption{11pt}{\renewcommand{\@examptsize}{11pt}}
\DeclareOption{12pt}{}

\newcommand{\studentid}{}
\newcommand{\otherinstructionsdefault}{Nil}
\newcommand{\otherinstructionsmcq}{Hand in MCQ answer sheet attached to green attendance receipt}
\newcommand{\otherinstructionsansbookmcq}{Hand in MCQ answer sheet attached to answer book(s)}
\newcommand{\otherinstructionsonexam}{Hand in entire exam paper attached to green attendance receipt}
\newcommand{\otherinstructionsonpinkexam}{Hand in pink section of exam paper attached to green attendance receipt}
\newcommand{\otherinstructionsmcqroughwork}{Hand in MCQ answer sheet attached to green attendance receipt and answer book (rough work only)}
\newcommand{\otherinstructionsonexamroughwork}{Hand in entire exam paper attached to green attendance receipt and answer book (rough work only)}
\newcommand{\otherinstructionsonpinkexamroughwork}{Hand in pink section of exam paper attached to green attendance receipt and answer book (rough work only)}
\newcommand{\otherinstructionsansbookafour}{Hand in A4 leaflets (rough work only) attached to answer book(s)}
\newcommand{\otherinstructionsmcqafour}{Hand in MCQ answer sheet attached to green attendance receipt and A4 leaflets (rough work only)}
\newcommand{\otherinstructionsonexamafour}{Hand in entire exam paper attached to green attendance receipt and A4 leaflets (rough work only)}
\newcommand{\otherinstructionsonpinkexamafour}{Hand in pink section of exam paper attached to green attendance receipt and A4 leaflets (rough work only)}

\newboolean{embargoed}

\DeclareOption{embargoed}{\renewcommand{\studentid}{Student ID: \rule{4cm}{0.15mm}}
\renewcommand{\otherinstructionsdefault}{Hand in entire exam attached to answer book(s)}
\renewcommand{\otherinstructionsmcq}{Hand in entire exam paper attached to MCQ answer sheet and green attendance receipt}
\renewcommand{\otherinstructionsansbookmcq}{Hand in entire exam attached to MCQ answer sheet and answer book(s)}
\renewcommand{\otherinstructionsmcqroughwork}{Hand in entire exam paper attached to MCQ answer sheet and green attendance receipt and answer book (rough work only)}
\renewcommand{\otherinstructionsansbookafour}{Hand in entire exam attached to answer books(s) and A4 leaflets (rough work only)}
\renewcommand{\otherinstructionsmcqafour}{Hand in entire exam paper attached to MCQ answer sheet and green attendance receipt and A4 leaflets (rough work only)}

\setboolean{embargoed}{true}
}

\newboolean{answers}
\DeclareOption{answers}{
\setboolean{answers}{true}
}

\newboolean{dev}
\DeclareOption{dev}{
\setboolean{dev}{true}
}

\newboolean{marginnote}
\DeclareOption{marginnote}{
\setboolean{marginnote}{true}
}

%\newboolean{manualpagebreaks}
%\DeclareOption{manualpagebreaks}{
%\setboolean{manualpagebreaks}{true}
%}


%---------------------------------------------------------------------
% Option execution
%---------------------------------------------------------------------
\ProcessOptions
%---------------------------------------------------------------------
% Package Loading
%---------------------------------------------------------------------
\LoadClass[a4paper,\@examptsize]{article}
\RequirePackage{float}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath}
\RequirePackage{bm}
\RequirePackage{revsymb}
\RequirePackage{lastpage}
\RequirePackage{mathptmx}
\RequirePackage{afterpage}
\RequirePackage{changepage}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{totcount}
\RequirePackage{minipage-marginpar}

\ifthenelse{\boolean{marginnote}}{\RequirePackage{marginnote}}{}
\ifthenelse{\boolean{dev}}{\RequirePackage{showframe}}{}

%---------------------------------------------------------------------
% Main Code
%---------------------------------------------------------------------
% Commands for use in the preamble:
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\papercode}[1]{\renewcommand{\@papercode}{#1}}
\newcommand{\papertitle}[1]{\renewcommand{\@papertitle}{#1}}
\newcommand{\paperyear}[1]{\renewcommand{\@paperyear}{#1}}
\newcommand{\timelimit}[1]{\renewcommand{\@timelimit}{#1}}
\newcommand{\semester}[1]{\renewcommand{\@semester}{#1}}
\newcommand{\instructions}[1]{\renewcommand{\@instructions}{#1}}
\newcommand{\providedmaterial}[1]{\renewcommand{\@providedmaterial}{#1}}
\newcommand{\permittedmaterial}[1]{\renewcommand{\@permittedmaterial}{#1}}
\newcommand{\embargoinstructions}[1]{{}}
\newcommand{\otherinstructions}[2][ansbook]{\renewcommand{\@otherinstructions}{

    \ifthenelse{\equal{#1}{ansbook}}{%
	\ifthenelse{\equal{#2}{}}{%
	        \otherinstructionsdefault{}%
 	}{%

        	 }%
    }{%
        \ifthenelse{\equal{#1}{mcq}}{%
            \otherinstructionsmcq{}%
        }{%
             \ifthenelse{\equal{#1}{ansbook+mcq}}{%
           	 \otherinstructionsansbookmcq{}%
       	      }{%
		 \ifthenelse{\equal{#1}{onexam}}{%
           	     \otherinstructionsonexam{}%
	 	 }{%
		   \ifthenelse{\equal{#1}{onpinkexam}}{%
           	     	 \otherinstructionsonpinkexam{}%
	 	   }{%
   		     \ifthenelse{\equal{#1}{mcq+roughwork}}{%
           	     	  \otherinstructionsmcqroughwork{}%
	 	     }{%
   		       \ifthenelse{\equal{#1}{onexam+roughwork}}{%
             	     	    \otherinstructionsonexamroughwork{}%
 	 	       }{%
            	          \ifthenelse{\equal{#1}{onpinkexam+roughwork}}{%
             	     	       \otherinstructionsonpinkexamroughwork{}%
 	 	           }{%
	            	      \ifthenelse{\equal{#1}{ansbook+a4}}{%
             	     	          \otherinstructionsansbookafour{}%
 	 	               }{%
            	               	 \ifthenelse{\equal{#1}{mcq+a4}}{%
             	     	             \otherinstructionsmcqafour{}%
 	 	              	 }{%
            	               	    \ifthenelse{\equal{#1}{onexam+a4}}{%
             	     	                \otherinstructionsonexamafour{}%
 	 	              	    }{%
	            	                \ifthenelse{\equal{#1}{onpinkexam+a4}}{%
             	     	                   \otherinstructionsonpinkexamafour{}%
 	 	              	        }{%
            	               	          \vspace{-0.1cm}%
        	                       	        }% 
        	                       	    }% 
		           	  }%
        	                       }%
        	                    }%
        	                }%
        	              }%
        	            }%
        	          }%
        	      }%
        }%
    }%
\\\\#2}}
\newcommand{\calculators}[1]{\renewcommand{\@calculators}{#1}}

\setlength{\parindent}{0cm}
\setlength{\oddsidemargin}{0cm}
\setlength{\marginparwidth}{1.5cm}
\setlength{\textwidth}{16cm}
\setlength{\fboxsep}{2pt}
\setlength{\topmargin}{-32pt}
\setlength{\headsep}{16pt}
\setlength{\headheight}{16pt}
\setlength{\textheight}{237mm}

%---------------------------------------------------------------------
% Coounter for total marks
%---------------------------------------------------------------------
\newtotcounter{totalmarks}
\setcounter{totalmarks}{0}
\newcommand{\totalmarks}[1]{\ifthenelse{\equal{#1}{}}{\total{totalmarks}}{#1}}

%---------------------------------------------------------------------
% This extremely lengthy definition provides the front-page-making
% command, \maketitle:


\renewcommand{\maketitle}{{\pagestyle{plain}
    \begin{center}
    \textbf{\Large UNIVERSITY OF OTAGO EXAMINATIONS \@paperyear}
    \vspace{18pt}\\
    \framebox{\framebox{\parbox{15.5cm}{\begin{center}
    \vspace{9pt}
    \textbf{\Large \expandafter\MakeUppercase\expandafter{\@department}}\\
    \vspace{18pt}
    \textbf{\large \@papercode}\\
    \vspace{18pt}
    \textbf{\large\@papertitle}\\
    \vspace{18pt}
    \large  \@semester\\
    \vspace{9pt}\end{center}}}}
    \end{center}
    \begin{center}
    \medskip
    \small \textbf{(TIME ALLOWED: \@timelimit)}
    \end{center}
    \normalsize
    \medskip
    \underline{This examination paper comprises \pageref{LastPage}~pages}
    \medskip\\
    \bigskip\\
    \underline{Candidates should answer questions as follows:}
    \begin{center}
    \begin{minipagewithmarginpars}[c]{135mm}
    \@instructions
    \end{minipagewithmarginpars}
    \end{center}
    \medskip
    \underline{The following material is provided:}
    \begin{center}
    \begin{minipage}[c]{135mm}
    \@providedmaterial
    \end{minipage}
    \end{center}
    \medskip
    \underline{Use of calculators:}
    \begin{center}
    \begin{minipage}[c]{135mm}
    \@calculators
    \end{minipage}
    \end{center}
    \medskip
    \underline{Candidates are permitted copies of:}
    \begin{center}
    \begin{minipage}[c]{135mm}
    \@permittedmaterial
    \end{minipage}
    \end{center}
    \medskip
    \underline{Other Instructions:}
    \begin{center}
    \begin{minipage}[c]{135mm}
    \@otherinstructions    
   \end{minipage}
    \end{center}
    \pagebreak}}

%---------------------------------------------------------------------
% The following defines commands, counters and options used only
% internally, and redefines some standard commands.
\newcounter{examquestion}
\newcommand{\@department}{\fbox{\textbf{DEPARTMENT? } use \textbackslash department\{ \}}}
\newcommand{\@papercode}{\fbox{\textbf{PAPER CODE? } use \textbackslash papercode\{ \}}}
\newcommand{\@papertitle}{\fbox{TITLE OF PAPER? use \textbackslash papertitle\{\}}}
\newcommand{\@semester}{\fbox{\textbf{TEACHING PERIOD?} use e.g.\ \textbackslash semester\{Semester One\}}}
\newcommand{\@paperyear}{\fbox{YEAR? use \textbackslash paperyear\{\}}}
\newcommand{\@timelimit}{\fbox{HOURS? use \textbackslash timelimit \{\}}}

\newcommand{\@instructions}{Candidates should answer \textbf{All} questions

\vspace{0.3cm}
Marks are shown thus: \showmarks{2}

\vspace{0.3cm}
The total number of marks for this exam is \totalmarks{}}
\newcommand{\@providedmaterial}{Nil}
\newcommand{\@calculators}{No calculators are permitted}
\newcommand{\@permittedmaterial}{No additional material}
\newcommand{\@otherinstructions}{\otherinstructionsdefault}
\newboolean{needquestionpagebreak}
\newboolean{startedquestionsyet}
\newboolean{donotneedendofpaper}
%---------------------------------------------------------------------
% Set up the page layout:



\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\fancyfoot[R]{
   \ifthenelse{\thepage=\pageref{LastPage}}
   {\textbf{END}}
   {\textbf{TURN OVER}}
 }
 \fancyfoot[C]{ \thepage }
 \fancyhead[R]{\@papercode}


\fancypagestyle{plain}{%
\fancyhf{}
\fancyhead[R]{\studentid}
\fancyfoot[R]{\textbf{TURN OVER}}}

%---------------------------------------------------------------------
% Redefine enumerates to look like 1 (a) (i) etc.
\renewcommand{\labelenumi}{\arabic{enumi}.}
\renewcommand{\labelenumii}{(\alph{enumii})}
\renewcommand{\labelenumiii}{(\roman{enumiii})}

% Format section titles
\renewcommand\thesection{\Alph{section}}
\titleformat{\section}{\fontsize{11}{11}}{}{0cm}{\addul}
\newcommand{\addul}[1]{\underline{Section \Alph{section}\ifthenelse{\equal{#1}{}}{}{: }#1}}

% Add a page break before a new section
\let\oldsection\section
\renewcommand\section{\clearpage\oldsection}

\titlespacing* % starred version: first paragraph is not indented
    {\section} % <command>
    {0cm} % <left>
    {3.5ex plus 1ex minus .2ex} % <before-sep>
    {2.3ex plus .2ex} %

%---------------------------------------------------------------------
% Marks:
%---------------------------------------------------------------------
\newcommand{\showmarks}[1]{\marginpar{(#1)}}
\ifthenelse{\boolean{marginnote}}{
    \renewcommand{\showmarks}[1]{\marginnote{(#1)}}
}{}

\newcommand{\addmarks}[1]{\addtocounter{totalmarks}{#1}\showmarks{#1}}


%---------------------------------------------------------------------
% Definition of the turn over page
%---------------------------------------------------------------------
\newcommand{\turnoverpage}{
    
    \pagebreak
    \checkoddpage

    
    \ifoddpage
      \null
      \thispagestyle{empty}
      \addtocounter{page}{-1}
    \else
    \fi

    \newpage
    \thispagestyle{empty} 
    \addtocounter{page}{-1}
    \fontsize{40}{50}\selectfont
    \begin{center}


      (\@papercode)

      \vspace{2cm}

      PLEASE DO NOT

      \vspace{1cm}

      TURN OVER YOUR

      \vspace{1cm}

      EXAMINATION

      \vspace{1cm}

      PAPER UNTIL

      \vspace{1cm}

      INSTRUCTED TO

      \vspace{1cm}

      DO SO
    \end{center}

    \fontsize{28}{50}\selectfont
    \begin{center}
    \fbox{
    \begin{minipage}{1\textwidth}
    Please check your desk and pockets for   
    unauthorised items including cell phones
    \end{minipage}}
  
    \end{center}

    \rfoot{\fancyplain{}{}}


}

%---------------------------------------------------------------------
% Calculator pre-defines
%---------------------------------------------------------------------
\newcommand{\nocalculators}{
    No calculators are premitted
}

\newcommand{\listA}{
    Calculator models as specified by the University of Otago in List A of approved calculators (scientific calculators)
    \begin{itemize}
        \item Casio FX82
        \item Casio FX100
        \item Sharp EL531
        \item Casio FX570
        \item Casio FX95
        \item Casio FX991
    \end{itemize}
    \medskip
}

\newcommand{\listB}{
    Calculator models as specified by the University of Otago in List B of approved calculators (scientific calculators)
    \begin{itemize}
        \item Casio FX82
        \item Casio FX100
        \item Sharp EL531
        \item Casio FX570
        \item Casio FX991
        \item Casio FX95
        \item Casio FX9750 (Graphing Calculator)
        \item Casio FX9860 (Graphing Calculator)
    \end{itemize}
    \medskip
}

\newcommand{\anymodel}{
    Any model of calculator provided that is battery powered, silent, truly portable and free of communication capabilities
}

%---------------------------------------------------------------------
% Definition of the question environment
%---------------------------------------------------------------------

\newenvironment{question}
  {
    \enumerate[align=left, leftmargin=*, labelindent=\parindent, listparindent=\parindent, labelwidth=*, itemindent=!]
    \setcounter{enumi}{\value{examquestion}}\item
  }
  {\setcounter{examquestion}{\value{enumi}}\endenumerate
  \questionbreak
  }

%---------------------------------------------------------------------
% Definition of the subquestions environment
%---------------------------------------------------------------------
\let\olditem\item
\newenvironment{subquestions}
    {%\let\olditem\item\renewcommand\item[2][]{\olditem ##2\ifthenelse{\equal{##1}{}}{}{\addmarks{##1}}}
    \enumerate[itemsep=\subquestionspacing]}
    {\endenumerate}

%---------------------------------------------------------------------
% Definition of the \answer command
%---------------------------------------------------------------------
\newcommand{\answer}[1]{\begin{sloppypar}\color{red} #1\color{black}\end{sloppypar}}

%---------------------------------------------------------------------
% If not in answer mode, redefine \answer to show nothing
%---------------------------------------------------------------------
\ifthenelse{\boolean{answers}}{}{\renewcommand{\answer}[1]{}}




% -------------------------
% Physics stuff
% -------------------------
\newcommand{\physicalconstants}{
\label{physicalconstants}
    \small
    \begin{center}
    \textbf{UNIVERSITY OF OTAGO PHYSICS DEPARTMENT}\\
    \textbf{PHYSICAL CONSTANTS}\\
    \textbf{(for use in examinations)}\\
    \end{center}
    \begin{tabular}[c]{l l l r l l}
    \textbf{Quantity}           & \textbf{Symbol}   & \textbf{Value}    &           &           & \textbf{Unit}\\
    Speed of light (exact)      & $c$               & $2.998$             & $\times$  & $10^8$    & $\mathrm{m\;s}^{-1}$ \\
    Planck's constant           & $h$               & $6.626$             & $\times$  & $10^{-34}$& $\mathrm{J\;s}$ \\
    Planck's constant (reduced) & $\hbar\equiv h/(2\pi)$ & $1.055$ & $\times$ & $10^{-34}$& $\mathrm{J\;s}$ \\
    & & $=6.582$ & $\times$ & $10^{-22}$ & $\mathrm{MeV\;s}$\\
    $|$electron charge$|$ & $e$ & $1.602$ & $\times$ & $10^{-19}$ & $\mathrm{C}$\\
    electron mass & $m_e$ & $9.109$ & $\times$ & $10^{-31}$ & $\mathrm{kg}$\\
    proton mass & $m_p$ & $1.673$ & $\times$ & $10^{-27}$ & $\mathrm{kg}$\\
    unified atomic mass unit & $u$ & $1.661$ & $\times$ & $10^{-27}$ & $\mathrm{kg}$\\
    & $$ & $=931.5$ & $$ & $$ & $\mathrm{MeV\;c}^{-2}$\\
    permittivity of free space (exact) & $\varepsilon_0\equiv 1/(\mu_0 c^2)$ & $8.854$ & $\times$ & $10^{-12}$ & $\mathrm{F\;m}^{-1}$\\
    permeability of free space (exact) & $\mu_0$ & $4 \pi$ & $\times$ & $10^{-7}$ & $\mathrm{N\;A}^{-2}$\\
    Coulomb constant (exact) & $(4 \pi \varepsilon_0)^{-1}$ & $8.988$ & $\times$ & $10^{9}$ & $\mathrm{N\;m}^{2}\mathrm{\;C}^{-2}$\\
    impedance of free space (exact) & $Z_0\equiv c \mu_0$ & $376.7$ &  & & $\mathrm{\Omega}$\\
    (fine structure constant)$^{-1}$& $\alpha^{-1}$ & $137.0$ & &  & $\mathrm{}$\\
    classical electron radius & $r_e$ & $2.818$ & $\times$ & $10^{-15}$ & $\mathrm{m}$\\
    electron Compton wavelength$/(2\pi)$& $\lambdabar_e\equiv\lambda_e/(2\pi)$ & $3.862$ & $\times$ & $10^{-13}$ & $\mathrm{m}$\\
    Bohr radius ($m_{\mathrm{nucleus}}=\infty$)& $a_0$ & $5.292$ & $\times$ & $10^{-11}$ & $\mathrm{m}$\\
    Rydberg energy & $hcR_\infty$ & $13.61$ & $$ & $$ & $\mathrm{eV}$\\
    Bohr magneton & $\mu_B$ & $9.274$ & $\times$ & $10^{-24}$ & $\mathrm{J\;T}^{-1}$\\
    & $$ & $=5.788$ & $\times$ & $10^{-5}$ & $\mathrm{eV\;T}^{-1}$\\
    nuclear magneton & $\mu_N$ & $5.051$ & $\times$ & $10^{-27}$ & $\mathrm{J\;T}^{-1}$\\
    & $$ & $=3.152$ & $\times$ & $10^{-8}$ & $\mathrm{eV\;T}^{-1}$\\
    electron charge/mass & $-e/m_e$ & $-1.759$ & $\times$ & $10^{11}$ & $\mathrm{C\;kg}^{-1}$\\
    proton charge/mass& $e/m_p$ & $9.579$ & $\times$ & $10^{7}$ & $\mathrm{C\;kg}^{-1}$\\
    gravitational constant (Newton) & $G$ & $6.673$ & $\times$ & $10^{-11}$ & $\mathrm{N\;m}^2\mathrm{\;kg}^{-2}$\\
    standard $g$ (sea level)& $g$ & $9.807$ &  &  & $\mathrm{m\;s}^{-2}$\\
    Avogadro number & $N_A$ & $6.022$ & $\times$ & $10^{23}$ & $\mathrm{mol}^{-1}$\\
    Boltzmann constant & $k$ & $1.381$ & $\times$ & $10^{-23}$ & $\mathrm{J\;K}^{-1}$\\
    & $$ & $=8.617$ & $\times$ & $10^{-5}$ & $\mathrm{eV\;K}^{-1}$\\
    molar gas constant & $R\equiv kN_A$ & $8.315$ & $$ &  & $\mathrm{J\;mol}^{-1}\mathrm{\;K}^{-1}$\\
    molar volume (at STP) & $V_m$ & $2.241$ & $\times$ & $10^{-2}$ & $\mathrm{m}^3\mathrm{\;mol}^{-1}$\\
    Wien displacement constant & $b\equiv \lambda_{\mathrm{max}} T $ & $2.898$ & $\times$ & $10^{-3}$ & $\mathrm{m\;K}$\\
    Stefan-Boltzmann constant& $\sigma$ & $5.671$ & $\times$ & $10^{-8}$ & $\mathrm{W\;m}^{-2}\mathrm{\;K}^{-4}$\\
    \end{tabular}
    \vspace{10pt}\\
    All numerical values have been rounded to four significant figures, for use where necessary in this examination. 
    Note that the actual situation is that except for $G$, $k$, $R$, $N_A$, and $V_m$ all measured values are 
    reliable to better than 1 part per million.   Also $\mu_0$, $c$, $\varepsilon_0$, and $Z_0$ are exact. $\mu_0$  
    is given above, the exact value of the speed of light is $c=299\;792\;458 \;\mathrm{m s}^{-1}$, 
    $\varepsilon_0\equiv 1/(\mu_0 c^2)$, and $Z_0\equiv c \mu_0=\sqrt{\mu_0/\varepsilon_0}$.
    \vspace{10pt}\\
    \textbf{Definitions and equations:}
    \vspace{10pt}\\
    \begin{tabular}[c]{l l l l l l}
    $\alpha$ & $\equiv$ & $e^2/(4 \pi \varepsilon_0 \hbar c)$, &
    $a_0$ & $\equiv$ & $4 \pi \varepsilon_0\hbar^2/(m_e c^2)=r_e/\alpha^2$,\\
    $u$ & $\equiv$ & $\mathrm{mass }^{12}\mathrm{C\;atom}/12=(10^{-3}\;\mathrm{kg})/N_A$,&
    $r_e$ & $\equiv$ & $e^2/(4 \pi \varepsilon_0 m_e c^2)$,\\
    $\lambdabar_e$ & $\equiv$ & $\lambda_e/(2\pi)\equiv \hbar/(m_e c)=r_e/\alpha$, &
    $h c R_\infty$ & $\equiv$ & $m_e e^4/(2(4 \pi \varepsilon_0)^2 \hbar^2)=m_e c^2 \alpha^2/2$, \\
    $\mu_B$ & $\equiv$ & $e \hbar /(2 m_e)$,&
    $\mu_N$ & $\equiv$ & $e \hbar/(2 m_p)$.\\
    \end{tabular}
    \normalsize
    \clearpage}

\newcommand{\formulae}{\twocolumn
\label{formulae}
{
\vspace*{-1cm}{\bf\footnotesize Useful Formulae:}
\tiny
\vspace{-5pt} \begin{eqnarray*}
\sin (\theta\pm\phi) &=& \sin \theta \cos \phi \pm \cos \theta \sin \phi,\\
\cos (\theta\pm\phi) &=& \cos \theta \cos \phi \mp \sin \theta \sin \phi,\\
\cos\theta\cos\phi &=&\frac{1}{2}[\cos(\theta+\phi)+\cos(\theta-\phi)],\\
\sin\theta\sin\phi &=&\frac{1}{2}[\cos(\theta-\phi)-\cos(\theta+\phi)],\\
\sin\theta\cos\phi &=&\frac{1}{2}[\sin(\theta+\phi)+\sin(\theta-\phi)],\\
\cos^2\theta&=&\frac{1}{2}[1+\cos2\theta],\\
\sin^2\theta&=&\frac{1}{2}[1-\cos2\theta],\\
\cos\theta+\cos\phi&=&2\cos\frac{\theta+\phi}{2}\cos\frac{\theta-\phi}{2},\\
\cos\theta-\cos\phi&=&2\sin\frac{\theta+\phi}{2}\sin\frac{\theta-\phi}{2},\\
\sin \theta\pm\sin\phi &=&2\sin\frac{\theta\pm\phi}{2}\cos\frac{\theta\mp\phi}{2},\\
1&=&\cos^2\theta+\sin^2\theta ,\\
1&=&\sec^2\theta-\tan^2\theta ,\\
e^{i\theta} &=& \cos\theta+i\sin\theta,\\
\cos\theta&=&\frac{1}{2}(e^{i\theta}+e^{-i\theta}),\\
\sin\theta&=&\frac{1}{2i}(e^{i\theta}-e^{-i\theta}),\\
&&\\
f(z)&=&\sum_{n=0}^\infty \frac{1}{n!}f^{(n)}(a)(z-a)^n,\\
%&f(a)+f'(a)(z-a)+\frac{1}{2!}f''(a)(z-a)^2+\\&&\frac{1}{3!}f'''(a)(z-a)^3+\ldots,\\
e^z&=&1+z+\frac{1}{2!}z^2+\frac{1}{3!}z^3+\ldots,\\
\cos z&=&1-\frac{1}{2!}z^2+\frac{1}{4!}z^4+\ldots,\\
\sin z&=&z-\frac{1}{3!}z^3+\frac{1}{5!}z^5-\ldots,\\
\ln (1+z)&=&z-\frac{1}{2}z^2+\frac{1}{3}z^3-\ldots[|z|<1],\\
(1+z)^n &=&1 +nz+\frac{n(n-1)}{2!}z^2+\ldots [|z|<1],\\
%\end{eqnarray*}
%\begin{eqnarray*}
\bm{\nabla}f\!&\!=\!&\!\hat{\mathbf{x}}\frac{\partial f}{\partial x}+\hat{\mathbf{y}}\frac{\partial f}{\partial y}+\hat{\mathbf{z}}\frac{\partial f}{\partial z},\\
%\bm{\nabla}\times \mathbf{A}&=&\hat{\mathbf{x}}\left(\frac{\partial}{\partial y}A_z-\frac{\partial}{\partial z}A_y\right) +\hat{\mathbf{y}}\left(\frac{\partial}{\partial z}A_x-\frac{\partial}{\partial x}A_z\right) \\&&
%+\hat{\mathbf{z}}\left(\frac{\partial}{\partial x}A_y-\frac{\partial}{\partial y}A_x\right).
\bm{\nabla}\!\times\!\mathbf{A}\!=\!&\!\hat{\mathbf{x}}\!\!\!\!\!\!&\!\!\!\!\left(\!\frac{\partial A_z}{\partial y}\!-\!\frac{\partial A_y}{\partial z}\!\right)\!+\!\hat{\mathbf{y}}\left(\!\frac{\partial A_x}{\partial z}\!-\!\frac{\partial A_z}{\partial x}\!\right)\!+\!\hat{\mathbf{z}}\left(\!\frac{\partial A_y}{\partial x}\!-\!\frac{\partial A_x}{\partial y}\!\right),\\
%\end{eqnarray*} 
%%\hrule
%\vspace{-10pt}% Integrals:
%\begin{eqnarray*}
\int_a^bf\frac{dg}{dx}\,dx&=&-\int_a^b\frac{df}{dx}g\,dx+fg\Big|^b_a,\\
\int\frac{dx}{a-x}&=&-\ln(a-x)+c,\\
\int\frac{dx}{1+x^2}&=&\textrm{arctan}\,x+c,\\
\int\frac{dx}{1-x^2}&=&\textrm{arctanh}\,x+c,\\
\int\frac{dx}{\sqrt{1-x^2}}&=&\textrm{arcsin}\,x+c,\\
\int\frac{dx}{\sqrt{1+x^2}}&=&\textrm{arcsinh}\,x+c,\\
\int \tan x \,dx&=&-\ln\cos x+c,\\
\int \tanh x \,dx&=&\ln\cosh x+c,\\
\int_0^{\infty}x^ne^{-x/a} \,dx&=&n!a^{n+1},\\
\int_0^{\infty}x^{2n}e^{-x^2/a^2} \,dx&=&\sqrt{\pi}\frac{(2n)!}{n!}\left(\frac{a}{2}\right)^{2n+1},\\
\int_0^{\infty}x^{2n+1}e^{-x^2/a^2} \,dx&=&\frac{n!}{2}{a}^{2n+2},\\
\int \frac{dx}{x+x^2}&=&\ln\left(\frac{x}{1+x}\right)+c,\\
\int \frac{x\,dx}{x+x^2}&=&\frac{1}{2}\ln\left(1+x^2\right)+c,
\end{eqnarray*}
%\pagebreak  
\begin{eqnarray*}
&&\\
 \int \cos(\alpha x)\sin(\alpha x)\,dx &=& \frac{-\cos^2(\alpha
   x)}{2\alpha}+c,\\
\int \cos^2(\alpha x)\,dx &=& \frac{2\alpha x + \sin(2 \alpha
x)}{4\alpha}+c,\\
\int \sin^2(\alpha x)\,dx &=& \frac{2\alpha x - \sin(2 \alpha
x)}{4\alpha}+c,\\
\int x\sin(ax) \,dx&=&\frac{1}{a^2}\sin(ax)-\frac{x}{a}\cos(ax),\\
\int x\cos(ax) \,dx&=&\frac{1}{a^2}\cos(ax)+\frac{x}{a}\sin(ax),\\
\int x\sin^2(\alpha x)\,dx &=& \frac{x^2}4
-\frac{x\sin(2\alpha x)}{4\alpha} -\frac{\cos(2\alpha x)}{8\alpha^2}+c,\\
\int x\cos^2(\alpha x)\,dx &=& \frac{x^2}4
+\frac{x\sin(2\alpha x)}{4\alpha} +\frac{\cos(2\alpha
x)}{8\alpha^2}+c,\\
\int x^2\sin^2(\alpha x)\,dx &=&
\frac{x^3}{6}-\frac{x\cos (2\alpha x)}{4\alpha^2}
 x-\frac{\left(2
 \alpha^2x^2-1\right) \sin (2\alpha x)}{8\alpha^3}+c,\\
\int x^2\cos^2(\alpha x)\,dx &=&
\frac{x^3}{6}+\frac{x\cos (2\alpha x)}{4\alpha^2}+\frac{\left(2
 \alpha^2x^2-1\right) \sin (2\alpha x)}{8\alpha^3}+c
\end{eqnarray*}
\vspace{-5pt}
\hrule
%\vspace{3pt}
%2D polar coordinates:
%\vspace{-10pt}
\begin{eqnarray*}
x&=&r\cos(\phi),\\
y&=&r\sin(\phi),\\
r&=&\sqrt{x^2+y^2},\\
\phi&=&\textrm{arctan}(y/x),\\
\mathbf{r} &=& r\hat{\mathbf{r}},\\
\dot{\mathbf{r}}&=&\dot{r}\hat{\mathbf{r}}+r\dot{\phi}\hat{\bm{\phi}},\\
\ddot{\mathbf{r}}&=&(\ddot{r}-r\dot{\phi}^2)\hat{\mathbf{r}}+(r\ddot{\phi}+2\dot{r}\dot{\phi})\hat{\bm{\phi}}. \end{eqnarray*} 
 \hrule 
\begin{eqnarray*}
\vspace{-10pt}
\ddot{x}&=&-2\beta\dot{x}-\omega_0^2x+f_0\cos(\omega t),\\
x(t) &=& A\cos(\omega t-\delta)+
A_{\rm{tr}}e^{-\beta t}\cos(\omega_1 t-\delta_{\rm{tr}}),\\
\omega_1 &=& \sqrt{\omega_0^2-\beta^2},\\
A^2 &=&\frac{f_0^2}{(\omega_0^2-\omega^2)^2+4\beta^2\omega^2},\\
\delta &=& \textrm{arctan}\left(\frac{2\beta\omega}{\omega_0^2-\omega^2}\right),\\ 
\end{eqnarray*}    
}
\pagebreak
\onecolumn
}

%---------------------------------------------------------------------
% This is the end of the file.
%---------------------------------------------------------------------
