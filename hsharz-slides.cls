%%%%%%%%%%%%%%%%%%%%%%%%%%-------------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      Formatirung für Beamerfolien im CD der Hochschule Harz
%
% Copyright (c) 2013 Hagen Hasenbalg
%
% MIT License
%
% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and 
% associated documentation files (the "Software"), to deal in the Software without restriction, 
% including without limitation the rights to use, copy, modify, merge, publish, distribute,
% sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is 
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all copies or 
% substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT 
% NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
% NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
% DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%------- Und noch mal auf Deutsch ---------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%
% Hiermit wird unentgeltlich, jeder Person, die eine Kopie der Software und der zugehörigen 
% Dokumentationen (die "Software") erhält, die Erlaubnis erteilt, sie uneingeschränkt zu benutzen,
% inklusive und ohne Ausnahme, dem Recht, sie zu verwenden, kopieren, ändern, fusionieren, 
% verlegen, verbreiten, unterlizenzieren und/oder zu verkaufen, und Personen, die diese Software 
% erhalten, diese Rechte zu geben, unter den folgenden Bedingungen:
%
% Der obige Urheberrechtsvermerk und dieser Erlaubnisvermerk sind in allen Kopien oder Teilkopien
% der Software beizulegen.
%
% DIE SOFTWARE WIRD OHNE JEDE AUSDRÜCKLICHE ODER IMPLIZIERTE GARANTIE BEREITGESTELLT, 
% EINSCHLIESSLICH DER GARANTIE ZUR BENUTZUNG FÜR DEN VORGESEHENEN ODER EINEM BESTIMMTEN ZWECK SOWIE 
% JEGLICHER RECHTSVERLETZUNG, JEDOCH NICHT DARAUF BESCHRÄNKT. IN KEINEM FALL SIND DIE AUTOREN ODER
% COPYRIGHTINHABER FÜR JEGLICHEN SCHADEN ODER SONSTIGE ANSPRÜCHE HAFTBAR ZU MACHEN, OB INFOLGE DER 
% ERFÜLLUNG EINES VERTRAGES, EINES DELIKTES ODER ANDERS IM ZUSAMMENHANG MIT DER SOFTWARE ODER 
% SONSTIGER VERWENDUNG DER SOFTWARE ENTSTANDEN.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%-------------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{hsharz-slides}[2013/06/03 HS Harz Slides]
\usepackage{tikz}

\LoadClass[20pt]{beamer}
\usepackage[latin1]{inputenc}

\RequirePackage[english,ngerman,german]{babel}
\RequirePackage{pgfpages}
\RequirePackage{listings}
\RequirePackage{ifthen}
\RequirePackage{ifxetex}

\ifxetex
    \RequirePackage{fontspec}
\else
    \RequirePackage[utf8]{inputenc}
    \RequirePackage{helvet}
\fi

% Color Theme
\definecolor{colorAI}{RGB}{150,190,180}
\definecolor{colorVW}{RGB}{200,210,125}
\definecolor{colorWW}{RGB}{240,225,100}


\newboolean{metafont}\setboolean{metafont}{false}
\newboolean{metaprofont}\setboolean{metaprofont}{false}
\newboolean{pdflogo}\setboolean{pdflogo}{false}
\newboolean{vslogo}\setboolean{vslogo}{false}
\newboolean{xetexwhelvetica}\setboolean{xetexwhelvetica}{true}
\DeclareOption{alternate}{\setboolean{alternate}{true}}
\DeclareOption{metafont}{\setboolean{metafont}{true}}
\DeclareOption{metaprofont}{\setboolean{metaprofont}{true}}
\DeclareOption{pdflogo}{\setboolean{pdflogo}{true}}
\ProcessOptions*


% Helvetiva als Standartschrift
\usepackage[scaled]{helvet}
\renewcommand*\familydefault{\sfdefault} 
\usepackage[T1]{fontenc}

% Font Theme

\setbeamerfont{author}{size=\footnotesize}
\setbeamerfont{subtitle}{size=\footnotesize}
\setbeamerfont{title}{series=\bfseries, size={\fontsize{38}{58}} }
\setbeamerfont{frametitle}{series=\bfseries, size={\fontsize{28}{38}} }
\setbeamerfont{footer}{ size={\fontsize{8.5}{12}} }
\setbeamerfont{normal text}{ size={\fontsize{20}{12}} }

