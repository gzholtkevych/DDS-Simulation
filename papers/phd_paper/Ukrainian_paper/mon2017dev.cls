%%% mon2017dev.cls --- Оформлення дисертації згідно з вимогами МОН
%%
%% Це допоміжний LaTeX-клас (надбудова над класом vakthesis)
%% для підготовки дисертації згідно з Вимогами до оформлення дисертації,
%% затвердженими наказом Міністерства освіти і науки від 12.01.2017 № 40
%% (набрав чинності 10.03.2017),
%% http://zakon.rada.gov.ua/go/z0155-17
%%
%% Основні можливості:
%% -- оформлення титульного аркуша згідно з Вимогами,
%% -- підтримка анотації і списку ключових слів двома мовами,
%% -- повтор списку публікацій здобувача з анотації
%%    у списку використаних джерел і в додатку,
%% -- повтор відомостей про апробацію зі вступу в додатку.
%%
%% Працює тільки разом з vakthesis:
%% викликає цей клас, а потім переозначує потрібні команди.
%%
%% Приклад використання у файлах
%% mon2017dev.tex, mon2017dev-intro.tex, mon2017dev-bib.tex, mon2017dev-app1.tex.
%%
%% TODO:
%% Вимоги до оформлення дисертації виписані не дуже чітко.
%% Інколи незрозуміло, що і як треба запрограмувати.
%% Деякі речі просто ще не реалізовані.
%% Тому користувачі мають знати про можливі труднощі:
%%
%% 1. Якщо установа, де здійснювалася підготовка здобувача
%%    і установа, де проводився захист дисертації, -- та сама установа,
%%    то як писати на титульній сторінці?
%%    Повторювати двічі?
%%    Писати назву установи, де здійснювалася підготовка здобувача?
%%    Писати назву установи, де проводився захист дисертації?
%%    (Вони однакові, але треба запрограмувати, аргумент якої команди брати.)
%%
%%    Аналогічна ситуація з анотацією.
%%    Але, крім того, в п. 2 Вимог написано, що в анотації також вказуються
%%    «найменування вищого навчального закладу або найменування наукової установи,
%%    у якому (якій) здійснювалася підготовка;
%%    найменування наукової установи або найменування вищого навчального закладу,
%%    у спеціалізованій вченій раді якої (якого) відбудеться захист»,
%%    а в зразку анотації (додаток 2) вказано тільки одну установу
%%    (де здійснювалася підготовка).
%%
%% 2. Оскільки у зразку титульного аркуша дисертації спочатку згадано
%%    найменування вищого навчального закладу або наукової установи,
%%    а потім -- органу, до сфери управління якого належить заклад, установа,
%%    може треба у такому порядку й писати?
%%                     Інститут педагогіки
%%       Національної академії педагогічних наук України
%%    а не
%%       Національна академія педагогічних наук України
%%                     Інститут педагогіки
%%
%% 3. Мабуть, потрібна підтримка Переліку наукових спеціальностей
%%    і Переліку галузей знань і спеціальностей,
%%    за якими здійснюється підготовка здобувачів вищої освіти.
%%    Незрозуміло, що треба використовувати:
%%    у зразку титульного аркуша дисертації йдеться про галузь знань,
%%    але у зразку анотації наведено і наукову спеціальність,
%%    за якою проводиться захист дисертації,
%%    і спеціальність, за якою здійснюється підготовка здобувачів вищої освіти.
%%
%% 4. Немає підтримки розбиття списку публікацій здобувача на групи:
%%    -- праці, в яких опубліковані основні наукові результати дисертації;
%%    -- праці, які засвідчують апробацію матеріалів дисертації;
%%    -- праці, які додатково відображають наукові результати дисертації.
%%
%%    Взагалі кажучи, не сказано явно,
%%    що публікації треба ділити на такі групи і явно позначати такий поділ.
%%    Важливо, щоб саме в такій послідовності.
%%    Справді, у п. 13 Вимог написано:
%%    «Вказуються наукові праці автора у послідовності,
%%    наведеній у пункті 4 розділу ІІІ цих Вимог»
%%
%%    За потреби можна робити це вручну.
%%    Можливо, якісь спеціалізовані пакунки будуть працювати з цим класом
%%    (bibtopic тощо)?
%%
%% 5. Незрозуміло, навіщо тричі повторювати список публікацій здобувача:
%%    -- в анотації після ключових слів (п. 4 Вимог);
%%    -- у списку використаних джерел (п. 9);
%%    -- в окремому обов'язковому додатку до дисертації (п. 13).
%%
%%    Як посилатися на публікації здобувача у тексті дисертації?
%%    У п. 9 Вимог сказано, що в дисертації має бути
%%    «зроблено посилання на всі наукові праці здобувача, наведені в анотації».
%%    Тоді у списку публікацій здобувача після анотації має бути окрема схема нумерації
%%    (наприклад, додати до номера букву «а», що клас vakthesis дозволяє зробити),
%%    щоб посилання на них не плуталися з посиланнями на використані джерела.
%%    Крім того, «список цих праць має також міститися у списку використаних джерел».
%%    Але тоді у списку використаних джерел будуть джерела,
%%    на які немає посилань у тексті.
%%    Бо не можна посилатися одночасно на те саме джерело у одному й другому списку.
%%    Намагаючись надати якогось смислу цим незрозумілим вимогам,
%%    я вирішив, що посилання в тексті мають бути на список використаних джерел
%%    (читачу зручніше працювати з посиланнями на один список, а не на три).
%%    А списки публікацій після анотації і в додатку мають довідковий характер,
%%    тому на них немає посилань у тексті.
%%    Щоб уникнути певних технічних проблем,
%%    пов'язаних з повторним згадуванням тих самих джерел (multiply-defined labels),
%%    я переозначив команду \bibitem в анотації та в додатку так,
%%    що вона тільки генерує мітку, але не дозволяє посилання на неї.
%%
%%    Мені траплялися дисертації, де навіть чотири списки публікацій здобувача,
%%    тобто в анотації -- двічі:
%%    українською -- після анотації українською,
%%    англійською -- після анотації українською.
%%    Але, на мій погляд, це дивне трактування Вимог:
%%    анотація в дисертації одна (але кілька варіантів різними мовами),
%%    тому й список публікацій здобувача після анотації має бути один.
%%    Справді, у тексті Вимог скрізь ідеться про «анотацію», а не «анотації».
%%
%% 6. Сподіваюся, клас сумісний
%%    з рекомендованими стилями оформлення списку наукових публікацій
%%    (він не містить нічого навмисно, що могло би привести до несумісності).
%%    Але тестування класу з відповідними BibTeX-стилями не проводилося
%%    (крім Springer MathPhys Style, який сумісний).
%%
%% 7. Список використаних джерел може бути
%%    в кінці кожного розділу основної частини дисертації.
%%    Поки що немає (можливо, ніколи й не буде) підтримки для цього.
%%    Не перевіряв, чи клас сумісний зі спеціальними пакунками LaTeX для цього.
%%
%% 8. «Дисертацію друкують на одному або на двох (за бажанням) боках аркуша»
%%    (додаток 4 до Вимог).
%%    Немає якоїсь спеціальної підтримки для цього.
%%    Не перевіряв, чи працюватимуть стандартні засоби LaTeX (oneside, twoside).
%%
%% 9. Не рекомендовано поки що використовувати клас для документів,
%%    у яких головна мова -- не ukrainian (а english чи інша).
%%    Виникають незрозумілі проблеми, для розв'язання яких потрібно більше часу.
%%
%%    До того ж, ще не всі службові слова перекладено
%%    (тільки ті, що використовуються в анотації).
%%    Але у Вимогах немає зразка анотації англійською мовою,
%%    тому мені не було на що орієнтуватися.
%%
%%10. Можливо, клас не працюватиме із XeLaTeX, LuaLaTeX і polyglossia.
%%    Бо для підтримки кількох мов використовуються засоби babel.
%%    Але тестування класу в такій ситуації не проводилося.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{mon2017dev}
  [2018/04/09 v0.02 vakthesis support document class (OMB)]
