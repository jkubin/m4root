__HEADER([Josef Kubin], [2019/12/03], [https://www.root.cz/clanky/generovani-kodu-v-m4-uvod])
___DESCR([the introductory part])

VERSION_TEMPLATE(1, 0, 0)


CAPTION([dnl czech
[SERIES_NAME: úvod],
dnl english: _next_language_
[SERIES_NAME: introduction],
])

PEREX_IMG([img/m4tux.png], [https://i.iinfo.cz/images/154/m4tux-1-prev.png])


PEREX([defn([PEREX_CS])[dnl czech
Úvodní díl seriálu obsahuje jeho historii, základní principy jazyka, příklady použití a[]NB()nutné předpoklady pro jeho zvládnutí.
],
defn([PEREX_EN])[dnl english: _next_language_
The introductory part of the series contains its history, the basic principles of language, examples of usage and prerequisites for its mastery.
]])


CHAPTER([dnl czech
[Úvod],
dnl english: _next_language_
[Introduction],
])

PARA([[dnl czech
Čtenáři tohoto seriálu se naučí psát skripty pro strojové generování kódu.
Strojově generovaný kód může být libovolně složitý a[]NB()může obsahovat další vnitřní závislosti.
Vzájemně závislé soubory se složitým kódem jsou pro člověka jen těžce udržitelné v[]NB()konzistentním stavu.
Je už nutné použít nějaký mechanismus pro generování kódu.
Generování kódu provádí nástroj určený pro transformaci textu – BOLD([makro procesor]).
],
[dnl english: _next_language_
Readers of this series will learn how to write scripts for machine code generation.
The machine-generated code can be arbitrarily complex and can contain other internal dependencies.
Interdependent files with complex code are hardly sustainable for humans in a[]NB()consistent state.
It is necessary to use some code generation mechanism.
The code generation is performed by a[]NB()tool for text transformation – BOLD([a[]NB()macro processor]).
]])

PARA([what_is_the_series_about], [[dnl czech
Seriál je zaměřen na praktické použití BOLD([univerzálního makro procesoru M4]) (dále jen M4) pomocí malých příkladů.
Popisuje také teoretický základ všech implementací.
Cílem seriálu je seznámit čtenáře s[]NB()tímto EXPL([nástrojem], [m4 – je program příkazové řádky]) a[]NB()také programovacím EXPL([jazykem], [M4 – je programovací jazyk]).
LINK([Na co se používá], [main_uses_of_m4]), jak se v[]NB()něm programuje a[]NB()jaké jsou jeho LINK([výhody], [why_to_use_m4]) a[]NB()LINK([nevýhody], [why_not_use]).
],
[dnl english: _next_language_
The series focus on the practical use of the BOLD([universal macro processor M4]) (hereafter M4) using small examples.
It also describes the theoretical part of all its implementations.
The aim of the series is to acquaint the reader with this EXPL([tool], [m4 – is a command line program]) and also the programming EXPL([language], [M4 – is a programming language]).
LINK([What is it used for], [main_uses_of_m4]), how to program in it and its LINK([advantages], [why_to_use_m4]) and LINK([disadvantages], [why_not_use]).
]])

# same tip box for each part
the_series_is_generated()

PARA([[dnl czech
Úvodní díl popisuje základní principy jazyka na jednoduchých příkladech.
Všechny příklady používají přepisovací pravidla LINK([bezkontextové gramatiky], [context_free_grammar]).
Později se naučíme používat LINK([výstupní fronty], [output_queues]),
LINK([automaty], [automata_descr]), asociativní paměti, zásobníky a[]NB()zásobníkové automaty.
Naučíme se také psát LINK([testovací automaty], [testing_automaton]) pro testování vstupních dat.
],
[dnl english: _next_language_
The introductory part describes the basic principles of the language with simple examples of use.
All examples use rewriting rules of LINK([context-free grammar], [context_free_grammar]).
Later we will learn how to use LINK([output queues], [output_queues]),
LINK([automata], [automata_descr]), associative memories, stacks and pushdown automata.
We will also learn how to write LINK([testing automata], [testing_automaton]) to test input data.
]])


SECT1([dnl czech
[Příklady pro čtenáře],
dnl english: _next_language_
[Examples for readers],
])

PARA([[dnl czech
Příklady pro čtenáře tvoří komplementární část seriálu a[]NB()budou do jisté míry vytvářeny na základě podnětů v[]NB()diskuzi pod článkem.
Na začátku každého dílu je popsána nějaká část jazyka M4 doplněná sadou příkladů na konci.
Každý díl je možné číst v[]NB()libovolném pořadí.
],
[dnl english: _next_language_
The examples are a[]NB()complementary part of the series and will be based to some extent on the discussion below the article.
At the beginning of each episode, some parts of the M4 language will be described and supplemented with a[]NB()set of examples at the end.
Each part can be read in any order.
]])

ITEMIZEDLIST_WRAP([

LISTITEM_MONO([[LINK([code_generation_examples], [code_generation_examples])]])

LISTITEM_MONO([[LINK([preproc_examples], [preproc_examples])]])

LISTITEM_MONO([[LINK([m4_on_examples], [m4_on_examples])]])

LISTITEM_MONO([[LINK([questions_and_answers], [questions_and_answers])]])

LISTITEM([dnl czech
[ULINK([http://github.com/jkubin/m4root], defn([SERIES_NAME]), [http://github.com/jkubin/m4root]) – složitější projekt generující HTML5 tohoto seriálu],
dnl english: _next_language_
[ULINK([http://github.com/jkubin/m4root], defn([SERIES_NAME]), [http://github.com/jkubin/m4root]) – more complex project generating HTML5 of this series],
])

])dnl ITEMIZEDLIST_WRAP


CHAPTER([dnl czech
[Historie makro jazyků],
dnl english: _next_language_
[History of macro languages],
])

PARA([[dnl czech
Makro jazyky byly vynalezeny v[]NB()době, kdy dominoval jazyk symbolických adres – ABBR([JSA], [Jazyk Symbolických Adres – assembler]).
Zdrojový kód JSA velmi často obsahuje shodné sekvence instrukcí odlišující se pouze hodnotami operandů.
Shodné sekvence instrukcí je možné seskupit do jednoho slova, nebo-li BOLD([makro instrukce]).
Jméno obvykle popisuje účel skryté sekvence instrukcí.
Makro instrukce se přeloží makro procesorem na původní sekvenci instrukcí, která se posléze přeloží do spustitelného strojového kódu.
Programování v[]NB()JSA pomocí makro instrukcí je jednodušší, rychlejší a[]NB()méně náchylné k[]NB()lidským chybám.
],
[dnl english: _next_language_
Macro languages were invented when the assembly language (ASM) dominated.
ASM source code usually contains identical instruction sequences that differ only in operand values.
Identical instruction sequences can be grouped into one word or a[]NB()BOLD([macro instruction]).
The name usually describes the purpose of the hidden sequence of instructions.
These macro instructions are translated by the macro processor to the original instruction sequences, which are then translated into the executable machine code.
Programming in ASM using macro instructions is simpler, faster and less prone to human errors.
]])

PARA([[dnl czech
Později byly makro jazyky použity k[]NB()rozšíření kompilovaných programovacích jazyků, protože umožnily psát zdrojový kód na vyšší úrovni abstrakce než jakou poskytuje samotný programovací jazyk.
Rychlost, výkonnost a efektivita složitého programovacího jazyka nižší úrovně je zachována díky makro jazykům.
Avšak je důležité dobře rozumět všem vrstvám kódu.
],
[dnl english: _next_language_
Later, macro languages were used to extend compiled programming languages because they made it possible to write a source code at the higher level of abstraction than offered by the programming language itself.
The speed, performance and efficiency of a[]NB()complex lower-level programming language is maintained through macro languages.
However, it is important to understand all layers of code well.
]])

BRIDGEHEAD_MONO([dnl monolingual
[GPM (General Purpose Macro-generator)],
])

PARA([[dnl czech
Základní myšlenku přepisování textových řetězců s[]NB()argumenty, které se přepíší do dalších rekurzivně přepisovatelných řetězců, představil
ULINK([PERSON([Christopher Strachey])], [Wikipedie], [https://en.wikipedia.org/wiki/Christopher_Strachey]) ve svém
ABBR([GPM], [General Purpose Macro-generator])[]REF([A[]NB()General Purpose Macro-generator], [Computer Journal 8, 3 (1965), 225–41], [http://dx.doi.org/10.1093/comjnl/8.3.225]) v[]NB()roce 1965.
Další generace makro procesorů M3 a[]NB()M4 původní ABBR([GPM], [General Purpose Macro-generator]) v[]NB()podstatě už jen rozšiřovaly.
Základní myšlenka původního návrhu ale zůstala stejná.
],
[dnl english: _next_language_
ULINK([PERSON([Christopher Strachey])], [Wikipedia], [https://en.wikipedia.org/wiki/Christopher_Strachey]) introduced the basic idea of rewritable strings with arguments which recursively rewrite to other strings in his
ABBR([GPM], [General Purpose Macro-generator])[]REF([A[]NB()General Purpose Macro-generator], [Computer Journal 8, 3 (1965), 225–41], [http://dx.doi.org/10.1093/comjnl/8.3.225]) in 1965.
The next generation of M3 and M4 macro processors basically just expanded the original ABBR([GPM], [General Purpose Macro-generator]).
The basic idea of the original proposal remained the same.
]])

BRIDGEHEAD_MONO([dnl monolingual
[M3],
])

PARA([[dnl czech
ULINK([PERSON([Dennis Ritchie])], [Wikipedie], [https://cs.wikipedia.org/wiki/Dennis_Ritchie]) převzal základní myšlenku ABBR([GPM], [General Purpose Macro-generator]) a[]NB()napsal vylepšený makro procesor pro generování zdrojového kódu programovacího jazyka C (1972), který sám navrhl.
Nový BOLD([m])akro procesor napsal pro minipočítač AP-BOLD([3]), odtud jméno BOLD([M3]).
Tento přímý předchůdce současného M4 dokázal výrazně ušetřit těžkou a[]NB()časově náročnou práci, čímž zaujal vývojáře programující v[]NB()jiných jazycích (ABBR([FORTRAN], [FORmula TRANslation]), ABBR([COBOL], [COmmon Business-Oriented Language]), ABBR([PL/I], [Programming Language One]), …).
Vývojáři upravovali M3 pro tyto jazyky čímž ho proměnili na univerzálně použitelný makro procesor M4.
],
[dnl english: _next_language_
ULINK([PERSON([Dennis Ritchie])], [Wikipedia], [https://en.wikipedia.org/wiki/Dennis_Ritchie]) took over the basic idea of ABBR([GPM], [General Purpose Macro-generator]) and wrote an improved macro processor for generating source code of C[]NB()(1972) language, which he himself designed.
The new BOLD([m])acro processor was written for the minicomputer AP-BOLD([3]), hence the name BOLD([M3]).
This direct ancestor of the current M4 managed to significantly save heavy and time-consuming work and attract developers programming to other languages (ABBR([FORTRAN], [FORmula TRANslation]), ABBR([COBOL], [COmmon Business-Oriented Language]), ABBR([PL/I], [Programming Language One]), …).
Developers have customized M3 for these languages turning it into a[]NB()universally usable M4 macro processor.
]])

NOTE_WRAP(, [m4 ∈ {]LANG([množina nástrojů UNIX-u], [set of UNIX tools])[}], [

PLAIN_TEXT([[dnl czech
PERSON([Dennis Ritchie]) byl také spolutvůrcem operačního systému UNIX a[]NB()proto:
],
[dnl english: _next_language_
PERSON([Dennis Ritchie]) was also a[]NB()co-creator of UNIX and therefore:
]])

ITEMIZEDLIST_WRAP([

LISTITEM([[dnl czech
M4 je minimalistický a[]NB()rychlý, ULINK([dělá jednu věc a[]NB()tu dělá dobře], [Filosofie UNIX-u
Wikipedie], [https://cs.wikipedia.org/wiki/Filosofie_Unixu])
],
[dnl english: _next_language_
M4 is minimalist and fast, ULINK([it does one thing and it does well], [UNIX philosophy
Wikipedia], [https://en.wikipedia.org/wiki/Unix_philosophy])
]])

LISTITEM([[dnl czech
výhradně spoléhá na neinteraktivní rozhraní příkazové řádky
],
[dnl english: _next_language_
it relies solely on the non-interactive command line interface
]])

LISTITEM([[dnl czech
parametry a[]NB()závislosti M4 skriptů popisuje CODE([Makefile])
],
[dnl english: _next_language_
parameters and dependencies of M4 scripts are described by CODE([Makefile])
]])

LISTITEM([[dnl czech
znakem CODE_M4([#]) začíná jednořádkový komentář jako v[]NB()UNIX-ovém shell-u
],
[dnl english: _next_language_
the CODE_M4([#]) character begins with a[]NB()one-line comment like in a[]NB()UNIX shell
]])

LISTITEM([[dnl czech
proměnné CODE([$[@]]), CODE([$[*]]), CODE([$[#]]), CODE([$[0]]), CODE([$[1]]), CODE([$[2]]), … mají podobný význam jako v[]NB()shell-u
],
[dnl english: _next_language_
variables CODE([$[@]]), CODE([$[*]]), CODE([$[#]]), CODE([$[0]]), CODE([$[1]]), CODE([$[2]]), … have similar meanings as in a[]NB()UNIX shell
]])

LISTITEM([[dnl czech
oddělovač argumentů je čárka
],
[dnl english: _next_language_
the argument delimiter is comma
]])

])dnl ITEMIZEDLIST_WRAP

])dnl NOTE_WRAP

PARA([[dnl czech
Makro procesor M3 rozšířil také PERSON([Jim E. Weythman]), autor programové konstrukce, která se používá téměř v[]NB()každém M4 skriptu:
],
[dnl english: _next_language_
The M3 macro processor was also extended by PERSON([Jim E. Weythman]), the author of program construction, which is used in almost every M4 script:
]])

PROGRAMLISTING([common_code], [dnl
[divert(-1)
…
define(…)
…
divert(0)dnl
…]
])dnl PROGRAMLISTING

NOTE(, defn([WORD_NOTE]), [[dnl czech
Klíčové slovo HCODE([[divert](ULINK([ℤ], [celé číslo], [https://cs.wikipedia.org/wiki/Cel%C3%A9_%C4%8D%C3%ADslo]))], [divert(-1), divert(0), divert(1), …, divert(2147483647)], [[[1, 5], [common_code]]]) přepíná výstupní fronty.
Argument CODE([-1]) zcela vypne jakýkoliv textový výstup.
Argument CODE([0]) přepne výstup na CODE_M4([stdout]) (standardní výstup).
],
[dnl english: _next_language_
The HCODE([[divert](ULINK([ℤ], [integer], [https://en.wikipedia.org/wiki/Integer]))], [divert(-1), divert(0), divert(1), …, divert(2147483647)], [[[1, 5], [common_code]]]) keyword switches output queues.
Argument CODE([-1]) completely disables any text output.
Argument CODE([0]) switches output to CODE([stdout]) (standard output).
]])

BRIDGEHEAD_MONO([dnl monolingual
[M4],
])

PARA([[dnl czech
ULINK([PERSON([Brian Kernighan])], [Wikipedie], [https://cs.wikipedia.org/wiki/Brian_Kernighan]) makro procesor M3 rozšířil na ULINK([preprocesor], [Wikipedie], [https://cs.wikipedia.org/wiki/Preprocesor]) jazyka FORTRAN 66,
aby mohl vytvořit hybridní jazykovou nadstavbu pojmenovanou ABBR([BOLD([RATFOR])], [RATional FORtran])[]REF([RATFOR — A Preprocessor for a Rational Fortran], [Brian W. Kernighan], [https://wolfram.schneider.org/bsd/7thEdManVol2/ratfor/ratfor.pdf]).
Základní programové konstrukce této nadstavby (podmínky, cykly) jsou stejné jako v[]NB()jazyce C.
Programování v[]NB()RATFOR-u se tak podobá programování v[]NB()QUOTE([céčku]).
Makro procesor zdrojový kód překládá zpátky do FORTRAN-u, poté kompilátor provede překlad do strojového kódu.
],
[dnl english: _next_language_
ULINK([PERSON([Brian Kernighan])], [Wikipedia], [https://en.wikipedia.org/wiki/Brian_Kernighan]) has enhanced the M3 macro processor to the FORTRAN 66
ULINK([preprocessor], [Wikipedia], [https://en.wikipedia.org/wiki/Preprocessor]) to create a[]NB()hybrid language extension named ABBR([BOLD([RATFOR])], [RATional FORtran])[]REF([RATFOR — A Preprocessor for a Rational Fortran], [Brian W. Kernighan], [https://wolfram.schneider.org/bsd/7thEdManVol2/ratfor/ratfor.pdf]).
The basic program constructions of this extension (conditions, cycles) are the same as in C[]NB()language.
Programming in RATFOR is similar to C[]NB()programming.
The macro processor converts the source code back to FORTRAN, then the compiler performs the usual compilation to machine code.
]])

NOTE_WRAP([], LANG([jazyk M4 doplňuje jazyk C], [M4 language complements C language]), [

PLAIN_TEXT([[dnl czech
Všimněte si LINK([téměř dokonalé symbiózy], [cpp_and_m4]) s[]NB()jazykem C
],
[dnl english: _next_language_
Note the LINK([almost perfect symbiosis], [cpp_and_m4]) with the C[]NB()language:
]])

ITEMIZEDLIST_WRAP([

LISTITEM([[dnl czech
direktivy ABBR([CPP], [Preprocesor jazyka C]) CODE_M4([#define]), CODE_M4([#include]), CODE_M4([#ifdef]), … jsou pro M4 komentáře
],
[dnl english: _next_language_
ABBR([CPP], [C preprocessor]) directives CODE_M4([#define]), CODE_M4([#include]), CODE_M4([#ifdef]), … are comments for M4
]])
# LI([této vlastnosti využívají LINK([bezpečnější makra], [safer_macros]) definovaná uživatelem])
# LI([this feature uses LINK([safer user-defined macros], [safer_macros])])

LISTITEM([[dnl czech
klíčová slova oddělená od závorek mezerou, ztrácí svůj původní význam
UL([
LI([M4 například ignoruje funkci CODE_M4([void define (char c, int i) {…}])])
])
],
[dnl english: _next_language_
most keywords separated from parentheses by a[]NB()white character lose meaning
UL([
LI([for example, M4 ignores CODE_M4([void define (char c, int i) {…}])])
])
]])

LISTITEM([[dnl czech
argumenty maker oddělují čárky stejně jako argumenty funkcí jazyka[]NB()C
UL([
LI([je-li definováno makro CODE_M4([FUNC(char c, int i)]), jeho proměnné jsou:[]BR()
CODE([$[#] → 2]), CODE([$[0] → FUNC]), CODE([$[1] → char c]), CODE([$[2] → int i])
])
])
],
[dnl english: _next_language_
macro arguments separate commas just like commas in C[]NB()functions
UL([
LI([if the CODE_M4([FUNC(char c, int i)]) macro is defined, its variables are:[]BR()
CODE([$[#] → 2]), CODE([$[0] → FUNC]), CODE([$[1] → char c]), CODE([$[2] → int i])
])
])
]])

LISTITEM([[dnl czech
BOLD([levý]) LINK([řídící znak], [expansion_control]) CODE([LQ()]) pro neterminály není součástí syntaxe rodiny jazyků[]NB()C
],
[dnl english: _next_language_
BOLD([the left]) LINK([control character], [expansion_control]) CODE([LQ()]) is not a[]NB()part of the C[]NB()family syntax
]])

LISTITEM([[dnl czech
BOLD([pravý]) řídící znak CODE([']) nevadí, není-li součástí makra
UL([LI([oba řídící znaky lze skrýt do uživatelsky definovaných maker CODE_M4([LQ()]), CODE_M4([RQ()])])])
],
[dnl english: _next_language_
BOLD([the right]) control character CODE([']) does not matter if it is not part of the macro[]BR()
UL([LI([both control characters can be hidden into user-defined macros CODE_M4([LQ()]), CODE_M4([RQ()])])])
]])

LISTITEM([[dnl czech
makra se píší CODE([VELKYMI_PISMENY]), stejně jako ULINK([neterminální symboly], [Wikipedie], [https://cs.wikipedia.org/wiki/Termin%C3%A1ln%C3%AD_a_netermin%C3%A1ln%C3%AD_symbol])
UL([LI([tím je vymezen jejich jmenný prostor])])
],
[dnl english: _next_language_
macros are written CODE([IN_UPPERCASE]), just like ULINK([nonterminal symbols], [Wikipedia], [https://en.wikipedia.org/wiki/Terminal_and_nonterminal_symbols])
UL([LI([this delimits their namespace])])
]])

])dnl ITEMIZEDLIST_WRAP

])dnl NOTE_WRAP

PARA([[dnl czech
Uživatelský manuál[]REF([The M4 Macro Processor], [Bell Laboratories (1977)], [https://wolfram.schneider.org/bsd/7thEdManVol2/m4/m4.pdf]) zmiňuje ještě další, zde neuvedené spoluautory.
Bylo by tedy značně nespravedlivé napsat, že autory makro procesoru M4 (1977) jsou EM([pouze]) dva lidé.
],
[dnl english: _next_language_
The user manual[]REF([The M4 Macro Processor], [Bell Laboratories (1977)], [https://wolfram.schneider.org/bsd/7thEdManVol2/m4/m4.pdf]) mentions other co-authors not mentioned here.
So it would be fairly unfair to write that the authors of the M4 macro processor (1977) are EM([only]) two people.
]])

IMAGEDATA([the_authors],dnl id
[Christopher Strachey, Dennis Ritchie, Brian Kernighan],dnl title
[],dnl class
[],dnl style
[],dnl anything
[img/authors.jpg, https://i.iinfo.cz/images/283/authors-of-m4-1.jpg],dnl src
[[dnl czech
Christopher Strachey[]REF([Christopher Strachey], [Computer Hope – Free computer help since 1998], [https://www.computerhope.com/people/christopher_strachey.htm]),
Dennis Ritchie[]REF([Dennis Ritchie], [Zomrel tvorca Unixu a[]NB()jazyka[]NB()C], [https://pc.zoznam.sk/novinka/zomrel-tvorca-unixu-jazyka-c]),
Brian Kernighan[]REF([Brian Kernighan], [An Interview with Brian Kernighan], [https://www.cs.cmu.edu/~mihaib/kernighan-interview/])
],
[dnl english: _next_language_
Christopher Strachey[]REF([Christopher Strachey], [Computer Hope – Free computer help since 1998], [https://www.computerhope.com/people/christopher_strachey.htm]),
Dennis Ritchie[]REF([Dennis Ritchie], [Zomrel tvorca Unixu a[]NB()jazyka[]NB()C], [https://pc.zoznam.sk/novinka/zomrel-tvorca-unixu-jazyka-c]),
Brian Kernighan[]REF([Brian Kernighan], [An Interview with Brian Kernighan], [https://www.cs.cmu.edu/~mihaib/kernighan-interview/])
]])

BRIDGEHEAD_MONO([dnl monolingual
[GNU M4],
])

PARA([[dnl czech
Dnes existuje několik implementací lišící se od původní implementace spíše drobnostmi.
Nejrozšířenější implementace M4 je BOLD([GNU M4]) používaná pro ULINK([Autotools], [Wikipedie], [https://en.wikipedia.org/wiki/GNU_Build_System])
a[]NB()pro překlad jednoduchého konfiguračního souboru CODE([sendmail.mc]) na složitý CODE([sendmail.cf]).
Autorem této implementace z[]NB()roku 1990 je ULINK([PERSON([René Seindal])], [https://www.seindal.dk/rene/gnu/]).
Následující příkaz nainstaluje EXPL([m4], [s malým „m“]):
],
[dnl english: _next_language_
Today, there are several implementations that differ from the original implementation rather by small details.
The most common implementation of M4 is the BOLD([GNU M4]) used for ULINK([Autotools], [Wikipedia], [https://en.wikipedia.org/wiki/GNU_Build_System])
and for translating the simple CODE([sendmail.mc]) configuration file to complex CODE([sendmail.cf]).
The author of this implementation (1990) is ULINK([PERSON([René Seindal])], [https://www.seindal.dk/rene/gnu/]).
To install EXPL([m4], [with small letter „m“]), type the following command:
]])

COMMAND_ROOT([install], LANG([příkaz nainstaluje také další důležité balíčky], [the command also installs other important packages]), [dnl
dnf -y install make m4 pinfo
])

PARA([[dnl czech
Podrobný popis klíčových slov se nachází v[]NB()dokumentaci[]REF([GNU M4 - GNU macro processor], [Free Software Foundation], [https://www.gnu.org/software/m4/manual/]):
],
[dnl english: _next_language_
A[]NB()detailed description of the keywords can be found in the documentation[]REF([GNU M4 - GNU macro processor], [Free Software Foundation], [https://www.gnu.org/software/m4/manual/]):
]])

PROGRAMLISTING([dnl
CMD() BOLD([pinfo m4])
CMD() BOLD([man m4])
CMD() BOLD([m4 --help])
])dnl PROGRAMLISTING


CHAPTER([dnl czech
[Základy jazyka M4],
dnl english: _next_language_
[Basics of M4],
])

PARA([[dnl czech
Základem jazyka M4 je BOLD([bezkontextová gramatika]), BOLD([automaty]), BOLD([zásobníky]) a[]NB()BOLD([výstupní fronty]).
Pro pochopení jazyka M4 je proto velmi důležité rozumět základním pojmům teorie formálních jazyků –
co jsou ULINK([terminální symboly], [Wikipedie], [https://cs.wikipedia.org/wiki/Termin%C3%A1ln%C3%AD_a_netermin%C3%A1ln%C3%AD_symbol]) (stručně BOLD([terminály])) a[]NB()neterminální symboly (stručně BOLD([neterminály])).
Zmíněné pojmy si podrobněji vysvětlíme někdy později.
Cílem tohoto úvodního dílu je hlavně ukázat praktické použití M4 na příkladech.
],
[dnl english: _next_language_
M4 is based on BOLD([context-free grammar]), BOLD([automata]), BOLD([stacks]) and BOLD([output queues]).
To understand M4, it is therefore crucial to understand the basic concepts of formal language theory –
ULINK([terminal symbols], [Wikipedia], [https://en.wikipedia.org/wiki/Terminal_and_nonterminal_symbols]) (briefly BOLD([terminals])) and nonterminal symbols (briefly BOLD([nonterminals])).
These terms will be explained later in more detail.
The objective is to show the basic practical use of M4 language on examples.
]])

SECT1([context_free_grammar], [dnl czech
[Bezkontextová gramatika],
dnl english: _next_language_
[Context-free grammar],
])

PARA([[dnl czech
Bezkontextová gramatika (krátce ABBR([CFG], [Context-Free Grammar – bezkontextová gramatika])) je LINK([formální gramatika], [formal_grammar_chomsky]), ve které mají všechna přepisovací pravidla tvar HCODE([A → β], [[[1], [all_context_free_grammar_rules]]]).
Neterminál HCODE_M4([A], [[[D], [all_context_free_grammar_rules]]]) se HEXPL([přepíše], [[[E], [all_context_free_grammar_rules]]]) na libovolně dlouhý řetězec ABBR([HCODE([β], [[[F], [all_context_free_grammar_rules]]])], [pravá strana přepisovacího pravidla]) složený z[]NB()HEXPL([neterminálů CODE([N])], [[[B], [all_context_free_grammar_rules]]]) HEXPL([nebo], [[[G], [all_context_free_grammar_rules]]]) HEXPL([terminálů CODE([Σ])], [[[A], [all_context_free_grammar_rules]]]).
HEXPL([ULINK([Kleeneho hvězda], [Wikipedie], [https://en.wikipedia.org/wiki/Kleene_star])], [[[C], [all_context_free_grammar_rules]]]) znamená, že se neterminál HCODE_M4([A], [[[D], [all_context_free_grammar_rules]], [[D], [rewriting_rules]]]) může přepsat na ABBR([CODE([ε])], [epsilon – prázdný symbol]) (přepisovací pravidlo HCODE([A → ε], [[[5,6], [rewriting_rules]]])).
],
[dnl english: _next_language_
Context-free grammar (shortly ABBR([CFG], [Context-Free Grammar])) is a[]NB()LINK([formal grammar], [formal_grammar_chomsky]) in which all rules for rewriting have the HCODE([A → β], [[[1], [all_context_free_grammar_rules]]]) form.
The nonterminal HCODE_M4([A], [[[D], [all_context_free_grammar_rules]]]) is HEXPL([rewritten], [[[E], [all_context_free_grammar_rules]]]) to an arbitrarily long ABBR([HCODE([β], [[[F], [all_context_free_grammar_rules]]])], [the right side of the rewriting rule]) string composed of HEXPL([nonterminals CODE([N])], [[[B], [all_context_free_grammar_rules]]]) HEXPL([or], [[[G], [all_context_free_grammar_rules]]]) HEXPL([terminals CODE([Σ])], [[[A], [all_context_free_grammar_rules]]]).
HEXPL([ULINK([Kleene star], [Wikipedia], [https://en.wikipedia.org/wiki/Kleene_star])], [[[C], [all_context_free_grammar_rules]]]) means that nonterminal HCODE_M4([A], [[[D], [all_context_free_grammar_rules]], [[D], [rewriting_rules]]]) can be rewritten to ABBR([CODE([ε])], [epsilon – empty symbol]) (rewriting rule HCODE([A → ε], [[[5,6], [rewriting_rules]]])).
]])

PROGRAMLISTING([all_context_free_grammar_rules], LANG([přepisovací pravidla bezkontextové gramatiky], [context-free grammar rewriting rules]), [dnl
P: MM([A], d) MM([→], e) MM([β], f)
   MM([A], d) ∈ MM([N], b)
   MM([β], f) ∈ (MM([N], b) MM([∪], g) MM([Σ], a))MM([*], c)
])dnl PROGRAMLISTING

BRIDGEHEAD([m4_rules], [dnl czech
[Přepisovací pravidla M4],
dnl english: _next_language_
[M4 rewriting rules],
])

PARA([[dnl czech
Přepisovací pravidla M4 HEXPL([jsou stejná], [[[1], [all_context_free_grammar_rules]], [[2], [rewriting_rules]]]) jako přepisovací pravidla bezkontextové gramatiky.
],
[dnl english: _next_language_
The rules for rewriting HEXPL([are the same], [[[1], [all_context_free_grammar_rules]], [[2], [rewriting_rules]]]) for context-free grammar and M4.
]])

PROGRAMLISTING([rewriting_rules], LANG([přepisovací pravidla M4], [M4 rewriting rules]), [dnl
[# A → β
define(`]MM([A], d)[', `]MM([β], f)[')

# A → ε
define(`]MM([A], d)[')
define(`]MM([A], d)[', `')]
])dnl PROGRAMLISTING

PARA([[dnl czech
Všechna klíčová slova M4 jsou neterminály (makra), provedou nějakou akci a[]NB()přepíší se na ABBR([CODE([ε])], [epsilon – prázdný symbol]) nebo jiný symbol.
Všechna klíčová slova lze přejmenovat nebo úplně vypnout.
Tato vlastnost je velmi důležitá pro režim preprocesoru.
],
[dnl english: _next_language_
All M4 keywords are nonterminals (macros), which take action and are rewritten to ABBR([CODE([ε])], [epsilon – empty symbol]) or another symbol.
All keywords can be renamed or turned off completely.
This feature is crucial for the preprocessor mode.
]])

PROGRAMLISTING([keywords_are_nonterminals], LANG([klíčová slova M4 jsou neterminály], [M4 keywords are nonterminals]), [dnl
[divert(ℤ) → ε
define(`A', `β') → ε
ifelse(`', `', `yes', `no') → yes
ifelse(`', `', `ifdef(`dnl', `1', `0')', `no') → ifdef(`dnl', `1', `0') → 1
…]
])dnl PROGRAMLISTING

BRIDGEHEAD([expansion_control], [dnl czech
[Řízení expanze neterminálů],
dnl english: _next_language_
[Nonterminal expansion control],
])

PARA([[dnl czech
Výchozí dvojice znaků CODE([`']) v[]NB()M4 řídí expanzi neterminálů.
Klíčové slovo CODE_M4([changequote()]) je může změnit na jiné znaky, například {EXPL_M4([[]], [hranaté závorky]), EXPL_M4([␂␆], [netisknutelné znaky]), EXPL_M4([⟦⟧], [UTF-8 znaky])}.
Neterminály, které nechceme (ihned) expandovat, jsou obklopeny touto dvojicí znaků.
Při průchodu makro procesorem jsou všechny symboly mezi touto dvojicí znaků BOLD([terminálními symboly]) a[]NB()vnější dvojice znaků je odstraněna.
Další průchod již způsobí expanzi původně chráněných neterminálů.
Dvojice řídících znaků se nastavuje na začátku kořenového souboru.
],
[dnl english: _next_language_
The default character pair CODE([`']) in M4 controls the expansion of nonterminals.
The keyword CODE_M4([changequote()]) can change them to other characters, for example {EXPL_M4([[]], [square brackets]), EXPL_M4([␂␆], [nonprintable characters]), EXPL_M4([⟦⟧], [UTF-8 characters])}.
The nonterminals that we do not want to (immediately) expand are surrounded by this pair of characters.
When passing through the macro processor, all the symbols between this character pair are BOLD([terminal symbols]) and the outer character pair is removed.
The next pass will cause the expansion of the originally protected nonterminals.
The control character pair is set at the beginning of the root file.
]])


SECT1([automata_descr], [dnl czech
[Automaty],
dnl english: _next_language_
[Automata],
])

PARA([[dnl czech
Automaty slouží jako QUOTE([přepínače]) pravidel gramatiky.
Používají přepisovací pravidla gramatiky jako uzly a[]NB()mění své stavy podle vstupních symbolů.
Aktuálně používané přepisovací pravidlo produkuje do výstupní fronty (nebo do několika výstupních front)
specifický kód, dokud automat nepřejde do jiného uzlu s[]NB()jiným přepisovacím pravidlem.
Příklady LINK([generujících automatů], [json_generating_automaton]) jsou ukázány v[]NB()příloze.
],
[dnl english: _next_language_
Automata serve as QUOTE([switches]) of grammar rules.
Automata use the grammar rules for rewriting as nodes and change their states according to input symbols.
The currently used rule produces a specific code to the output queue (or several output queues) until the automaton moves to another node with a[]NB()different rule.
The examples of LINK([generating automata], [json_generating_automaton]) are in appendix.
]])


SECT1([output_queues], [dnl czech
[Výstupní fronty],
dnl english: _next_language_
[Output queues],
])

PARA([[dnl czech
Výstupní fronty jsou dočasné úložiště pro části výsledného kódu.
Tyto části výsledného kódu jsou produkovány přepisovacími pravidly gramatiky, které přepisují vstupní symboly.
Klíčové slovo CODE_M4([divert(ℤ)]) nastavuje aktuální výstupní frontu.
Na závěr jsou všechny neprázdné fronty vypsány ve vzestupném pořadí na standardní výstup a[]NB()složí výsledný kód z[]NB()částí kódu.
LINK([Výstupní fronty], [output_queues_html]) jsou ukázány v[]NB()příloze.
],
[dnl english: _next_language_
The output queues temporarily store the portions of the resulting code.
These parts are formed using the grammar rules for rewriting which subsequently rewrite input symbols.
The CODE_M4([divert(ℤ)]) keyword sets the output queue.
Finally, all non-empty queues are dumped in ascending order to the standard output and compose the final code.
The examples of the LINK([output queues], [output_queues_html]) are in the appendix.
]])

INFO(, defn([WORD_INFORMATION]), [[dnl czech
BOLD([Zásobníky]) si ukážeme později.
],
[dnl english: _next_language_
BOLD([Stacks]) will be described later.
]])


CHAPTER([main_uses_of_m4], [dnl czech
[Hlavní použití M4],
dnl english: _next_language_
[Main uses of M4],
])

PARA([[dnl czech
M4 se používá ke generování zdrojového kódu libovolného programovacího jazyka nebo jako preprocesor jakéhokoliv zdrojového kódu.
],
[dnl english: _next_language_
M4 is used to generate the source code of any programming language or as a[]NB()preprocessor for any source code.
]])


SECT1([code_generation], [dnl czech
[Generování kódu],
dnl english: _next_language_
[The code generation],
])

PARA([[dnl czech
M4 transformuje vstupní data ze souborů ABBR([CODE([.mc])], [Macro Configuration]) na výsledná data následujícím příkazem:
],
[dnl english: _next_language_
M4 transforms input data from ABBR([CODE([.mc])], [Macro Configuration]) files to output data with the following command:
]])

COMMAND_USR([files_on_command_line], [← ]LANG([nejobecnější.m4 … nejspeciálnější.m4], [the_most_general.m4 … the_most_special.m4])[ →], [dnl
m4 root.m4 stem.m4 branch.m4 leaf.m4 input1.mc input2.mc > output.file
])

PARA([[dnl czech
Během načítání souborů jsou prováděny dvě základní operace:
],
[dnl english: _next_language_
Two basic operations are performed during file loading:
]])

ORDEREDLIST_WRAP([

LISTITEM([[dnl czech
čtení transformačních pravidel ze souborů s[]NB()příponou CODE([.m4])
],
[dnl english: _next_language_
the reading transformation rules from files with the CODE([.m4]) extension
]])

LISTITEM([[dnl czech
expanze maker uvnitř souborů s[]NB()příponou CODE([.mc])
],
[dnl english: _next_language_
the expansion of macros inside CODE([.mc]) files
]])

])dnl ORDEREDLIST_WRAP

PARA([[dnl czech
Soubory CODE([input1.mc]) a[]NB()CODE([input2.mc]) obsahují BOLD([vstupní data]) ve specifickém formátu, který umožňuje jejich transformaci na BOLD([výstupní data]) podle pravidel v[]NB()předchozích CODE([.m4]) souborech.
Datové soubory CODE([.mc]) obvykle neobsahují žádná transformační pravidla.
],
[dnl english: _next_language_
The CODE([input1.mc]) and CODE([input2.mc]) files contain the BOLD([input data]) in a[]NB()format that allows them to be transformed into BOLD([output data]) according to the rules in the previous CODE([.m4]) files.
The CODE([.mc]) data files usually do not contain any transformation rules.
]])

PARA([[dnl czech
Vstupní data mohou také přicházet z[]NB()kolony:
],
[dnl english: _next_language_
The input data may also come from the pipeline:
]])

COMMAND_USR(, LANG([vstupní kód → generování zdrojového kódu → soubor], [input code → source code generation → file]), [dnl
cat input.mc | m4 root.m4 stem.m4 branch.m4 leaf.m4 - > output.file
])

COMMAND_USR(, LANG([vstupní kód → generování zdrojového kódu → program], [input code → source code generation → program]), [dnl
cat input.mc | m4 root.m4 stem.m4 branch.m4 leaf.m4 - | gcc -x c -o progr -
])

PARA([[dnl czech
define([try_it_yourself], [Vyzkoušejte:])try_it_yourself() LINK([code_generation_examples], [code_generation_examples])
],
[dnl english: _next_language_
define([try_it_yourself], [Try:])try_it_yourself() LINK([code_generation_examples], [code_generation_examples])
]])


SECT1([m4_as_preproc], [dnl czech
[Preprocesor],
dnl english: _next_language_
[The preprocessor],
])

PARA([[dnl czech
M4 může pracovat v[]NB()režimu preprocesoru a může být také součástí kolony.
Vstupní zdrojový kód jím prochází beze změny s[]NB()výjimkou neterminálních symbolů.
Nalezené neterminály jsou expandovány na terminály a[]NB()odchází spolu se zdrojovým kódem na výstup.
M4 může rozšířit jakýkoliv jiný jazyk, kde je preprocesor nedostatečný (bez rekurze) nebo žádný.
Důležité je zvolit vhodný levý znak pro řízení expanze neterminálů, který nesmí kolidovat se znakem vstupního zdrojového kódu.
Kolize znaku je ale snadno řešitelná regulárním výrazem.
],
[dnl english: _next_language_
M4 can operate in the preprocessor mode and can also be part of a[]NB()pipeline.
The input source code passes unchanged through except for nonterminal symbols.
The nonterminals found are expanded to terminals and the output along with the source code.
M4 can extend any other language where the preprocessor is insufficient (no recursion) or none.
It is important to select the left character for nonterminal expansion control, which must not collide with the input source code character.
However the character collision is easily solved by a regex.
]])

COMMAND_USR(, LANG([M4 jako preprocesor – obecně], [M4 as preprocessor – in general]), [dnl
m4 root.m4 stem.m4 branch.m4 leaf.m4 file.c > preproc.file.c
])

COMMAND_USR(, LANG([M4 jako preprocesor – bez dočasného souboru], [M4 as preprocessor – without intermediate file]), [dnl
m4 root.m4 stem.m4 branch.m4 leaf.m4 file.c | gcc -x c -o progr -
])


BRIDGEHEAD([dnl czech
[CODE_M4([`']) Výchozí znaky],
dnl english: _next_language_
[CODE_M4([`']) Default characters],
])

PARA([[dnl czech
Konfliktní znak CODE([LQ()]) ze vstupního zdrojového kódu je skryt do makra CODE_M4([`'LQ()]).
Prázdný pár řídících znaků CODE_M4([`']) před makrem CODE_M4([LQ()]) slouží jako LINK([oddělovač symbolů], [symbols_in_brackets]).
Při průchodu zdrojového kódu makro procesorem se makro CODE_M4([`'LQ()]) přepíše zpátky na původní znak CODE([LQ()]) a[]NB()prázdný pár CODE_M4([`']) je odstraněn.
],
[dnl english: _next_language_
The conflicting character CODE([LQ()]) from the input source code is hidden into a[]NB()macro CODE_M4([`'LQ()]).
An empty pair of control characters CODE_M4([`']) before the macro serves as a[]NB()LINK([symbol separator], [symbols_in_brackets]).
When the source code is passed through the macro processor, the CODE_M4([`'LQ()]) macro is rewritten back to the original CODE([LQ()]) character and the empty pair CODE_M4([`']) is removed.
]])

define([common_title_for_regex], LANG([M4 jako preprocesor s řídícími znaky], [M4 as preprocessor with control characters]))
define([common_title], [ ]LANG([jinak], [differently]))

COMMAND_USR(, defn([common_title_for_regex])[: `'], [dnl
sed 's/LQ()/`'\''[LQ()]/g' any.src | m4 rootq.m4 leaf.m4 -
])

PARA([[dnl czech
Vyskytují-li se ve vstupním kódu komentáře CODE_M4([#]) nebo CODE_M4([dnl]), je nutné je skrýt.
Znaky CODE_M4([`']) LINK([vypnou], [symbols_in_brackets]) původní význam komentářů a budou odebrány při průchodu makro procesorem.[]BR()
Komentáře M4 CODE_M4([#]) a CODE_M4([dnl]) jsou skryty mezi výchozí znaky: CODE_M4([`#']) CODE_M4([`dnl'])
],
[dnl english: _next_language_
If there are CODE_M4([#]) or CODE_M4([dnl]) comments in the source code, they must be hidden first.
The characters CODE_M4([`']) LINK([turn off], [symbols_in_brackets]) original meaning and will be removed by the macro processor.[]BR()
M4 CODE_M4([#]) and CODE_M4([dnl]) comments are hidden between default characters: CODE_M4([`#']) CODE_M4([`dnl'])
]])

COMMAND_USR(, defn([common_title_for_regex])[: `'], [dnl
sed 's/LQ()/`'\''[LQ()]/g;s/[#]\|\LT()[dnl]\GT()/`&'\''/g' any.src | m4 rootq.m4 leaf.m4 -
])

COMMAND_USR(, defn([common_title_for_regex], [common_title])[: `'], [dnl
sed 's/LQ()/`'\''[LQ()]/g;s/[#]/`[#]'\''/g;s/\LT()[dnl]\GT()/`[dnl]'\''/g' any.src | m4 …
])


BRIDGEHEAD([dnl czech
[CODE_M4([[]]) Hranaté závorky],
dnl english: _next_language_
[CODE_M4([[]]) Square brackets],
])

PARA([[dnl czech
Použijeme-li pro LINK([řízení expanze neterminálů], [expansion_control]) hranaté závorky, stejným způsobem je skryta levá CODE([LB()]) hranatá závorka.
Vše ostatní platí jako pro výchozí znaky CODE_M4([`']).
],
[dnl english: _next_language_
If square brackets are used to LINK([control the expansion], [expansion_control]) of nonterminals, the left CODE([LB()]) square bracket is hidden in the same way.
Everything else applies as for default characters CODE_M4([`']).
]])

COMMAND_USR(, defn([common_title_for_regex])[: []], [dnl
sed 's/\LB()/[[]LB()]/g' any.src | m4 rootb.m4 leaf.m4 - | …
])

PARA([[dnl czech
Komentáře M4 CODE_M4([#]) a CODE_M4([dnl]) jsou skryty mezi závorkami: CODE_M4([[#]]) CODE_M4([[dnl]])
],
[dnl english: _next_language_
M4 CODE_M4([#]) and CODE_M4([dnl]) comments are hidden between parentheses: CODE_M4([[#]]) CODE_M4([[dnl]])
]])

COMMAND_USR(, defn([common_title_for_regex])[: []], [dnl
sed 's/\LB()/[[]LB()]/g;s/[#]\|\LT()[dnl]\GT()/[[&]]/g' any.src | m4 rootb.m4 leaf.m4 - | …
])

COMMAND_USR(, defn([common_title_for_regex], [common_title])[: []], [dnl
sed 's/\LB()/[[]LB()]/g;s/[#]/[[#]]/g;s/\LT()[dnl]\GT()/[[dnl]]/g' any.src | m4 rootb.m4 …
])


BRIDGEHEAD([dnl czech
[CODE_M4([␂␆]) Netisknutelné znaky],
dnl english: _next_language_
[CODE_M4([␂␆]) Non printable characters],
])

PARA([[dnl czech
Pro řízení expanze neterminálů lze použít netisknutelné znaky BOLD([CODE([␂])]) (SAMP([0x02])) a[]NB()BOLD([CODE([␆])]) (SAMP([0x06])).
Tyto znaky nemohou kolidovat s[]NB()tisknutelnými znaky zdrojového kódu.
],
[dnl english: _next_language_
Non printable characters BOLD([CODE([␂])]) (SAMP([0x02])) and BOLD([CODE([␆])]) (SAMP([0x06])) can be used to control the expansion of nonterminals.
These characters cannot interfere with printable source code characters.
]])

COMMAND_USR(, defn([common_title_for_regex])[: ␂␆], [dnl
m4 rootn.m4 leaf.m4 any.src | gcc …
])

PARA([[dnl czech
Komentáře M4 CODE_M4([#]) a CODE_M4([dnl]) jsou skryty mezi netisknutelné znaky: CODE_M4([␂#␆]) CODE_M4([␂dnl␆])
],
[dnl english: _next_language_
M4 CODE_M4([#]) and CODE_M4([dnl]) comments are hidden between non printable characters: CODE_M4([␂#␆]) CODE_M4([␂dnl␆])
]])

COMMAND_USR(, defn([common_title_for_regex])[: ␂␆], [dnl
sed 's/[#]\|\LT()[dnl]\GT()/␂[&]␆/g' any.src | m4 rootn.m4 leaf.m4 - | gcc …
])

COMMAND_USR(, defn([common_title_for_regex], [common_title])[: ␂␆], [dnl
sed 's/[#]/␂[#]␆/g;s/\LT()[dnl]\GT()/␂[dnl]␆/g' any.src | m4 rootn.m4 leaf.m4 - | gcc …
])


BRIDGEHEAD([dnl czech
[CODE_M4([⟦⟧]) UTF-8 znaky],
dnl english: _next_language_
[CODE_M4([⟦⟧]) UTF-8 characters],
])

PARA([[dnl czech
Expanzi neterminálů může také řídit vhodně zvolený pár UTF-8 znaků.
Běžný zdrojový kód takové znaky neobsahuje, proto nemusíme řešit kolizi levého CODE([⟦]) znaku.
UTF-8 znaky nabízí podobné výhody jako netisknutelné znaky.
],
[dnl english: _next_language_
Expansion of nonterminals can also be controlled by a suitably selected UTF-8 character pair.
The usual source code does not contain such characters, so we do not have to solve the collision of the left CODE([⟦]) bracket.
UTF-8 characters offer similar advantages to non printable characters.
]])

COMMAND_USR(, defn([common_title_for_regex])[: ⟦⟧], [dnl
m4 rootu.m4 leaf.m4 any.src | gcc …
])

PARA([[dnl czech
Komentáře M4 CODE_M4([#]) a CODE_M4([dnl]) jsou skryty mezi UTF-8 znaky: CODE_M4([⟦#⟧]) CODE_M4([⟦dnl⟧])
],
[dnl english: _next_language_
M4 CODE_M4([#]) and CODE_M4([dnl]) comments are hidden between UTF-8 characters: CODE_M4([⟦#⟧]) CODE_M4([⟦dnl⟧])
]])

COMMAND_USR(, defn([common_title_for_regex])[: ⟦⟧], [dnl
sed 's/[#]\|\LT()[dnl]\GT()/⟦[&]⟧/g' any.src | m4 rootu.m4 leaf.m4 - | gcc …
])

COMMAND_USR(, defn([common_title_for_regex], [common_title])[: ⟦⟧], [dnl
sed 's/[#]/⟦[#]⟧/g;s/\LT()[dnl]\GT()/⟦[dnl]⟧/g' any.src | m4 rootu.m4 leaf.m4 - | gcc …
])

undefine([common_title_for_regex], [common_title])

PARA_MONO([[dnl
try_it_yourself() LINK([preproc_examples], [preproc_examples])
]])

BRIDGEHEAD([dnl czech
[Smíšený režim],
dnl english: _next_language_
[Mixed mode],
])

PARA([[dnl czech
Smíšený režim je kombinací předchozích režimů a[]NB()je používán hlavně na pokusy.
Data nejsou oddělena od transformačních pravidel.
Listový soubor CODE([leaf.m4]) obsahuje definice těchto pravidel spolu se vstupními daty.
],
[dnl english: _next_language_
The mixed mode is a[]NB()combination of the previous modes and is mainly used for experiments.
The data is not separated from the rules for its transformation.
The leaf file CODE([leaf.m4]) contains transformation rule definitions along with input data.
]])

COMMAND_USR(, LANG([jak se naučit M4], [how to learn M4]), [dnl
m4 root.m4 leaf.m4
])

PARA_MONO([[dnl
try_it_yourself() LINK([m4_on_examples], [m4_on_examples])
]])


CHAPTER([prerequisites_for_mastering], [dnl czech
[Předpoklady pro zvládnutí M4],
dnl english: _next_language_
[Prerequisites for mastering M4],
])

PARA([[dnl czech
Pro úspěšné zvládnutí tohoto makro jazyka je důležité splnit několik předpokladů.
M4 není jednoduchý jazyk, protože není možné v[]NB()něm myslet a[]NB()programovat jako v[]NB()běžném programovacím jazyce.
Nejdůležitější je uvědomit si, že se v[]NB()něm programují přepisovací pravidla gramatiky.
Každý řetězec je buď terminální nebo neterminální symbol včetně všech klíčových slov jazyka (symboly CODE_M4([#]) a[]NB()CODE_M4([,]) jsou speciální případy neterminálů).
],
[dnl english: _next_language_
To successfully master this macro language it is important to fulfill several prerequisites.
M4 is not a[]NB()simple language because it is not possible to think and program in it like an ordinary programming language.
The most important thing to realize is that it is used to program the grammar rules for rewriting.
Each string is either a[]NB()terminal or a[]NB()nonterminal symbol, including all language keywords (the symbols CODE_M4([#]) and CODE_M4([,]) are special cases of nonterminals).
]])

NOTE_WRAP(, defn([WORD_NOTE]), [

PLAIN_TEXT([[dnl czech
M4 záměrně nemá klíčová slova pro BOLD([cykly]) (CODE([for])/CODE([while])), protože jeho základ je zcela jiný, než jaký mají procedurální nebo funkcionální jazyky.
],
[dnl english: _next_language_
M4 intentionally does not have keywords for BOLD([cycles]) (CODE([for])/CODE([while])) because its basis is quite different from procedural or functional languages.
]])

HORIZONTAL_RULE()

ITEMIZEDLIST_WRAP([

LISTITEM([[dnl czech
BOLD([cykly]) jsou pouze levorekurzivní nebo pravorekurzivní
],
[dnl english: _next_language_
BOLD([loops]) are only left-recursive or right-recursive
]])

LISTITEM([[dnl czech
BOLD([větví]) se LINK([řetězením symbolů], [branching_in_m4]) nebo klíčovými slovy CODE_M4([ifelse()]), CODE_M4([ifdef()])
],
[dnl english: _next_language_
BOLD([branching]) is made by LINK([symbol concatenation], [branching_in_m4]) or CODE_M4([ifelse()]), CODE_M4([ifdef()]) keywords
]])

])dnl ITEMIZEDLIST_WRAP

])dnl NOTE_WRAP


SECT1([dnl czech
[Základy gramatik],
dnl english: _next_language_
[Fundamentals of grammars],
])

PARA([[dnl czech
Základem všech gramatik jsou HEXPL([přepisovací pravidla], [[[6], [formal_definition]]]), jejichž podobu obecně popisuje:
],
[dnl english: _next_language_
All grammars are based on the HEXPL([rules for rewriting], [[[6], [formal_definition]]]) and their forms are generally described:
]])

BRIDGEHEAD([formal_grammar_chomsky], [dnl czech
[Formální gramatika (Chomského typu)],
dnl english: _next_language_
[Formal grammar (Chomsky type)],
])

PROGRAMLISTING([formal_definition], [dnl
G = (N, Σ, P, S)
N: LANG([konečná množina neterminálních symbolů], [a finite set of nonterminal symbols])
Σ: LANG([konečná množina terminálních symbolů], [a finite set of terminal symbols])
   N ∩ Σ = ø
P: LANG([konečná množina přepisovacích pravidel], [a finite set of production (rewrite) rules])
   MM([(N ∪ Σ)*], x) MM([N], s) MM([(N ∪ Σ)*], x) → MM([(N ∪ Σ)*], s)
S: LANG([je počáteční (startovací) symbol], [is the start symbol])
   S ∈ N
])dnl PROGRAMLISTING

PARA([[dnl czech
ULINK([Formální gramatika], [Wikipedie], [https://cs.wikipedia.org/wiki/Form%C3%A1ln%C3%AD_gramatika]) popisuje ULINK([podmnožiny], [Chomského hierarchie
(Wikipedie)], [https://cs.wikipedia.org/wiki/Chomsk%C3%A9ho_hierarchie])
přepisovacích pravidel ULINK([formálního jazyka], [Wikipedie], [https://cs.wikipedia.org/wiki/Form%C3%A1ln%C3%AD_jazyk]).
Jedna z[]NB()podmnožin se jmenuje HEXPL([ULINK([bezkontextová gramatika], [Wikipedie], [https://cs.wikipedia.org/wiki/Bezkontextov%C3%A1_gramatika])], [[[S,X], [formal_definition]]]),
krátce ABBR([CFG], [Context-Free Grammar – bezkontextová gramatika]).
Jak již bylo dříve zmíněno, přepisovací pravidla CFG pracují stejně jako přepisovací pravidla jazyka M4.
Některý z[]NB()následujících dílů seriálu se podrobněji zaměří na formální gramatiky.
],
[dnl english: _next_language_
The ULINK([Formal grammar], [Wikipedia], [https://en.wikipedia.org/wiki/Formal_grammar]) describes the ULINK([subsets], [Chomsky hierarchy
(Wikipedie)], [https://en.wikipedia.org/wiki/Chomsky_hierarchy]) of the
ULINK([formal language], [Wikipedia], [https://en.wikipedia.org/wiki/Formal_language])
rewriting rules and one of the subsets is called HEXPL([ULINK([context-free grammar], [Wikipedia], [https://en.wikipedia.org/wiki/Context-free_grammar])], [[[S,X], [formal_definition]]]),
shortly ABBR([CFG], [Context-Free Grammar]).
As mentioned earlier, the CFG rewriting rules work the same as the M4 rewriting rules.
Some of the following episodes of this series will focus on formal grammar in detail.
]])


SECT1([dnl czech
[Základy automatů],
dnl english: _next_language_
[Fundamentals of automata],
])

PARA([[dnl czech
Schopnost používat převážně dvoustavové automaty je zásadní věc pro psaní jednoduchých M4 skriptů, protože převážná většina skriptů používá LINK([malé automaty], [small_automaton]).
],
[dnl english: _next_language_
The ability to use predominantly two-state automata is an essential thing for writing simple M4 scripts because the vast majority of scripts use LINK([small automata], [small_automaton]).
]])

BRIDGEHEAD([testing_automaton], [dnl czech
[Testovací automat],
dnl english: _next_language_
[Testing automaton],
])

PARA([[dnl czech
Pořadí vstupních symbolů nebo jejich kontext lze otestovat automatem.
Splňují-li vstupní symboly požadované vlastnosti, automat skončí v[]NB()uzlu s[]NB()dvojitým kroužkem, kterým se označuje akceptující stav.
],
[dnl english: _next_language_
The order of input symbols or their context can be tested by an automaton.
If the input symbols meet the required properties, the automaton ends up in[]NB()a[]NB()double-ring node which indicates the accepting state.
]])

IMAGEDATA([dfa_img],dnl id
LANG([deterministický konečný automat], [deterministic finite automaton])[ (DFA)],dnl title
[],dnl class
[],dnl style
[],dnl anything
[img/dfa.png, https://i.iinfo.cz/images/149/dfa-1.png],dnl src
[[dnl czech
Příklad automatu[]REF([Teorie automatů], [From Wikipedia, the free encyclopedia], [https://cs.wikipedia.org/wiki/Teorie_automat%C5%AF], [Wikipedie]) akceptující sudý počet (žádný je také sudý) symbolů CODE([0]), ignorující symboly CODE([1]).
Automat je shodný s[]NB()regulárním výrazem CODE([(1*01*01*)*1*]).
],
[dnl english: _next_language_
Example of an automaton[]REF([Automata theory], [From Wikipedia, the free encyclopedia], [https://en.wikipedia.org/wiki/Automata_theory], [Wikipedia]) accepting an even number (none is even) of symbols CODE([0]), ignoring symbols CODE([1]).
The automaton is the same as the regular expression CODE([(1*01*01*)*1*]).
]])

PARA([[dnl czech
Předchozí automat lze zapsat jako ASCII art doprovázející M4 skript:
],
[dnl english: _next_language_
The previous automaton can be written as an ASCII art accompanying the M4 script:
]])

PROGRAMLISTING(, [ASCII art ]LANG([jako dokumentace M4 kódu], [for M4 code documentation]), [dnl
#          ____1
#         |   /
#      ___V__/   0    ____
# --->// S1 \\------>/ S2 \---.1
#     \\____//<------\____/<--'
[#]                0
])dnl PROGRAMLISTING note: The symbols [#] or [dnl] on the last line must be in brackets!

BRIDGEHEAD([generating_automaton], [dnl czech
[Generující automat],
dnl english: _next_language_
[Generating automaton],
])

PARA([[dnl czech
Vstupní symboly mění uzly automatu, čímž zároveň mění přepisovací pravidla pro generování kódu.
Příklad LINK([generujícího automatu], [json_generating_automaton]) naleznete v[]NB()příloze:
],
[dnl english: _next_language_
Input symbols change the nodes of the automaton, thereby changing the rewriting rules for code generation.
See the appendix for LINK([this generating automaton], [json_generating_automaton]):
]])

PROGRAMLISTING(, [ASCII art ]LANG([generujícího automatu], [of generating automaton]), [dnl
[#]      _______      ___________
[#] --->/ ERROR \--->/ NEXT_ITEM \---.
[#]     \_______/    \___________/<--'
])dnl PROGRAMLISTING note: The symbols [#] or [dnl] on the last line must be in brackets!

_PARA([[dnl czech
První symbol ve stavu CODE_M4([ERROR]) vygeneruje záhlaví se závorkami a[]NB()vloží první položku.
Poté automat přejde do stavu CODE_M4([NEXT_ITEM]), ve kterém se pouze přidávají další položky.
Automat zůstává v[]NB()tomto stavu, dokud nejsou zpracována všechna data.
],
[dnl english: _next_language_
The first symbol in the CODE_M4([ERROR]) state generates a[]NB()header with brackets and inserts the first item.
Then automaton make transition to CODE_M4([NEXT_ITEM]) state in which only next items are added.
The automaton remains in this state until all data has been processed.
]])


SECT1([dnl czech
[(GNU) make],
dnl english: _next_language_
[(GNU) make],
])

PARA([[dnl czech
Dobře navržený generátor kódu se obvykle skládá z[]NB()několika menších souborů, jejichž pořadí, závislosti a[]NB()parametry se zapisují do souboru CODE([Makefile]).
Dobrá znalost tvorby CODE([Makefile]) je proto základním předpokladem pro zvládnutí M4.
Čtení a údržba zdrojového kódu celkově zabere vždy více času než jeho tvorba.
Dobře strukturovaný CODE([Makefile]) proto zásadním způsobem přispívá k[]NB()celkové přehlednosti výsledného generátoru kódu.
],
[dnl english: _next_language_
A[]NB()well-designed code generator usually consists of several smaller files whose order, dependencies and parameters are written to the CODE([Makefile]) file.
Good knowledge of CODE([Makefile]) writing is therefore a[]NB()prerequisite for mastering M4.
Reading and maintaining source code generally takes more time than creating it.
A[]NB()well-structured CODE([Makefile]) therefore significantly contributes to the overall clarity of the resulting code generator.
]])

NOTE(, LANG([tímto tématem se budeme zabývat jindy], [we will deal with this topic at another part]), [[dnl czech
Spouštění CODE([make])[]REF([GNU Make Manual], [Free Software Foundation], [https://www.gnu.org/software/make/manual/make.html]) z[]NB()editoru kódu pomocí vhodné klávesové zkratky zásadně urychluje vývoj M4 kódu.
Soubor CODE([~/.vimrc]) obsahuje CODE([nnoremap []LT()c-j[]GT() :make[]LT()cr[]GT()]).
],
[dnl english: _next_language_
Executing CODE([make])[]REF([GNU Make Manual], [Free Software Foundation], [https://www.gnu.org/software/make/manual/make.html]) from the code editor with a[]NB()shortcut key will significantly speed up M4 code development.
The file CODE([~/.vimrc]) contains CODE([nnoremap []LT()c-j[]GT() :make[]LT()cr[]GT()]).
]])


SECT1([dnl czech
[Vim],
dnl english: _next_language_
[Vim],
])

PARA([[dnl czech
Zvládnutí editoru Vim[]REF([Vim – všudypřítomný textový editor], [který edituje text rychlostí myšlenky], [https://www.vim.org/]) je důležitým předpokladem pro pohodlí a[]NB()rychlost psaní kódu M4.
Vim zkratky, definované klíčovým slovem CODE([iabbrev]), ušetří velké množství zbytečně napsaného textu.
Tyto zkratky také významně snižují výskyt téměř neviditelných chyb způsobených nepárovou závorkou, čímž šetří ztracený čas vynaložený na ladění kódu.
],
[dnl english: _next_language_
Mastering the Vim[]REF([Vim – the ubiquitous text editor], [that edits text at the speed of thought], [https://www.vim.org/]) editor is an important prerequisite for the convenience and speed of writing M4 code.
Vim shortcuts, defined by the CODE([iabbrev]) keyword, will save large amounts of unnecessary typing.
These shortcuts also significantly reduce the occurrence of almost invisible errors caused by an unpaired bracket, thus saving the lost time spent on debugging.
]])


SECT1([dnl czech
[Talent a čas],
dnl english: _next_language_
[Talent and time],
])

PARA([[dnl czech
M4 obvykle nejde zcela zvládnout přes víkend, zvláště chybí-li základy[]REF([Automaty a[]NB()formální jazyky I], [Učební text FI MU], [https://is.muni.cz/elportal/estud/fi/js06/ib005/Formalni_jazyky_a_automaty_I.pdf])
ULINK([teorie[]NB()automatů], [Wikipedie], [https://cs.wikipedia.org/wiki/Teorie_automat%C5%AF]) a[]NB()ULINK([formálních[]NB()gramatik], [Wikipedie], [https://cs.wikipedia.org/wiki/Form%C3%A1ln%C3%AD_gramatika]).
Ke zvládnutí jazyka M4 je nutné v[]NB()něm programovat delší období a[]NB()napsat množství špatného (složitého) M4 kódu, který z[]NB()vlastní vůle přepíšete kvůli lepšímu nápadu.
Tímto způsobem je možné postupně získat praxi.
],
[dnl english: _next_language_
M4 usually cannot be mastered over the weekend, especially when the fundamentals[]REF([Automaty a[]NB()formální jazyky I], [Učební text FI MU], [https://is.muni.cz/elportal/estud/fi/js06/ib005/Formalni_jazyky_a_automaty_I.pdf]) of
ULINK([automata theory], [Wikipedia], [https://en.wikipedia.org/wiki/Automata_theory]) and ULINK([formal[]NB()grammars], [Wikipedia], [https://en.wikipedia.org/wiki/Formal_grammar]) are lacking.
In order to master the M4 language, it is necessary to program in a[]NB()longer period of time and write amounts of bad (complex) M4 code that you rewrite for a[]NB()better idea.
In this way it is possible to gradually gain practice.
]])

# a reference to a book that inspired me 😍
[]REF([Automaty a[]NB()gramatiky], [Michal Chytil, 1. vydání, Praha, 331 s. 1984.], [https://is.muni.cz/publication/173173])


APPENDIX([code_generation_examples], [dnl czech
[Příklady generování kódu],
dnl english: _next_language_
[Code generation examples],
])

NOTE(, defn([WORD_NOTE]), [[dnl czech
Příklady v[]NB()této příloze jsou složitější a[]NB()jejich cílem je ukázat praktické použití jazyka M4.
Podrobněji budou vysvětleny později.
],
[dnl english: _next_language_
The examples in this appendix are more complex and are intended to demonstrate the practical use of M4.
They will be explained in detail later.
]])


SECT1([input_source_code], [dnl czech
[CODE_M4([[]]) Vstupní zdrojový kód],
dnl english: _next_language_
[CODE_M4([[]]) Input source code],
])

PARA([[dnl czech
Vstupní zdrojový kód je podobný ABBR([CSV], [Comma Separated Values]), který se převede na libovolně složitý cílový kód jiného jazyka pomocí ABBR([CFG], [Context-Free Grammar – bezkontextová gramatika]), automatů a[]NB()výstupních front.
Zásobníky v[]NB()příkladech nejsou použity.
Vstupní zdrojový kód obsahuje speciální znaky, které je nutné skrýt:
],
[dnl english: _next_language_
The input source code is similar to ABBR([CSV], [Comma Separated Values]), which is converted to arbitrarily complex target code of another language using ABBR([CFG], [Context-Free Grammar]), automata and output queues.
Stacks in the examples are not used.
The input source code contains special characters that must be hidden:
]])

INSERT_FILE([messages/messages_raw.mc],, [s/\<ERROR\>/MM(r)/g])

NOTE(, defn([WORD_NOTE]), [[dnl czech
Vstupní soubor může také obsahovat poznámky, které nemusí být skryté v[]NB()komentářích CODE_M4([#]), CODE_M4([dnl]), CODE_M4([ifelse([…])]) nebo CODE_M4([[… někde uvnitř závorek …]]).
],
[dnl english: _next_language_
The input file may also contain notes that may not be hidden in the comments CODE_M4([#]), CODE_M4([dnl]), CODE_M4([ifelse([…])]) or CODE_M4([[… somewhere inside brackets …]]).
]])


SECT1([dnl czech
[CODE_M4([[]]) CSV: nejjednodušší příklad],
dnl english: _next_language_
[CODE_M4([[]]) CSV: simplest example],
])

PARA([[dnl czech
Tento příklad nepoužívá výstupní fronty, HEXPL([pouze vypisuje], [[[R, 5], [messages/hello.csv.m4]], [[1-3], [messages/hello.csv]], [[R, 3, 5, 7], [messages/messages_raw.mc]]]) ABBR([CSV], [Comma Separated Values]) oddělené znakem CODE([TAB]) na HEXPL([standardní výstup], [[[4], [messages/hello.csv.m4]]]).
],
[dnl english: _next_language_
This example does not use output queues, HEXPL([it only prints], [[[R, 5], [messages/hello.csv.m4]], [[1-3], [messages/hello.csv]], [[R, 3, 5, 7], [messages/messages_raw.mc]]]) ABBR([CSV], [Comma Separated Values]) separated by CODE([TAB]) to HEXPL([standard output], [[[4], [messages/hello.csv.m4]]]).
]])

INSERT_FILE([messages/hello.csv.m4],, [s/\<ERROR\>/MM(r)/g])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/hello.csv.m4], [messages/messages_raw.mc], [messages/hello.csv])
INSERT_FILE([messages/hello.csv])


SECT1([dnl czech
[CODE_M4([[]]) CSV: počítadlo],
dnl english: _next_language_
[CODE_M4([[]]) CSV: counter],
])

PARA([[dnl czech
Příklad používá makro HCODE_M4([COUNT_UP], [[[A], [messages/counter.csv.m4]]]) z[]NB()kořenového souboru, jehož ABBR([CODE([β])], [pravá strana přepisovacího pravidla]) se zkopíruje do pravé strany makra HCODE_M4([COUNTER], [[[2], [messages/counter.csv.m4]]]).
Během první expanze HCODE_M4([COUNTER], [[[5], [messages/counter.csv.m4]]]) proběhne inicializace jeho startovací hodnoty.
HEXPL([Další expanze], [[[B], [messages/counter.csv.m4]]]) vrátí číselný terminální symbol a[]NB()proběhne zvýšení vnitřního pomocného (globálního) symbolu o[]NB()jedničku.
CODE_M4([COUNTER]) je malý automat.
],
[dnl english: _next_language_
The example uses the HCODE_M4([COUNT_UP], [[[A], [messages/counter.csv.m4]]]) macro from the root file whose ABBR([CODE([β])], [the right side of the rewriting rule]) is copied to the right side of the HCODE_M4([COUNTER], [[[2], [messages/counter.csv.m4]]]) macro.
During the first expansion of HCODE_M4([COUNTER], [[[5], [messages/counter.csv.m4]]]) its initial value is initialized.
HEXPL([Further expansion], [[[B], [messages/counter.csv.m4]]]) returns the numeric terminal symbol and increases the inner auxiliary (global) symbol by one.
CODE_M4([COUNTER]) is a[]NB()small automaton.
]])

INSERT_FILE([messages/counter.csv.m4],, [
s/\<COUNT_UP\>/MM(a)/
/\<ERR_\>/s/\<COUNTER\>/MM(b)/
])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/counter.csv.m4], [messages/messages_raw.mc], [messages/counter.csv])
INSERT_FILE([messages/counter.csv])


SECT1([dnl czech
[CODE([💡], [jak se to dělá],, [cursor:help]) Úpravy speciálních znaků],
dnl english: _next_language_
[CODE([💡], [how to do it],, [cursor:help]) Modification of special characters],
])

PARA([[dnl czech
Každý typ výstupního kódu vyžaduje úpravu speciálních znaků.
Klíčové slovo jazyka M4 CODE_M4([patsubst()]) je nevhodné pro tento úkol.
Všechny speciální znaky vstupního souboru proto napřed skryjeme do HEXPL([vhodně pojmenovaných maker], [[[A], [messages/messages.mc]]]) pomocí regulárních výrazů.
],
[dnl english: _next_language_
Each type of output code requires the modification of the special characters.
The M4 CODE_M4([patsubst()]) keyword is inappropriate for this type of task.
First, we hide all special characters of the input file into HEXPL([appropriately named macros], [[[A], [messages/messages.mc]]]) using regular expressions.
]])

BRIDGEHEAD([modified_input_source_code], [dnl czech
[Upravený vstupní kód],
dnl english: _next_language_
[Modified input code],
])

INSERT_FILE([messages/messages.mc], LANG([všechny speciální znaky jsou skryty do maker], [all special characters are hidden into macros]), [
s/[[:upper:]]\+()/MM(a)/g
])

PARA([[dnl czech
Vytvoříme několik převodních souborů podle typu cílového kódu, makra pro hranaté závorky CODE_M4([LB()]) a CODE_M4([RB()]) jsou už definována v[]NB()kořenovém souboru.
],
[dnl english: _next_language_
We create several conversion files according to the target code type, CODE_M4([LB()]) and CODE_M4([RB()]) macros for square brackets are already defined in the root file.
]])

define([conv_file], LANG([Převodní soubor pro], [Conversion file for]))

BRIDGEHEAD_MONO([dnl
[CODE_M4([[]]) conv_file XML[,] XSLT[,] HTML],
])

INSERT_FILE([messages/markup.m4], LANG([převodní soubor pro značkovací jazyky], [conversion file for markup languages]))

# hide  ‘"’ → DQ(), because of title="… &quot; … &quot; …"
BRIDGEHEAD([dnl
[CODE_M4([[]]) conv_file C[,] JSON[,] INI: CODE([DQ()řetězec[]DQ()])],
[CODE_M4([[]]) conv_file C[,] JSON[,] INI: CODE([DQ()string[]DQ()])],
])

INSERT_FILE([messages/code.m4], LANG([převodní soubor pro zdrojový kód], [conversion file for a source code]))

# hide ‘"’ → DQ(), because of title="… &quot; … &quot; …"
BRIDGEHEAD([dnl
[CODE_M4([[]]) conv_file Bash: CODE([DQ()řetězec[]DQ()])],
dnl english: _next_language_
[CODE_M4([[]]) conv_file Bash: CODE([DQ()string[]DQ()])],
])

INSERT_FILE([messages/doubleq.m4], XLANG([převodní soubor pro Bash []DQ()řetězce v uvozovkách[]DQ()], [conversion file for Bash []DQ()strings in quotation marks[]DQ()]))

BRIDGEHEAD([dnl
[CODE_M4([[]]) conv_file Bash: CODE([AP()řetězec[]AP()])],
dnl english: _next_language_
[CODE_M4([[]]) conv_file Bash: CODE([AP()string[]AP()])],
])

INSERT_FILE([messages/apost.m4], LANG([převodní soubor pro Bash 'řetězce v apostrofech'], [conversion file for Bash 'strings in apostrophes']))

BRIDGEHEAD([dnl
[CODE_M4([[]]) conv_file CSV[,] M4 (vrátí všechny znaky zpátky)],
dnl english: _next_language_
[CODE_M4([[]]) conv_file CSV[,] M4 (returns all characters)],
])undefine([conv_file])

INSERT_FILE([messages/unchanged.m4], LANG([převodní soubor vrátí všechny speciální znaky zpátky], [the conversion file puts all special characters back]))


SECT1([dnl czech
[CODE_M4([[]]) C: výstupní fronta],
dnl english: _next_language_
[CODE_M4([[]]) C: output queue],
])

PARA([[dnl czech
Příklad používá jednu HEXPL([výstupní frontu], [[[15], [messages/array.c.m4]]]) na znaky HCODE([};], [[[16], [messages/array.c.m4]], [[9], [messages/array.c]]]) pro uzavření HEXPL([pole], [[[6-8], [messages/array.c]], [[5], [messages/array.c.m4]]]) na konci skriptu.
],
[dnl english: _next_language_
The example uses one HEXPL([output queue], [[[15], [messages/array.c.m4]]]) for characters HCODE([};], [[[16], [messages/array.c.m4]], [[9], [messages/array.c]]]) to close the HEXPL([array], [[[6-8], [messages/array.c]], [[5], [messages/array.c.m4]]]) at the end.
]])

INSERT_FILE([messages/array.c.m4])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/array.c.m4], [messages/code.m4], [messages/messages.mc], [messages/array.c])
INSERT_FILE([messages/array.c])


SECT1([dnl czech
[CODE_M4([[]]) INI: externí příkaz],
dnl english: _next_language_
[CODE_M4([[]]) INI: an external command],
])

PARA([[dnl czech
Příklad spustí externí příkaz HCODE([date], [[[D], [messages/hello.ini.m4]], [[3], [messages/hello.ini]]]) a[]NB()jeho výstup umístí do hranatých závorek.
Výstupem externího příkazu jsou HEXPL([dvě položky oddělené čárkou], [[[A], [messages/hello.ini.m4]]]).
Makro HCODE_M4([ARG1()], [[[C], [messages/hello.ini.m4]]]) HEXPL([vybere první položku], [[[B], [messages/hello.ini.m4]]]), protože druhá položka obsahuje nežádoucí znak nového řádku CODE([LF]) (SAMP([0x0a])).
],
[dnl english: _next_language_
The example runs an external HCODE([date], [[[D], [messages/hello.ini.m4]], [[3], [messages/hello.ini]]]) command and places its output in square brackets.
The output of an external command are HEXPL([two comma-separated items], [[[A], [messages/hello.ini.m4]]]).
The HCODE_M4([ARG1()], [[[C], [messages/hello.ini.m4]]]) macro HEXPL([selects the first item], [[[B], [messages/hello.ini.m4]]]) because the second item contains an unwanted CODE([LF]) (SAMP([0x0a])) new line character.
]])

INSERT_FILE([messages/hello.ini.m4],, [
/\<esyscmd\>/{
s/+\([^,]*\)/+<span class="NSP()b">\1<\x2fspan>/
s/,/MM(a)/
s/ARG1/MM(c)/
s/date \x27[^\x27]\+\x27/MM(d)/
}
])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/hello.ini.m4], [messages/code.m4], [messages/messages.mc], [messages/hello.ini])
INSERT_FILE([messages/hello.ini])


SECT1([dnl czech
[CODE_M4([[]]) .h: hex počítadlo],
dnl english: _next_language_
[CODE_M4([[]]) .h: hex counter],
])

PARA([[dnl czech
Příklad používá makro HCODE_M4([COUNTER], [[[A, 2], [messages/messages.h.m4]]]) pro číslování výsledných ABBR([CPP], [Preprocesor jazyka C]) HEXPL([maker], [[[11], [messages/messages.h.m4]], [[8-10], [messages/messages.h]]]) a[]NB()jednu výstupní frontu.
Fronta číslo HCODE([1], [[[23], [messages/messages.h.m4]]]) obsahuje direktivu preprocesoru HCODE_M4([#endif], [[[24], [messages/messages.h.m4]], [[12], [messages/messages.h]]]) pro zakončení hlavičkového souboru.
Převod dekadické hodnoty počítadla na HEXPL([dvoumístné hex-a číslo], [[[B], [messages/messages.h.m4]]]) provádí klíčové slovo HCODE_M4([eval()], [[[C], [messages/messages.h.m4]]]).
],
[dnl english: _next_language_
The example uses the HCODE_M4([COUNTER], [[[A, 2], [messages/messages.h.m4]]]) macro to number the resulting ABBR([CPP], [C preprocessor]) HEXPL([macros], [[[11], [messages/messages.h.m4]], [[8-10], [messages/messages.h]]]) and one output queue.
The queue number HCODE([1], [[[23], [messages/messages.h.m4]]]) contains the preprocessor directive HCODE_M4([#endif], [[[24], [messages/messages.h.m4]], [[12], [messages/messages.h]]]) to terminate the header file.
The decimal value of the counter is converted to the HEXPL([two-digit hex], [[[B], [messages/messages.h.m4]]]) by keyword HCODE_M4([eval()], [[[C], [messages/messages.h.m4]]]).
]])

INSERT_FILE([messages/messages.h.m4],, [
s/\<COUNTER\>\((0)\)\?/MM(a)/g
/eval(/{
s//MM(c)/
s/\<16, 2\>/MM(b)/
s/)/MM(c)/
}
])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/messages.h.m4], [messages/messages.mc], [messages/messages.h])
INSERT_FILE([messages/messages.h])


SECT1([small_automaton], [dnl czech
[CODE_M4([[]]) C: malý automat],
dnl english: _next_language_
[CODE_M4([[]]) C: small automaton],
])

PARA([[dnl czech
Příklad používá HEXPL([malý automat], [[[1-4], [messages/stringl.c.m4]]]) HCODE([NEW_LINE], [[[7], [messages/stringl.c.m4]]]) pro generování znaku nového řádku HCODE([\n], [[[A], [messages/stringl.c.m4]], [[A], [messages/stringl.c]]]) a[]NB()jednu výstupní frontu číslo HCODE([1], [[[22], [messages/stringl.c.m4]]]) do které se vloží znaky HCODE([";], [[[B], [messages/stringl.c.m4]]]) pro uzavření výsledného řetězce.
Poprvé se HCODE([NEW_LINE], [[[C], [messages/stringl.c.m4]]]) přepíše na ABBR([HCODE([ε], [[[D], [messages/stringl.c.m4]]])], [epsilon – prázdný symbol]), podruhé a dále se přepíše na HCODE([\n], [[[A], [messages/stringl.c.m4]], [[A], [messages/stringl.c]]]).
],
[dnl english: _next_language_
The example uses HEXPL([a[]NB()small automaton], [[[1-4], [messages/stringl.c.m4]]]) HCODE([NEW_LINE], [[[7], [messages/stringl.c.m4]]]) to generate a[]NB()newline HCODE([\n], [[[A], [messages/stringl.c.m4]], [[A], [messages/stringl.c]]]) character and one output queue number HCODE([1], [[[22], [messages/stringl.c.m4]]]) containing HCODE([";], [[[B], [messages/stringl.c.m4]]]) characters to terminate resulting string.
Run the first time HCODE([NEW_LINE], [[[C], [messages/stringl.c.m4]]]), is rewritten to ABBR([HCODE([ε], [[[D], [messages/stringl.c.m4]]])], [epsilon – empty symbol]), in all following ones, it is rewritten to HCODE([\n], [[[A], [messages/stringl.c.m4]], [[A], [messages/stringl.c]]]).
]])

INSERT_FILE([messages/stringl.c.m4],, [
s/\\n/MM(a)/
s/";/MM(b)/
s/ε/MM(d)/
/divert/s/\<NEW_LINE\>/MM(c)/
])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/stringl.c.m4], [messages/code.m4], [messages/messages.mc], [messages/stringl.c])
INSERT_FILE([messages/stringl.c],, [
s/\\n/MM(a)/g
])


SECT1([dnl czech
[CODE_M4([[]]) C: malý automat 2],
dnl english: _next_language_
[CODE_M4([[]]) C: small automaton 2],
])

PARA([[dnl czech
Tento příklad je podobný předchozímu, avšak každý řetězec HEXPL([je na novém řádku], [[[A], [messages/string.c.m4]], [[A], [messages/string.c]]]).
],
[dnl english: _next_language_
This example is similar to the previous one, but each string is on a[]NB()HEXPL([new line], [[[A], [messages/string.c.m4]], [[A], [messages/string.c]]]).
]])

INSERT_FILE_MLH([messages/string.c.m4],, [s/\\n"\n"/MM(a)/])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/string.c.m4], [messages/code.m4], [messages/messages.mc], [messages/string.c])
INSERT_FILE_MLH([messages/string.c],, [s/\\n"\n"/MM(a)/g])


SECT1([output_queues_html], [dnl czech
[CODE_M4([[]]) HTML: výstupní fronty],
dnl english: _next_language_
[CODE_M4([[]]) HTML: output queues],
])

PARA([[dnl czech
Příklad používá HEXPL([dvě výstupní fronty], [[[9, 27, 29], [messages/messages.html.m4]]]).
Fronta číslo HCODE([1], [[[9, 27], [messages/messages.html.m4]]]) obsahuje HEXPL([odstavce], [[[10], [messages/messages.html.m4]], [[16-21], [messages/messages.html]]]),
fronta číslo HCODE([2], [[[29], [messages/messages.html.m4]]]) HEXPL([uzavírací značky HTML], [[[30-31], [messages/messages.html.m4]], [[22-23], [messages/messages.html]]]) stránky.
HEXPL([Navigační odkazy], [[[8], [messages/messages.html.m4]], [[9-14], [messages/messages.html]]]) nemusí být nikde uloženy, HEXPL([jdou přímo na výstup], [[[7], [messages/messages.html.m4]]]).
Zprávy typu HCODE([QUERY], [[[15], [messages/messages.html.m4]]]) a[]NB()HCODE([WARNING], [[[16], [messages/messages.html.m4]]]) jsou zpracovány stejně jako zprávy typu HCODE([ERROR], [[[5-12], [messages/messages.html.m4]]]).
],
[dnl english: _next_language_
The example uses HEXPL([two output queues], [[[9, 27, 29], [messages/messages.html.m4]]]).
The queue number HCODE([1], [[[9, 27], [messages/messages.html.m4]]]) contains HEXPL([paragraphs], [[[10], [messages/messages.html.m4]], [[16-21], [messages/messages.html]]]).
The queue number HCODE([2], [[[29], [messages/messages.html.m4]]]) contains HEXPL([closing HTML tags], [[[30-31], [messages/messages.html.m4]], [[22-23], [messages/messages.html]]]).
HEXPL([Navigation links], [[[8], [messages/messages.html.m4]], [[9-14], [messages/messages.html]]]) do not have to be stored anywhere, they HEXPL([go straight to the output], [[[7], [messages/messages.html.m4]]]).
The HCODE([QUERY], [[[15], [messages/messages.html.m4]]]) and HCODE([WARNING], [[[16], [messages/messages.html.m4]]]) messages are processed in the same way as the HCODE([ERROR], [[[5-12], [messages/messages.html.m4]]]) messages.
]])

INSERT_FILE([messages/messages.html.m4])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/messages.html.m4], [messages/markup.m4], [messages/messages.mc], [messages/messages.html])
INSERT_FILE([messages/messages.html])


SECT1([branching_in_m4], [dnl czech
[CODE_M4([[]]) Větvení gramatikou],
dnl english: _next_language_
[CODE_M4([[]]) Branching by grammar],
])

PARA([[dnl czech
Příklad ukazuje LINK([větvení gramatikou], [branching_by_grammar]), argumenty maker se ignorují.
Vstupní neterminály se přepisují na terminály HCODE_M4([ERROR → 🐛], [🐛], [[[6, 13], [messages/insect.txt.m4]], [[A], [messages/insect.txt]]]),
HCODE_M4([QUERY → 🐜], [🐜], [[[6, 14], [messages/insect.txt.m4]], [[B], [messages/insect.txt]]]),
HCODE_M4([WARNING → 🐝], [🐝], [[[6, 15], [messages/insect.txt.m4]], [[C], [messages/insect.txt]]]).
],
[dnl english: _next_language_
The example shows LINK([branching by grammar], [branching_by_grammar]), macro arguments are ignored.
Input nonterminals are rewritten to terminals HCODE_M4([ERROR → 🐛], [🐛], [[[6, 13], [messages/insect.txt.m4]], [[A], [messages/insect.txt]]]),
HCODE_M4([QUERY → 🐜], [🐜], [[[6, 14], [messages/insect.txt.m4]], [[B], [messages/insect.txt]]]),
HCODE_M4([WARNING → 🐝], [🐝], [[[6, 15], [messages/insect.txt.m4]], [[C], [messages/insect.txt]]]).
]])

INSERT_FILE([messages/insect.txt.m4])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/insect.txt.m4], [messages/messages.mc], [messages/insect.txt])
INSERT_FILE([messages/insect.txt],, [
s/🐛/MM(a)/g
s/🐜/MM(b)/g
s/🐝/MM(c)/g
])


SECT1([json_generating_automaton], [dnl czech
[CODE_M4([[]]) JSON: generující automat],
dnl english: _next_language_
[CODE_M4([[]]) JSON: generating automaton],
])

PARA([[dnl czech
Příklad používá HEXPL([dvě výstupní fronty], [[[14, 30], [messages/atm.json.m4]]]) a[]NB()jeden HEXPL([generující automat], [[[1-3], [messages/atm.json.m4]]]).
První chybová zpráva CODE_M4([ERROR([…])]) ve stavu HCODE([ERROR], [[[6-17], [messages/atm.json.m4]]]) vygeneruje HEXPL([záhlaví se závorkami], [[[12, 15], [messages/atm.json.m4]], [[3, 7], [messages/atm.json]]]) a[]NB()vypíše HEXPL([na výstup], [[[11], [messages/atm.json.m4]]]) HEXPL([první záznam], [[[13], [messages/atm.json.m4]], [[4], [messages/atm.json]]]).
HEXPL([Automat přejde], [[[8, 9], [messages/atm.json.m4]]]) do stavu HCODE([NEXT_ITEM], [[[20-25], [messages/atm.json.m4]]]) což je ABBR([HCODE([β], [[[19], [messages/atm.json.m4]]]) pravidlo], [takové pravidlo se používá jako pravá strana jiného přepisovacího pravidla]).
Následující chybové zprávy ve stavu HCODE([NEXT_ITEM], [[[20-25], [messages/atm.json.m4]]]) pouze HEXPL([vypisují na výstup], [[[22], [messages/atm.json.m4]]]) HEXPL([jednotlivé záznamy], [[[23], [messages/atm.json.m4]], [[5, 6], [messages/atm.json]]]).
Na závěr výstupní fronty číslo HCODE([1], [[[14], [messages/atm.json.m4]]]) a[]NB()HCODE([2], [[[30], [messages/atm.json.m4]]]) vypíšou znaky HCODE([RB()], [[[15], [messages/atm.json.m4]], [[7], [messages/atm.json]]]) a[]NB()HCODE([}}], [[[31], [messages/atm.json.m4]], [[8], [messages/atm.json]]]) čímž zakončí výsledný JSON.
],
[dnl english: _next_language_
The example uses HEXPL([two output queues], [[[14, 30], [messages/atm.json.m4]]]) and one HEXPL([generating automaton], [[[1-3], [messages/atm.json.m4]]]).
The first CODE_M4([ERROR([…])]) error message in the HCODE([ERROR], [[[6-17], [messages/atm.json.m4]]]) state generates HEXPL([a[]NB()header with brackets], [[[12, 15], [messages/atm.json.m4]], [[3, 7], [messages/atm.json]]]) and HEXPL([outputs], [[[11], [messages/atm.json.m4]]]) HEXPL([the first record], [[[13], [messages/atm.json.m4]], [[4], [messages/atm.json]]]).
HEXPL([The automaton goes], [[[8, 9], [messages/atm.json.m4]]]) to the state HCODE([NEXT_ITEM], [[[20-25], [messages/atm.json.m4]]]) which is a[]NB()ABBR([HCODE([β], [[[19], [messages/atm.json.m4]]]) rule], [the rule is used as the right side of another rewriting rule]).
The following error messages in the HCODE([NEXT_ITEM], [[[20-25], [messages/atm.json.m4]]]) state only HEXPL([output], [[[22], [messages/atm.json.m4]]]) HEXPL([individual records], [[[23], [messages/atm.json.m4]], [[5, 6], [messages/atm.json]]]).
At the end the output queue number HCODE([1], [[[14], [messages/atm.json.m4]]]) and number HCODE([2], [[[30], [messages/atm.json.m4]]]) print the characters HCODE([RB()], [[[15], [messages/atm.json.m4]], [[7], [messages/atm.json]]]) and HCODE([}}], [[[31], [messages/atm.json.m4]], [[8], [messages/atm.json]]]) to close the resulting JSON.
]])

INSERT_FILE([messages/atm.json.m4])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/atm.json.m4], [messages/code.m4], [messages/messages.mc], [messages/atm.json])
INSERT_FILE([messages/atm.json])


SECT2([json_branch], [dnl czech
[CODE_M4([[]]) JSON: pojmenované fronty],
dnl english: _next_language_
[CODE_M4([[]]) JSON: named queues],
])

PARA([[dnl czech
Příklad zpracovává další zprávy typu CODE_M4([QUERY]) a[]NB()CODE_M4([WARNING]).
Používá tři automaty a[]NB()šest výstupních front.
Generujeme-li složitější zdrojový kód, brzy narazíme na problém udržení konzistence indexů pro výstupní fronty.
Abychom se vyhnuli zmatku, pojmenujeme si fronty a[]NB()místo čísel používáme jména.
Abychom nemuseli definovat podobná pravidla, zkopírujeme si pravou stranu CODE([ERROR]) (je to také ABBR([HCODE([β], [[[21], [messages/qnames.json.m4]]]) pravidlo], [takové pravidlo se používá jako pravá strana jiného přepisovacího pravidla])) do pravé strany pravidel CODE([QUERY]) a[]NB()CODE([WARNING]).
],
[dnl english: _next_language_
The example processes other types of messages CODE_M4([QUERY]) and CODE_M4([WARNING]).
It uses three automata and six output queues.
If we generate more complex source code, we will soon encounter the problem of maintaining index consistency for output queues.
To avoid confusion, we use queue names instead of numbers.
To avoid having to define similar rules, we copy the right side of CODE([ERROR]) (it is also a[]NB()ABBR([HCODE([β], [[[21], [messages/qnames.json.m4]]]) rule], [the rule is used as the right side of another rewriting rule])) to the right side of the CODE([QUERY]) and CODE([WARNING]) rules.
]])

BRIDGEHEAD([branching_by_grammar], [dnl czech
[Větvení gramatikou – základní princip],
dnl english: _next_language_
[Branching by grammar – basic principle],
])

PARA([[dnl czech
Proměnná HCODE([$[0]], [[[A], [nonterminals_for_branches]]]) se nahradí za HEXPL([jméno makra], [[[B], [nonterminals_for_branches]]]) a[]NB()HEXPL([zřetězí se s[]NB()dalším symbolem], [[[C], [nonterminals_for_branches]]]).
HEXPL([Nově vzniklý neterminál], [[[B, C], [nonterminals_for_branches]]]) se přepíše na odpovídající HEXPL([terminální symbol], [[[D], [nonterminals_for_branches]]]) (číslo fronty nebo jméno).
],
[dnl english: _next_language_
The HCODE([$[0]], [[[A], [nonterminals_for_branches]]]) variable is replaced by HEXPL([the name of the macro], [[[B], [nonterminals_for_branches]]]) and HEXPL([concatenated with another symbol], [[[C], [nonterminals_for_branches]]]).
HEXPL([The newly formed nonterminal], [[[B, C], [nonterminals_for_branches]]]) is rewritten to the corresponding HEXPL([terminal symbol], [[[D], [nonterminals_for_branches]]]) (queue number or name).
]])

PROGRAMLISTING([nonterminals_for_branches], LANG([větvení gramatikou v M4], [grammar branching in M4]), [dnl
MM([$[0]], a)_QU → MM([ERROR], b)MM([_QU], c) → MM([2], d)
MM([$[0]], a)_END → MM([ERROR], b)MM([_END], c) → MM([3], d)
MM([$[0]], a)_NAME → MM([ERROR], b)MM([_NAME], c) → MM([error], d)
MM([$[0]], a)_QU → MM([QUERY], b)MM([_QU], c) → MM([0], d)
MM([$[0]], a)_END → MM([QUERY], b)MM([_END], c) → MM([1], d)
MM([$[0]], a)_NAME → MM([QUERY], b)MM([_NAME], c) → MM([query], d)
…
])dnl PROGRAMLISTING

INSERT_FILE([messages/qnames.json.m4])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/qnames.json.m4], [messages/code.m4], [messages/messages.mc], [messages/qnames.json])
INSERT_FILE([messages/qnames.json])


SECT2([json_symbolic_queue_names], [dnl czech
[CODE_M4([[]]) JSON: generované indexy front],
dnl english: _next_language_
[CODE_M4([[]]) JSON: generated queue indexes],
])

PARA([[dnl czech
Během vývoje se často mění pořadí a[]NB()počet výstupních front, což také vyžaduje častou změnu jejich indexů.
HEXPL([Indexy je proto vhodné generovat], [[[A], [messages/queues.m4]]]).
Můžeme pak používat prakticky neomezený počet front.
Následující příklad ukazuje, jak se tyto indexy generují.
],
[dnl english: _next_language_
During development, the order and number of output queues often change, which also requires frequent changes of their indexes.
HEXPL([It is therefore appropriate to generate indexes], [[[A], [messages/queues.m4]]]).
We can then use a[]NB()virtually unlimited number of queues.
The following example shows how these indexes are generated.
]])

INSERT_FILE([messages/queues.m4],, [/\<QUEUE_INDEX\>)$/s/\<QUEUE_INDEX\>/MM(a)/])
INSERT_FILE([messages/messages.json.m4])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/queues.m4], [messages/messages.json.m4], [messages/code.m4], [messages/messages.mc], [messages/messages.json])
INSERT_FILE([messages/messages.json])


SECT1([dnl czech
[CODE_M4([[]]) INI: nespojitý index front],
dnl english: _next_language_
[CODE_M4([[]]) INI: discontinuous queue index],
])

PARA([[dnl czech
Příklad používá tři automaty a[]NB()dvě výstupní fronty číslo HCODE([2], [[[10, 26], [messages/messages.ini.m4]]]) a[]NB()HCODE([4], [[[10, 26], [messages/messages.ini.m4]]]) definované v[]NB()odděleném souboru.
HEXPL([Názvy INI sekcí], [[[11], [messages/messages.ini.m4]], [[3, 6, 11], [messages/messages.ini]]]) jsou generovány HEXPL([řetězením symbolů], [[[A, R], [messages/messages.ini.m4]]]) (viz. LINK([větvení], [branching_by_grammar])).
Příklad používá stejný soubor pro výstupní fronty jako LINK([příklad], [json_symbolic_queue_names]) pro generování JSON.
],
[dnl english: _next_language_
The example uses three automata and two output queues number HCODE([2], [[[10, 26], [messages/messages.ini.m4]]]) and HCODE([4], [[[10, 26], [messages/messages.ini.m4]]]) defined in a[]NB()separate file.
HEXPL([INI section names], [[[11], [messages/messages.ini.m4]], [[3, 6, 11], [messages/messages.ini]]]) are generated by HEXPL([symbol chaining], [[[A, R], [messages/messages.ini.m4]]]) (see LINK([branching], [branching_by_grammar])).
The example uses the same file for output queues as the LINK([example], [json_symbolic_queue_names]) to generate JSON.
]])

INSERT_FILE([messages/messages.ini.m4],, [/\<BRAC\>/s/\(.0\)\(_NAME\)/<span class="NSP()r">\1<\x2fspan><span class="NSP()a">\2<\x2fspan>/])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/messages.ini.m4], [messages/queues.m4], [messages/code.m4], [messages/messages.mc], [messages/messages.ini])
INSERT_FILE([messages/messages.ini])


SECT1([dnl czech
[CODE_M4([[]]) XML: smíšené zprávy],
dnl english: _next_language_
[CODE_M4([[]]) XML: mixed messages],
])

PARA([[dnl czech
Příklad používá jednu výstupní frontu číslo HCODE([1], [[[21], [messages/mixed.xml.m4]]]) pro uzavírací značku HCODE([[]LT()/messages[]GT()], [[[22], [messages/mixed.xml.m4]], [[28], [messages/mixed.xml]]]).
],
[dnl english: _next_language_
The example uses one output queue number HCODE([1], [[[21], [messages/mixed.xml.m4]]]) for the HCODE([[]LT()/messages[]GT()], [[[22], [messages/mixed.xml.m4]], [[28], [messages/mixed.xml]]]) closing tag.
]])

INSERT_FILE([messages/mixed.xml.m4])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/queues.m4], [messages/mixed.xml.m4], [messages/markup.m4], [messages/messages.mc], [messages/mixed.xml])
INSERT_FILE([messages/mixed.xml])


SECT1([dnl czech
[CODE_M4([[]]) XML: oddělené zprávy],
dnl english: _next_language_
[CODE_M4([[]]) XML: separated messages],
])

PARA([[dnl czech
Příklad seskupuje zprávy podle jejich typu pomocí výstupních front.
],
[dnl english: _next_language_
The example groups messages by their type using output queues.
]])

INSERT_FILE([messages/messages.xml.m4])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/queues.m4], [messages/messages.xml.m4], [messages/markup.m4], [messages/messages.mc], [messages/messages.xml])
INSERT_FILE([messages/messages.xml])


SECT1([dnl czech
[CODE_M4([[]]) Bash CODE([CMD() echo []DQ()řetězec[]DQ()])],
dnl english: _next_language_
[CODE_M4([[]]) Bash CODE([CMD() echo []DQ()string[]DQ()])],
])

INSERT_FILE([messages/doubleq.sh.m4])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/doubleq.sh.m4], [messages/doubleq.m4], [messages/messages.mc], [messages/doubleq.sh])
INSERT_FILE([messages/doubleq.sh])


SECT1([dnl czech
[CODE_M4([[]]) Bash CODE([CMD() echo 'řetězec'])],
dnl english: _next_language_
[CODE_M4([[]]) Bash CODE([CMD() echo 'string'])],
])

INSERT_FILE([messages/apost.sh.m4])
COMMAND_LINE([m4], [gfiles/rootb.m4], [messages/apost.sh.m4], [messages/apost.m4], [messages/messages.mc], [messages/apost.sh])
INSERT_FILE([messages/apost.sh])


APPENDIX([preproc_examples], [dnl czech
[Příklady preprocesoru],
dnl english: _next_language_
[Preprocessor examples],
])

SECT1([cpp_and_m4], [dnl czech
[CODE_M4([`']) Preprocesor jazyka C[]NB()a[]NB()M4],
dnl english: _next_language_
[CODE_M4([`']) C[]NB()preprocessor and M4],
])

PARA([[dnl czech
Direktivy ULINK([CPP], [Preprocesor jazyka C], [https://cs.wikipedia.org/wiki/Preprocesor_jazyka_C]) jsou pro M4 jednořádkový komentář, což brání nežádoucí expanzi stejně pojmenovaných maker.
Definujeme-li bezpečnější makro HCODE([SAF()], [[[5], [preproc/file.c.m4]], [[12], [preproc/file.c]]]), stejně pojmenované makro HCODE([SAF ()], [[[8, 11], [preproc/file.c]]]) nebude přepsáno.
Jmenný prostor ABBR([CPP], [Preprocesor jazyka C]) tak BOLD([může]) být zcela oddělen od jmenného prostoru M4.
Problematický znak CODE([LQ()]) je skryt do makra HCODE_M4([LQ()], [[[24], [preproc/file.c]]]).
Apostrof HCODE([RQ()], [[[A], [preproc/file.c]], [[A], [preproc/preproc.file.c]]]) ve zdrojovém kódu ničemu nevadí.
Apostrof uvnitř makra HCODE([ORD[]DEL([SPAN([()],,, [color:rgba(0,0,0,.75)])],,, [color:red])], [[[4], [preproc/file.c.m4]], [[B], [preproc/file.c]]]) je skryt do makra HCODE_M4([RQ()], [[[A], [preproc/file.c.m4]]]).
Všimněte si jmen funkcí HCODE_M4([define ()], [[[17, 27], [preproc/file.c]], [[17, 27], [preproc/preproc.file.c]]]) nebo HCODE_M4([ifelse ()], [[[18, 28], [preproc/file.c]], [[18, 28], [preproc/preproc.file.c]]]) a[]NB()kde je expandován HCODE([SYMBOL], [[[C], [preproc/file.c]], [[C], [preproc/preproc.file.c]], [[C], [preproc/file.c.m4]]]).
],
[dnl english: _next_language_
The ULINK([CPP], [C preprocessor], [https://en.wikipedia.org/wiki/C_preprocessor]) directives are a[]NB()one-line comment for M4 preventing unwanted expansion of the same named macros.
If we define a[]NB()safer HCODE([SAF()], [[[5], [preproc/file.c.m4]], [[12], [preproc/file.c]]]) macro, the similar HCODE([SAF ()], [[[8, 11], [preproc/file.c]]]) macro will not be overwritten.
Thus, the ABBR([CPP], [C preprocessor]) namespace BOLD([can be]) completely separated from the M4 namespace.
The problematic (backquote) character CODE([LQ()]) is hidden in the HCODE_M4([LQ()], [[[24], [preproc/file.c]]]) macro.
The apostrophe HCODE(['], [[[A], [preproc/file.c]], [[A], [preproc/preproc.file.c]]]) does not matter in the source code.
Apostrophe inside HCODE([ORD[]DEL([SPAN([()],,, [color:rgba(0,0,0,.75)])],,, [color:red])], [[[4], [preproc/file.c.m4]], [[B], [preproc/file.c]]]) macro is hidden in HCODE_M4([RQ()], [[[A], [preproc/file.c.m4]]]) macro.
Note the HCODE_M4([define ()], [[[17, 27], [preproc/file.c]], [[17, 27], [preproc/preproc.file.c]]]) or HCODE_M4([ifelse ()], [[[18, 28], [preproc/file.c]], [[18, 28], [preproc/preproc.file.c]]]) function names and where the HCODE_M4([SYMBOL], [[[C], [preproc/file.c]], [[C], [preproc/preproc.file.c]], [[C], [preproc/file.c.m4]]]) is expanded.
]])

INSERT_FILE([preproc/file.c.m4],, [
s/\<RQ()/MM(a)/g
s/\<SYMBOL\>/MM(c)/g
])
INSERT_FILE([preproc/file.c],, [
s/\x27/MM(a)/g
s/\<SYMBOL\>/MM(c)/g
/\<define\>/!s/\<ORD\>/MM(b)/
])
COMMAND_LINE([m4 -DSYMBOL='Hello, world!'], [gfiles/rootq.m4], [preproc/file.c.m4], [preproc/file.c], [preproc/preproc.file.c])
INSERT_FILE([preproc/preproc.file.c],, [
s/\x27/MM(a)/g
s/\<SYMBOL\>/MM(c)/g
])


SECT1([dnl czech
[CODE_M4([`']) CSS: vložení souboru[,] komentář],
dnl english: _next_language_
[CODE_M4([`']) CSS: file inclusion[,] comment],
])

PARA([[dnl czech
CSS používá znak HCODE_M4([#], [[[A], [preproc/file.css.m4]], [[A], [preproc/preproc.file.css]]]) pro kódy barev, což je také začátek jednořádkového M4 komentáře.
Klíčové slovo HCODE_M4([changecom(/*,*/)], [[[A], [preproc/file.css]]]) nastaví víceřádkový komentář CODE([/* … */]) a[]NB()přepíše se na ABBR([CODE([ε])], [epsilon – prázdný symbol]).
Komentáře se vypínají stejným klíčovým slovem HCODE_M4([changecom], [[[B], [preproc/file.css]]]) bez parametrů.
],
[dnl english: _next_language_
CSS uses the HCODE_M4([#], [[[A], [preproc/file.css.m4]], [[A], [preproc/preproc.file.css]]]) character for color codes, which is also the beginning of a[]NB()one-line M4 comment.
The HCODE_M4([changecom(/*,*/)], [[[A], [preproc/file.css]]]) keyword sets a[]NB()multiline CODE([/* … */]) comment and rewrites itself into ABBR([CODE([ε])], [epsilon – empty symbol]).
The comments can be turned off with the same HCODE_M4([changecom], [[[B], [preproc/file.css]]]) keyword without parameters.
]])

INSERT_FILE([preproc/foo.css], LANG([soubor vložený makro procesorem], [file embedded by the macro processor]))
INSERT_FILE([preproc/file.css.m4],, [/\<define\>/s/#/MM(a)/])
INSERT_FILE([preproc/file.css],, [s/changecom(\/\*,\*\/)/MM(a)/;s/^changecom/MM(b)/])
COMMAND_LINE([m4 -DSYMBOL='Hello, world!'], [gfiles/rootq.m4], [preproc/file.css.m4], [preproc/file.css], [preproc/preproc.file.css])
INSERT_FILE([preproc/preproc.file.css],, [s/#/MM(a)/g])


SECT1([nprint_bash], [dnl czech
[BOLD([CODE([␂␆])]) Bash: netisknutelné znaky],
dnl english: _next_language_
[BOLD([CODE([␂␆])]) Bash: nonprintable characters],
])

PARA([[dnl czech
Bash používá oba znaky, CODE([LQ()]) a CODE([LB()]).
Nechceme-li je skrývat do makra CODE_M4([LQ()]) nebo CODE_M4([LB()]), můžeme použít pro LINK([řízení expanze neterminálů], [expansion_control]) HEXPL([netisknutelné znaky], [zobrazené jako UTF-8 znaky], [[[A], [preproc/file.sh.m4]], [[A], [preproc/file.sh]]]), viz. příklad:
],
[dnl english: _next_language_
Bash uses both CODE([LQ()]) and CODE([LB()]) characters.
If we do not want to hide them either in an CODE_M4([LQ()]) or CODE_M4([LB()]) macro, we can use HEXPL([nonprintable characters], [displayed as UTF-8 characters], [[[A], [preproc/file.sh.m4]], [[A], [preproc/file.sh]]]) for LINK([expansion control], [expansion_control]), see the example:
]])

INSERT_FILE([preproc/file.sh.m4],, [s/[␂␆]/MM(a)/g])
INSERT_FILE([preproc/file.sh],, [s/[␂␆]/MM(a)/g])
COMMAND_LINE([m4 -DSYMBOL='Hello, world!'], [gfiles/rootn.m4], [preproc/file.sh.m4], [preproc/file.sh], [preproc/preproc.file.sh])
INSERT_FILE([preproc/preproc.file.sh])


APPENDIX([m4_on_examples], [dnl czech
[M4: příklady],
dnl english: _next_language_
[M4: examples],
])


SECT1([dnl czech
[CODE_M4([[]]) JSON: levá závorka CODE([LB()])],
dnl english: _next_language_
[CODE_M4([[]]) JSON: left bracket CODE([LB()])],
])

PARA([[dnl czech
Uvnitř hranatých závorek CODE_M4([[… se neterminály neexpandují …]]).
Proto je levá hranatá závorka CODE([LB()]) nahrazena makrem HCODE_M4([LB()], [[[6], [hello_world/json.m4]], [[3], [hello_world/hello_world.json]]]) z[]NB()kořenového souboru.
],
[dnl english: _next_language_
The CODE_M4([[… nonterminals are not expanded …]]) inside square brackets.
Therefore, the left square bracket CODE([LB()]) is replaced by the HCODE_M4([LB()], [[[6], [hello_world/json.m4]], [[3], [hello_world/hello_world.json]]]) macro defined in the root file.
]])

INSERT_FILE([hello_world/json.m4])
COMMAND_LINE([m4 -DSYMBOL='Hello, world!'], [gfiles/rootb.m4], [hello_world/json.m4], [hello_world/hello_world.json])
INSERT_FILE([hello_world/hello_world.json])


SECT1([dnl czech
[CODE_M4([[]]) Bash: počítadla],
dnl english: _next_language_
[CODE_M4([[]]) Bash: counters],
])

PARA([[dnl czech
Počítadla HCODE_M4([COUNT_UP], [[[A], [hello_world/sh.m4]]]) a[]NB()HCODE_M4([COUNT_DOWN], [[[B], [hello_world/sh.m4]]]) jsou definována v[]NB()kořenovém souboru.
HEXPL([Neterminály], [[[C], [hello_world/sh.m4]]]) HCODE_M4([[… uvnitř závorek …]], [[[20], [hello_world/sh.m4]], [[5], [hello_world/hello_world.sh]]]) nebudou expandovány, pouze se odeberou vnější závorky.
Nutno použít makro HCODE_M4([LB()], [[[30], [hello_world/sh.m4]], [[15], [hello_world/hello_world.sh]]]) z[]NB()kořenového souboru.
],
[dnl english: _next_language_
The HCODE_M4([COUNT_UP], [[[A], [hello_world/sh.m4]]]) and HCODE_M4([COUNT_DOWN], [[[B], [hello_world/sh.m4]]]) counters are defined in the root file.
The HEXPL([nonterminals], [[[C], [hello_world/sh.m4]]]) HCODE_M4([[… inside brackets …]], [[[20], [hello_world/sh.m4]], [[5], [hello_world/hello_world.sh]]]) will not be expanded, only the outer brackets will be removed.
The HCODE_M4([LB()], [[[30], [hello_world/sh.m4]], [[15], [hello_world/hello_world.sh]]]) macro defined in the root file must be used.
]])

INSERT_FILE([hello_world/sh.m4],, [
s/\<COUNT_UP\>/MM(a)/
s/\<COUNT_DOWN\>/MM(b)/
/^define/s/\<LEFT\>\|\<OP\>\|\<RIGHT\>/MM(c)/
])
COMMAND_LINE([m4 -DSYMBOL='Hello, world!'], [gfiles/rootb.m4], [hello_world/sh.m4], [hello_world/hello_world.sh])
INSERT_FILE([hello_world/hello_world.sh])


SECT1([symbols_in_brackets], [dnl czech
[CODE_M4([[]]) .h: závorky CODE_M4([[]])[,] CODE_M4([[,]])[,] CODE_M4([[#]])[,] CODE_M4([[dnl]])],
dnl english: _next_language_
[CODE_M4([[]]) .h: brackets CODE_M4([[]])[,] CODE_M4([[,]])[,] CODE_M4([[#]])[,] CODE_M4([[dnl]])],
])

PARA([[dnl czech
Prázdný pár HCODE_M4([[]], [[[A], [hello_world/h.m4]]]) (nebo prázdný symbol v[]NB()závorkách CODE_M4([[ε]])) slouží jako oddělovač symbolů.
Závorky kolem znaku komentáře HCODE_M4([[#]], [[[B], [hello_world/h.m4]]]) vypnou jeho původní význam, stejně jako vypnou význam EM([silnějšího]) M4 komentáře HCODE_M4([[dnl]], [[[C], [hello_world/h.m4]]]).
Vypnou také původní význam čárky CODE_M4([[,]]) jako oddělovače argumentů maker.
Tyto symboly se stanou obyčejnými terminálními symboly bez jakéhokoliv vedlejšího efektu.
],
[dnl english: _next_language_
The empty pair HCODE_M4([[]], [[[A], [hello_world/h.m4]]]) (or the empty symbol in brackets CODE_M4([[ε]])) serves as a[]NB()symbol separator.
Brackets around the comment character HCODE_M4([[#]], [[[B], [hello_world/h.m4]]]) turn off its original meaning as well as the meaning of the EM([more powerful]) M4 comment HCODE_M4([[dnl]], [[[C], [hello_world/h.m4]]]).
They also turn off the original meaning of the comma CODE_M4([[,]]) as a[]NB()macro argument delimiter.
These symbols become ordinary terminal symbols without any side effect.
]])

INSERT_FILE([hello_world/h.m4],, [
s/\\x5b;\\x5d;/MM(a)/g
s/\\x5b;#\\x5d;/MM(b)/
s/\\x5b;dnl\\x5d;/MM(c)/
])
COMMAND_LINE([m4 -DSYMBOL='Hello, world!'], [gfiles/rootb.m4], [hello_world/h.m4], [hello_world/hello_world.h])
INSERT_FILE([hello_world/hello_world.h])


SECT1([safe_example], [dnl czech
[CODE_M4([[]]) AWK: příklady bezpečnějších maker],
dnl english: _next_language_
[CODE_M4([[]]) AWK: examples of safer macros],
])

PARA([[dnl czech
Univerzální výstraha HCODE_M4([DONTE], [[[A], [hello_world/awk.m4]], [[A], [hello_world/hello_world.awk]]]) se ignoruje bez závorek, stejně jako HCODE_M4([LB], [[[B], [hello_world/awk.m4]], [[B], [hello_world/hello_world.awk]]]), CODE_M4([RB]), …
Taková makra explicitně vytváří vývojář skriptů, prohlédněte si kořenový soubor.
],
[dnl english: _next_language_
The universal alert HCODE_M4([DONTE], [[[A], [hello_world/awk.m4]], [[A], [hello_world/hello_world.awk]]]) is ignored without parentheses, such as for example HCODE_M4([LB], [[[B], [hello_world/awk.m4]], [[B], [hello_world/hello_world.awk]]]) or CODE_M4([RB]).
Such macros are explicitly created by a[]NB()script developer, see the root file.
]])

INSERT_FILE([hello_world/awk.m4],, [
/\<BEGIN\>/{
s/\<DONTE\>/MM(a)/
s/\<LB\>/MM(b)/
}
])
COMMAND_LINE([m4 -DSYMBOL='Hello, world!'], [gfiles/rootb.m4], [hello_world/awk.m4], [hello_world/hello_world.awk])
INSERT_FILE([hello_world/hello_world.awk],, [
/\<BEGIN\>/{
s/\<DONTE\>/MM(a)/
s/\<LB\>/MM(b)/
}
])


# A → ε
pushdef([APPENDIX_APPEND_CODE])# temporarily disable NOTE in appendix because no examples
APPENDIX([questions_and_answers], [dnl czech
[Proč používat M4 a[]NB()proč ne?],
dnl english: _next_language_
[Why to use M4 and why not?],
])
popdef([APPENDIX_APPEND_CODE])# re-enable NOTE


SECT1([why_to_use_m4], [dnl czech
[CODE([👍]) Proč generovat kód v[]NB()M4],
dnl english: _next_language_
[CODE([👍]) Why to generate code in M4],
])

ITEMIZEDLIST_WRAP([

LISTITEM([direct_use_of_cfg], [[dnl czech
přímé použití LINK([bezkontextové gramatiky], [context_free_grammar]) (rekurze zdarma)
UL([LI([pro transformaci dat stačí napsat minimum M4 kódu])])
],
[dnl english: _next_language_
direct use of LINK([context-free grammar], [context_free_grammar]) (recursion for free)
UL([LI([minimum M4 code is required for data transformation])])
]])

LISTITEM([direct_use_of_atm], [[dnl czech
přímé použití automatů
UL([LI([možnost vymodelovat si potřebné algoritmy (M4 nepotřebuje verze)])])
],
[dnl english: _next_language_
direct use of automata
UL([LI([possibility to model necessary algorithms (M4 does not need versions)])])
]])

LISTITEM([direct_use_of_stacks], [[dnl czech
přímé použití zásobníků
UL([LI([zásobníky propojené s[]NB()automaty rozšiřují možnosti generátoru kódu])])
],
[dnl english: _next_language_
direct use of stacks
UL([LI([stacks connected to automata extend capabilities of code generator])])
]])

LISTITEM([direct_use_of_queues], [[dnl czech
přímé použití výstupních front pro dočasné uložení výsledných částí kódu
UL([LI([jednotlivé fronty jsou na závěr vypsány na výstup ve vzestupném pořadí])])
],
[dnl english: _next_language_
direct use of output queues to temporarily store resulting pieces of code
UL([LI([individual queues are finally dumped to output in ascending order])])
]])

LISTITEM([significantly_faster_code_gener], [[dnl czech
výrazně vyšší rychlost generování kódu (ve srovnání s[]NB()XSLT)
UL([LI([nízké nároky na výpočetní zdroje])])
],
[dnl english: _next_language_
significantly faster code generation (compared to XSLT)
UL([LI([low demands on computing resources])])
]])

])dnl ITEMIZEDLIST_WRAP


SECT1([why_not_use], [dnl czech
[CODE([👎]) Proč se vyhnout M4],
dnl english: _next_language_
[CODE([👎]) Why to avoid M4],
])

ITEMIZEDLIST_WRAP([

LISTITEM([low_level_language], [[dnl czech
univerzální jazyk nízké úrovně (podobně jako jazyk C)
UL([LI([což výměnou poskytuje ohromnou flexibilitu jako UNIX])])
],
[dnl english: _next_language_
low-level universal language (similar to C language)
UL([LI([which in return it provides tremendous flexibility as UNIX])])
]])

LISTITEM([nearly_forgotten_language], [[dnl czech
(téměř) neexistující komunita vývojářů (podzim 2019)
UL([LI([M4 je téměř zapomenutý jazyk, málo existujících projektů])])
],
[dnl english: _next_language_
(almost) nonexistent developer community (as of Autumn 2019)
UL([LI([M4 is nearly forgotten language with small number of existing projects])])
]])

LISTITEM([unusual_language], [[dnl czech
neobvyklé programovací paradigma vyžadující splnění LINK([několika předpokladů], [prerequisites_for_mastering])
UL([LI([BOLD([právě proto]) lze M4 považovat za náročný jazyk])])
],
[dnl english: _next_language_
unusual programming paradigm requiring LINK([several prerequisites], [prerequisites_for_mastering])
UL([LI([BOLD([that is why]) the M4 can be considered a challenging language])])
]])

LISTITEM([experience_dependent], [[dnl czech
produktivita značně závisí na zkušenostech (možný problém s[]NB()termíny)
UL([LI([psaní M4 skriptů vyžaduje základní znalost automatů a gramatik])])
],
[dnl english: _next_language_
productivity greatly depends on experience (problem with short-term deadlines)
UL([LI([writing M4 scripts requires basic knowledge of automata and grammars])])
]])

LISTITEM([maintenance_could_be_hard], [[dnl czech
údržba špatně napsaného M4 kódu není jednoduchá
UL([LI([existující M4 kód je snadné proměnit ve zmatek (nutný dohled!)])])
],
[dnl english: _next_language_
maintaining badly written M4 code is not easy
UL([LI([existing M4 code is easily thrown into confusion (supervision required!)])])
]])

])dnl ITEMIZEDLIST_WRAP