\setbeamercolor{title}{fg=black}
\setbeamercolor{frametitle}{fg=black}
\setbeamercolor{framesubtitle}{fg=\ColorTheme}
\setbeamercolor{footlinecolor}{fg=black,bg=\ColorTheme}

% itemize mit Strichen
\usepackage{textcomp}
\usepackage{enumitem}
\setlist[itemize,1]{label=\textendash}


\setbeamertemplate{navigation symbols}{}%remove navigation symbols
\setbeamertemplate{headline}{}


% Inner Theme

\useinnertheme{default}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titelseite
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setbeamertemplate{title page}{
    
    \begin{beamercolorbox}[wd=0.55\paperwidth, leftskip=-1.5cm]{footlinecolor}
        \begin{tikzpicture}
            \node(\inserttitlegraphic) {\includegraphics[height=4cm]{\hslogoblack}};
        \end{tikzpicture}
    \end{beamercolorbox}
    \vskip 10pt
    
    \hbox{
        \begin{beamercolorbox}[left,wd=.9\paperwidth]{title}
            \usebeamerfont{title}\inserttitle
            \vskip5pt
            \usebeamerfont{subtitle}
            \insertsubtitle
        \end{beamercolorbox}
    }
    \vskip 160pt
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Frametitle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setbeamertemplate{frametitle}{

    \ifthenelse{\equal{}{\insertframesubtitle}}{}{}
    
    \vskip 15pt
    \begin{beamercolorbox}[wd=\paperwidth,ht=1.20ex,leftskip=0.4cm,dp=0.4ex]{frametitle}
        \usebeamerfont{header_font_subsubsection}\insertframetitle
    \end{beamercolorbox}   
    \vskip0pt
    \begin{beamercolorbox}[wd=\paperwidth,ht=1.20ex,leftskip=0.4cm,dp=0.4ex]{framesubtitle}
        \usebeamerfont{header_font_subsubsection}\insertframesubtitle
    \end{beamercolorbox}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Footline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setbeamertemplate{footline}{
   
         \hfuzz=0pt 
   
        \begin{beamercolorbox}[ht=1.9cm,wd=\paperwidth]{}
            \begin{beamercolorbox}[ht=1.0cm,wd=0.3\paperwidth]{bg=}
                \ifnum\insertframenumber=1 % Titelseite
                    \pgfimage[width=0.3\paperwidth]{\hslogoblack}
                \else 
                    \pgfimage[width=0.3\paperwidth]{\hslogo}
                \fi
                \vspace*{-0.4em}
            \end{beamercolorbox} 
            \ifnum\insertframenumber=1
                \line(0,1){52}
            \fi
            \begin{beamercolorbox}[ht=1.9cm,wd=0.5\paperwidth]{footlinecolor}
                \usebeamerfont{footer}
                \hspace*{0.3em}
                \vspace*{0.3em}
                \insertdate : \insertshorttitle{}
                \vspace*{0.3em}
                \newline
                \hspace*{0.5em}
                \insertshortauthor{}
                \vspace*{0.5em}
                \newline
                \hspace*{0.5em}
                \function
                \vskip 16pt
            \end{beamercolorbox}
            \ifnum\insertframenumber=1   
            \else 
                \begin{beamercolorbox}[wd=0.05\paperwidth,ht=0.25cm,center]{section in head/foot}
                    \usebeamerfont{footer}
                    \raisebox{1.4cm}{{ Seite \insertframenumber \hspace*{1ex}}}
                \end{beamercolorbox}
            \fi  
       \end{beamercolorbox}
   
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setbeamertemplate{caption}{
        \insertcaption
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setbeamersize{sidebar width left=.075\paperwidth}
\setbeamersize{text margin left=.3cm}
\setbeamersize{text margin right=.1\paperwidth}

\setlength\leftmargini{1.5em}
\setlength\leftmarginii{1.5em}
\setlength\leftmarginiii{1.5em}

\setbeamerfont{footnote}{size=\tiny}
\setbeamerfont{caption}{size=\tiny}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Logo der HS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\pdflogo{%
    \includegraphics[width=.25\paperwidth]{\hslogo}%
}