\LoadClassWithOptions{vakthesis}[2009/04/01]
% У версії v0.3 від 2014/05/04 виправлено
% \RenewEnviron для оточень, які означені не пакунком environ.
\RequirePackage{environ}[2014/05/04]
% Щоб забезпечити різні назви дисертації для різних мов,
% використовується механізм \captions<languagename> (з babel).
% Але якщо в документі немає зміни мови засобами babel,
% то команда \@title буде неозначена.
% Тому означуємо її глобально (бо \title буде всередині мовного оточення),
% а також додаємо до \captionsenglish чи \captionsukrainian.
% TODO: 1. Це поганий код.
% У командах майже ті самі дії повторюються,
% тому треба було б зробити спеціальну команду
% і викликати її з конкретними параметрами.
% Але деякі команди (\author, пов'язані зі speciality, ...) потребують особливої уваги,
% тому під загальну схему не підпадають.
% 2. Треба глянути, чи є стандартні засоби babel для цього,
% або глянути спеціальні пакунки типу translations, translator тощо.
% TODO: Мабуть, такий механізм підтримки двох мов не працюватиме з polyglossia
% (аналог babel для користувачів XeLaTeX та LuaLaTeX),
% бо він ґрунтується на засобах babel.
% Але я не користуюся XeLaTeX чи LuaLaTeX,
% тому найближчим часом у це не заглиблюватимуся.
\renewcommand{\title}[1]{%
  \iflanguage{\bbl@main@language}{%
    \gdef\@title{#1}%
  }{%
    \expandafter\addto\csname captions\languagename\endcsname{%
      \def\@title{#1}%
    }%
  }%
}
\renewcommand{\author}[1]{%
  \iflanguage{\bbl@main@language}{%
    \gdef\@author{#1}%
    \gdef\@shortauthor{\@shortifyname#1\@nil}%
    \gdef\shortauthor@{\shortifyname@#1\@nil}%
  }{%
    \expandafter\addto\csname captions\languagename\endcsname{%
      \def\@author{#1}%
      \def\@shortauthor{\@shortifyname#1\@nil}%
      \def\shortauthor@{\shortifyname@#1\@nil}%
    }%
  }%
}
% Скоротити ім'я і по батькові, поставити перед прізвищем
\def\@shortifyname#1 #2 #3\@nil{%
  \@shortify@name#2\@nil
  \@shortify@name#3\@nil
  #1%
}
\def\@shortify@name#1#2\@nil{#1.~}
% Скоротити ім'я і по батькові, поставити після прізвища
\def\shortifyname@#1 #2 #3\@nil{%
  #1%
  \shortify@name@#2\@nil
  \shortify@name@#3\@nil
}
\def\shortify@name@#1#2\@nil{~#1.}
% Науковий керівник
\renewcommand{\supervisor}[2]{%
  \stepcounter{@supervisors@count}%
  \ifnum\value{@supervisors@count}=1
    \iflanguage{\bbl@main@language}{%
      \gdef\@supervisors{\\{#1}{#2}}%
    }{%
      \expandafter\addto\csname captions\languagename\endcsname{%
% REVIEW: Чому тут глобальне означення?
        \gdef\@supervisors{\\{#1}{#2}}%
      }%
    }%
    % \def\@supervisors{\\{#1}{#2}}%
  \else
    \iflanguage{\bbl@main@language}{%
      \g@addto@macro\@supervisors{\\{#1}{#2}}%
    }{%
      \expandafter\addto\csname captions\languagename\endcsname{%
        \g@addto@macro\@supervisors{\\{#1}{#2}}%
      }%
    }%
    % \g@addto@macro\@supervisors{\\{#1}{#2}}%
  \fi
}
% Шифр і назва спеціальності
\def\n@speciality[#1]{%
  \iflanguage{\bbl@main@language}{%
    \gdef\@specialityname{#1}%
  }{%
    \expandafter\addto\csname captions\languagename\endcsname{%
      \def\@specialityname{#1}%
    }%
  }%
  % \def\@specialityname{#1}%
  \@speciality}
\def\@speciality#1{%
  \@parse@speciality#1.\@nil
% Щоб можна було вже використовувати, треба означити незалежно від мови
% (див. також \n@specialitya).
  \iflanguage{\bbl@main@language}{%
    \gdef\@specialitycode{\@speca.\@specb.\@specc}%
  }{%
    \expandafter\addto\csname captions\languagename\endcsname{%
      \def\@specialitycode{\@speca.\@specb.\@specc}%
    }%
    \def\@specialitycode{\@speca.\@specb.\@specc}%
  }%
  % \def\@specialitycode{\@speca.\@specb.\@specc}%
  \@ifnextchar[\ns@speciality\s@specialitya}
\def\ns@speciality[#1]{%
  \iflanguage{\bbl@main@language}{%
    \gdef\@science{#1}%
  }{%
    \expandafter\addto\csname captions\languagename\endcsname{%
      \def\@science{#1}%
    }%
  }%
  % \def\@science{#1}%
}
\def\s@specialitya{%
  \@find@speciality
  \iflanguage{\bbl@main@language}{%
    \gdef\@science{\expandafter\@afterslash\@found\@nil}%
  }{%
    \expandafter\addto\csname captions\languagename\endcsname{%
      \def\@science{\expandafter\@afterslash\@found\@nil}%
    }%
  }%
  % \def\@science{\expandafter\@afterslash\@found\@nil}%
}
\def\n@specialitya#1{%
  \@parse@speciality#1.\@nil
% Щоб можна було вже використовувати, треба означити незалежно від мови
% (див. також \@speciality).
  \iflanguage{\bbl@main@language}{%
    \gdef\@specialitycode{\@speca.\@specb.\@specc}%
  }{%
    \expandafter\addto\csname captions\languagename\endcsname{%
      \def\@specialitycode{\@speca.\@specb.\@specc}%
    }%
    \def\@specialitycode{\@speca.\@specb.\@specc}%
  }%
  % \def\@specialitycode{\@speca.\@specb.\@specc}%
  \@ifnextchar[\s@speciality\ns@specialitya}
\def\s@speciality[#1]{%
  \iflanguage{\bbl@main@language}{%
    \gdef\@science{#1}%
  }{%
    \expandafter\addto\csname captions\languagename\endcsname{%
      \def\@science{#1}%
    }%
  }%
  % \def\@science{#1}%
  \@find@speciality
  \iflanguage{\bbl@main@language}{%
    \gdef\@specialityname{\expandafter\@beforeslash\@found\@nil}%
  }{%
    \expandafter\addto\csname captions\languagename\endcsname{%
      \def\@specialityname{\expandafter\@beforeslash\@found\@nil}%
    }%
  }%
  % \def\@specialityname{\expandafter\@beforeslash\@found\@nil}%
}
\def\ns@specialitya{%
  \@find@speciality
  \iflanguage{\bbl@main@language}{%
    \gdef\@specialityname{\expandafter\@beforeslash\@found\@nil}%
    \gdef\@science{\expandafter\@afterslash\@found\@nil}%
  }{%
    \expandafter\addto\csname captions\languagename\endcsname{%
      \def\@specialityname{\expandafter\@beforeslash\@found\@nil}%
      \def\@science{\expandafter\@afterslash\@found\@nil}%
    }%
  }%
  % \def\@specialityname{\expandafter\@beforeslash\@found\@nil}%
  % \def\@science{\expandafter\@afterslash\@found\@nil}%
}
\def\@parse@speciality#1.#2.#3.#4\@nil{%
  \gdef\@speca{#1}%
  \gdef\@specb{#2}%
  \gdef\@specc{#3}}
\def\@test#1 #2\@nil{%
  \ifthenelse{\equal{\@required}{#1}}
  {\gdef\@found{#2}\let\next\relax}
  {}}
% Установа, де виконана робота
\renewcommand{\institution}[2]{%
  \@split@institution#1,,\@nil
  \iflanguage{\bbl@main@language}{%
    \gdef\@towni{#2}%
  }{%
    \expandafter\addto\csname captions\languagename\endcsname{%
      \def\@towni{#2}%
    }%
  }%
  % \def\@town{#2}%
}
\def\@split@institution#1,#2,#3\@nil{%
  \iflanguage{\bbl@main@language}{%
    \gdef\@institution{#1}%
    \gdef\@institution@office{\ignorespaces#2}%
  }{%
    \expandafter\addto\csname captions\languagename\endcsname{%
      \def\@institution{#1}%
      \def\@institution@office{\ignorespaces#2}%
    }%
  }%
}
% Рада, де буде захист (додано з vakaref.cls з відповідними змінами для двох мов)
%% Синтаксис команди
%% \council{шифр ради}[установа, відомство]{назва установи}{адреса}
\newcommand{\council}[1]{% \catcode`м=11
  \def\@council@code{#1}%
  \@ifnextchar[\o@council\@council}
\def\o@council[#1,#2]#3#4{%
  \iflanguage{\bbl@main@language}{%
    \gdef\@council@institutiont{#1}%
    \gdef\@council@institutiont@office{\ignorespaces#2}%
  }{%
    \expandafter\addto\csname captions\languagename\endcsname{%
      \def\@council@institutiont{#1}%
      \def\@council@institutiont@office{\ignorespaces#2}%
    }%
  }%
  % \def\@council@institutiont{#1}%
  % \def\@council@institutiont@office{#2}%
  \@council{#3}{#4}}
\def\@council#1#2{%
  \iflanguage{\bbl@main@language}{%
    \gdef\@council@institution{#1}%
    \gdef\@council@address{#2}%
  }{%
    \expandafter\addto\csname captions\languagename\endcsname{%
      \def\@council@institution{#1}%
      \def\@council@address{#2}%
    }%
  }%
  % \def\@council@institution{#1}%
  % \def\@council@address{#2}%
  \@extracttown#2\@nil}
\def\@extracttown#1.#2,#3\@nil{%
  \iflanguage{\bbl@main@language}{%
    \global\def\@townc{\ignorespaces
      \@ifnextchar~{\@gobble}{\relax}#2}%
  }{%
    \expandafter\addto\csname captions\languagename\endcsname{%
      \global\def\@townc{\ignorespaces
        \@ifnextchar~{\@gobble}{\relax}#2}%
    }%
  }%
  % \global\def\@town{\ignorespaces
  %   \@ifnextchar~{\@gobble}{\relax}#2}%
}
\def\@council@code{<\cyrsh\cyri\cyrf\cyrr\ \cyrr\cyra\cyrd\cyri>}
\def\@council@institution{<\CYRN\cyra\cyrz\cyrv\cyra\ \cyru\cyrs\cyrt\cyra\cyrn\cyro\cyrv\cyri,
  \cyrv\ \cyrya\cyrk\cyrii\cyrishrt\ \cyrs\cyrt\cyrv\cyro\cyrr\cyre\cyrn\cyra\ \cyrr\cyra\cyrd\cyra>}
\def\@council@address{<\cyra\cyrd\cyrr\cyre\cyrs\cyra>}
% Для оформлення інформації про наукового керівника на титульному аркуші.
% Тепер схоже на те, що в авторефераті.
% (додано з vakaref.cls)
\newenvironment{listofpersons}[1]
  {\list{#1\hfil}{\topsep0pt\parsep0pt\itemsep.5\parskip
   \ifx\@supervisors\@empty
     \settowidth\@tempdima{#1}%
     \setlength\labelwidth{\@tempdima}%
   \else
     \settowidth\@tempdima{\@supervisors@caption}
     % \settowidth\@tempdimb{\@opponents@caption}
     % \ifdim\@tempdima>\@tempdimb
       \setlength\labelwidth{\@tempdima}%
     % \else
     %   \setlength\labelwidth{\@tempdimb}%
     % \fi
   \fi
   \setlength\leftmargin{\labelwidth}%
   \addtolength\leftmargin{\labelsep}%
   \def\makelabel##1{##1}%
   \def\makephantomlabel##1{\phantom{##1}}}%
   \rightskip\@flushglue% ! нерівний правий край, але при дуже вузькій колонці погано
                        % ? можуть виникати Underfull \hbox
  }
  {\endlist}
% Нова команда для списку ключових слів
\newcommand{\keywords}[1]{%
  \iflanguage{\bbl@main@language}{%
    \gdef\@keywords{#1}%
  }{%
    \expandafter\addto\csname captions\languagename\endcsname{%
      \def\@keywords{#1}%
    }%
  }%
}
%
\renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \@maketitle
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  % \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  {\scshape
   \@ifundefined{@institution@office}{\relax}{\@institution@office\par}
   \@institution\par}
  \smallskip
  {\scshape
   \@ifundefined{@council@institutiont@office}{\relax}{\@council@institutiont@office\par}
   \@council@institutiont\par}
  % {\scshape\@council@institutiont@office\par\@council@institutiont\par}
  \vspace{\stretch{3}}%
% TODO: Вирівняти цей напис по лівому краю.
  {\raggedleft
    \manuscriptname{\\}%
    \par}%
  \vspace{\stretch{2}}%
  {\bfseries\expandafter\emphsurname\@author \par}%
  \vspace{\stretch{2}}%
  {\raggedleft
    \@ifundefined{@secret}{}{%
      \@secret\\
      \CYRP\cyrr\cyri\cyrm.~\No~\placeholder[5mm]\\}
    \CYRU\CYRD\CYRK\ \@udc \par}%
  \vspace{\stretch{1}}%
  {\bfseries\scshape\CYRD\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyrya\par}
  {\large\bfseries\scshape \@title \par}%
  \vspace{\stretch{1}}%
  \@specialitycode\ --- \@specialityname\par
  \vspace{\stretch{1}}%
% TODO: 1. Незрозуміло, чи «галузь знань», про яку згадується в зразку,
% це те саме, що «галузь науки»
% з Переліку спеціальностей, за якими проводяться захист дисертацій...
% (тобто з файла speciality.20070212N70)?
% Поточна версія переліку:
% http://zakon.rada.gov.ua/go/z1133-11
% 2. Якщо так, то у speciality.20070212N70 вона зберігається в родовому відмінку.
% Треба або перетворювати в називний відмінок (якщо за зразком треба називний),
% або змінювати файл, щоб зберігати у називному.
% У будь-якому разі, нижче треба галузь науки в родовому (Подається на здобуття...).
% 3. Але, мабуть, це інше:
% з переліку галузей знань і спеціальностей,
% за якими здійснюється підготовка здобувачів вищої освіти
% http://zakon.rada.gov.ua/go/266-2015-%D0%BF
% Тоді потрібен ще один файл спеціальностей?
% 4. Чи, може, тут треба писати
% шифр і назва спеціальності -- для кандидатів наук,
% галузь знань -- для докторів філософії.
% Див. також приклад анотації (там і те, й те).
% FIXME: Незрозуміло, коли і що тут писати. Тому тимчасово закоментував.
% Кому треба -- розкоментуйте чи напишіть своє.
  % \@science\par
  \end{center}
  \vspace{\stretch{2}}%
  {\small% Це не основний текст для титульної сторінки, тому зменшимо.
    % Подається на здобуття наукового ступеня
    \CYRP\cyro\cyrd\cyra\cyrie\cyrt\cyrsftsn\cyrs\cyrya\
    \cyrn\cyra\ \cyrz\cyrd\cyro\cyrb\cyru\cyrt\cyrt\cyrya\
    \cyrn\cyra\cyru\cyrk\cyro\cyrv\cyro\cyrg\cyro\
    \cyrs\cyrt\cyru\cyrp\cyre\cyrn\cyrya\
% TODO: Якщо вище галузь знань = педагогічних наук,
% то навіщо ще й тут писати «кандидата педагогічних наук»?
    \degreename\cyra\
    \@science\unskip.
    % Дисертація містить результати власних досліджень.
    \CYRD\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyrya\
    \cyrm\cyrii\cyrs\cyrt\cyri\cyrt\cyrsftsn\
    \cyrr\cyre\cyrz\cyru\cyrl\cyrsftsn\cyrt\cyra\cyrt\cyri\
    \cyrv\cyrl\cyra\cyrs\cyrn\cyri\cyrh\
    \cyrd\cyro\cyrs\cyrl\cyrii\cyrd\cyrzh\cyre\cyrn\cyrsftsn.
    % Використання ідей, результатів і текстів інших авторів мають посилання на відповідне джерело 
    \CYRV\cyri\cyrk\cyro\cyrr\cyri\cyrs\cyrt\cyra\cyrn\cyrn\cyrya\
    \cyrii\cyrd\cyre\cyrishrt,
    \cyrr\cyre\cyrz\cyru\cyrl\cyrsftsn\cyrt\cyra\cyrt\cyrii\cyrv\
    \cyrii\
    \cyrt\cyre\cyrk\cyrs\cyrt\cyrii\cyrv\
    \cyrii\cyrn\cyrsh\cyri\cyrh\
    \cyra\cyrv\cyrt\cyro\cyrr\cyrii\cyrv\
    \cyrm\cyra\cyryu\cyrt\cyrsftsn\
    \cyrp\cyro\cyrs\cyri\cyrl\cyra\cyrn\cyrn\cyrya\
    \cyrn\cyra\
    \cyrv\cyrii\cyrd\cyrp\cyro\cyrv\cyrii\cyrd\cyrn\cyre\
    \cyrd\cyrzh\cyre\cyrr\cyre\cyrl\cyro.
    % \newline
    \placeholder[25mm]
    \@shortauthor\par}
  \vspace{\stretch{2}}%
  {% \raggedleft
   % \noindent
   \let\\\@format@person
   % \ifx\@supervisors\@empty
   %   \hbox{}\hbox{}\hbox{}
   % \else
   %   \@supervisors@caption\@supervisors\relax
   % \fi
   \ifx\@supervisors\@empty
   \else
     \begin{listofpersons}{\@supervisors@caption}
       \@supervisors\relax
     \end{listofpersons}
   \fi
   % \par
  }%
  \vspace{\stretch{3}}%
  \begin{center}
  \@towni\ --- \@year}
\def\@supervisors@caption{%
  \ifnum\value{@supervisors@count}>1
    \manysupervisorsname:%
  \else
    \onesupervisorname:%
  \fi}
\def\@format@person#1#2{\item
  \textbf{#1}, \linebreak[1]\@@format@person#2,,\@nil
  \let\makelabel\makephantomlabel
  \futurelet\next\@delimit@person}
% Команда, що збирає сторінку/сторінки з анотацією
\newcommand\makeabstract{%
  \begin{abstractpage}%
    \@makeabstract{ukrainian}%
    \@makeabstract{english}%
  \end{abstractpage}%
}
\def\@makeabstract#1{%
  \begin{otherlanguage}{#1}
    \emph{\shortauthor@}
    \@title.
    \cdash---
    \manuscriptname{\relax}.
    \par
    \thesisdescriptionname{\degreename}{\@science}{\@specialitycode}{\@specialityname}.
    \cdash---
    \@institution;
    \@council@institution,
    \@towni,
    \@year.
    \par
    \smallskip
    \@abstract
    \par
    \smallskip
    \emph{\keywordsname}:
    \@keywords.
    \par
    \bigskip
  \end{otherlanguage}%
}
% Різні варіанти, як можна зберегти вміст оточення:
% 1.
% \newbox\abstractbox
% \renewenvironment{abstract}{%
%   \global\setbox\abstractbox=\vtop\bgroup
% }{%
%   \egroup
%   \iflanguage{\bbl@main@language}{%
%     \gdef\@abstractboxcontent{\box\abstractbox}%
%   }{%
%     \expandafter\addto\csname captions\languagename\endcsname{%
%       \def\@abstractboxcontent{\box\abstractbox}%
%     }%
%   }%
% }
% \newsavebox{\abstractbox}
% \savebox{\abstractbox}{12345}
% \renewenvironment{abstract}{%
%   \savebox{\abstractbox}\bgroup
% }{%
%   \egroup
%   \def\@abstractboxcontent{\usebox{\abstractbox}}%
%   \iflanguage{\bbl@main@language}{%
%     \gdef\@abstractboxcontent{\usebox{\abstractbox}}%
%   }{%
%     \expandafter\addto\csname captions\languagename\endcsname{%
%       \def\@abstractboxcontent{\usebox{\abstractbox}}%
%     }%
%   }%
% }
% 2.
% https://tex.stackexchange.com/questions/70016/ways-to-grab-and-store-larger-amount-of-text
% https://tex.stackexchange.com/questions/49129/lrbox-in-newenvironment
% \long\def\abstract#1\endabstract{\def\@abstractboxcontent{#1}}
% \let\endabstract\relax
% \newsavebox{\abstractbox}
% \renewenvironment{abstract}{%
%   \lrbox{0\null\global\setbox\abstractbox}%
% }{%
%   \endlrbox
%   \xdef\@abstractboxcontent\expandafter{\usebox{\abstractbox}}%
% }
% Зупинився на варіанті з використанням пакунку environ.
%
% Пакунок environ до версії v0.3 не вміє переозначувати оточення,
% які створені не його засобами.
% Тому треба спочатку скасувати стандартне означення,
% потім означити оточення за допомогою команди з environ,
% а потім переозначити його ж засобами.
% Це був тимчасовий обхід проблеми,
% бо я деякий час використовував машину зі старим environ.
% \let\abstract\relax
% \let\endabstract\relax
% \NewEnviron{abstract}{}
\RenewEnviron{abstract}{%
  \iflanguage{\bbl@main@language}{%
    \xdef\@abstract{\BODY}%
  }{%
    \expandafter\g@addto@macro\csname captions\languagename\expandafter\endcsname\expandafter{%
      \expandafter\def\expandafter\@abstract\expandafter{\BODY}%
    }%
  }%
}
%
\newenvironment{abstractpage}{%
  % \chapter*{\abstractname}%
  % Щоб заголовок Анотація не потрапляв у зміст.
  % REVIEW: Скопійовано з \tableofcontents.
  % Потрібна додаткова перевірка.
  \@tocheader{%
    \abstractname
    \@mkboth{\MakeUppercase\abstractname}{\MakeUppercase\abstractname}%
  }%
}{%
%
}
% Копіювання відомостей про апробацію зі вступу в додаток.
% TODO: Чи слово approval підходить тут?
% https://en.wiktionary.org/wiki/approval
% https://en.wiktionary.org/wiki/approbation
% https://e2u.org.ua/s?w=%D0%B0%D0%BF%D1%80%D0%BE%D0%B1%D0%B0%D1%86%D1%96%D1%8F&dicts=all&highlight=on&filter_lines=on
\NewEnviron{approval}[1][\approvalname]{%
  \paragraph{#1}%
  \global\let\sav@approval\BODY
  \BODY
}
\newcommand{\repeatapproval}{%
  \def\approvalname{%
    % Відомості про апробацію результатів дисертації
    {\cyr\CYRV\cyrii\cyrd\cyro\cyrm\cyro\cyrs\cyrt\cyrii\
      \cyrp\cyrr\cyro\
      \cyra\cyrp\cyrr\cyro\cyrb\cyra\cyrc\cyrii\cyryu\
      \cyrr\cyre\cyrz\cyru\cyrl\cyrsftsn\cyrt\cyra\cyrt\cyrii\cyrv\
      \cyrd\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyryi}%
  }%
  \renewcommand{\participation}[1]{\unskip, ##1}%
  \section{\approvalname}%
  \sav@approval
}
\def\approvalname{%
  % Апробація матеріалів дисертації
  {\cyr\CYRA\cyrp\cyrr\cyro\cyrb\cyra\cyrc\cyrii\cyrya\
    \cyrm\cyra\cyrt\cyre\cyrr\cyrii\cyra\cyrl\cyrii\cyrv\
    \cyrd\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyryi}%
}%
% Цією командою позначаємо форму участі в конференції.
% Тоді можна зробити так, щоб у вступі не писати, а в додатку -- писати.
\newcommand{\participation}[1]{\unskip}
% Список публікацій здобувача
% Це буде після анотації, без заголовка
\newenvironment{authorpublications}[1]
     {% \chapter*{\bibname}%
      % \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv\@bibmark}}%
           {\settowidth\labelwidth{\@biblabel{#1\@bibmark}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv\@bibmark}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
     }
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
% Це буде в додатку, як підрозділ
\newenvironment{reauthorpublications}[1]
     {\section{\bibname}%
      % \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv\@bibmark}}%
           {\settowidth\labelwidth{\@biblabel{#1\@bibmark}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv\@bibmark}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
     }
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
% Спочатку пробував копіювати оточення.
% Виникла проблема, що копіювали тільки внутрішність, без \list, \endlist.
% Отже, треба про це потурбуватися у повторі.
% Але насправді немає потреби копіювати те, що всередині оточення.
% Можна просто підтягнути ще раз готовий .bbl-файл (цей варіант використовую).
% TODO: Що робити, якщо вміст .bbl-файла вставлено в .tex-файл?
%       Або просто автор робить список літератури вручну, без BibTeX?
%       Тоді цей підхід не працюватиме.
% TODO: Якщо в анотації два списки публікацій здобувача (укр. і англ.),
%       то який підтягувати в додатку?
% \NewEnviron{thepublications}[1]
%      {% \chapter*{\bibname}%
%       % \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
%       \list{\@biblabel{\@arabic\c@enumiv\@bibmark}}%
%            {\settowidth\labelwidth{\@biblabel{#1\@bibmark}}%
%             \leftmargin\labelwidth
%             \advance\leftmargin\labelsep
%             \@openbib@code
%             \usecounter{enumiv}%
%             \let\p@enumiv\@empty
%             \renewcommand\theenumiv{\@arabic\c@enumiv\@bibmark}}%
%       \sloppy
%       \clubpenalty4000
%       \@clubpenalty \clubpenalty
%       \widowpenalty4000%
%       \global\let\sav@publications\BODY
%       \BODY
%      }
%      [\def\@noitemerr
%        {\@latex@warning{Empty `thepublications' environment}}%
%       \endlist]
% \newcommand{\repeatpublications}{%
%       \chapter*{\bibname}%
%       \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
%       \list{\@biblabel{\@arabic\c@enumiv\@bibmark}}%
%            {\settowidth\labelwidth{\@biblabel{AA\@bibmark}}%
%             \leftmargin\labelwidth
%             \advance\leftmargin\labelsep
%             \@openbib@code
%             \usecounter{enumiv}%
%             \let\p@enumiv\@empty
%             \renewcommand\theenumiv{\@arabic\c@enumiv\@bibmark}}%
%       \sloppy
%       \clubpenalty4000
%       \@clubpenalty \clubpenalty
%       \widowpenalty4000%
%   \sav@publications% !!!
%      \def\@noitemerr
%        {\@latex@warning{Empty `thebibliography' environment}}%
%       \endlist}
\newcommand{\repeatauthorpublications}{%
  \def\bibname{% Список публікацій здобувача за темою дисертації
    {\cyr\CYRS\cyrp\cyri\cyrs\cyro\cyrk\
      \cyrp\cyru\cyrb\cyrl\cyrii\cyrk\cyra\cyrc\cyrii\cyrishrt\
      \cyrz\cyrd\cyro\cyrb\cyru\cyrv\cyra\cyrch\cyra\
      \cyrz\cyra\
      \cyrt\cyre\cyrm\cyro\cyryu\
      \cyrd\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyryi}}%
  \let\thebibliography\reauthorpublications
  \let\endthebibliography\endreauthorpublications
  \let\@lbibitem\simple@lbibitem
  \let\@bibitem\simple@bibitem
  \@input@{\jobname1.bbl}%
}
% Для \bibitem, яка тільки позначка, але посилання на неї не буде.
% Щоб уникнути multiply-defined labels.
\def\simple@lbibitem[#1]#2{\item[\@biblabel{#1}\hfill]\ignorespaces}
\def\simple@bibitem#1{\item\ignorespaces}
% Тут внесено зміни для підтримки authorpublications.
\renewenvironment{bibset}[2][]
  {\stepcounter{currbibset}%
   \def\@temp{#1}%
   \ifx\@temp\@empty
     \def\@bibmark{\relax}%FIXME: \def\@bibmark{} не працює
   \else
     \def\@bibmark{\textsuperscript{#1}}%
   \fi
   \let\@sav@lbibitem\@lbibitem
   \def\@lbibitem[##1]##2{\@sav@lbibitem[##1\@bibmark]{##2}}%
   \@ifundefined{hyper@warn}
%% якщо не підключений пакет hyperref
     {\def\@bibitem##1{\item\if@filesw \immediate\write\@auxout
        {\string\bibcite{##1}{\the\value{\@listctr}\expandafter\string\@bibmark}}%
        \fi\ignorespaces}}
%% якщо підключений пакет hyperref
     {\def\@bibitem##1{%
      \@skiphyperreftrue\H@item\@skiphyperreffalse
      \hyper@anchorstart{cite.##1}\relax\hyper@anchorend
      \if@filesw {\let\protect\noexpand
      \immediate\write\@auxout{%
        \string\bibcite{##1}{\the\value{\@listctr}\expandafter\string\@bibmark}}}%
      \fi
      \ignorespaces}}%
   \def\bibname{#2}%
   \let\bibliography\@thisbibliography
   \let\bibliographystyle\@thisbibliographystyle
% Якщо перший, то це список публікацій здобувача після анотації.
   \ifnum\thecurrbibset=1
     \let\thebibliography\authorpublications
     \let\endthebibliography\endauthorpublications
     \let\@lbibitem\simple@lbibitem
     \let\@bibitem\simple@bibitem
   \fi}
  {\ifnum\thecurrbibset=\theneedbibset
     \ifnum\theneedbibset=1
       \immediate\write\@auxout{\string\setcounter{needbibset}{2}}%
     \else
       \immediate\write\@auxout{\string\setcounter{needbibset}{1}}%
     \fi
   \fi}
% Зарезервовані слова (англійською і українською)
% TODO: Перекласти англійською всі службові слова.
% Перекладено тільки ті слова, що використовуються в анотації.
% Тому можна використовувати, якщо головна мова документа -- ukrainian,
% і анотації українською і англійською.
% Але не рекомендовано використовувати для англомовних документів
% (коли english -- головна мова документа).
\AtBeginDocument{%
\if@cthesis
  \addto\captionsenglish{\def\degreename{candidate}}%
  \addto\captionsukrainian{\def\degreename{\cyrk\cyra\cyrn\cyrd\cyri\cyrd\cyra\cyrt}}%
\else
  \addto\captionsenglish{\def\degreename{doctor}}%
  \addto\captionsukrainian{\def\degreename{\cyrd\cyro\cyrk\cyrt\cyro\cyrr}}%
\fi
\addto\captionsenglish{%
  \def\manuscriptname#1{%
    % FIXME: Qualification чи Qualifying?
    Qualification scientific work#1 in the form of manuscript%
  }%
  \def\thesisdescriptionname#1#2#3#4{%
    Thesis for #1 degree
    in #2
    (doctor of philosophy),
    % TODO: У файлі speciality -- назва спеціальності з маленької.
    % Але у зразку в наказі -- з великої.
    % Як правильно: змінювати тут чи змінити файл speciality?
    % Для англійського варіанту анотації буде з великої,
    % якщо так задано у факультативному аргументі команди \speciality.
    speciality #3 ``#4''%
    % TODO: Цвяхами прибито те, що в зразку.
    % Бо я не знаю, що тут писати.
    % Для інших спеціальностей треба вручну виправити.
    % FIXME: Незрозуміло, коли і що тут писати. Тому тимчасово закоментував.
    % Кому треба -- розкоментуйте і напишіть своє.
    % \ (012 \cdash--- Preschool education)%
  }%
  \def\keywordsname{Key words}%
}
\addto\captionsukrainian{%
  \def\manuscriptname#1{%
    % Кваліфікаційна наукова праця на правах рукопису
    \CYRK\cyrv\cyra\cyrl\cyrii\cyrf\cyrii\cyrk\cyra\cyrc\cyrii\cyrishrt\cyrn\cyra\
    \cyrn\cyra\cyru\cyrk\cyro\cyrv\cyra#1
    \cyrp\cyrr\cyra\cyrc\cyrya\
    \cyrn\cyra\
    \cyrp\cyrr\cyra\cyrv\cyra\cyrh\
    \cyrr\cyru\cyrk\cyro\cyrp\cyri\cyrs\cyru
  }%
  \def\thesisdescriptionname#1#2#3#4{%
    % Дисертація на здобуття наукового ступеня
    % кандидата педагогічних наук (доктора філософії)
    \CYRD\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyrya\
    \cyrn\cyra\
    \cyrz\cyrd\cyro\cyrb\cyru\cyrt\cyrt\cyrya\
    \cyrn\cyra\cyru\cyrk\cyro\cyrv\cyro\cyrg\cyro\
    \cyrs\cyrt\cyru\cyrp\cyre\cyrn\cyrya\
    #1\cyra\
    #2
    (\cyrd\cyro\cyrk\cyrt\cyro\cyrr\cyra\
    \cyrf\cyrii\cyrl\cyro\cyrs\cyro\cyrf\cyrii\cyryi)
    \cyrz\cyra\
    \cyrs\cyrp\cyre\cyrc\cyrii\cyra\cyrl\cyrsftsn\cyrn\cyrii\cyrs\cyrt\cyryu\
    #3
    % TODO: У файлі speciality -- назва спеціальності з маленької.
    % Але у зразку в наказі -- з великої.
    % Як правильно: змінювати тут чи змінити файл speciality?
    <<#4>>%
    % TODO: Цвяхами прибито те, що в зразку.
    % Бо я не знаю, що тут писати.
    % Для інших спеціальностей треба вручну виправити.
    % FIXME: Незрозуміло, коли і що тут писати. Тому тимчасово закоментував.
    % Кому треба -- розкоментуйте і напишіть своє.
    % \ (012
    % \cdash---
    % \CYRD\cyro\cyrsh\cyrk\cyrii\cyrl\cyrsftsn\cyrn\cyra\
    % \cyro\cyrs\cyrv\cyrii\cyrt\cyra)%
  }%
  \def\keywordsname{\CYRK\cyrl\cyryu\cyrch\cyro\cyrv\cyrii\ \cyrs\cyrl\cyro\cyrv\cyra}%
}
}
\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Local Variables:
% mode: latex
% coding: windows-1251-dos
% End:
