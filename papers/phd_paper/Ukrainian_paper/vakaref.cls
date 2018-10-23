%%
%% This is file `vakaref.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% vakthesis.dtx  (with options: `vakaref')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from vakaref.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file vakthesis.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{vakaref}
  [2009/04/01 v0.08
   VAKU author's abstract document class (OMB)]
\def\@classname{vakaref}
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright %FIXME: \protect \begingroup \immediate \write \@unused   \def \MessageBreak  
 \let \protect \edef  The document does not appear to be in UTF-8 encoding.\MessageBreak Try adding \UseRawInputEncoding as the first line of the file\MessageBreak or specify an encoding such as \usepackage [latin1]{inputenc}\MessageBreak in the document preamble.\MessageBreak Alternatively, save the file in UTF-8 using your editor or another tool  \errhelp \let \def \MessageBreak  
(inputenc)                     \def   \errmessage  Package inputenc Error: Invalid UTF-8 byte sequence.

See the inputenc package documentation for explanation.
Type  H <return>  for immediate help   \endgroup \protect \begingroup \immediate \write \@unused   \def \MessageBreak  
 \let \protect \edef  The document does not appear to be in UTF-8 encoding.\MessageBreak Try adding \UseRawInputEncoding as the first line of the file\MessageBreak or specify an encoding such as \usepackage [latin1]{inputenc}\MessageBreak in the document preamble.\MessageBreak Alternatively, save the file in UTF-8 using your editor or another tool  \errhelp \let \def \MessageBreak  
(inputenc)                     \def   \errmessage  Package inputenc Error: Invalid UTF-8 byte sequence.

See the inputenc package documentation for explanation.
Type  H <return>  for immediate help   \endgroup \protect \begingroup \immediate \write \@unused   \def \MessageBreak  
 \let \protect \edef  The document does not appear to be in UTF-8 encoding.\MessageBreak Try adding \UseRawInputEncoding as the first line of the file\MessageBreak or specify an encoding such as \usepackage [latin1]{inputenc}\MessageBreak in the document preamble.\MessageBreak Alternatively, save the file in UTF-8 using your editor or another tool  \errhelp \let \def \MessageBreak  
(inputenc)                     \def   \errmessage  Package inputenc Error: Invalid UTF-8 byte 179.

See the inputenc package documentation for explanation.
Type  H <return>  for immediate help   \endgroup \protect \begingroup \immediate \write \@unused   \def \MessageBreak  
 \let \protect \edef  The document does not appear to be in UTF-8 encoding.\MessageBreak Try adding \UseRawInputEncoding as the first line of the file\MessageBreak or specify an encoding such as \usepackage [latin1]{inputenc}\MessageBreak in the document preamble.\MessageBreak Alternatively, save the file in UTF-8 using your editor or another tool  \errhelp \let \def \MessageBreak  
(inputenc)                     \def   \errmessage  Package inputenc Error: Invalid UTF-8 byte sequence.

See the inputenc package documentation for explanation.
Type  H <return>  for immediate help   \endgroup , \protect \begingroup \immediate \write \@unused   \def \MessageBreak  
 \let \protect \edef  The document does not appear to be in UTF-8 encoding.\MessageBreak Try adding \UseRawInputEncoding as the first line of the file\MessageBreak or specify an encoding such as \usepackage [latin1]{inputenc}\MessageBreak in the document preamble.\MessageBreak Alternatively, save the file in UTF-8 using your editor or another tool  \errhelp \let \def \MessageBreak  
(inputenc)                     \def   \errmessage  Package inputenc Error: Invalid UTF-8 byte sequence.

See the inputenc package documentation for explanation.
Type  H <return>  for immediate help   \endgroup  \protect \begingroup \immediate \write \@unused   \def \MessageBreak  
 \let \protect \edef  The document does not appear to be in UTF-8 encoding.\MessageBreak Try adding \UseRawInputEncoding as the first line of the file\MessageBreak or specify an encoding such as \usepackage [latin1]{inputenc}\MessageBreak in the document preamble.\MessageBreak Alternatively, save the file in UTF-8 using your editor or another tool  \errhelp \let \def \MessageBreak  
(inputenc)                     \def   \errmessage  Package inputenc Error: Invalid UTF-8 byte sequence.

See the inputenc package documentation for explanation.
Type  H <return>  for immediate help   \endgroup \protect \begingroup \immediate \write \@unused   \def \MessageBreak  
 \let \protect \edef  The document does not appear to be in UTF-8 encoding.\MessageBreak Try adding \UseRawInputEncoding as the first line of the file\MessageBreak or specify an encoding such as \usepackage [latin1]{inputenc}\MessageBreak in the document preamble.\MessageBreak Alternatively, save the file in UTF-8 using your editor or another tool  \errhelp \let \def \MessageBreak  
(inputenc)                     \def   \errmessage  Package inputenc Error: Invalid UTF-8 byte sequence.

See the inputenc package documentation for explanation.
Type  H <return>  for immediate help   \endgroup \protect \begingroup \immediate \write \@unused   \def \MessageBreak  
 \let \protect \edef  The document does not appear to be in UTF-8 encoding.\MessageBreak Try adding \UseRawInputEncoding as the first line of the file\MessageBreak or specify an encoding such as \usepackage [latin1]{inputenc}\MessageBreak in the document preamble.\MessageBreak Alternatively, save the file in UTF-8 using your editor or another tool  \errhelp \let \def \MessageBreak  
(inputenc)                     \def   \errmessage  Package inputenc Error: Invalid UTF-8 byte sequence.

See the inputenc package documentation for explanation.
Type  H <return>  for immediate help   \endgroup \protect \begingroup \immediate \write \@unused   \def \MessageBreak  
 \let \protect \edef  The document does not appear to be in UTF-8 encoding.\MessageBreak Try adding \UseRawInputEncoding as the first line of the file\MessageBreak or specify an encoding such as \usepackage [latin1]{inputenc}\MessageBreak in the document preamble.\MessageBreak Alternatively, save the file in UTF-8 using your editor or another tool  \errhelp \let \def \MessageBreak  
(inputenc)                     \def   \errmessage  Package inputenc Error: Invalid UTF-8 byte sequence.

See the inputenc package documentation for explanation.
Type  H <return>  for immediate help   \endgroup \par 
\newif\if@draftmode
\newif\if@cthesis
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{a3paper}
   {\setlength\paperheight {420mm}%
    \setlength\paperwidth  {297mm}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{14pt}{\IfFileExists{size14.clo}%
  {\renewcommand\@ptsize{4}}%
  {\renewcommand\@ptsize{2}%
   \ClassError{\@classname}{You cannot use option `14pt'}%
     {File `size14.clo' not found.
      LaTeX package `extsizes' is not installed^^J%
      properly in your system.}}}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\@draftmodetrue\setlength\overfullrule{5pt}}
\DeclareOption{final}{\@draftmodefalse\setlength\overfullrule{0pt}}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\DeclareOption{c}{\@cthesistrue
  \def\degreename{\cyrk\cyra\cyrn\cyrd\cyri\cyrd\cyra\cyrt}%
  \def\onesupervisorname{\CYRN\cyra\cyru\cyrk\cyro\cyrv\cyri\cyrishrt\
    \cyrk\cyre\cyrr\cyrii\cyrv\cyrn\cyri\cyrk}%
  \def\manysupervisorsname{\CYRN\cyra\cyru\cyrk\cyro\cyrv\cyrii\
    \cyrk\cyre\cyrr\cyrii\cyrv\cyrn\cyri\cyrk\cyri}}
\DeclareOption{d}{\@cthesisfalse
  \def\degreename{\cyrd\cyro\cyrk\cyrt\cyro\cyrr}%
  \def\onesupervisorname{\CYRN\cyra\cyru\cyrk\cyro\cyrv\cyri\cyrishrt\
    \cyrk\cyro\cyrn\cyrs\cyru\cyrl\cyrsftsn\cyrt\cyra\cyrn\cyrt}%
  \def\manysupervisorsname{\CYRN\cyra\cyru\cyrk\cyro\cyrv\cyrii\
    \cyrk\cyro\cyrn\cyrs\cyru\cyrl\cyrsftsn\cyrt\cyra\cyrn\cyrt\cyri}}
\DeclareOption*{\ClassError{\@classname}
  {Option `\CurrentOption' not supported}
  {Do not use option `\CurrentOption' please.}}
\ExecuteOptions{a5paper,10pt,twoside,final,c}
\ProcessOptions
\input{size1\@ptsize.clo}
\RequirePackage{ifthen}
\RequirePackage{indentfirst}
\RequirePackage{verbatim}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\def\ps@plain{\let\@mkboth\@gobbletwo
  \def\@oddhead{\small\hfil\thepage\hfil}%
  \def\@evenhead{\small\hfil\thepage\hfil}
  \let\@oddfoot\@empty\let\@evenfoot\@empty}
\if@draftmode
  \let\ps@draft\ps@plain
  \g@addto@macro\ps@draft{\def\chaptermark#1{\markboth{#1}{#1}}%
    \def\@oddfoot{\scriptsize \draftname\ $\circ$\ \today\hfil \rightmark}%
    \def\@evenfoot{\scriptsize \leftmark\hfil \draftname\ $\circ$\ \today}}
  \let\ps@plain\ps@draft
  \def\draftname{Draft Version}%
  \AtBeginDocument{\addto\captionsukrainian{%
    \def\draftname{{\cyr\CYRCH\cyre\cyrr\cyrn\cyre\cyrt\cyrk\cyra}}}%
  }
\fi
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ %
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ %
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
\def\@nocmdgiven#1{%
  \ClassError{\@classname}
  {No \protect#1 given}
  {Use command \protect#1 in your document.}}
\newcommand{\placeholder}[1][100pt]{\rule{#1}{0.4pt}}
%%\renewcommand{\title}[1]{\def\@title{#1}}
\def\@title{<\CYRN\cyra\cyrz\cyrv\cyra\
  \cyrd\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyryi>%
  \@nocmdgiven{\title}}
%%\renewcommand{\author}[1]{\def\@author{#1}}
\def\@author{<\CYRP\cyrr\cyrii\cyrz\cyrv\cyri\cyrshch\cyre{}
  \CYRII\cyrm'\cyrya\
  \CYRP\cyro\ \cyrb\cyra\cyrt\cyrsftsn\cyrk\cyro\cyrv\cyrii>%
  \@nocmdgiven{\author}}
\newcounter{@supervisors@count}
\newcommand{\supervisor}[3]{%
  \stepcounter{@supervisors@count}%
  \ifnum\value{@supervisors@count}=1
    \def\@supervisors{\\{#1}{#2}{#3}}%
  \else
    \g@addto@macro\@supervisors{\\{#1}{#2}{#3}}%
  \fi}
\if@cthesis
  \def\@supervisors{\@nocmdgiven{\supervisor}%
    \\{<\CYRP\cyrr\cyrii\cyrz\cyrv\cyri\cyrshch\cyre\
       \CYRII\cyrm'\cyrya\ \CYRP\cyro\ \cyrb\cyra\cyrt\cyrsftsn\cyrk\cyro\cyrv\cyrii>}%
      {<\cyrn\cyra\cyru\cyrk\cyro\cyrv\cyri\cyrishrt\ \cyrs\cyrt\cyru\cyrp\cyrii\cyrn\cyrsftsn,
       \cyrv\cyrch\cyre\cyrn\cyre\ \cyrz\cyrv\cyra\cyrn\cyrn\cyrya>}%
      {<\cyrm\cyrii\cyrs\cyrc\cyre\ \cyrr\cyro\cyrb\cyro\cyrt\cyri, \cyrp\cyro\cyrs\cyra\cyrd\cyra>}%
  }%
\else
  \let\@supervisors\@empty
\fi
\def\oneopponentname{\CYRO\cyrf\cyrii\cyrc\cyrii\cyrishrt\cyrn\cyri\cyrishrt\
  \cyro\cyrp\cyro\cyrn\cyre\cyrn\cyrt}
\def\manyopponentsname{\CYRO\cyrf\cyrii\cyrc\cyrii\cyrishrt\cyrn\cyrii\
  \cyro\cyrp\cyro\cyrn\cyre\cyrn\cyrt\cyri}
\newcounter{@opponents@count}
\newcommand{\opponent}[3]{%
  \stepcounter{@opponents@count}%
  \ifnum\value{@opponents@count}=1
    \def\@opponents{\\{#1}{#2}{#3}}%
  \else
    \g@addto@macro\@opponents{\\{#1}{#2}{#3}}%
  \fi}
\def\@opponents{\@nocmdgiven{\opponent}%
  \\{<\CYRP\cyrr\cyrii\cyrz\cyrv\cyri\cyrshch\cyre\
     \CYRII\cyrm'\cyrya\ \CYRP\cyro\ \cyrb\cyra\cyrt\cyrsftsn\cyrk\cyro\cyrv\cyrii>}%
    {<\cyrn\cyra\cyru\cyrk\cyro\cyrv\cyri\cyrishrt\ \cyrs\cyrt\cyru\cyrp\cyrii\cyrn\cyrsftsn,
     \cyrv\cyrch\cyre\cyrn\cyre\ \cyrz\cyrv\cyra\cyrn\cyrn\cyrya>}%
    {<\cyrm\cyrii\cyrs\cyrc\cyre\ \cyrr\cyro\cyrb\cyro\cyrt\cyri,
     \cyrp\cyro\cyrs\cyra\cyrd\cyra>}}
\def\specialityfilename{speciality.20070212N70}
\def\speciality{\@ifnextchar[\n@speciality\n@specialitya}
\def\n@speciality[#1]{%
  \def\@specialityname{#1}%
  \@speciality}
\def\@speciality#1{%
  \@parse@speciality#1.\@nil
  \def\@specialitycode{\@speca.\@specb.\@specc}%
  \@ifnextchar[\ns@speciality\s@specialitya}
\def\ns@speciality[#1]{\def\@science{#1}}
\def\s@specialitya{%
  \@find@speciality
  \def\@science{\expandafter\@afterslash\@found\@nil}}
\def\n@specialitya#1{%
  \@parse@speciality#1.\@nil
  \def\@specialitycode{\@speca.\@specb.\@specc}%
  \@ifnextchar[\s@speciality\ns@specialitya}
\def\s@speciality[#1]{%
  \def\@science{#1}%
  \@find@speciality
  \def\@specialityname{\expandafter\@beforeslash\@found\@nil}}
\def\ns@specialitya{%
  \@find@speciality
  \def\@specialityname{\expandafter\@beforeslash\@found\@nil}%
  \def\@science{\expandafter\@afterslash\@found\@nil}}
\def\@find@speciality{%
  \findinfile{\specialityfilename}{\@specialitycode}%
  \ifthenelse{\equal{\@found}{}}
  {\def\@found{<\cyrn\cyra\cyrishrt\cyrm\cyre\cyrn\cyru\cyrv\cyra\cyrn\cyrn\cyrya\
     \cyrs\cyrp\cyre\cyrc\cyrii\cyra\cyrl\cyrsftsn\cyrn\cyro\cyrs\cyrt\cyrii>%
     \ClassError{\@classname}{Unknown speciality code (speciality name)}
     {I can not determinate speciality name.\MessageBreak
      Command \protect\speciality\space has two optional arguments. Use them please.}/%
     <\cyrg\cyra\cyrl\cyru\cyrz\cyrsftsn\ \cyrn\cyra\cyru\cyrk>%
     \ClassError{\@classname}{Unknown speciality code (science)}
     {I can not determinate science.\MessageBreak
      Command \protect\speciality\space has two optional arguments. Use them please.}}}
  {\relax}}
\def\@specialitycode{<\cyrsh\cyri\cyrf\cyrr\
  \cyrs\cyrp\cyre\cyrc\cyrii\cyra\cyrl\cyrsftsn\cyrn\cyro\cyrs\cyrt\cyrii>%
  \@nocmdgiven{\speciality}}
\def\@specialityname{%
  <\cyrn\cyra\cyrishrt\cyrm\cyre\cyrn\cyru\cyrv\cyra\cyrn\cyrn\cyrya\
  \cyrs\cyrp\cyre\cyrc\cyrii\cyra\cyrl\cyrsftsn\cyrn\cyro\cyrs\cyrt\cyrii>}
\def\@science{<\cyrg\cyra\cyrl\cyru\cyrz\cyrsftsn\ \cyrn\cyra\cyru\cyrk>}
\def\@parse@speciality#1.#2.#3.#4\@nil{%
  \def\@speca{#1}%
  \def\@specb{#2}%
  \def\@specc{#3}}
\newread\@specialityfile
\def\findinfile#1#2{%
  \def\@required{#2}%
  \def\@found{}%
  \openin\@specialityfile #1\relax
  \ifeof\@specialityfile
    \typeout{No file #1.}
  \else
    \@addtofilelist{#1}
    \ProvidesFile{#1}[(\@classname)]
    \@readline
  \fi
  \closein\@specialityfile}
\def\@readline{%
  \read\@specialityfile to\@currline
  \ifeof\@specialityfile
  \else
    \expandafter\test\@currline\@nil
    \next
  \fi}
\def\test#1\@nil{%
  \let\next\@readline
  \def\@temp{#1}%
  \ifx\@temp\@empty \else\@test#1\@nil \fi}
\def\@test#1 #2\@nil{%
  \ifthenelse{\equal{\@required}{#1}}
  {\def\@found{#2}\let\next\relax}
  {}}
\def\@beforeslash#1/#2\@nil{#1}
\def\@afterslash#1/#2\@nil{#2}
\newcommand{\udc}[1]{\def\@udc{#1}}
\def\@udc{<\cyrii\cyrn\cyrd\cyre\cyrk\cyrs\ \CYRU\CYRD\CYRK>}
\newcommand{\institution}[1]{\@split@institution#1,,\@nil}
\def\@split@institution#1,#2,#3\@nil{%
  \def\@institution{#1}%
  \def\@institution@office{\ignorespaces
  #2}}
\def\@institution{<\CYRN\cyra\cyrz\cyrv\cyra\
  \cyro\cyrr\cyrg\cyra\cyrn\cyrii\cyrz\cyra\cyrc\cyrii\cyryi,\
  \cyrv\ \cyrya\cyrk\cyrii\cyrishrt\
  \cyrv\cyri\cyrk\cyro\cyrn\cyra\cyrn\cyra\
  \cyrd\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyrya>}
\def\@institution@office{\ignorespaces}
