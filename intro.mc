# 2019/12/03 Josef Kubin

VERSION(0, 0, 0)


CAPTION([dnl czech
[SERIES_NAME: úvod],
dnl english: _next_language_
[SERIES_NAME: introduction],
])

PEREX_IMG([img/m4tux.png], [https://cesta/nekam.png])


PEREX([defn([PEREX_CS])[dnl czech
Úvodní díl seriálu obsahuje jeho historii, základní principy jazyka, příklady použití a[]NB()nutné předpoklady pro zvládnutí tohoto geniálního nástroje.
],
defn([PEREX_EN])[dnl english: _next_language_
The introductory part of the series contains its history, the basic principles of language, examples of usage and prerequisites for master this brilliant tool.
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
Proto je vhodné použít nějaký mechanismus pro generování kódu.
Generování kódu provádí nástroj určený pro transformaci textu – BO([makro procesor]).
],
[dnl english: _next_language_
Readers of this series will learn how to write scripts for machine code generation.
The machine-generated code can be arbitrarily complex and can contain other internal dependencies.
Interdependent files with complex code are hardly sustainable for humans in a[]NB()consistent state.
Therefore, it is advisable to use some code generation mechanisms.
The code generation is performed by a[]NB()tool for text transformation – BO([a[]NB()macro processor]).
]])

Therefore, it is advisable to use some code generation mechanisms such as ...

PARA([[dnl czech
Seriál je zaměřen na praktické použití BO([univerzálního makro procesoru M4]) (dále jen M4) pomocí malých, ukázkových příkladů.
Popisuje též teoretický základ všech implementací.
Cílem seriálu je seznámit čtenáře s[]NB()tímto ABBR([nástrojem], [m4 – je program příkazové řádky]) a také programovacím ABBR([jazykem], [M4 – je programovací jazyk]).[]BR()
LINK([Na co se používá], [main_use_of_m4]), jak se v něm programuje a jaké jsou jeho LINK([výhody], [why_to_use_m4]) a[]NB()LINK([nevýhody], [why_not_use]).
],
[dnl english: _next_language_
The series focus on the practical use of the BO([universal macro processor M4]) (hereafter M4) using small examples.
It also describes the theoretical part of all its implementations.
The aim of the series is to acquaint the reader with this ABBR([tool], [m4 – is a command line program]) and also the programming ABBR([language], [M4 – is a programming language]).
LINK([What its main use], [main_use_of_m4]), how to program in it, what are LINK([advantages], [why_to_use_m4]) and what are LINK([disadvantages], [why_not_use]).
]])
preformulovat
LINK([What its main use], [main_use_of_m4]), how to program in it, what are LINK([advantages], [why_to_use_m4]) and what are LINK([disadvantages], [why_not_use]).

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


SUB_CHAPTER([dnl czech
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
The examples are a complementary part of the series and will be based to some extent on the discussion below the article.
At the beginning of each episode, some parts of the M4 language will be described and supplemented with a[]NB()set of examples at the end.
Each part can be read in any order.
]])

UNORDERED_LIST_WRAP([

LIST_ITEM_MONO([[LINK([code_generation_examples], [code_generation_examples])]])

LIST_ITEM_MONO([[LINK([preproc_examples], [preproc_examples])]])

LIST_ITEM_MONO([[LINK([m4_on_examples], [m4_on_examples])]])

LIST_ITEM_MONO([[LINK([questions_and_answers], [questions_and_answers])]])

LIST_ITEM([dnl czech
[AD([http://github.com/jkubin/m4root], defn([SERIES_NAME]), [http://github.com/jkubin/m4root]) – složitější projekt generující HTML tohoto seriálu],
dnl english: _next_language_
[AD([http://github.com/jkubin/m4root], defn([SERIES_NAME]), [http://github.com/jkubin/m4root]) – a[]NB()project generating HTML of this series],
])

])dnl UNORDERED_LIST_WRAP


CHAPTER([dnl czech
[Historie M4],
dnl english: _next_language_
[History of M4],
])

PARA([[dnl czech
Makro jazyky byly vynalezeny v době, kdy dominoval jazyk symbolických instrukcí (assembler).
Později byly použity k rozšíření kompilovaných programovacích jazyků, protože umožnily psát zdrojový kód na vyšší úrovni abstrakce než samotný programovací jazyk.
],
[dnl english: _next_language_
Macro languages were invented at a time when the assembly language dominated.
Later they were used to extend compiled programming languages because they made it possible to write source code at a higher level of abstraction than the programming language itself.
]])


HEADING_MONO([dnl monolingual
[GPM (General Purpose Macro-generator)],
])

PARA([[dnl czech
Základní myšlenku přepisování textových řetězců s[]NB()argumenty, které se přepíší do dalších rekurzivně přepisovatelných řetězců představil
AD([PERSON([Christopher Strachey])], [Wikipedie], [https://en.wikipedia.org/wiki/Christopher_Strachey]) ve svém
ABBR([GPM], [General Purpose Macro-generator])[]REF([A[]NB()General Purpose Macro-generator], [Computer Journal 8, 3 (1965), 225–41], [http://dx.doi.org/10.1093/comjnl/8.3.225]) v[]NB()roce 1965.
Další generace makro procesorů M3 a[]NB()M4 původní ABBR([GPM], [General Purpose Macro-generator]) v[]NB()podstatě už jen rozšiřovaly.
Základní myšlenka původního návrhu ale zůstala stejná.
],
[dnl english: _next_language_
AD([PERSON([Christopher Strachey])], [Wikipedia], [https://en.wikipedia.org/wiki/Christopher_Strachey]) introduced the basic idea of rewritable strings with arguments which recursively rewrite to other strings in his
ABBR([GPM], [General Purpose Macro-generator])[]REF([A[]NB()General Purpose Macro-generator], [Computer Journal 8, 3 (1965), 225–41], [http://dx.doi.org/10.1093/comjnl/8.3.225]) in 1965.
The next generation of M3 and M4 macro processors basically just expanded the original ABBR([GPM], [General Purpose Macro-generator]).
However, the basic idea of the original proposal remained the same.
]])


HEADING([dnl czech
[M3],
dnl english: _next_language_
[M3],
])

PARA([[dnl czech
AD([PERSON([Dennis Ritchie])], [Wikipedie], [https://cs.wikipedia.org/wiki/Dennis_Ritchie]) převzal základní myšlenku ABBR([GPM], [General Purpose Macro-generator]) a[]NB()napsal vylepšený makro procesor pro generování zdrojového kódu programovacího jazyka C (1972), který sám navrhl.
Nový BUN([m])akroprocesor napsal pro minipočítač AP-BUN([3]) – odtud jméno BO([M3]).
Tento přímý předchůdce současného M4 dokázal výrazně ušetřit těžkou a[]NB()časově náročnou práci, čímž zaujal vývojáře programující v[]NB()jiných jazycích (ABBR([FORTRAN], [FORmula TRANslation]), ABBR([COBOL], [COmmon Business-Oriented Language]), ABBR([PL/I], [Programming Language One]), …).
Vývojáři upravovali M3 pro tyto jazyky čímž ho proměnili na univerzálně použitelný makro procesor M4.
],
[dnl english: _next_language_
AD([PERSON([Dennis Ritchie])], [Wikipedia], [https://en.wikipedia.org/wiki/Dennis_Ritchie]) took over the basic idea of ABBR([GPM], [General Purpose Macro-generator]) and wrote an improved macro processor for generating source code of C[]NB()(1972) language, which he himself designed.
The new BUN([m])acro processor was written for the minicomputer AP-BUN([3]) – hence the name BO([M3]).
This direct ancestor of the current M4 managed to significantly save heavy and time-consuming work and attract developers programming to other languages (ABBR([FORTRAN], [FORmula TRANslation]), ABBR([COBOL], [COmmon Business-Oriented Language]), ABBR([PL/I], [Programming Language One]), …).
Developers have customized M3 for these languages turning it into a[]NB()universally usable M4 macro processor.
]])

TIP_BOX_WRAP(, [m4 ∈ ]LANG([{množina nástrojů UNIX-u}], [{set of UNIX tools}]), [

PLAIN_TEXT([[dnl czech
PERSON([Dennis Ritchie]) byl také spolutvůrcem operačního systému UNIX a[]NB()proto:
],
[dnl english: _next_language_
PERSON([Dennis Ritchie]) was also a[]NB()co-creator of UNIX and therefore:
]])

UNORDERED_LIST_WRAP([

LIST_ITEM([[dnl czech
M4 je minimalistický a[]NB()rychlý, AD([dělá jednu věc a[]NB()tu dělá dobře], [Filosofie UNIX-u], [https://cs.wikipedia.org/wiki/Filosofie_Unixu])
],
[dnl english: _next_language_
M4 is minimalist and fast, AD([it does one thing and it does well], [UNIX philosophy], [https://en.wikipedia.org/wiki/Unix_philosophy])
]])

LIST_ITEM([[dnl czech
výhradně spoléhá na neinteraktivní rozhraní příkazové řádky
],
[dnl english: _next_language_
it relies solely on the non-interactive command line interface
]])

LIST_ITEM([[dnl czech
parametry a[]NB()závislosti M4 skriptů popisuje CODE([Makefile])
],
[dnl english: _next_language_
parameters and dependencies of M4 scripts are described by CODE([Makefile])
]])

LIST_ITEM([[dnl czech
znakem CODE_M4([#]) začíná jednořádkový komentář jako v[]NB()UNIX-ovém shell-u
],
[dnl english: _next_language_
the CODE_M4([#]) character begins with a one-line comment like in a[]NB()UNIX shell
]])

LIST_ITEM([[dnl czech
proměnné CODE([$[@]]), CODE([$[*]]), CODE([$[#]]), CODE([$[0]]), CODE([$[1]]), CODE([$[2]]), … mají podobný význam jako v[]NB()shell-u
],
[dnl english: _next_language_
variables CODE([$[@]]), CODE([$[*]]), CODE([$[#]]), CODE([$[0]]), CODE([$[1]]), CODE([$[2]]), … have similar meanings as in a[]NB()UNIX shell
]])

LIST_ITEM([[dnl czech
oddělovač argumentů je čárka
],
[dnl english: _next_language_
the argument delimiter is comma
]])

])dnl UNORDERED_LIST_WRAP

])dnl TIP_BOX_WRAP

PARA([[dnl czech
Makro procesor M3 rozšířil také PERSON([Jim E. Weythman]), autor programové konstrukce, která se používá téměř v[]NB()každém M4 skriptu:
],
[dnl english: _next_language_
The M3 macro processor was also extended by PERSON([Jim E. Weythman]), the author of program construction, which is used in almost every M4 script:
]])

PRE(, LANG([idiomatický kód M4], [idiomatic M4 code]), [[
divert(-1)
…
define(…)
…
divert(0)dnl
…
]])dnl PRE

TIP_BOX(, [divert(-1), divert(0), divert(1), …, divert(2147483647)], [[dnl czech
Klíčové slovo CODE_M4([divert(ℤ)]) přepíná výstupní fronty.
Argument CODE([-1]) zcela vypne jakýkoliv textový výstup.
Argument CODE([0]) přepne výstup na CODE_M4([stdout]).
],
[dnl english: _next_language_
The CODE_M4([divert(ℤ)]) keyword switches output queues.
Argument CODE([-1]) completely disables any text output.
Argument CODE([0]) switches output to CODE([stdout]).
]])


HEADING([dnl czech
[M4],
dnl english: _next_language_
[M4],
])

PARA([[dnl czech
AD([PERSON([Brian Kernighan])], [Wikipedie], [https://cs.wikipedia.org/wiki/Brian_Kernighan]) makro procesor M3 rozšířil na AD([preprocesor], [Wikipedie], [https://cs.wikipedia.org/wiki/Preprocesor]) jazyka FORTRAN 66,
aby mohl vytvořit hybridní jazykovou nadstavbu pojmenovanou ABBR([BO([Ratfor])], [Rational Fortran])[]REF([RATFOR — A Preprocessor for a Rational Fortran], [Brian W. Kernighan], [https://wolfram.schneider.org/bsd/7thEdManVol2/ratfor/ratfor.pdf]).
Základní programové konstrukce této nadstavby (podmínky, cykly) jsou stejné jako v[]NB()jazyce C.
Programování v[]NB()Ratfor-u se tak podobá programování v[]NB()QUOTE([céčku]).
Makro procesor zdrojový kód překládá zpátky do FORTRAN-u, poté kompilátor provede překlad do strojového kódu.
],
[dnl english: _next_language_
AD([PERSON([Brian Kernighan])], [Wikipedia], [https://en.wikipedia.org/wiki/Brian_Kernighan]) has enhanced the M3 macro processor to the FORTRAN 66
AD([preprocessor], [Wikipedia], [https://en.wikipedia.org/wiki/Preprocessor]) to create a[]NB()hybrid language extension named ABBR([BO([Ratfor])], [Rational Fortran])[]REF([RATFOR — A Preprocessor for a Rational Fortran], [Brian W. Kernighan], [https://wolfram.schneider.org/bsd/7thEdManVol2/ratfor/ratfor.pdf]).
The basic program constructions of this extension (conditions, cycles) are the same as in C[]NB()language.
Programming in Ratfor is similar to C[]NB()programming.
The macro processor converts the source code back to FORTRAN, then the compiler performs the usual compilation to machine code.
]])

TIP_BOX_WRAP([], LANG([M4 doplňuje jazyk C], [M4 complements C language]), [

PLAIN_TEXT([[dnl czech
Všimněte si LINK([téměř dokonalé symbiózy], [cpp_and_m4]) s[]NB()jazykem C
],
[dnl english: _next_language_
Note the LINK([almost perfect symbiosis], [cpp_and_m4]) with the C[]NB()language:
]])

UNORDERED_LIST_WRAP([

LIST_ITEM([[dnl czech
direktivy ABBR([CPP], [Preprocesor jazyka C]) CODE_M4([#define]), CODE_M4([#include]), CODE_M4([#ifdef]), … jsou pro M4 komentáře
],
[dnl english: _next_language_
ABBR([CPP], [C preprocessor]) directives CODE_M4([#define]), CODE_M4([#include]), CODE_M4([#ifdef]), … are comments for M4
]])
# LI([této vlastnosti využívají LINK([bezpečnější makra], [safer_macros]) definovaná uživatelem])
# LI([this feature uses LINK([safer user-defined macros], [safer_macros])])

LIST_ITEM([[dnl czech
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

LIST_ITEM([[dnl czech
argumenty maker oddělují čárky stejně jako argumenty funkcí jazyka[]NB()C
UL([
LI([je-li definováno makro CODE_M4([FUNC(char c, int i)]), jeho proměnné jsou:[]BR()
CODE([$[#] → 2]), CODE([$[0] → FUNC]), CODE([$[1] → char c]), CODE([$[2] → int i])
])
])dnl UL
],
[dnl english: _next_language_
macro arguments separate commas just like commas in C[]NB()functions
UL([
LI([if the CODE_M4([FUNC(char c, int i)]) macro is defined, its variables are:[]BR()
CODE([$[#] → 2]), CODE([$[0] → FUNC]), CODE([$[1] → char c]), CODE([$[2] → int i])
])
])dnl UL
]])

LIST_ITEM([[dnl czech
BO([levý]) LINK([řídící znak], [expansion_control]) CODE([LQ()]) pro neterminály není součástí syntaxe rodiny jazyků[]NB()C
],
[dnl english: _next_language_
BO([the left]) LINK([control character], [expansion_control]) CODE([LQ()]) is not a[]NB()part of the C[]NB()family syntax
]])

LIST_ITEM([[dnl czech
BO([pravý]) řídící znak CODE([']) nevadí, není-li součástí makra
UL([LI([oba řídící znaky lze skrýt do uživatelsky definovaných maker CODE_M4([LQ()]), CODE_M4([RQ()])])])
],
[dnl english: _next_language_
BO([the right]) control character CODE([']) does not matter if it is not part of the macro[]BR()
UL([LI([both control characters can be hidden into user-defined macros CODE_M4([LQ()]), CODE_M4([RQ()])])])
]])

LIST_ITEM([[dnl czech
makra se píší CODE([VELKYMI_PISMENY]), stejně jako AD([neterminální symboly], [Wikipedie], [https://cs.wikipedia.org/wiki/Termin%C3%A1ln%C3%AD_a_netermin%C3%A1ln%C3%AD_symbol])
UL([LI([tím je vymezen jejich jmenný prostor])])
],
[dnl english: _next_language_
macros are written CODE([IN_UPPERCASE]), just like AD([nonterminal symbols], [Wikipedia], [https://en.wikipedia.org/wiki/Terminal_and_nonterminal_symbols])
UL([LI([this delimits their namespace])])
]])

])dnl UNORDERED_LIST_WRAP

])dnl TIP_BOX_WRAP

PARA([[dnl czech
Uživatelský manuál[]REF([The M4 Macro Processor], [Bell Laboratories (1977)], [https://wolfram.schneider.org/bsd/7thEdManVol2/m4/m4.pdf]) zmiňuje ještě další, zde neuvedené spoluautory.
Bylo by tedy značně nespravedlivé napsat, že autory makro procesoru M4 (1977) jsou EM([pouze]) dva lidé.
],
[dnl english: _next_language_
The user manual[]REF([The M4 Macro Processor], [Bell Laboratories (1977)], [https://wolfram.schneider.org/bsd/7thEdManVol2/m4/m4.pdf]) mentions other co-authors not mentioned here.
So it would be fairly unfair to write that the authors of the M4 macro processor (1977) are EM([only]) two people.
]])

IMG([the_authors],dnl id
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


HEADING([dnl czech
[GNU M4],
dnl english: _next_language_
[GNU M4],
])

PARA([[dnl czech
Dnes existuje několik implementací lišící se od původní implementace spíše drobnostmi.
Nejrozšířenější implementace M4 je BO([GNU M4]) používaná pro AD([Autotools], [Wikipedie], [https://en.wikipedia.org/wiki/GNU_Build_System])
a[]NB()pro překlad jednoduchého konfiguračního souboru CODE([sendmail.mc]) na složitý CODE([sendmail.cf]).
Autorem této implementace z[]NB()roku 1990 je AD([PERSON([René Seindal])], [https://www.seindal.dk/rene/gnu/]).
ABBR([BO([m4])], [m4 s malým „m“ je nástroj]) nainstalujeme následujícím příkazem:
],
[dnl english: _next_language_
Today, there are several implementations that differ from the original implementation rather by small details.
The most common implementation of M4 is the BO([GNU M4])[]REF([GNU M4 - GNU macro processor], [Free Software Foundation], [https://www.gnu.org/software/m4/manual/]) used for AD([Autotools], [Wikipedia], [https://en.wikipedia.org/wiki/GNU_Build_System])
and for translating the simple CODE([sendmail.mc]) configuration file to complex CODE([sendmail.cf]).
The author of this implementation (1990) is AD([PERSON([René Seindal])], [https://www.seindal.dk/rene/gnu/]).
To install ABBR([BO([m4])], [m4 with small letter „m“ is a tool]), type the following command:
]])

PRE([install], LANG([příkaz nainstaluje také další balíčky], [the command also installs additional packages]), [
ROO() BO([dnf -y install make m4 pinfo])
])dnl PRE

PARA([[dnl czech
Podrobný popis klíčových slov naleznete v[]NB()dokumentaci[]REF([GNU M4 - GNU macro processor], [Free Software Foundation], [https://www.gnu.org/software/m4/manual/]):
],
[dnl english: _next_language_
A detailed description of the keywords can be found in the documentation[]REF([GNU M4 - GNU macro processor], [Free Software Foundation], [https://www.gnu.org/software/m4/manual/]):
]])

PRE([
CMD() BO([pinfo m4])
CMD() BO([man m4])
CMD() BO([m4 --help])
])dnl PRE


CHAPTER([dnl czech
[Základy jazyka M4],
dnl english: _next_language_
[Basics of M4],
])

PARA([[dnl czech
Základem jazyka M4 je BO([bezkontextová gramatika]), BO([automaty]), BO([zásobníky]) a[]NB()BO([výstupní fronty]).
Pro pochopení jazyka M4 je proto velmi důležité rozumět základním pojmům teorie formálních jazyků.
Co jsou AD([terminální symboly], [Wikipedie], [https://cs.wikipedia.org/wiki/Termin%C3%A1ln%C3%AD_a_netermin%C3%A1ln%C3%AD_symbol]) (stručně BO([terminály])) a neterminální symboly (stručně BO([neterminály])).
Zmíněné pojmy si podrobněji vysvětlíme někdy později.
Cílem tohoto úvodního dílu je hlavně ukázat praktické použití M4 na příkladech.
],
[dnl english: _next_language_
M4 is based on LINK([context-free grammar], [context_free_grammar]), BO([automata]), BO([stacks]) and BO([output queues]).
To understand M4, it is therefore very important to understand the basic concepts of formal language theory.
What are AD([terminal symbols], [Wikipedia], [https://en.wikipedia.org/wiki/Terminal_and_nonterminal_symbols]) (briefly BO([terminals])) and nonterminal symbols (briefly BO([nonterminals])).
These terms will be explained later in more detail.
The aim of this introductory part is mainly to show the basic practical use of M4 language on examples.
]])

SUB_CHAPTER([context_free_grammar], [dnl czech
[Bezkontextová gramatika],
dnl english: _next_language_
[Context-free grammar],
])

PARA([[dnl czech
Bezkontextová gramatika (krátce ABBR([CFG], [Context-Free Grammar – bezkontextová gramatika])) je LINK([formální gramatika], [formal_grammar_chomsky]), ve které mají všechna přepisovací pravidla tvar CODE([A[]NB()→[]NB()β]).
Neterminál CODE_M4([A]) se přepíše na libovolně dlouhý řetězec ABBR([CODE([β])], [pravá strana přepisovacího pravidla]) složený z[]NB()terminálů nebo neterminálů.
AD([Kleene hvězda], [Wikipedie], [https://en.wikipedia.org/wiki/Kleene_star]) CODE([*]) znamená, že se neterminál CODE_M4([A]) může přepsat na ABBR([CODE([ε])], [epsilon – prázdný symbol]).
],
[dnl english: _next_language_
Context-free grammar (shortly ABBR([CFG], [Context-Free Grammar])) is a LINK([formal grammar], [formal_grammar_chomsky]) in which all rewriting rules have the form CODE([A[]NB()→[]NB()β]).
The nonterminal CODE_M4([A]) is rewritten to an arbitrarily long ABBR([CODE([β])], [the right side of the rewriting rule]) string composed of terminals or nonterminals.
AD([Kleene star], [Wikipedia], [https://en.wikipedia.org/wiki/Kleene_star]) CODE([*]) means that the resulting string can be rewritten to ABBR([CODE([ε])], [epsilon – empty symbol]).
]])

PRE(, LANG([formát přepisovacích pravidel bezkontextové gramatiky], [format of rewriting context-free grammar rules]), [[
P: A → β
   A ∈ N
   β ∈ (N ∪ Σ)*
]])dnl PRE

HEADING([m4_rules], [dnl czech
[Přepisovací pravidla M4],
dnl english: _next_language_
[M4 rewriting rules],
])

PARA([[dnl czech
Přepisovací pravidla M4 jsou stejná jako přepisovací pravidla bezkontextové gramatiky.
],
[dnl english: _next_language_
The M4 rewriting rules are the same as context-free grammar rewriting rules.
]])

PRE(, LANG([formát přepisovacích pravidel M4], [format M4 rewriting rules]), [[
# A → β
define(`A', `β')

# A → ε
define(`A')
define(`A', `')
]])dnl PRE

PARA([[dnl czech
Všechna klíčová slova M4 jsou neterminály (makra), provedou nějakou akci (změní vnitřní stav makro procesoru) a přepíší se na ABBR([CODE([ε])], [epsilon – prázdný symbol]).
Klíčová slova mohou být přejmenována.
],
[dnl english: _next_language_
All M4 keywords are nonterminals (macros), they take some action (changes the internal state of the macro processor) and rewrite to ABBR([CODE([ε])], [epsilon – empty symbol]).
Keywords can be renamed.
]])

PRE(, LANG([všechna klíčová slova jazyka M4 jsou neterminály], [all M4 keywords are nonterminals]), [[
divert(ℤ) → ε
define(`A', `β') → ε
ifelse(`', `', `yes', `no') → yes
…
]])dnl PRE


HEADING([expansion_control], [dnl czech
[Řízení expanze neterminálů],
dnl english: _next_language_
[Nonterminal expansion control],
])

PARA([[dnl czech
Výchozí dvojice znaků CODE([LQ()']) v[]NB()M4 řídí expanzi neterminálů.
Klíčové slovo CODE_M4([changequote()]) je může změnit na jiné znaky, například {CODE_M4([[]]), BO([CODE([␂␆])]), CODE([〖〗])}.
Neterminály, které nechceme (ihned) expandovat, jsou obklopeny touto dvojicí znaků.
Při průchodu makro procesorem jsou všechny symboly mezi touto dvojicí znaků BUN([terminálními symboly]) a dvojice znaků je odstraněna.
Další průchod již způsobí expanzi původně chráněných neterminálů.
Dvojice řídících znaků se nastavují na začátku kořenového souboru.
],
[dnl english: _next_language_
The default character pair CODE([LQ()']) in M4 controls the expansion of nonterminals.
The keyword CODE_M4([changequote()]) can change them to other characters, for example {CODE_M4([[]]), BO([CODE([␂␆])]), CODE([〖〗])}.
Nonterminals that we do not want to (immediately) expand are surrounded by this pair of characters.
When passing through a macro processor, all the symbols between this character pair are BUN([terminal symbols]) and the character pair is removed.
The next pass will cause the expansion of the originally protected nonterminals.
Control character pair is set at the beginning of the root file.
]])


SUB_CHAPTER([automata_descr], [dnl czech
[Automaty],
dnl english: _next_language_
[Automata],
])

PARA([[dnl czech
Automaty používají přepisovací pravidla gramatiky jako uzly a[]NB()mění své stavy podle vstupních symbolů.
Aktuálně používané přepisovací pravidlo produkuje do výstupní fronty (nebo do několika výstupních front)
specifický kód, dokud automat nepřejde do jiného uzlu s[]NB()jiným přepisovacím pravidlem.
Automaty slouží jako QUOTE([přepínače]) pravidel gramatiky.
LINK([Generující automat], [generating_automaton]) je v[]NB()příloze.
],
[dnl english: _next_language_
Automata use grammar rewriting rules as nodes and change their states according to input symbols.
The currently used rewriting rule produces specific code to the output queue (or several output queues) until the automaton transition to another node with a[]NB()different rewriting rule.
Automata serve as QUOTE([switches]) of grammar rules.
Examples of LINK([generating automata], [generating_automaton]) are in annex.
]])


SUB_CHAPTER([output_queues], [dnl czech
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
Output queues are temporary storage for portions of the resulting code.
These parts of the resulting code are created by rewriting rules of grammar that rewrite input symbols.
The CODE_M4([divert(ℤ)]) keyword sets the current output queue.
Finally, all non-empty queues are dumped in ascending order on standard output and compose the final code.
Examples of LINK([output queues], [output_queues_html]) are in annex.
]])

TIP_BOX([[dnl czech
BO([Zásobníky]) si ukážeme později.
],
[dnl english: _next_language_
BO([Stacks]) will be described later.
]])


CHAPTER([main_use_of_m4], [dnl czech
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


SUB_CHAPTER([code_generation], [dnl czech
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

PRE([files_on_command_line], [← ]LANG([nejobecnější.m4 … nejspeciálnější.m4], [the_most_general.m4 … the_most_special.m4])[ →], [
CMD() BO([m4 root.m4 stem.m4 branch.m4 leaf.m4 input1.mc input2.mc > output.file])
])dnl PRE

PARA([[dnl czech
Během načítání souborů jsou prováděny dvě základní operace:
],
[dnl english: _next_language_
Two basic operations are performed during file loading:
]])

ORDERED_LIST_WRAP([

LIST_ITEM([[dnl czech
čtení transformačních pravidel ze souborů s[]NB()příponou CODE([.m4])
],
[dnl english: _next_language_
reading transformation rules from files with the CODE([.m4]) extension
]])

LIST_ITEM([[dnl czech
expanze maker uvnitř souborů s[]NB()příponou CODE([.mc])
],
[dnl english: _next_language_
expansion of macros inside CODE([.mc]) files
]])

])dnl ORDERED_LIST_WRAP

PARA([[dnl czech
Soubory CODE([input1.mc]) a[]NB()CODE([input2.mc]) obsahují BO([vstupní data]) ve specifickém formátu, který umožňuje jejich transformaci na BO([výstupní data]) podle pravidel v[]NB()předchozích CODE([.m4]) souborech.
Datové soubory CODE([.mc]) obvykle neobsahují žádná transformační pravidla.
],
[dnl english: _next_language_
The CODE([input1.mc]) and CODE([input2.mc]) files contain the BO([input data]) in a[]NB()format that allows them to be transformed into BO([output data]) according to the rules in the previous CODE([.m4]) files.
The data CODE([.mc]) files usually do not contain any transformation rules.
]])

PARA([[dnl czech
Vstupní data mohou také přicházet z kolony:
],
[dnl english: _next_language_
Input data may also come from the pipeline:
]])

PRE(, LANG([vstupní kód → generování zdrojového kódu → soubor], [input code → source code generation → file]), [
CMD() BO([cat input.mc | m4 root.m4 stem.m4 branch.m4 leaf.m4 - > output.file])
])dnl PRE

PRE(, LANG([vstupní kód → generování zdrojového kódu → kompilace], [input code → source code generation → compilation]), [
CMD() BO([cat input.mc | m4 root.m4 stem.m4 branch.m4 leaf.m4 - | gcc -x c -o prg -])
])dnl PRE

PARA([[dnl czech
define([try_it_yourself], [Vyzkoušejte:])try_it_yourself() LINK([code_generation_examples], [code_generation_examples])
],
[dnl english: _next_language_
define([try_it_yourself], [Try:])try_it_yourself() LINK([code_generation_examples], [code_generation_examples])
]])


SUB_CHAPTER([m4_as_preproc], [dnl czech
[Preprocesor],
dnl english: _next_language_
[The preprocessor],
])

PARA([[dnl czech
M4 může pracovat v[]NB()režimu preprocesoru.
Vstupní zdrojový kód jím prochází beze změny s[]NB()výjimkou neterminálních symbolů.
Nalezené neterminály jsou expandovány na terminály a[]NB()odchází spolu se zdrojovým kódem na výstup.
M4 může rozšířit jakýkoliv jiný jazyk, kde je preprocesor nedostatečný (bez rekurze) nebo žádný.
Důležité je zvolit vhodný levý znak pro řízení expanze neterminálů, který nesmí kolidovat se znakem vstupního zdrojového kódu.
Kolize znaku je ale snadno řešitelná.
],
[dnl english: _next_language_
M4 can operate in preprocessor mode.
The input source code passes through it unchanged except for nonterminal symbols.
The nonterminals found are expanded to terminals and output along with the source code.
M4 can extend any other language where the preprocessor is insufficient (no recursion) or none.
It is important to select the left character for nonterminal expansion control, which must not collide with the input source code character.
However the character collision is easy to solve.
]])

PRE(, LANG([M4 jako preprocesor – obecně], [M4 as preprocessor – in general]), [
CMD() BO([m4 root.m4 stem.m4 branch.m4 leaf.m4 file.c > preproc.file.c])
])dnl PRE

PRE(, LANG([M4 jako preprocesor – bez dočasného souboru], [M4 as preprocessor – without intermediate file]), [
CMD() BO([m4 root.m4 stem.m4 branch.m4 leaf.m4 file.c | gcc -x c -o prg -])
])dnl PRE

PARA([[dnl czech
M4 v[]NB()režimu preprocesoru může být součástí kolony.
Konfliktní znak CODE([LQ()]) ze vstupního zdrojového kódu je skryt do makra, například CODE_M4([`'LQ()]).
Prázdný pár řídících znaků CODE_M4([`']) před makrem slouží jako LINK([oddělovač symbolů], [symbols_in_brackets]).
],
[dnl english: _next_language_
M4 in preprocessor mode can be part of a[]NB()pipeline.
The conflicting character from the input source code is hidden into a[]NB()macro, for example CODE_M4([`'LQ()]).
An empty pair of control characters CODE_M4([`']) before the macro serves as a[]NB()LINK([symbol separator], [symbols_in_brackets]).
]])

PRE(, LANG([M4 jako preprocesor s řídícími znaky], [M4 as preprocessor with control characters])[: `'], [
CMD() BO([sed 's/LQ()/`'\''CODE_M4([LQ()])/g' any_src.code | m4 rootq.m4 leaf.m4 - | gcc …])
])dnl PRE

PARA([[dnl czech
Při průchodu zdrojového kódu makro procesorem se makro CODE_M4([`'LQ()]) přepíše zpátky na původní znak CODE([LQ()]) a[]NB()prázdný pár CODE_M4([`']) je odstraněn.
Použijeme-li pro řízení expanze neterminálů hranaté závorky, skryjeme stejným způsobem levou CODE([LB()]) hranatou závorku.
],
[dnl english: _next_language_
When the source code is passed through the macro processor, the CODE_M4([LQ()]) macro is rewritten back to the original CODE([LQ()]) character and the empty pair CODE_M4([`']) is removed.
Using square brackets to control the expansion of nonterminals, we hide the left CODE([LB()]) square bracket in the same way.
]])

PRE(, LANG([M4 jako preprocesor s řídícími znaky], [M4 as preprocessor with control characters])[: []], [
CMD() BO([sed 's/\LB()/CODE_M4([[]LB()])/g' any_src.code | m4 rootb.m4 leaf.m4 - | gcc …])
])dnl PRE

PARA([[dnl czech
Pro řízeni expanze neterminálů lze použít netisknutelné znaky BO([CODE([␂])]) (SAMP([0x02])) a BO([CODE([␆])]) (SAMP([0x06])).
Tyto znaky nemohou kolidovat s tisknutelnými znaky zdrojového kódu.
],
[dnl english: _next_language_
Non printable characters BO([CODE([␂])]) (SAMP([0x02])) and BO([CODE([␆])]) (SAMP([0x06])) can be used to control the expansion of nonterminals.
These characters can not interfere with printable source code characters.
]])

PRE(, LANG([M4 jako preprocesor s řídícími znaky], [M4 as preprocessor with control characters])[: ␂␆], [
CMD() BO([m4 rootn.m4 leaf.m4 any_src.code | gcc …])
])dnl PRE

PARA_MONO([[dnl
try_it_yourself() LINK([preproc_examples], [preproc_examples])
]])


HEADING([dnl czech
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
Mixed mode is a[]NB()combination of the previous modes and is mainly used for experiments.
The data is not separated from the rules for its transformation.
The leaf file CODE([leaf.m4]) contains transformation rule definitions along with input data.
]])

PRE(, LANG([jak se naučit M4], [how to learn M4]), [
CMD() BO([m4 root.m4 leaf.m4])
])dnl PRE

PARA_MONO([[dnl
try_it_yourself() LINK([m4_on_examples], [m4_on_examples])
]])


CHAPTER([prerequisites_for_mastering], [dnl czech
[Předpoklady pro zvládnutí M4],
dnl english: _next_language_
[Prerequisites for mastering M4],
])

PARA([[dnl czech
Pro úspěšné zvládnutí tohoto makro-jazyka je důležité splnit několik předpokladů.
M4 není jednoduchý jazyk, protože není možné v[]NB()něm myslet a[]NB()programovat jako v[]NB()běžném programovacím jazyce.
Nejdůležitější je uvědomit si, že se v[]NB()něm programují přepisovací pravidla gramatiky.
Každý řetězec je buď terminální nebo neterminální symbol včetně všech klíčových slov jazyka (CODE_M4([#]) a CODE_M4([,]) jsou speciální případy neterminálů).
],
[dnl english: _next_language_
To successfully master this macro-language it is important to fulfill several prerequisites.
M4 is not a[]NB()simple language because it is not possible to think and program in it like a[]NB()regular programming language.
The most important thing to realize is that it is used to program grammar rewriting rules.
Each string is either a[]NB()terminal or a[]NB()nonterminal symbol, including all language keywords (CODE_M4([#]) and CODE_M4([,]) are special cases of nonterminals).
]])

TIP_BOX_WRAP([

PLAIN_TEXT([[dnl czech
M4 záměrně nemá klíčová slova pro BO([cykly]) (CODE([for])/CODE([while])), protože jeho základ je zcela jiný, než jaký mají procedurální nebo funkcionální jazyky.
],
[dnl english: _next_language_
M4 intentionally does not have keywords for BO([cycles]) (CODE([for])/CODE([while])) because its basis is quite different from procedural or functional languages.
]])

HORIZONTAL_RULE()

UNORDERED_LIST_WRAP([

LIST_ITEM([[dnl czech
BO([cykly]) jsou pouze levo-rekurzivní nebo pravo-rekurzivní
],
[dnl english: _next_language_
BO([loops]) are only left-recursive or right-recursive
]])

LIST_ITEM([[dnl czech
BO([větví]) se LINK([řetězením symbolů], [branching_in_m4]) nebo klíčovými slovy CODE_M4([ifelse()]), CODE_M4([ifdef()])
],
[dnl english: _next_language_
BO([branching]) is made by LINK([symbol concatenation], [branching_in_m4]) or CODE_M4([ifelse()]), CODE_M4([ifdef()]) keywords
]])

])dnl UNORDERED_LIST_WRAP

])dnl TIP_BOX_WRAP


SUB_CHAPTER([dnl czech
[Základy gramatik],
dnl english: _next_language_
[Fundamentals of grammars],
])

PARA([[dnl czech
Základem všech gramatik jsou přepisovací pravidla, jejichž podobu obecně popisuje:
],
[dnl english: _next_language_
All grammars are based on rewriting rules, which form generally describes:
]])


HEADING([formal_grammar_chomsky], [dnl czech
[Formální gramatika (Chomského typu)],
dnl english: _next_language_
[Formal grammar (Chomsky type)],
])

PRE([
G = (N, Σ, P, S)
N: LANG([neprázdná konečná množina neterminálních symbolů], [nonempty finite set of nonterminal symbols])
Σ: LANG([konečná množina terminálních symbolů], [finite set of terminal symbols])
   N ∩ Σ = ø
P: LANG([konečná množina přepisovacích pravidel], [finite set of production (rewrite) rules])
   (N ∪ Σ)* N (N ∪ Σ)* → (N ∪ Σ)*
S: LANG([je počáteční (startovací) symbol], [is the start symbol])
   S ∈ N
])dnl PRE

PARA([[dnl czech
AD([Formální gramatika], [Wikipedie], [https://cs.wikipedia.org/wiki/Formální_gramatika]) popisuje AD([podmnožiny], [Chomského hierarchie], [https://cs.wikipedia.org/wiki/Chomsk%C3%A9ho_hierarchie]) přepisovacích pravidel AD([formálního jazyka], [Wikipedie], [https://cs.wikipedia.org/wiki/Form%C3%A1ln%C3%AD_jazyk]).
Jedna z[]NB()podmnožin se jmenuje AD([bezkontextová gramatika], [Wikipedie], [https://cs.wikipedia.org/wiki/Bezkontextov%C3%A1_gramatika]), krátce ABBR([CFG], [Context-Free Grammar – bezkontextová gramatika]).
Přepisovací pravidla CFG pracují stejně jako přepisovací pravidla jazyka M4.
Některý z[]NB()následujících dílů seriálu se podrobněji zaměří na formální gramatiky.
],
[dnl english: _next_language_
AD([Formal grammar], [Wikipedia], [https://en.wikipedia.org/wiki/Formal_grammar]) describes AD([subsets], [Chomsky hierarchy], [https://en.wikipedia.org/wiki/Chomsky_hierarchy]) of AD([formal language], [Wikipedia], [https://en.wikipedia.org/wiki/Formal_language]) rewriting rules.
One of the subsets is called AD([context-free grammar], [Wikipedia], [https://en.wikipedia.org/wiki/Context-free_grammar]), shortly ABBR([CFG], [Context-Free Grammar]).
The CFG rewriting rules work the same as M4 rewriting rules.
Some of the following episodes of this series will focuses in more detail on formal grammars.
]])


SUB_CHAPTER([dnl czech
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


HEADING([testing_automaton], [dnl czech
[Testovací automat],
dnl english: _next_language_
[Testing automaton],
])

PARA([[dnl czech
Pořadí vstupních symbolů nebo jejich kontext lze otestovat automatem.
Splňují-li vstupní symboly požadované vlastnosti, automat skončí v[]NB()uzlu s[]NB()dvojitým kroužkem (označuje akceptující stav nebo stavy).
],
[dnl english: _next_language_
Order of input symbols or their context can be tested by the automaton.
If the input symbols meet the required properties, the automaton ends up in[]NB()the[]NB()double-ring node (indicates the accepting state or states).
]])

IMG([dfa_img],dnl id
LANG([deterministický konečný automat], [deterministic finite automaton]),dnl title
[],dnl class
[],dnl style
[],dnl anything
[img/dfa.png, https://i.iinfo.cz/images/149/dfa-1.png],dnl src
[[dnl czech
Příklad automatu[]REF([Teorie automatů], [From Wikipedia, the free encyclopedia], [https://cs.wikipedia.org/wiki/Teorie_automat%C5%AF], [Wikipedie]) akceptující sudý počet (žádný je také sudý) symbolů CODE([0]), ignorující symboly CODE([1]).
Automat je shodný s[]NB()regulárním výrazem CODE([(1*01*01*)*]).
],
[dnl english: _next_language_
Example of an automaton[]REF([Automata theory], [From Wikipedia, the free encyclopedia], [https://en.wikipedia.org/wiki/Automata_theory], [Wikipedia]) accepting an even number (none is even) of symbols CODE([0]), ignoring symbols CODE([1]).
The automaton is the same as the regular expression CODE([(1*01*01*)*]).
]])

PARA([[dnl czech
Předchozí automat lze zapsat jako ASCII art doprovázející M4 skript:
],
[dnl english: _next_language_
Previous automaton can be written as an ASCII art accompanying the M4 script:
]])

PRE(, LANG([jak dokumentovat M4 kód], [how to document M4 code]), [
#          ____1
#         |   /
#      ___V__/   0    ____
# --->// S1 \\------>/ S2 \---.1
#     \\____//<------\____/<--'
#                0
])dnl PRE


HEADING([generating_automaton], [dnl czech
[Generující automat],
dnl english: _next_language_
[Generating automaton],
])

PARA([[dnl czech
Vstupní symboly mění uzly automatu, čímž zároveň mění přepisovací pravidla pro generování kódu.
LINK([Tento příklad], [json_generating_automaton]) naleznete v[]NB()příloze:
],
[dnl english: _next_language_
Input symbols change the nodes of the automaton, thereby changing the rewriting rules for code generation.
See the annex for LINK([this example], [json_generating_automaton]):
]])

PRE(, [ASCII-art ]LANG([generujícího automatu], [of generating automaton]), [
#      _______      ___________
# --->/ ERROR \--->/ NEXT_ITEM \---.
#     \_______/    \___________/<--'
])dnl PRE

PARA([[dnl czech
První symbol ve stavu CODE_M4([ERROR]) vygeneruje záhlaví a[]NB()první položku.
Poté automat přejde do stavu CODE_M4([NEXT_ITEM]), ve kterém se přidávají další položky.
Automat zůstává v tomto stavu, dokud nejsou zpracována všechna data.
],
[dnl english: _next_language_
The first error message generates a header and inserts the first item.
Then automaton make transition to CODE_M4([NEXT_ITEM]) state in which only next items are added.
The automaton remains in this state until all data has been processed.
]])


SUB_CHAPTER([dnl czech
[(GNU) make],
dnl english: _next_language_
[(GNU) make],
])

Není vhodné do sebe vzájemně vkládat zdrojové soubory.

PARA([[dnl czech
Dobře navržený generátor kódu se obvykle skládá z[]NB()několika menších souborů, jejichž pořadí, závislosti a[]NB()parametry se zapisují do souboru CODE([Makefile]).
Dobrá znalost tvorby CODE([Makefile]) je proto základním předpokladem pro zvládnutí M4.
Čtení a údržba zdrojového kódu celkově zabere vždy více času než jeho tvorba.
Dobře strukturovaný CODE([Makefile]) proto zásadním způsobem přispívá k[]NB()celkové přehlednosti výsledného generátoru kódu.
],
[dnl english: _next_language_
A well-designed code generator usually consists of several smaller files whose order, dependencies and parameters are written to the CODE([Makefile]) file.
Good knowledge of CODE([Makefile]) writing is therefore a[]NB()prerequisite for mastering M4.
Reading and maintaining source code generally takes more time than creating it.
A well-structured CODE([Makefile]) therefore significantly contributes to the overall clarity of the resulting code generator.
]])

TIP_BOX(, LANG([více v kapitole: „Pracovní postup“], [more in the chapter: „Workflow“]), [[dnl czech
Spouštění CODE([make])[]REF([GNU Make Manual], [Free Software Foundation], [https://www.gnu.org/software/make/manual/make.html]) z[]NB()editoru kódu pomocí vhodné klávesové zkratky zásadně urychluje vývoj M4 kódu.
Soubor CODE([~/.vimrc]) obsahuje CODE_M4([nnoremap &lt;c-j&gt; :make&lt;cr&gt;]).
],
[dnl english: _next_language_
Executing CODE([make])[]REF([GNU Make Manual], [Free Software Foundation], [https://www.gnu.org/software/make/manual/make.html]) from the code editor with a[]NB()shortcut key will significantly speed up M4 code development.
The file CODE([~/.vimrc]) contains CODE_M4([nnoremap &lt;c-j&gt; :make&lt;cr&gt;]).
]])


SUB_CHAPTER([dnl czech
[Vim],
dnl english: _next_language_
[Vim],
])

PARA([[dnl czech
Zvládnutí editoru Vim[]REF([Vim – všudypřítomný textový editor], [editující text rychlostí myšlenky], [https://www.vim.org/]) je důležitým předpokladem pro pohodlí a[]NB()rychlost psaní kódu M4.
Vim zkratky, definované klíčovým slovem CODE([iabbrev]), ušetří velké množství zbytečně napsaného textu.
Tyto zkratky také významně snižují výskyt téměř neviditelných chyb způsobených nepárovou závorkou, čímž šetří ztracený čas vynaložený na ladění kódu.
],
[dnl english: _next_language_
Mastering the Vim[]REF([Vim – the ubiquitous text editor], [editing text at the speed of thought], [https://www.vim.org/]) editor is an important prerequisite for the convenience and speed of writing M4 code.
Vim shortcuts, defined by the CODE([iabbrev]) keyword, will save large amounts of unnecessary typing.
These shortcuts also significantly reduce the occurrence of almost invisible errors caused by an unpaired bracket, thus saving the lost time spent on debugging.
]])


_TIP_BOX([[dnl czech
produktivitu skriptování zvyšuje kapitola – LINK([vim_scripting], [vim_scripting]).
],
[dnl english: _next_language_
productivity of scripting increases chapter – LINK([vim_scripting], [vim_scripting])
]])


SUB_CHAPTER([dnl czech
[Talent a čas],
dnl english: _next_language_
[Talent and time],
])

PARA([[dnl czech
M4 nejde zvládnout přes víkend, zvláště chybí-li základy[]REF([Automaty a[]NB()formální jazyky I], [Učební text FI MU], [https://is.muni.cz/elportal/estud/fi/js06/ib005/Formalni_jazyky_a_automaty_I.pdf])
AD([teorie[]NB()automatů], [Wikipedie], [https://cs.wikipedia.org/wiki/Teorie_automat%C5%AF]) a[]NB()AD([formálních[]NB()gramatik], [Wikipedie], [https://cs.wikipedia.org/wiki/Form%C3%A1ln%C3%AD_gramatika]).
Pro zvládnutí M4 je nutné QUOTE([odpřemýšlet si]) delší období a[]NB()napsat velké množství špatného (složitého) M4 kódu, který z[]NB()vlastní vůle přepíšete kvůli lepšímu nápadu.
Tímto způsobem je možné postupně získat určitou praxi.
],
[dnl english: _next_language_
M4 cannot be mastered over the weekend, especially when the fundamentals[]REF([Automaty a[]NB()formální jazyky I], [Učební text FI MU], [https://is.muni.cz/elportal/estud/fi/js06/ib005/Formalni_jazyky_a_automaty_I.pdf]) of
AD([automata theory], [Wikipedia], [https://en.wikipedia.org/wiki/Automata_theory]) and AD([formal[]NB()grammars], [Wikipedia], [https://en.wikipedia.org/wiki/Formal_grammar]) are lacking.
To master the M4, you need to spend a[]NB()longer period of time and write a lot of bad (complex) M4 code that you rewrite for a[]NB()better idea.
In this way it is possible to gradually gain some practice.
]])

# a reference to a book that inspired me 😍
[]REF([Automaty a[]NB()gramatiky], [Michal Chytil, 1. vydání, Praha, 331 s. 1984.], [https://is.muni.cz/publication/173173])

[]REF([Chomsky hierarchy], [cover image], [https://www.researchgate.net/figure/The-four-classes-of-grammars-in-the-Chomsky-hierarchy-of-transformational-grammars_fig1_244429893])

BLOCKQUOTE(, LANG([M4 je těžký ⚠ jazyk!], [M4 is a hard ⚠ language!]), [[dnl czech
Disclaimer 🕱: BO([Větší M4 projekty vyžadují praxi!])
],
[dnl english: _next_language_
Disclaimer 🕱: BO([Larger M4 projects require practice!])
]])


ANNEX([code_generation_examples], [dnl czech
[Příklady generování kódu],
dnl english: _next_language_
[Code generation examples],
])

# , LANG([skrývání problematických znaků se neprovádí], [hiding problematic characters is not performed]), 

TIP_BOX([[dnl czech
Příklady v[]NB()této příloze jsou složitější a[]NB()jejich cílem je ukázat praktické použití jazyka M4.
Podrobněji budou vysvětleny později.
],
[dnl english: _next_language_
The examples in this annex are more complex and are intended to demonstrate the practical use of M4.
They will be explained in more detail later.
]])


HEADING([input_source_code], [dnl czech
[Vstupní zdrojový kód],
dnl english: _next_language_
[Input source code],
])

PARA([[dnl czech
Vstupní zdrojový kód je podobný ABBR([CSV], [Comma Separated Values]), který se převede na libovolně složitý cílový kód jiného jazyka pomocí ABBR([CFG], [Context-Free Grammar – bezkontextová gramatika]), automatů a[]NB()výstupních front.
Zásobníky v[]NB()příkladech nejsou použity.
],
[dnl english: _next_language_
The input source code is similar to ABBR([CSV], [Comma Separated Values]), which is converted to arbitrarily complex target code of another language using ABBR([CFG], [Context-Free Grammar]), automata and output queues.
Stacks in the examples are not used.
]])

INSERT_FILE([messages/messages_raw.mc], [  ⚠ ]LANG([obsahuje speciální znaky], [contains special characters])[ ⚠], [])

TIP_BOX([[dnl czech
Vstupní soubor může obsahovat poznámky, které nemusí být skryté v[]NB()komentářích CODE_M4([#]), CODE_M4([dnl]), CODE_M4([ifelse([…])]) nebo CODE_M4([[… někde uvnitř závorek …]]).
],
[dnl english: _next_language_
The input file may contain notes that may not be hidden in the comments CODE_M4([#]), CODE_M4([dnl]), CODE_M4([ifelse([…])]) or CODE_M4([[… somewhere inside brackets …]]).
]])


SUB_ANNEX([dnl czech
[CODE_M4([[]]) CSV – nejjednodušší příklad],
dnl english: _next_language_
[CODE_M4([[]]) CSV – simplest example],
])

PARA([[dnl czech
Tento příklad nepoužívá výstupní fronty, pouze generuje ABBR([CSV], [Comma Separated Values]) oddělené znakem CODE([TAB]).
],
[dnl english: _next_language_
This example does not use output queues, it only generates ABBR([CSV], [Comma Separated Values]) separated by CODE([TAB]).
]])

INSERT_FILES_RAW_MESSAGES([hello.csv.m4], [hello.csv])


SUB_ANNEX([dnl czech
[CODE_M4([[]]) CSV – počítadlo],
dnl english: _next_language_
[CODE_M4([[]]) CSV – counter],
])

PARA([[dnl czech
Příklad používá makro CODE_M4([COUNT_UP]) z[]NB()kořenového souboru, jehož ABBR([CODE([β])], [pravá strana přepisovacího pravidla]) se zkopíruje do pravé strany makra CODE_M4([COUNTER]).
Během první expanze CODE_M4([COUNTER]) proběhne inicializace jeho startovací hodnoty.
Další expanze vrátí číselný terminální symbol a[]NB()proběhne zvýšení pomocného (globálního) symbolu o[]NB()jedničku.
CODE_M4([COUNTER]) je malý automat.
],
[dnl english: _next_language_
The example uses the CODE_M4([COUNT_UP]) macro from the root file whose ABBR([CODE([β])], [the right side of the rewriting rule]) is copied to the right side of the CODE_M4([COUNTER]) macro.
During the first expansion of CODE_M4([COUNTER]) its initial value is initialized.
Further expansion returns the numeric terminal symbol and increases the auxiliary (global) symbol by one.
CODE_M4([COUNTER]) is a[]NB()small automaton.
]])

INSERT_FILES_RAW_MESSAGES([counter.csv.m4], [counter.csv])


SUB_ANNEX([dnl czech
[CODE([💡], [jak to udělat]) Úprava speciálních znaků],
dnl english: _next_language_
[CODE([💡], [how to do it]) Modification of special characters],
])

PARA([[dnl czech
Každý typ výstupního kódu vyžaduje úpravu speciálních znaků.
Použití klíčového slova CODE_M4([patsubst()]) je nevhodné pro tento úkol.
Vstupní zdrojový kód proto napřed upravíme regulárním výrazem a[]NB()všechny speciální znaky schováme do maker.
Soubor pro převod speciálních znaků do cílového kódu přidáme na příkazovou řádku.
],
[dnl english: _next_language_
Each type of output code requires modification of special characters.
Using the keyword CODE_M4([patsubst()]) is inappropriate for this type of task.
Therefore, the input source code should be modified by regular expression and all special characters will be hidden in macros.
The file for conversion of special characters to the target code is added at the command line.
]])

ifelse([
PARA([[dnl czech
Generování různých typů souborů obvykle vyžaduje méně úsilí, protože je možné použít předchozí hotové soubory.
],
[dnl english: _next_language_
Generating different file types usually requires less effort because the previous finished files can be used.
]])
])dnl comment


HEADING([modified_input_source_code], [dnl czech
[Upravený vstupní zdrojový kód],
dnl english: _next_language_
[Modified input source code],
])

INSERT_FILE([messages/messages.mc], [ (]LANG([speciální znaky jsou skryty do maker], [special characters are hidden to macros])[)], [])

HEADING([dnl czech
[CODE_M4([[]]) XML[,] HTML – soubor pro značkovací jazyky],
dnl english: _next_language_
[CODE_M4([[]]) XML[,] HTML – the file for markup languages],
])

INSERT_FILE([messages/markup.m4])

# hide ‘"’ → DQ(), because of title="… &quot; … &quot; …"
HEADING([dnl czech
[CODE_M4([[]]) C[,] JSON[,] INI – soubor pro DQ()řetězce v uvozovkách[]DQ()],
dnl english: _next_language_
[CODE_M4([[]]) C[,] JSON[,] INI – the file for DQ()strings in double quotes[]DQ()],
])

INSERT_FILE([messages/code.m4])

# hide  ‘"’ → DQ(), because of title="… &quot; … &quot; …"
HEADING([dnl czech
[CODE_M4([[]]) Bash – soubor pro DQ()řetězce v uvozovkách[]DQ()],
dnl english: _next_language_
[CODE_M4([[]]) Bash – the file for DQ()strings in double quotes[]DQ()],
])

INSERT_FILE([messages/doubleq.m4])

HEADING([dnl czech
[CODE_M4([[]]) Bash – soubor pro 'řetězce v apostrofech'],
dnl english: _next_language_
[CODE_M4([[]]) Bash – the file for 'strings in apostrophes'],
])

INSERT_FILE([messages/apost.m4])


SUB_ANNEX([dnl czech
[CODE_M4([[]]) C – výstupní fronta],
dnl english: _next_language_
[CODE_M4([[]]) C – output queue],
])

PARA([[dnl czech
Příklad používá jednu výstupní frontu na znaky CODE([};]) pro uzavření pole na konci skriptu.
],
[dnl english: _next_language_
The example uses one output queue for characters CODE([};]) to close the array at the end.
]])

INSERT_FILES_MESSAGES_CODE([array.c.m4], [array.c])


SUB_ANNEX([dnl czech
[CODE_M4([[]]) INI – externí příkaz],
dnl english: _next_language_
[CODE_M4([[]]) INI – an external command],
])

PARA([[dnl czech
Příklad spustí externí příkaz CODE([date]) a jeho výstup umístí do hranatých závorek.
Výstupem externího příkazu jsou dvě položky oddělené čárkou.
Makro CODE_M4([FST()]) vybere první položku, protože druhá položka obsahuje nežádoucí znak nového řádku CODE([LF]) (SAMP([0x0a])).
],
[dnl english: _next_language_
The example runs an external CODE([date]) command and places its output in square brackets.
The output of an external command are two comma-separated items.
The CODE_M4([FST()]) macro selects the first item because the second item contains an unwanted CODE([LF]) (SAMP([0x0a])) new line character.
]])

INSERT_FILES_MESSAGES_CODE([hello.ini.m4], [hello.ini])


SUB_ANNEX([dnl czech
[CODE_M4([[]]) .h – hex počítadlo],
dnl english: _next_language_
[CODE_M4([[]]) .h – hex counter],
])

PARA([[dnl czech
Příklad používá makro CODE_M4([COUNTER]) pro číslování výsledných ABBR([CPP], [Preprocesor jazyka C]) maker a[]NB()jednu výstupní frontu.
Fronta číslo CODE([1]) obsahuje direktivu preprocesoru CODE_M4([#endif]) pro zakončení hlavičkového souboru.
Převod dekadické hodnoty počítadla na dvoumístné hex-a číslo provádí klíčové slovo CODE_M4([eval()]).
],
[dnl english: _next_language_
The example uses the CODE_M4([COUNTER]) macro to number the resulting ABBR([CPP], [C preprocessor]) macros and one output queue.
The queue number CODE([1]) contains the preprocessor directive CODE_M4([#endif]) to terminate the header file.
The decimal value of the counter is converted to the two-digit hex digit by keyword CODE_M4([eval()]).
]])

INSERT_FILES_MESSAGES([messages.h.m4], [messages.h])



SUB_ANNEX([small_automaton], [dnl czech
[CODE_M4([[]]) C – malý automat],
dnl english: _next_language_
[CODE_M4([[]]) C – small automaton],
])

PARA([[dnl czech
Příklad používá malý automat CODE([NEW_LINE]) pro generování znaku nového řádku CODE([\n]) a[]NB()jednu výstupní frontu číslo CODE([1]) do které se vloží znaky CODE([";]) pro uzavření výsledného řetězce.
Poprvé se CODE([NEW_LINE]) přepíše na ABBR([CODE([ε])], [epsilon – prázdný symbol]), podruhé se přepíše na CODE([\n]).
],
[dnl english: _next_language_
The example uses a[]NB()small automaton CODE([NEW_LINE]) to generate a[]NB()newline CODE([\n]) character and one output queue number CODE([1]) containing CODE([";]) characters to terminate resulting string.
For the first time the CODE([NEW_LINE]) is rewritten to ABBR([CODE([ε])], [epsilon – empty symbol]), for the second time is rewritten to CODE([\n]).
]])

INSERT_FILES_MESSAGES_CODE([stringl.c.m4], [stringl.c])


SUB_ANNEX([dnl czech
[CODE_M4([[]]) C – malý automat 2],
dnl english: _next_language_
[CODE_M4([[]]) C – small automaton 2],
])

PARA([[dnl czech
Tento příklad je podobný předchozímu, avšak každý řetězec je na novém řádku.
],
[dnl english: _next_language_
This example is similar to the previous one, but each string is on a[]NB()new line.
]])

INSERT_FILES_MESSAGES_CODE([string.c.m4], [string.c])


SUB_ANNEX([output_queues_html], [dnl czech
[CODE_M4([[]]) HTML – výstupní fronty],
dnl english: _next_language_
[CODE_M4([[]]) HTML – output queues],
])

PARA([[dnl czech
Příklad používá dvě výstupní fronty.
Fronta číslo CODE([1]) obsahuje odstavce, fronta číslo CODE([2]) uzavírací značky HTML stránky.
Navigační odkazy nemusí být nikde uloženy, jdou přímo na výstup.
Zprávy typu CODE([QUERY]) a[]NB()CODE([WARNING]) jsou zpracovány stejně jako zprávy typu CODE([ERROR]).
],
[dnl english: _next_language_
The example uses two output queues.
The queue number CODE([1]) contains paragraphs.
The queue number CODE([2]) contains closing HTML tags.
Navigation links do not have to be stored anywhere, they go straight to the output.
The CODE([QUERY]) and CODE([WARNING]) messages are treated in the same way as CODE([ERROR]) messages.
]])

INSERT_FILES_MESSAGES_MARKUP([messages.html.m4], [messages.html])


SUB_ANNEX([branching_in_m4], [dnl czech
[CODE_M4([[]]) Větvení gramatikou],
dnl english: _next_language_
[CODE_M4([[]]) Branching by grammar],
])

PARA([[dnl czech
Příklad ukazuje LINK([větvení gramatikou], [nonterminals_for_branches]), argumenty maker se ignorují.
Vstupní neterminály se přepisují na terminály CODE_M4([ERROR → 🐛], [🐛]), CODE_M4([QUERY → 🐜], [🐜]), CODE_M4([WARNING → 🐝], [🐝]).
],
[dnl english: _next_language_
The example shows LINK([branching by grammar], [nonterminals_for_branches]), macro arguments are ignored.
Input nonterminals are rewritten to terminals CODE_M4([ERROR → 🐛], [🐛]), CODE_M4([QUERY → 🐜], [🐜]), CODE_M4([WARNING → 🐝], [🐝]).
]])

INSERT_FILES_MESSAGES([insect.txt.m4], [insect.txt])


SUB_ANNEX([json_generating_automaton], [dnl czech
[CODE_M4([[]]) JSON – generující automat],
dnl english: _next_language_
[CODE_M4([[]]) JSON – generating automaton],
])

PARA([[dnl czech
Příklad používá dvě výstupní fronty a[]NB()jeden generující automat.
První chybová zpráva CODE_M4([ERROR([…])]) ve stavu CODE([ERROR]) vygeneruje záhlaví se závorkami a[]NB()vypíše na výstup první záznam.
Automat přejde do stavu CODE([NEXT_ITEM]) což je ABBR([CODE([β]) pravidlo], [takové pravidlo se používá jako pravá strana jiného přepisovacího pravidla]).
Následující chybové zprávy ve stavu CODE([NEXT_ITEM]) pouze vypisují na výstup jednotlivé záznamy.
Na závěr výstupní fronty číslo CODE([1]) a[]NB()CODE([2]) vypíšou znaky CODE([RB()]) a[]NB()CODE([}}]) čímž zakončí výsledný JSON.
],
[dnl english: _next_language_
The example uses two output queues and one generating automaton.
The first CODE_M4([ERROR([…])]) error message in the CODE([ERROR]) state generates a[]NB()header with brackets and outputs the first record.
The automaton goes to the state CODE([NEXT_ITEM]) which is a[]NB()ABBR([CODE([β]) rule], [rule is used as the right side of another rewriting rule]).
The following error messages in the CODE([NEXT_ITEM]) state only output individual records.
At the end the output queue number CODE([1]) and number CODE([2]) print the characters CODE([RB()]) and CODE([}}]) to end the resulting JSON.
]])

INSERT_FILES_MESSAGES_CODE([atm.json.m4], [atm.json])


SUB_SUB_ANNEX([json_branch], [dnl czech
[CODE_M4([[]]) JSON – pojmenované fronty],
dnl english: _next_language_
[CODE_M4([[]]) JSON – named queues],
])

PARA([[dnl czech
Příklad zpracovává další zprávy typu CODE_M4([QUERY]) a[]NB()CODE_M4([WARNING]).
Používá tři automaty a[]NB()šest výstupních front.
Generujeme-li složitější zdrojový kód, brzy narazíme na problém udržení konzistence indexů pro výstupní fronty.
Abychom se vyhnuli zmatku, fronty si pojmenujeme a[]NB()místo čísel používáme jména.
],
[dnl english: _next_language_
The example processes other types of messages CODE_M4([QUERY]) and CODE_M4([WARNING]).
It uses three automata and six output queues.
If we generate more complex source code, we will soon encounter the problem of maintaining index consistency for output queues.
To avoid confusion, we use queue names instead of numbers.
]])

ifelse([
PARA([[dnl czech
Příklad zpracovává další zprávy typu CODE([QUERY]) a[]NB()CODE([WARNING]) celkem třemi automaty a[]NB()šesti výstupními frontami.
],
[dnl english: _next_language_
The example processes other CODE([QUERY]) and CODE([WARNING]) messages with a total of three automata and six output queues.
]])
])dnl

PARA([[dnl czech
Abychom nemuseli definovat podobná pravidla, zkopírujeme si pravou stranu CODE([ERROR])[]BR()(je to také ABBR([CODE([β]) pravidlo], [takové pravidlo se používá jako pravá strana jiného přepisovacího pravidla])) do pravé strany pravidel CODE([QUERY]) a[]NB()CODE([WARNING]).
Proměnná CODE([$[0]]) se přepíše na jméno makra a[]NB()zřetězí se s[]NB()dalším symbolem.
Nově vzniklý neterminál se přepíše na odpovídající terminální symbol.
Tímto způsobem se provádí větvení.
],
[dnl english: _next_language_
To avoid having to define similar rules, we copy the right side of CODE([ERROR]) (it is also a ABBR([CODE([β]) rule], [rule is used as the right side of another rewriting rule])) to the right side of the CODE([QUERY]) and CODE([WARNING]) rules.
The CODE([$[0]]) variable is rewritten to the name of the macro and concatenated with another symbol.
The newly formed nonterminal is rewritten to the corresponding terminal symbol.
In this way branching is carried out.
]])

PRE([nonterminals_for_branches], LANG([větvení gramatikou v M4], [grammar branching in M4]), [
$[0]_QU → ERROR_QU → 2
$[0]_END → ERROR_END → 3
$[0]_NAME → ERROR_NAME → error
$[0]_QU → QUERY_QU → 0
$[0]_END → QUERY_END → 1
$[0]_NAME → QUERY_NAME → query
…
])dnl PRE

INSERT_FILES_MESSAGES_CODE([qnames.json.m4], [qnames.json])


SUB_SUB_ANNEX([json_symbolic_queue_names], [dnl czech
[CODE_M4([[]]) JSON – generované indexy front],
dnl english: _next_language_
[CODE_M4([[]]) JSON – generated queue indexes],
])

PARA([[dnl czech
Během vývoje se často mění pořadí a[]NB()počet výstupních front, což také vyžaduje častou změnu jejich indexů.
Indexy je proto vhodné generovat.
Můžeme pak používat prakticky neomezený počet front.
Následující příklad ukazuje, jak se tyto indexy generují.
],
[dnl english: _next_language_
During development, the order and number of output queues often change, which also requires frequent changes of their indexes.
It is therefore appropriate to generate indexes.
We can then use a[]NB()virtually unlimited number of queues.
The following example shows how these indexes are generated.
]])

INSERT_FILES_MESSAGES_CODE([queues.m4], [messages.json.m4], [messages.json])


SUB_ANNEX([dnl czech
[CODE_M4([[]]) INI – nespojitý index front],
dnl english: _next_language_
[CODE_M4([[]]) INI – discontinuous queue index],
])

PARA([[dnl czech
Příklad používá tři automaty a[]NB()dvě výstupní fronty číslo CODE([2]) a CODE([4]) definované v odděleném souboru.
Názvy INI sekcí jsou generovány řetězením symbolů.
Příklad používá stejný soubor pro výstupní fronty jako LINK([příklad], [json_symbolic_queue_names]) pro generování JSON.
],
[dnl english: _next_language_
The example uses three automata and two output queues number CODE([2]) and CODE([4]) defined in a separate file.
INI section names are generated by symbol chaining.
The example uses the same file for output queues as the LINK([example], [json_symbolic_queue_names]) to generate JSON.
]])

INSERT_FILES_MESSAGES_QUEUES_CODE([messages.ini.m4], [messages.ini])


SUB_ANNEX([dnl czech
[CODE_M4([[]]) XML – smíšené zprávy],
dnl english: _next_language_
[CODE_M4([[]]) XML – mixed messages],
])

PARA([[dnl czech
Příklad používá jednu výstupní frontu číslo CODE([1]) pro uzavírací značku CODE([&lt;/messages&gt;]).
],
[dnl english: _next_language_
The example uses one output queue number CODE([1]) for the CODE([&lt;/messages&gt;]) closing tag.
]])

INSERT_FILES_MESSAGES_QUEUES_MARKUP([mixed.xml.m4], [mixed.xml])


SUB_ANNEX([dnl czech
[CODE_M4([[]]) XML – oddělené zprávy],
dnl english: _next_language_
[CODE_M4([[]]) XML – separated messages],
])

PARA([[dnl czech
Příklad seskupuje zprávy podle jejich typu pomocí výstupních front.
],
[dnl english: _next_language_
The example groups messages by their type using output queues.
]])

INSERT_FILES_MESSAGES_QUEUES_MARKUP([messages.xml.m4], [messages.xml])


SUB_ANNEX([dnl czech
[CODE_M4([[]]) Bash – CODE([echo "řetězec"])],
dnl english: _next_language_
[CODE_M4([[]]) Bash – CODE([echo "string"])],
])

INSERT_FILES_MESSAGES_DOUBLEQ([doubleq.sh.m4], [doubleq.sh])


SUB_ANNEX([dnl czech
[CODE_M4([[]]) Bash – CODE([echo 'řetězec'])],
dnl english: _next_language_
[CODE_M4([[]]) Bash – CODE([echo 'string'])],
])

INSERT_FILES_MESSAGES_APOSTROPHE([apost.sh.m4], [apost.sh])


ANNEX([preproc_examples], [dnl czech
[Příklady preprocesoru],
dnl english: _next_language_
[Preprocessor examples],
])

SUB_ANNEX([cpp_and_m4], [dnl czech
[CODE_M4([`']) Preprocesor jazyka C[]NB()a[]NB()M4],
dnl english: _next_language_
[CODE_M4([`']) C[]NB()preprocessor and M4],
])

PARA([[dnl czech
Direktivy AD([CPP], [Preprocesor jazyka C], [https://cs.wikipedia.org/wiki/Preprocesor_jazyka_C]) jsou pro M4 jednořádkový komentář, což brání nežádoucí expanzi stejně pojmenovaných maker.
Definujeme-li bezpečnější makro CODE([SAF()]), stejně pojmenované makro CODE([SAF ()]) nebude přepsáno.
Jmenný prostor ABBR([CPP], [Preprocesor jazyka C]) tak BO([může]) být zcela oddělen od jmenného prostoru M4.
Problematický znak CODE([LQ()]) je skryt do makra CODE_M4([LQ()]).
Apostrof CODE([RQ()]) ve zdrojovém kódu ničemu nevadí.
Apostrof uvnitř makra CODE([ORD]) je skryt do makra CODE_M4([RQ()]).
Všimněte si jmen funkcí CODE_M4([define ()]) nebo CODE_M4([ifelse ()]) a[]NB()kde je expandován CODE([SYMBOL]).
],
[dnl english: _next_language_
The AD([CPP], [C preprocessor], [https://en.wikipedia.org/wiki/C_preprocessor]) directives are a[]NB()one-line comment for M4, preventing unwanted expansion of the same named macros.
If we define a[]NB()safer CODE([SAF()]) macro, the same named CODE([SAF ()]) macro will not be overwritten.
Thus, the ABBR([CPP], [C preprocessor]) namespace BO([can be]) completely separated from the M4 namespace.
The problematic character CODE([LQ()]) is hidden in the CODE_M4([LQ()]) macro.
Apostrophe CODE([']) does not matter in the source code.
Apostrophe inside CODE([ORD]) macro is hidden in CODE_M4([RQ()]) macro.
Note the CODE_M4([define ()]) or CODE_M4([ifelse ()]) function names and where the CODE_M4([SYMBOL]) is expanded.
]])

INSERT_FILES_PREPROC([q], [file.c])


SUB_ANNEX([dnl czech
[CODE_M4([`']) CSS – komentáře],
dnl english: _next_language_
[CODE_M4([`']) CSS – comments],
])

PARA([[dnl czech
CSS používá znak CODE_M4([#]) pro kódy barev, což je také začátek jednořádkového M4 komentáře.
Klíčové slovo CODE_M4([changecom(/*,*/)]) nastaví víceřádkový komentář CODE([/* … */]) a[]NB()přepíše se na ABBR([CODE([ε])], [epsilon – prázdný symbol]).
Komentáře se vypínají stejným klíčovým slovem CODE_M4([changecom]) bez parametrů.
],
[dnl english: _next_language_
CSS uses the CODE_M4([#]) character for color codes, which is also the beginning of a[]NB()one-line M4 comment.
The CODE_M4([changecom(/*,*/)]) keyword sets a[]NB()multiline CODE([/* … */]) comment and rewrites into ABBR([CODE([ε])], [epsilon – empty symbol]).
The comment can be turned off with the same CODE_M4([changecom]) keyword without parameters.
]])

INSERT_FILES_PREPROC([q], [file.css])


SUB_ANNEX([nprint_bash], [dnl czech
[BO([CODE([␂␆])]) Bash – netisknutelné znaky],
dnl english: _next_language_
[BO([CODE([␂␆])]) Bash – nonprintable characters],
])

PARA([[dnl czech
Bash používá oba znaky CODE([LQ()]) CODE([LB()]).
Nechceme-li je skrývat do makra CODE_M4([LQ()]) nebo CODE_M4([LB()]), můžeme použít pro LINK([řízení expanze neterminálů], [expansion_control]) netisknutelné znaky, viz. příklad:
],
[dnl english: _next_language_
Bash uses both characters CODE([LQ()]) CODE([LB()]).
If we do not want to hide them in an CODE_M4([LQ()]) or CODE_M4([LB()]) macro, we can use nonprintable characters as in the following example:
]])

INSERT_FILES_PREPROC([n], [file.sh])


ANNEX([m4_on_examples], [dnl czech
[Jazyk M4 na příkladech],
dnl english: _next_language_
[M4: examples],
])


SUB_ANNEX([dnl czech
[CODE_M4([[]]) JSON – levá závorka CODE([LB()])],
dnl english: _next_language_
[CODE_M4([[]]) JSON – left bracket CODE([LB()])],
])

PARA([[dnl czech
Uvnitř hranatých závorek CODE_M4([[… se neterminály neexpandují …]]).
Proto je levá hranatá závorka CODE([LB()]) nahrazena makrem CODE_M4([LB()]) z[]NB()kořenového souboru.
],
[dnl english: _next_language_
The CODE_M4([[… nonterminals are not expanded …]]) inside square brackets.
Therefore, the left square bracket CODE([LB()]) is replaced by the CODE_M4([LB()]) macro defined in the root file.
]])

INSERT_FILES_HELLO_WORLD([b], [json])


SUB_ANNEX([dnl czech
[CODE_M4([[]]) Bash – počítadla],
dnl english: _next_language_
[CODE_M4([[]]) Bash – counters],
])

PARA([[dnl czech
Počítadla CODE_M4([COUNT_UP]) a CODE_M4([COUNT_DOWN]) jsou definována v kořenovém souboru.
Neterminály[]BR()CODE_M4([[… uvnitř závorek …]]) nebudou expandovány, pouze se odeberou vnější závorky.
Nutno použít makro CODE_M4([LB()]) z[]NB()kořenového souboru.
],
[dnl english: _next_language_
The CODE_M4([COUNT_UP]) and CODE_M4([COUNT_DOWN]) counters are defined in the root file.
The CODE_M4([[… nonterminals inside brackets …]]) will not be expanded, only the outer brackets will be removed.
The CODE_M4([LB()]) macro defined in the root file must be used.
]])

INSERT_FILES_HELLO_WORLD([b], [sh])


SUB_ANNEX([symbols_in_brackets], [dnl czech
[CODE_M4([[]]) .h – závorky CODE_M4([[]])[,] CODE_M4([[,]])[,] CODE_M4([[#]])[,] CODE_M4([[dnl]])],
dnl english: _next_language_
[CODE_M4([[]]) .h – brackets CODE_M4([[]])[,] CODE_M4([[,]])[,] CODE_M4([[#]])[,] CODE_M4([[dnl]])],
])

PARA([[dnl czech
Prázdný pár CODE_M4([[]]) (nebo prázdný symbol v závorkách CODE_M4([[ε]])) slouží jako oddělovač symbolů.
Závorky kolem znaku komentáře CODE_M4([[#]]) vypnou jeho původní význam, stejně jako vypnou význam EM([silnějšího]) M4 komentáře CODE_M4([[dnl]]).
Vypnou také původní význam čárky CODE_M4([[,]]) jako oddělovače argumentů maker.
Tyto symboly se stanou obyčejnými terminálními symboly bez jakéhokoliv vedlejšího efektu.
],
[dnl english: _next_language_
The empty pair CODE_M4([[]]) (or empty symbol in brackets CODE_M4([[ε]])) serves as a[]NB()symbol separator.
Brackets around the comment character CODE_M4([[#]]) turn off its original meaning as well as turn off the meaning of the EM([more powerful]) M4 comment CODE_M4([[dnl]]).
They also turn off the original meaning of the comma CODE_M4([[,]]) as a[]NB()macro argument delimiter.
These symbols become ordinary terminal symbols without any side effect.
]])

INSERT_FILES_HELLO_WORLD([b], [h])


SUB_ANNEX([safe_example], [dnl czech
[CODE_M4([[]]) AWK – příklady bezpečnějších maker],
dnl english: _next_language_
[CODE_M4([[]]) AWK – examples of safer macros],
])

PARA([[dnl czech
Univerzální výstraha CODE_M4([DONTE]) se ignoruje bez závorek, stejně jako CODE_M4([LB]), CODE_M4([RB]), CODE_M4([BRAC]), …
Taková makra explicitně vytváří vývojář skriptů, prohlédněte si kořenový soubor.
],
[dnl english: _next_language_
The universal alert CODE_M4([DONTE]) is ignored without parentheses, like CODE_M4([LB]), CODE_M4([RB]), CODE_M4([BRAC]), …
Such macros are explicitly created by a script developer, see the root file.
]])

INSERT_FILES_HELLO_WORLD([b], [awk])


# A → ε
pushdef([ANNEX_APPEND_CODE])# temporarily disable TIP_BOX in annex because no examples
ANNEX([questions_and_answers], [dnl czech
[Proč používat M4 a proč ne?],
dnl english: _next_language_
[Why using M4 and why not?],
])
popdef([ANNEX_APPEND_CODE])# re-enable TIP_BOX


SUB_ANNEX([why_to_use_m4], [dnl czech
[CODE([👍]) Proč generovat kód v[]NB()M4],
dnl english: _next_language_
[CODE([👍]) Why generate code in M4],
])

UNORDERED_LIST_WRAP([

LIST_ITEM([[dnl czech
přímé použití LINK([bezkontextové gramatiky], [context_free_grammar])
UL([LI([k transformaci dat stačí napsat minimum M4 kódu])])
],
[dnl english: _next_language_
direct use of LINK([context-free grammar], [context_free_grammar])
UL([LI([a minimum M4 code is required for data transformation])])
]])

LIST_ITEM([[dnl czech
přímé použití automatů
UL([LI([možnost vymodelovat si potřebné algoritmy (M4 nepotřebuje verze)])])
],
[dnl english: _next_language_
direct use of automata
UL([LI([possibility to model necessary algorithms (M4 does not need versions)])])
]])

LIST_ITEM([[dnl czech
přímé použití zásobníků
UL([LI([zásobníky propojené s[]NB()automaty rozšiřují možnosti generátoru kódu])])
],
[dnl english: _next_language_
direct use of stacks
UL([LI([stacks connected to automata extend the capabilities of the code generator])])
]])

LIST_ITEM([[dnl czech
přímé použití výstupních front pro dočasné uložení výsledných částí kódu
UL([LI([jednotlivé fronty jsou na závěr vypsány na výstup ve vzestupném pořadí])])
],
[dnl english: _next_language_
direct use of output queues to temporarily store the resulting code pieces
UL([LI([the individual queues are finally dumped to output in ascending order])])
]])

LIST_ITEM([[dnl czech
vyšší rychlost generování kódu (ve srovnání s[]NB()XSLT)
UL([LI([nízké nároky na výpočetní zdroje])])
],
[dnl english: _next_language_
faster code generation (compared to XSLT)
UL([LI([low demands on computing resources])])
]])

])dnl UNORDERED_LIST_WRAP


SUB_ANNEX([why_not_use], [dnl czech
[CODE([👎]) Proč se vyhnout M4],
dnl english: _next_language_
[CODE([👎]) Why avoid M4],
])

UNORDERED_LIST_WRAP([

LIST_ITEM([low_level_language], [[dnl czech
univerzální jazyk nízké úrovně (podobně jako jazyk C)
UL([LI([nemůže konkurovat úzce specializovaným jazykům (například XSLT)])])
],
[dnl english: _next_language_
low-level universal language (similar to C)
UL([
LI([can not compete with narrowly specialized languages (for example XSLT)])
])
]])

LI([M4 programming EM([can]) be difficult and time consuming])

LIST_ITEM([forgotten_language], [[dnl czech
neexistující komunita vývojářů (podzim 2019)
UL([LI([M4 je zapomenutý jazyk, málo existujících projektů])])
],
[dnl english: _next_language_
non-existent developer community (Autumn 2019)
UL([LI([M4 is a[]NB()forgotten language, small amount of existing projects])])
]])

LIST_ITEM([unusual_language], [[dnl czech
neobvyklé programovací paradigma vyžadující splnění LINK([několika předpokladů], [prerequisites_for_mastering])
UL([LI([M4 je proto těžký jazyk])])
],
[dnl english: _next_language_
an unusual programming paradigm requiring LINK([several prerequisites], [prerequisites_for_mastering])
UL([LI([M4 is therefore a[]NB()hard language])])
]])

LIST_ITEM([experience_dependent], [[dnl czech
produktivita značně závisí na zkušenostech (možný problém s[]NB()termíny)
UL([LI([schopnost myslet v[]NB()M4 je nutnost])])
],
[dnl english: _next_language_
productivity greatly depends on experience (possible problem with deadlines)
UL([LI([the ability to think in M4 is an essential necessity])])
]])

LIST_ITEM([hard_maintenance], [[dnl czech
údržba špatně napsaného M4 kódu je těžká
UL([LI([existující M4 kód je snadné proměnit ve zmatek])])
],
[dnl english: _next_language_
maintaining a[]NB()badly written M4 code is difficult
UL([LI([existing M4 code is easy to turn into confusion])])
]])

])dnl UNORDERED_LIST_WRAP
