# vim:mps+=⟦\:⟧

__HEADER(⟦Josef Kubin⟧, ⟦2019/12/03⟧, ⟦https://www.root.cz/clanky/generovani-kodu-v-m4-uvod⟧)
___DESCR(⟦the introductory part⟧)
__TPLVER(1, 0, 0)


PART(⟦
⟦SERIES_NAME: úvod⟧,
dnl _next_language_
⟦SERIES_NAME: introduction⟧,
⟧)

PARTIMAGE(⟦img/m4tux.png⟧, ⟦https://i.iinfo.cz/images/154/m4tux-1-prev.png⟧)


PARTINTRO(⟦defn(⟦PARTINTRO_CS⟧)⟦
Úvodní díl seriálu obsahuje jeho historii, základní principy jazyka, příklady použití a⟦⟧NB()nutné předpoklady pro jeho zvládnutí.
⟧,dnl _next_language_
defn(⟦PARTINTRO_EN⟧)⟦
The introductory part of the series contains its history, the basic principles of language, examples of usage and prerequisites for its mastery.
⟧⟧)


CHAPTER(⟦
⟦Úvod⟧,
dnl _next_language_
⟦Introduction⟧,
⟧)

PARA(⟦⟦
Čtenáři tohoto seriálu se naučí psát skripty pro strojové generování kódu.
Strojově generovaný kód může být libovolně složitý a⟦⟧NB()může obsahovat další vnitřní závislosti.
Vzájemně závislé soubory se složitým kódem jsou pro člověka jen těžce udržitelné v⟦⟧NB()konzistentním stavu.
Je už nutné použít nějaký mechanismus pro generování kódu.
Generování kódu provádí nástroj určený pro transformaci textu – BOLD(⟦makro procesor⟧).
⟧,dnl _next_language_
⟦
Readers of this series will learn how to write scripts for machine code generation.
The machine-generated code can be arbitrarily complex and can contain other internal dependencies.
Interdependent files with complex code are hardly sustainable for humans in a⟦⟧NB()consistent state.
It is necessary to use some code generation mechanism.
The code generation is performed by a⟦⟧NB()tool for text transformation – BOLD(⟦a⟦⟧NB()macro processor⟧).
⟧⟧)

PARA(⟦what_is_the_series_about⟧, ⟦⟦
Seriál je zaměřen na praktické použití BOLD(⟦univerzálního makro procesoru M4⟧) (dále jen M4) pomocí malých příkladů.
Popisuje také teoretický základ všech implementací.
Cílem seriálu je seznámit čtenáře s⟦⟧NB()tímto EXPLAIN(⟦nástrojem⟧, ⟦m4 – je program příkazové řádky⟧) a⟦⟧NB()také programovacím EXPLAIN(⟦jazykem⟧, ⟦M4 – je programovací jazyk⟧).
LINK(⟦Na co se používá⟧, ⟦main_uses_of_m4⟧), jak se v⟦⟧NB()něm programuje a⟦⟧NB()jaké jsou jeho LINK(⟦výhody⟧, ⟦why_to_use_m4⟧) a⟦⟧NB()LINK(⟦nevýhody⟧, ⟦why_not_use⟧).
⟧,dnl _next_language_
⟦
The series focus on the practical use of the BOLD(⟦universal macro processor M4⟧) (hereafter M4) using small examples.
It also describes the theoretical part of all its implementations.
The aim of the series is to acquaint the reader with this EXPLAIN(⟦tool⟧, ⟦m4 – is a command line program⟧) and also the programming EXPLAIN(⟦language⟧, ⟦M4 – is a programming language⟧).
LINK(⟦What is it used for⟧, ⟦main_uses_of_m4⟧), how to program in it and its LINK(⟦advantages⟧, ⟦why_to_use_m4⟧) and LINK(⟦disadvantages⟧, ⟦why_not_use⟧).
⟧⟧)

# same tip box for each part
the_series_is_generated()

PARA(⟦⟦
Úvodní díl popisuje základní principy jazyka na jednoduchých příkladech.
Všechny příklady používají přepisovací pravidla LINK(⟦bezkontextové gramatiky⟧, ⟦context_free_grammar⟧).
Později se naučíme používat LINK(⟦výstupní fronty⟧, ⟦output_queues⟧),
LINK(⟦automaty⟧, ⟦automata_descr⟧), asociativní paměti, zásobníky a⟦⟧NB()zásobníkové automaty.
Naučíme se také psát LINK(⟦testovací automaty⟧, ⟦testing_automaton⟧) pro testování vstupních dat.
⟧,dnl _next_language_
⟦
The introductory part describes the basic principles of the language with simple examples of use.
All examples use rewriting rules of LINK(⟦context-free grammar⟧, ⟦context_free_grammar⟧).
Later we will learn how to use LINK(⟦output queues⟧, ⟦output_queues⟧),
LINK(⟦automata⟧, ⟦automata_descr⟧), associative memories, stacks and pushdown automata.
We will also learn how to write LINK(⟦testing automata⟧, ⟦testing_automaton⟧) to test input data.
⟧⟧)


SECT1(⟦
⟦Příklady pro čtenáře⟧,
dnl _next_language_
⟦Examples for readers⟧,
⟧)

PARA(⟦⟦
Příklady pro čtenáře tvoří komplementární část seriálu a⟦⟧NB()budou do jisté míry vytvářeny na základě podnětů v⟦⟧NB()diskuzi pod článkem.
Na začátku každého dílu je popsána nějaká část jazyka M4 doplněná sadou příkladů na konci.
Každý díl je možné číst v⟦⟧NB()libovolném pořadí.
⟧,dnl _next_language_
⟦
The examples are a⟦⟧NB()complementary part of the series and will be based to some extent on the discussion below the article.
At the beginning of each episode, some parts of the M4 language will be described and supplemented with a⟦⟧NB()set of examples at the end.
Each part can be read in any order.
⟧⟧)

ITEMIZEDLIST_WRAP(⟦

LISTITEM_MONO(⟦⟦LINK(⟦code_generation_examples⟧, ⟦code_generation_examples⟧)⟧⟧)

LISTITEM_MONO(⟦⟦LINK(⟦preproc_examples⟧, ⟦preproc_examples⟧)⟧⟧)

LISTITEM_MONO(⟦⟦LINK(⟦m4_on_examples⟧, ⟦m4_on_examples⟧)⟧⟧)

LISTITEM_MONO(⟦⟦LINK(⟦questions_and_answers⟧, ⟦questions_and_answers⟧)⟧⟧)

LISTITEM(⟦
⟦ULINK(⟦http://github.com/jkubin/m4root⟧, defn(⟦SERIES_NAME⟧), ⟦http://github.com/jkubin/m4root⟧) – projekt generující tento seriál⟧,
dnl _next_language_
⟦ULINK(⟦http://github.com/jkubin/m4root⟧, defn(⟦SERIES_NAME⟧), ⟦http://github.com/jkubin/m4root⟧) – project generating this series⟧,
⟧)

⟧)dnl ITEMIZEDLIST_WRAP


CHAPTER(⟦
⟦Historie makro jazyků⟧,
dnl _next_language_
⟦History of macro languages⟧,
⟧)

PARA(⟦⟦
Makro jazyky byly vynalezeny v⟦⟧NB()době, kdy dominoval jazyk symbolických adres – ABBREV(⟦JSA⟧, ⟦Jazyk Symbolických Adres – assembler⟧).
Zdrojový kód JSA velmi často obsahuje shodné sekvence instrukcí odlišující se pouze hodnotami operandů.
Shodné sekvence instrukcí je možné seskupit do jednoho slova, nebo-li BOLD(⟦makro instrukce⟧).
Jméno obvykle popisuje účel skryté sekvence instrukcí.
Makro instrukce se přeloží makro procesorem na původní sekvenci instrukcí, která se posléze přeloží do spustitelného strojového kódu.
Programování v⟦⟧NB()JSA pomocí makro instrukcí je jednodušší, rychlejší a⟦⟧NB()méně náchylné k⟦⟧NB()lidským chybám.
⟧,dnl _next_language_
⟦
Macro languages were invented when the assembly language (ASM) dominated.
ASM source code usually contains identical instruction sequences that differ only in operand values.
Identical instruction sequences can be grouped into one word or a⟦⟧NB()BOLD(⟦macro instruction⟧).
The name usually describes the purpose of the hidden sequence of instructions.
These macro instructions are translated by the macro processor to the original instruction sequences, which are then translated into the executable machine code.
Programming in ASM using macro instructions is simpler, faster and less prone to human errors.
⟧⟧)

PARA(⟦⟦
Později byly makro jazyky použity k⟦⟧NB()rozšíření kompilovaných programovacích jazyků, protože umožnily psát zdrojový kód na vyšší úrovni abstrakce než jakou poskytuje samotný programovací jazyk.
Rychlost, výkonnost a efektivita složitého programovacího jazyka nižší úrovně je zachována díky makro jazykům.
Avšak je důležité dobře rozumět všem vrstvám kódu.
⟧,dnl _next_language_
⟦
Later, macro languages were used to extend compiled programming languages because they made it possible to write a source code at the higher level of abstraction than offered by the programming language itself.
The speed, performance and efficiency of a⟦⟧NB()complex lower-level programming language is maintained through macro languages.
However, it is important to understand all layers of code well.
⟧⟧)

BRIDGEHEAD_MONO(⟦
⟦GPM (General Purpose Macro-generator)⟧,
⟧)

PARA(⟦⟦
Základní myšlenku přepisování textových řetězců s⟦⟧NB()argumenty, které se přepíší do dalších rekurzivně přepisovatelných řetězců, představil
ULINK(⟦PERSON(⟦Christopher Strachey⟧)⟧, ⟦Wikipedie⟧, ⟦https://en.wikipedia.org/wiki/Christopher_Strachey⟧) ve svém
ABBREV(⟦GPM⟧, ⟦General Purpose Macro-generator⟧)⟦⟧REF(⟦A⟦⟧NB()General Purpose Macro-generator⟧, ⟦Computer Journal 8, 3 (1965), 225–41⟧, ⟦http://dx.doi.org/10.1093/comjnl/8.3.225⟧) v⟦⟧NB()roce 1965.
Další generace makro procesorů M3 a⟦⟧NB()M4 původní ABBREV(⟦GPM⟧, ⟦General Purpose Macro-generator⟧) v⟦⟧NB()podstatě už jen rozšiřovaly.
Základní myšlenka původního návrhu ale zůstala stejná.
⟧,dnl _next_language_
⟦
ULINK(⟦PERSON(⟦Christopher Strachey⟧)⟧, ⟦Wikipedia⟧, ⟦https://en.wikipedia.org/wiki/Christopher_Strachey⟧) introduced the basic idea of rewritable strings with arguments which recursively rewrite to other strings in his
ABBREV(⟦GPM⟧, ⟦General Purpose Macro-generator⟧)⟦⟧REF(⟦A⟦⟧NB()General Purpose Macro-generator⟧, ⟦Computer Journal 8, 3 (1965), 225–41⟧, ⟦http://dx.doi.org/10.1093/comjnl/8.3.225⟧) in 1965.
The next generation of M3 and M4 macro processors basically just expanded the original ABBREV(⟦GPM⟧, ⟦General Purpose Macro-generator⟧).
The basic idea of the original proposal remained the same.
⟧⟧)

BRIDGEHEAD_MONO(⟦
⟦M3⟧,
⟧)

PARA(⟦⟦
ULINK(⟦PERSON(⟦Dennis Ritchie⟧)⟧, ⟦Wikipedie⟧, ⟦https://cs.wikipedia.org/wiki/Dennis_Ritchie⟧) převzal základní myšlenku ABBREV(⟦GPM⟧, ⟦General Purpose Macro-generator⟧) a⟦⟧NB()napsal vylepšený makro procesor pro generování zdrojového kódu programovacího jazyka C (1972), který sám navrhl.
Nový BOLD(⟦m⟧)akro procesor napsal pro minipočítač AP-BOLD(⟦3⟧), odtud jméno BOLD(⟦M3⟧).
Tento přímý předchůdce současného M4 dokázal výrazně ušetřit těžkou a⟦⟧NB()časově náročnou práci, čímž zaujal vývojáře programující v⟦⟧NB()jiných jazycích (ABBREV(⟦FORTRAN⟧, ⟦FORmula TRANslation⟧), ABBREV(⟦COBOL⟧, ⟦COmmon Business-Oriented Language⟧), ABBREV(⟦PL/I⟧, ⟦Programming Language One⟧), …).
Vývojáři upravovali M3 pro tyto jazyky čímž ho proměnili na univerzálně použitelný makro procesor M4.
⟧,dnl _next_language_
⟦
ULINK(⟦PERSON(⟦Dennis Ritchie⟧)⟧, ⟦Wikipedia⟧, ⟦https://en.wikipedia.org/wiki/Dennis_Ritchie⟧) took over the basic idea of ABBREV(⟦GPM⟧, ⟦General Purpose Macro-generator⟧) and wrote an improved macro processor for generating source code of C⟦⟧NB()(1972) language, which he himself designed.
The new BOLD(⟦m⟧)acro processor was written for the minicomputer AP-BOLD(⟦3⟧), hence the name BOLD(⟦M3⟧).
This direct ancestor of the current M4 managed to significantly save heavy and time-consuming work and attract developers programming to other languages (ABBREV(⟦FORTRAN⟧, ⟦FORmula TRANslation⟧), ABBREV(⟦COBOL⟧, ⟦COmmon Business-Oriented Language⟧), ABBREV(⟦PL/I⟧, ⟦Programming Language One⟧), …).
Developers have customized M3 for these languages turning it into a⟦⟧NB()universally usable M4 macro processor.
⟧⟧)

NOTE_WRAP(, ⟦m4 ∈ {⟧LANG(⟦množina nástrojů UNIX-u⟧, ⟦set of UNIX tools⟧)⟦}⟧, ⟦

PLAIN_TEXT(⟦⟦
PERSON(⟦Dennis Ritchie⟧) byl také spolutvůrcem operačního systému UNIX a⟦⟧NB()proto:
⟧,dnl _next_language_
⟦
PERSON(⟦Dennis Ritchie⟧) was also a⟦⟧NB()co-creator of UNIX and therefore:
⟧⟧)

ITEMIZEDLIST_WRAP(⟦

LISTITEM(⟦⟦
M4 je minimalistický a⟦⟧NB()rychlý, ULINK(⟦dělá jednu věc a⟦⟧NB()tu dělá dobře⟧, ⟦Filosofie UNIX-u
Wikipedie⟧, ⟦https://cs.wikipedia.org/wiki/Filosofie_Unixu⟧)
⟧,dnl _next_language_
⟦
M4 is minimalist and fast, ULINK(⟦it does one thing and it does well⟧, ⟦UNIX philosophy
Wikipedia⟧, ⟦https://en.wikipedia.org/wiki/Unix_philosophy⟧)
⟧⟧)

LISTITEM(⟦⟦
výhradně spoléhá na neinteraktivní rozhraní příkazové řádky
⟧,dnl _next_language_
⟦
it relies solely on the non-interactive command line interface
⟧⟧)

LISTITEM(⟦⟦
parametry a⟦⟧NB()závislosti M4 skriptů popisuje CODE(⟦Makefile⟧)
⟧,dnl _next_language_
⟦
parameters and dependencies of M4 scripts are described by CODE(⟦Makefile⟧)
⟧⟧)

LISTITEM(⟦⟦
znakem XCODE(⟦#⟧) začíná jednořádkový komentář jako v⟦⟧NB()UNIX-ovém shell-u
⟧,dnl _next_language_
⟦
the XCODE(⟦#⟧) character begins with a⟦⟧NB()one-line comment like in a⟦⟧NB()UNIX shell
⟧⟧)

LISTITEM(⟦⟦
proměnné XCODE(⟦⟦$⟧@⟧), XCODE(⟦⟦$⟧*⟧), XCODE(⟦⟦$⟧#⟧), XCODE(⟦⟦$⟧0⟧), XCODE(⟦⟦$⟧1⟧), XCODE(⟦⟦$⟧2⟧), XCODE(⟦⟦$⟧3⟧), … mají podobný význam jako v⟦⟧NB()shell-u
⟧,dnl _next_language_
⟦
variables XCODE(⟦⟦$⟧@⟧), XCODE(⟦⟦$⟧*⟧), XCODE(⟦⟦$⟧#⟧), XCODE(⟦⟦$⟧0⟧), XCODE(⟦⟦$⟧1⟧), XCODE(⟦⟦$⟧2⟧), XCODE(⟦⟦$⟧3⟧), … have similar meanings as in a⟦⟧NB()UNIX shell
⟧⟧)

LISTITEM(⟦⟦
oddělovač argumentů je čárka
⟧,dnl _next_language_
⟦
the argument delimiter is comma
⟧⟧)

⟧)dnl ITEMIZEDLIST_WRAP

⟧)dnl NOTE_WRAP

PARA(⟦⟦
Makro procesor M3 rozšířil také PERSON(⟦Jim E. Weythman⟧), autor programové konstrukce, která se používá téměř v⟦⟧NB()každém M4 skriptu:
⟧,dnl _next_language_
⟦
The M3 macro processor was also extended by PERSON(⟦Jim E. Weythman⟧), the author of program construction, which is used in almost every M4 script:
⟧⟧)

PROGRAMLISTING(⟦common_code⟧, ⟦
⟦divert(-1)
…
define(…)
…
divert(0)⟧dnl
…
⟧)dnl PROGRAMLISTING

NOTE(, defn(⟦WORD_NOTE⟧), ⟦⟦
Klíčové slovo HXCODE(⟦⟦divert⟧(ULINK(⟦ℤ⟧, ⟦celé číslo⟧, ⟦https://cs.wikipedia.org/wiki/Cel%C3%A9_%C4%8D%C3%ADslo⟧))⟧, ⟦divert(-1), divert(0), divert(1), …, divert(2147483647)⟧, ⟦⟦⟦1, 5⟧, ⟦common_code⟧⟧⟧) přepíná výstupní fronty.
Argument CODE(⟦-1⟧) zcela vypne jakýkoliv textový výstup.
Argument CODE(⟦0⟧) přepne výstup na CODE(⟦stdout⟧) (standardní výstup).
⟧,dnl _next_language_
⟦
The HXCODE(⟦⟦divert⟧(ULINK(⟦ℤ⟧, ⟦integer⟧, ⟦https://en.wikipedia.org/wiki/Integer⟧))⟧, ⟦divert(-1), divert(0), divert(1), …, divert(2147483647)⟧, ⟦⟦⟦1, 5⟧, ⟦common_code⟧⟧⟧) keyword switches output queues.
Argument CODE(⟦-1⟧) completely disables any text output.
Argument CODE(⟦0⟧) switches output to CODE(⟦stdout⟧) (standard output).
⟧⟧)

BRIDGEHEAD_MONO(⟦
⟦M4⟧,
⟧)

PARA(⟦⟦
ULINK(⟦PERSON(⟦Brian Kernighan⟧)⟧, ⟦Wikipedie⟧, ⟦https://cs.wikipedia.org/wiki/Brian_Kernighan⟧) makro procesor M3 rozšířil na ULINK(⟦preprocesor⟧, ⟦Wikipedie⟧, ⟦https://cs.wikipedia.org/wiki/Preprocesor⟧) jazyka FORTRAN 66,
aby mohl vytvořit hybridní jazykovou nadstavbu pojmenovanou ABBREV(⟦BOLD(⟦RATFOR⟧)⟧, ⟦RATional FORtran⟧)⟦⟧REF(⟦RATFOR — A Preprocessor for a Rational Fortran⟧, ⟦Brian W. Kernighan⟧, ⟦https://wolfram.schneider.org/bsd/7thEdManVol2/ratfor/ratfor.pdf⟧).
Základní programové konstrukce této nadstavby (podmínky, cykly) jsou stejné jako v⟦⟧NB()jazyce C.
Programování v⟦⟧NB()RATFOR-u se tak podobá programování v⟦⟧NB()QUOTE(⟦céčku⟧).
Makro procesor zdrojový kód překládá zpátky do FORTRAN-u, poté kompilátor provede překlad do strojového kódu.
⟧,dnl _next_language_
⟦
ULINK(⟦PERSON(⟦Brian Kernighan⟧)⟧, ⟦Wikipedia⟧, ⟦https://en.wikipedia.org/wiki/Brian_Kernighan⟧) has enhanced the M3 macro processor to the FORTRAN 66
ULINK(⟦preprocessor⟧, ⟦Wikipedia⟧, ⟦https://en.wikipedia.org/wiki/Preprocessor⟧) to create a⟦⟧NB()hybrid language extension named ABBREV(⟦BOLD(⟦RATFOR⟧)⟧, ⟦RATional FORtran⟧)⟦⟧REF(⟦RATFOR — A Preprocessor for a Rational Fortran⟧, ⟦Brian W. Kernighan⟧, ⟦https://wolfram.schneider.org/bsd/7thEdManVol2/ratfor/ratfor.pdf⟧).
The basic program constructions of this extension (conditions, cycles) are the same as in C⟦⟧NB()language.
Programming in RATFOR is similar to C⟦⟧NB()programming.
The macro processor converts the source code back to FORTRAN, then the compiler performs the usual compilation to machine code.
⟧⟧)

NOTE_WRAP(⟦⟧, LANG(⟦jazyk M4 doplňuje jazyk C⟧, ⟦M4 language complements C language⟧), ⟦

PLAIN_TEXT(⟦⟦
Všimněte si LINK(⟦téměř dokonalé symbiózy⟧, ⟦cpp_and_m4⟧) s⟦⟧NB()jazykem⟦⟧NB()C
⟧,dnl _next_language_
⟦
Note the LINK(⟦almost perfect symbiosis⟧, ⟦cpp_and_m4⟧) with the C⟦⟧NB()language:
⟧⟧)

ITEMIZEDLIST_WRAP(⟦

LISTITEM(⟦⟦
direktivy ABBREV(⟦CPP⟧, ⟦Preprocesor jazyka C⟧) XCODE(⟦#define⟧), XCODE(⟦#include⟧), XCODE(⟦#ifdef⟧), … jsou pro M4 komentáře
⟧,dnl _next_language_
⟦
ABBREV(⟦CPP⟧, ⟦C preprocessor⟧) directives XCODE(⟦#define⟧), XCODE(⟦#include⟧), XCODE(⟦#ifdef⟧), … are comments for M4
⟧⟧)
# LI(⟦této vlastnosti využívají LINK(⟦bezpečnější makra⟧, ⟦safer_macros⟧) definovaná uživatelem⟧)
# LI(⟦this feature uses LINK(⟦safer user-defined macros⟧, ⟦safer_macros⟧)⟧)

LISTITEM(⟦⟦
klíčová slova oddělená od závorek mezerou, ztrácí svůj původní význam
UL(⟦LI(⟦M4 například ignoruje funkci CODE(⟦void define (char c, int i) {…}⟧)⟧)⟧)
⟧,dnl _next_language_
⟦
most keywords separated from parentheses by a⟦⟧NB()white character lose meaning
UL(⟦LI(⟦for example, M4 ignores CODE(⟦void define (char c, int i) {…}⟧)⟧)⟧)
⟧⟧)

LISTITEM(⟦⟦
argumenty maker oddělují čárky stejně jako argumenty funkcí jazyka⟦⟧NB()C
UL(⟦LI(⟦je-li definováno makro CODE(⟦FUNC(char c, int i)⟧), jeho proměnné jsou:
XCODE(⟦⟦$⟧# → 2⟧), XCODE(⟦⟦$⟧0 → FUNC⟧), XCODE(⟦⟦$⟧1 → char c⟧), XCODE(⟦⟦$⟧2 → int i⟧)⟧)⟧)
⟧,dnl _next_language_
⟦
macro arguments separate commas just like commas in C⟦⟧NB()functions
UL(⟦LI(⟦if the CODE(⟦FUNC(char c, int i)⟧) macro is defined, its variables are:
XCODE(⟦⟦$⟧# → 2⟧), XCODE(⟦⟦$⟧0 → FUNC⟧), XCODE(⟦⟦$⟧1 → char c⟧), XCODE(⟦⟦$⟧2 → int i⟧)⟧)⟧)
⟧⟧)

LISTITEM(⟦⟦
BOLD(⟦levý⟧) LINK(⟦řídící znak⟧, ⟦expansion_control⟧) CODE(⟦`⟧) není součástí syntaxe rodiny jazyků⟦⟧NB()C
⟧,dnl _next_language_
⟦
BOLD(⟦the left⟧) LINK(⟦control character⟧, ⟦expansion_control⟧) CODE(⟦`⟧) is not a⟦⟧NB()part of the C⟦⟧NB()family syntax
⟧⟧)

LISTITEM(⟦⟦
BOLD(⟦pravý⟧) řídící znak CODE(⟦'⟧) nevadí, není-li součástí makra
UL(⟦LI(⟦oba řídící znaky lze skrýt do uživatelských maker CODE(⟦LL()⟧), CODE(⟦RR()⟧)⟧)⟧)
⟧,dnl _next_language_
⟦
BOLD(⟦the right⟧) control character CODE(⟦'⟧) does not matter if it is not part of the macro⟦⟧BR()
UL(⟦LI(⟦both control characters can be hidden into user-defined macros CODE(⟦LL()⟧), CODE(⟦RR()⟧)⟧)⟧)
⟧⟧)

LISTITEM(⟦⟦
makra se píší CODE(⟦VELKYMI_PISMENY⟧), stejně jako ULINK(⟦neterminální symboly⟧, ⟦Wikipedie⟧, ⟦https://cs.wikipedia.org/wiki/Termin%C3%A1ln%C3%AD_a_netermin%C3%A1ln%C3%AD_symbol⟧)
UL(⟦LI(⟦tím je vymezen jejich jmenný prostor⟧)⟧)
⟧,dnl _next_language_
⟦
macros are written CODE(⟦IN_UPPERCASE⟧), just like ULINK(⟦nonterminal symbols⟧, ⟦Wikipedia⟧, ⟦https://en.wikipedia.org/wiki/Terminal_and_nonterminal_symbols⟧)
UL(⟦LI(⟦this delimits their namespace⟧)⟧)
⟧⟧)

⟧)dnl ITEMIZEDLIST_WRAP

⟧)dnl NOTE_WRAP

PARA(⟦⟦
Uživatelský manuál⟦⟧REF(⟦The M4 Macro Processor⟧, ⟦Bell Laboratories (1977)⟧, ⟦https://wolfram.schneider.org/bsd/7thEdManVol2/m4/m4.pdf⟧) zmiňuje ještě další, zde neuvedené spoluautory.
Bylo by tedy značně nespravedlivé napsat, že autory makro procesoru M4 (1977) jsou ITALIC(⟦pouze⟧) dva lidé.
⟧,dnl _next_language_
⟦
The user manual⟦⟧REF(⟦The M4 Macro Processor⟧, ⟦Bell Laboratories (1977)⟧, ⟦https://wolfram.schneider.org/bsd/7thEdManVol2/m4/m4.pdf⟧) mentions other co-authors not mentioned here.
So it would be fairly unfair to write that the authors of the M4 macro processor (1977) are ITALIC(⟦only⟧) two people.
⟧⟧)

IMAGEDATA(⟦the_authors⟧,dnl id
⟦Christopher Strachey, Dennis Ritchie, Brian Kernighan⟧,dnl title
⟦⟧,dnl class
⟦⟧,dnl style
⟦⟧,dnl anything
⟦img/authors.jpg, https://i.iinfo.cz/images/283/authors-of-m4-1.jpg⟧,dnl src
⟦⟦
Christopher Strachey⟦⟧REF(⟦Christopher Strachey⟧, ⟦Computer Hope – Free computer help since 1998⟧, ⟦https://www.computerhope.com/people/christopher_strachey.htm⟧),
Dennis Ritchie⟦⟧REF(⟦Dennis Ritchie⟧, ⟦Zomrel tvorca Unixu a⟦⟧NB()jazyka⟦⟧NB()C⟧, ⟦https://pc.zoznam.sk/novinka/zomrel-tvorca-unixu-jazyka-c⟧),
Brian Kernighan⟦⟧REF(⟦Brian Kernighan⟧, ⟦An Interview with Brian Kernighan⟧, ⟦https://www.cs.cmu.edu/~mihaib/kernighan-interview/⟧)
⟧,dnl _next_language_
⟦
Christopher Strachey⟦⟧REF(⟦Christopher Strachey⟧, ⟦Computer Hope – Free computer help since 1998⟧, ⟦https://www.computerhope.com/people/christopher_strachey.htm⟧),
Dennis Ritchie⟦⟧REF(⟦Dennis Ritchie⟧, ⟦Zomrel tvorca Unixu a⟦⟧NB()jazyka⟦⟧NB()C⟧, ⟦https://pc.zoznam.sk/novinka/zomrel-tvorca-unixu-jazyka-c⟧),
Brian Kernighan⟦⟧REF(⟦Brian Kernighan⟧, ⟦An Interview with Brian Kernighan⟧, ⟦https://www.cs.cmu.edu/~mihaib/kernighan-interview/⟧)
⟧⟧)

BRIDGEHEAD_MONO(⟦
⟦GNU M4⟧,
⟧)

PARA(⟦⟦
Dnes existuje několik implementací lišící se od původní implementace spíše drobnostmi.
Nejrozšířenější implementace M4 je BOLD(⟦GNU M4⟧) používaná pro ULINK(⟦Autotools⟧, ⟦Wikipedie⟧, ⟦https://en.wikipedia.org/wiki/GNU_Build_System⟧)
a⟦⟧NB()pro překlad jednoduchého konfiguračního souboru CODE(⟦sendmail.mc⟧) na složitý CODE(⟦sendmail.cf⟧).
Autorem této implementace z⟦⟧NB()roku 1990 je ULINK(⟦PERSON(⟦René⟦⟧NB()Seindal⟧)⟧, ⟦https://www.seindal.dk/rene/gnu/⟧).
Následující příkaz nainstaluje EXPLAIN(⟦m4⟧, ⟦s malým „m“⟧):
⟧,dnl _next_language_
⟦
Today, there are several implementations that differ from the original implementation rather by small details.
The most common implementation of M4 is the BOLD(⟦GNU M4⟧) used for ULINK(⟦Autotools⟧, ⟦Wikipedia⟧, ⟦https://en.wikipedia.org/wiki/GNU_Build_System⟧)
and for translating the simple CODE(⟦sendmail.mc⟧) configuration file to complex CODE(⟦sendmail.cf⟧).
The author of this implementation (1990) is ULINK(⟦PERSON(⟦René⟦⟧NB()Seindal⟧)⟧, ⟦https://www.seindal.dk/rene/gnu/⟧).
To install EXPLAIN(⟦m4⟧, ⟦with small letter “m”⟧), type the following command:
⟧⟧)

CMDSYNOPSIS_ROOT(⟦install⟧, LANG(⟦příkaz nainstaluje také další důležité balíčky⟧, ⟦the command also installs other important packages⟧), ⟦
dnf -y install make m4 pinfo
⟧)

PARA(⟦⟦
Podrobný popis klíčových slov se nachází v⟦⟧NB()dokumentaci⟦⟧REF(⟦GNU M4 - GNU macro processor⟧, ⟦Free Software Foundation⟧, ⟦https://www.gnu.org/software/m4/manual/⟧):
⟧,dnl _next_language_
⟦
A⟦⟧NB()detailed description of the keywords can be found in the documentation⟦⟧REF(⟦GNU M4 - GNU macro processor⟧, ⟦Free Software Foundation⟧, ⟦https://www.gnu.org/software/m4/manual/⟧):
⟧⟧)

PROGRAMLISTING(⟦
PROMPT() BOLD(⟦pinfo m4⟧)
PROMPT() BOLD(⟦man m4⟧)
PROMPT() BOLD(⟦m4 --help⟧)
⟧)dnl PROGRAMLISTING


CHAPTER(⟦
⟦Základy jazyka M4⟧,
dnl _next_language_
⟦Basics of M4⟧,
⟧)

PARA(⟦⟦
Základem jazyka M4 je BOLD(⟦bezkontextová gramatika⟧), BOLD(⟦automaty⟧), BOLD(⟦zásobníky⟧) a⟦⟧NB()BOLD(⟦výstupní fronty⟧).
Pro pochopení jazyka M4 je proto velmi důležité rozumět základním pojmům teorie formálních jazyků –
co jsou ULINK(⟦terminální symboly⟧, ⟦Wikipedie⟧, ⟦https://cs.wikipedia.org/wiki/Termin%C3%A1ln%C3%AD_a_netermin%C3%A1ln%C3%AD_symbol⟧) (stručně BOLD(⟦terminály⟧)) a⟦⟧NB()neterminální symboly (stručně BOLD(⟦neterminály⟧)).
Zmíněné pojmy si podrobněji vysvětlíme někdy později.
Cílem tohoto úvodního dílu je hlavně ukázat praktické použití M4 na příkladech.
⟧,dnl _next_language_
⟦
M4 is based on BOLD(⟦context-free grammar⟧), BOLD(⟦automata⟧), BOLD(⟦stacks⟧) and BOLD(⟦output queues⟧).
To understand M4, it is therefore crucial to understand the basic concepts of formal language theory –
ULINK(⟦terminal symbols⟧, ⟦Wikipedia⟧, ⟦https://en.wikipedia.org/wiki/Terminal_and_nonterminal_symbols⟧) (briefly BOLD(⟦terminals⟧)) and nonterminal symbols (briefly BOLD(⟦nonterminals⟧)).
These terms will be explained later in more detail.
The objective is to show the basic practical use of M4 language on examples.
⟧⟧)

SECT1(⟦context_free_grammar⟧, ⟦
⟦Bezkontextová gramatika⟧,
dnl _next_language_
⟦Context-free grammar⟧,
⟧)

PARA(⟦⟦
Bezkontextová gramatika (krátce ABBREV(⟦CFG⟧, ⟦Context-Free Grammar – bezkontextová gramatika⟧)) je LINK(⟦formální gramatika⟧, ⟦formal_grammar_chomsky⟧), ve které mají všechna přepisovací pravidla tvar HCODE(⟦A → β⟧, ⟦⟦⟦1⟧, ⟦all_context_free_grammar_rules⟧⟧, ⟦⟦2⟧, ⟦rewriting_rules⟧⟧⟧).
Neterminál HCODE(⟦A⟧, ⟦⟦⟦D⟧, ⟦all_context_free_grammar_rules⟧⟧⟧) se HEXPLAIN(⟦přepíše⟧, ⟦⟦⟦E⟧, ⟦all_context_free_grammar_rules⟧⟧⟧) na libovolně dlouhý řetězec ABBREV(⟦HCODE(⟦β⟧, ⟦⟦⟦F⟧, ⟦all_context_free_grammar_rules⟧⟧⟧)⟧, ⟦pravá strana přepisovacího pravidla⟧) složený z⟦⟧NB()HEXPLAIN(⟦neterminálů CODE(⟦N⟧)⟧, ⟦⟦⟦B⟧, ⟦all_context_free_grammar_rules⟧⟧⟧) HEXPLAIN(⟦nebo⟧, ⟦⟦⟦G⟧, ⟦all_context_free_grammar_rules⟧⟧⟧) HEXPLAIN(⟦terminálů CODE(⟦Σ⟧)⟧, ⟦⟦⟦A⟧, ⟦all_context_free_grammar_rules⟧⟧⟧).
HEXPLAIN(⟦ULINK(⟦Kleeneho hvězda⟧, ⟦Wikipedie⟧, ⟦https://en.wikipedia.org/wiki/Kleene_star⟧)⟧, ⟦⟦⟦C⟧, ⟦all_context_free_grammar_rules⟧⟧⟧) znamená, že se neterminál HCODE(⟦A⟧, ⟦⟦⟦D⟧, ⟦all_context_free_grammar_rules⟧⟧, ⟦⟦D⟧, ⟦rewriting_rules⟧⟧⟧) může přepsat na ABBREV(⟦CODE(⟦ε⟧)⟧, ⟦epsilon – prázdný symbol⟧) (přepisovací pravidlo HCODE(⟦A → ε⟧, ⟦⟦⟦5,6⟧, ⟦rewriting_rules⟧⟧⟧)).
⟧,dnl _next_language_
⟦
Context-free grammar (shortly ABBREV(⟦CFG⟧, ⟦Context-Free Grammar⟧)) is a⟦⟧NB()LINK(⟦formal grammar⟧, ⟦formal_grammar_chomsky⟧) in which all rules for rewriting have the HCODE(⟦A → β⟧, ⟦⟦⟦1⟧, ⟦all_context_free_grammar_rules⟧⟧, ⟦⟦2⟧, ⟦rewriting_rules⟧⟧⟧) form.
The nonterminal HCODE(⟦A⟧, ⟦⟦⟦D⟧, ⟦all_context_free_grammar_rules⟧⟧⟧) is HEXPLAIN(⟦rewritten⟧, ⟦⟦⟦E⟧, ⟦all_context_free_grammar_rules⟧⟧⟧) to an arbitrarily long ABBREV(⟦HCODE(⟦β⟧, ⟦⟦⟦F⟧, ⟦all_context_free_grammar_rules⟧⟧⟧)⟧, ⟦the right side of the rewriting rule⟧) string composed of HEXPLAIN(⟦nonterminals CODE(⟦N⟧)⟧, ⟦⟦⟦B⟧, ⟦all_context_free_grammar_rules⟧⟧⟧) HEXPLAIN(⟦or⟧, ⟦⟦⟦G⟧, ⟦all_context_free_grammar_rules⟧⟧⟧) HEXPLAIN(⟦terminals CODE(⟦Σ⟧)⟧, ⟦⟦⟦A⟧, ⟦all_context_free_grammar_rules⟧⟧⟧).
HEXPLAIN(⟦ULINK(⟦Kleene star⟧, ⟦Wikipedia⟧, ⟦https://en.wikipedia.org/wiki/Kleene_star⟧)⟧, ⟦⟦⟦C⟧, ⟦all_context_free_grammar_rules⟧⟧⟧) means that nonterminal HCODE(⟦A⟧, ⟦⟦⟦D⟧, ⟦all_context_free_grammar_rules⟧⟧, ⟦⟦D⟧, ⟦rewriting_rules⟧⟧⟧) can be rewritten to ABBREV(⟦CODE(⟦ε⟧)⟧, ⟦epsilon – empty symbol⟧) (rewriting rule HCODE(⟦A → ε⟧, ⟦⟦⟦5,6⟧, ⟦rewriting_rules⟧⟧⟧)).
⟧⟧)

PROGRAMLISTING(⟦all_context_free_grammar_rules⟧, LANG(⟦přepisovací pravidla bezkontextové gramatiky⟧, ⟦context-free grammar rewriting rules⟧), ⟦
P: MM(⟦A⟧, d) MM(⟦→⟧, e) MM(⟦β⟧, f)
   MM(⟦A⟧, d) ∈ MM(⟦N⟧, b)
   MM(⟦β⟧, f) ∈ (MM(⟦N⟧, b) MM(⟦∪⟧, g) MM(⟦Σ⟧, a))MM(⟦*⟧, c)
⟧)dnl PROGRAMLISTING

BRIDGEHEAD(⟦m4_rules⟧, ⟦
⟦Přepisovací pravidla M4⟧,
dnl _next_language_
⟦M4 rewriting rules⟧,
⟧)

PARA(⟦⟦
Přepisovací pravidla M4 HEXPLAIN(⟦jsou stejná⟧, ⟦⟦⟦1⟧, ⟦all_context_free_grammar_rules⟧⟧, ⟦⟦2⟧, ⟦rewriting_rules⟧⟧⟧) jako přepisovací pravidla bezkontextové gramatiky.
⟧,dnl _next_language_
⟦
The rules for rewriting HEXPLAIN(⟦are the same⟧, ⟦⟦⟦1⟧, ⟦all_context_free_grammar_rules⟧⟧, ⟦⟦2⟧, ⟦rewriting_rules⟧⟧⟧) for context-free grammar and M4.
⟧⟧)

PROGRAMLISTING(⟦rewriting_rules⟧, LANG(⟦přepisovací pravidla M4⟧, ⟦M4 rewriting rules⟧), ⟦
# A → β
define⟦⟧(`MM(⟦A⟧, d)', `MM(⟦β⟧, f)')

# A → ε
define⟦⟧(`MM(⟦A⟧, d)')
define⟦⟧(`MM(⟦A⟧, d)', `')
⟧)dnl PROGRAMLISTING

PARA(⟦⟦
Všechna klíčová slova M4 jsou neterminály (makra), provedou nějakou akci a⟦⟧NB()přepíší se na ABBREV(⟦CODE(⟦ε⟧)⟧, ⟦epsilon – prázdný symbol⟧) nebo jiný symbol.
Všechna klíčová slova lze přejmenovat nebo úplně vypnout.
Tato vlastnost je velmi důležitá pro režim preprocesoru.
⟧,dnl _next_language_
⟦
All M4 keywords are nonterminals (macros), which take action and are rewritten to ABBREV(⟦CODE(⟦ε⟧)⟧, ⟦epsilon – empty symbol⟧) or another symbol.
All keywords can be renamed or turned off completely.
This feature is crucial for the preprocessor mode.
⟧⟧)

PROGRAMLISTING(⟦keywords_are_nonterminals⟧, LANG(⟦klíčová slova M4 jsou neterminály⟧, ⟦M4 keywords are nonterminals⟧), ⟦
⟦divert⟧(ℤ) → ε
define⟦⟧(`A', `β') → ε
ifelse⟦⟧(`', `', `yes', `no') → yes
ifelse⟦⟧(`', `', `ifdef⟦⟧(`dnl', `1', `0')', `no') → ifdef⟦⟧(`dnl', `1', `0') → 1
…
⟧)dnl PROGRAMLISTING

BRIDGEHEAD(⟦expansion_control⟧, ⟦
⟦Řízení expanze neterminálů⟧,
dnl _next_language_
⟦Nonterminal expansion control⟧,
⟧)

PARA(⟦⟦
Výchozí dvojice znaků CODE(⟦`'⟧) v⟦⟧NB()M4 řídí expanzi neterminálů.
Klíčové slovo CODE(⟦changequote()⟧) je může změnit na jiné znaky, například {EXPLAIN_CODE(⟦[]⟧, ⟦hranaté závorky⟧), EXPLAIN_CODE(⟦␂␆⟧, ⟦netisknutelné znaky⟧), EXPLAIN_CODE(⟦⟦⟧⟧, ⟦UTF-8 znaky⟧)}.
Neterminály, které nechceme (ihned) expandovat, jsou obklopeny touto dvojicí znaků.
Při průchodu makro procesorem jsou všechny symboly mezi touto dvojicí znaků BOLD(⟦terminálními symboly⟧) a⟦⟧NB()vnější dvojice znaků je odstraněna.
Další průchod již způsobí expanzi původně chráněných neterminálů.
Dvojice řídících znaků se nastavuje na začátku kořenového souboru.
⟧,dnl _next_language_
⟦
The default character pair CODE(⟦`'⟧) in M4 controls the expansion of nonterminals.
The keyword CODE(⟦changequote()⟧) can change them to other characters, for example {EXPLAIN_CODE(⟦[]⟧, ⟦square brackets⟧), EXPLAIN_CODE(⟦␂␆⟧, ⟦nonprintable characters⟧), EXPLAIN_CODE(⟦⟦⟧⟧, ⟦UTF-8 characters⟧)}.
The nonterminals that we do not want to (immediately) expand are surrounded by this pair of characters.
When passing through the macro processor, all the symbols between this character pair are BOLD(⟦terminal symbols⟧) and the outer character pair is removed.
The next pass will cause the expansion of the originally protected nonterminals.
The control character pair is set at the beginning of the root file.
⟧⟧)


SECT1(⟦automata_descr⟧, ⟦
⟦Automaty⟧,
dnl _next_language_
⟦Automata⟧,
⟧)

PARA(⟦⟦
Automaty slouží jako QUOTE(⟦přepínače⟧) pravidel gramatiky.
Používají přepisovací pravidla gramatiky jako uzly a⟦⟧NB()mění své stavy podle vstupních symbolů.
Aktuálně používané přepisovací pravidlo produkuje do výstupní fronty (nebo do několika výstupních front)
specifický kód, dokud automat nepřejde do jiného uzlu s⟦⟧NB()jiným přepisovacím pravidlem.
Příklady LINK(⟦generujících automatů⟧, ⟦json_generating_automaton⟧) jsou ukázány v⟦⟧NB()příloze.
⟧,dnl _next_language_
⟦
Automata serve as QUOTE(⟦switches⟧) of grammar rules.
Automata use the grammar rules for rewriting as nodes and change their states according to input symbols.
The currently used rule produces a specific code to the output queue (or several output queues) until the automaton moves to another node with a⟦⟧NB()different rule.
The examples of LINK(⟦generating automata⟧, ⟦json_generating_automaton⟧) are in appendix.
⟧⟧)


SECT1(⟦output_queues⟧, ⟦
⟦Výstupní fronty⟧,
dnl _next_language_
⟦Output queues⟧,
⟧)

PARA(⟦⟦
Výstupní fronty jsou dočasné úložiště pro části výsledného kódu.
Tyto části výsledného kódu jsou produkovány přepisovacími pravidly gramatiky, které přepisují vstupní symboly.
Klíčové slovo CODE(⟦divert(ℤ)⟧) nastavuje aktuální výstupní frontu.
Na závěr jsou všechny neprázdné fronty vypsány ve vzestupném pořadí na standardní výstup a⟦⟧NB()složí výsledný kód z⟦⟧NB()částí kódu.
LINK(⟦Výstupní fronty⟧, ⟦output_queues_html⟧) jsou ukázány v⟦⟧NB()příloze.
⟧,dnl _next_language_
⟦
The output queues temporarily store the portions of the resulting code.
These parts are formed using the grammar rules for rewriting which subsequently rewrite input symbols.
The CODE(⟦divert(ℤ)⟧) keyword sets the output queue.
Finally, all non-empty queues are dumped in ascending order to the standard output and compose the final code.
The examples of the LINK(⟦output queues⟧, ⟦output_queues_html⟧) are in the appendix.
⟧⟧)

INFO(, defn(⟦WORD_INFORMATION⟧), ⟦⟦
BOLD(⟦Zásobníky⟧) si ukážeme později.
⟧,dnl _next_language_
⟦
BOLD(⟦Stacks⟧) will be described later.
⟧⟧)


CHAPTER(⟦main_uses_of_m4⟧, ⟦
⟦Hlavní použití M4⟧,
dnl _next_language_
⟦Main uses of M4⟧,
⟧)

PARA(⟦⟦
M4 se používá ke generování zdrojového kódu libovolného programovacího jazyka nebo jako preprocesor jakéhokoliv zdrojového kódu.
⟧,dnl _next_language_
⟦
M4 is used to generate the source code of any programming language or as a⟦⟧NB()preprocessor for any source code.
⟧⟧)


SECT1(⟦code_generation⟧, ⟦
⟦Generování kódu⟧,
dnl _next_language_
⟦The code generation⟧,
⟧)

PARA(⟦⟦
M4 transformuje vstupní data ze souborů ABBREV(⟦CODE(⟦.mc⟧)⟧, ⟦Macro Configuration⟧) na výsledná data následujícím příkazem:
⟧,dnl _next_language_
⟦
M4 transforms input data from ABBREV(⟦CODE(⟦.mc⟧)⟧, ⟦Macro Configuration⟧) files to output data with the following command:
⟧⟧)

CMDSYNOPSIS(⟦files_on_command_line⟧, ⟦← ⟧LANG(⟦nejobecnější.m4 … nejspeciálnější.m4⟧, ⟦the_most_general.m4 … the_most_special.m4⟧)⟦ →⟧, ⟦
m4 root.m4 stem.m4 branch.m4 leaf.m4 input1.mc input2.mc > output.file
⟧)

PARA(⟦⟦
Během načítání souborů jsou prováděny dvě základní operace:
⟧,dnl _next_language_
⟦
Two basic operations are performed during file loading:
⟧⟧)

ORDEREDLIST_WRAP(⟦

LISTITEM(⟦⟦
čtení transformačních pravidel ze souborů s⟦⟧NB()příponou CODE(⟦.m4⟧)
⟧,dnl _next_language_
⟦
the reading transformation rules from files with the CODE(⟦.m4⟧) extension
⟧⟧)

LISTITEM(⟦⟦
expanze maker uvnitř souborů s⟦⟧NB()příponou CODE(⟦.mc⟧)
⟧,dnl _next_language_
⟦
the expansion of macros inside CODE(⟦.mc⟧) files
⟧⟧)

⟧)dnl ORDEREDLIST_WRAP

PARA(⟦⟦
Soubory CODE(⟦input1.mc⟧) a⟦⟧NB()CODE(⟦input2.mc⟧) obsahují BOLD(⟦vstupní data⟧) ve specifickém formátu, který umožňuje jejich transformaci na BOLD(⟦výstupní data⟧) podle pravidel v⟦⟧NB()předchozích CODE(⟦.m4⟧) souborech.
Datové soubory CODE(⟦.mc⟧) obvykle neobsahují žádná transformační pravidla.
⟧,dnl _next_language_
⟦
The CODE(⟦input1.mc⟧) and CODE(⟦input2.mc⟧) files contain the BOLD(⟦input data⟧) in a⟦⟧NB()format that allows them to be transformed into BOLD(⟦output data⟧) according to the rules in the previous CODE(⟦.m4⟧) files.
The CODE(⟦.mc⟧) data files usually do not contain any transformation rules.
⟧⟧)

PARA(⟦⟦
Vstupní data mohou také přicházet z⟦⟧NB()kolony:
⟧,dnl _next_language_
⟦
The input data may also come from the pipeline:
⟧⟧)

CMDSYNOPSIS(, LANG(⟦vstupní kód → generování zdrojového kódu → soubor⟧, ⟦input code → source code generation → file⟧), ⟦
cat input.mc | m4 root.m4 stem.m4 branch.m4 leaf.m4 - > output.file
⟧)

CMDSYNOPSIS(, LANG(⟦vstupní kód → generování zdrojového kódu → program⟧, ⟦input code → source code generation → program⟧), ⟦
cat input.mc | m4 root.m4 stem.m4 branch.m4 leaf.m4 - | gcc -x c -o progr -
⟧)

PARA(⟦⟦
define(⟦try_it_yourself⟧, ⟦Vyzkoušejte:⟧)try_it_yourself() LINK(⟦code_generation_examples⟧, ⟦code_generation_examples⟧)
⟧,dnl _next_language_
⟦
define(⟦try_it_yourself⟧, ⟦Try:⟧)try_it_yourself() LINK(⟦code_generation_examples⟧, ⟦code_generation_examples⟧)
⟧⟧)


SECT1(⟦m4_as_preproc⟧, ⟦
⟦Preprocesor⟧,
dnl _next_language_
⟦The preprocessor⟧,
⟧)

PARA(⟦⟦
M4 může pracovat v⟦⟧NB()režimu preprocesoru a může být také součástí kolony.
Vstupní zdrojový kód jím prochází beze změny s⟦⟧NB()výjimkou neterminálních symbolů.
Nalezené neterminály jsou expandovány na terminály a⟦⟧NB()odchází spolu se zdrojovým kódem na výstup.
M4 může rozšířit jakýkoliv jiný jazyk, kde je preprocesor nedostatečný (bez rekurze) nebo žádný.
Důležité je zvolit vhodný levý znak pro řízení expanze neterminálů, který nesmí kolidovat se znakem vstupního zdrojového kódu.
Kolize znaku je ale snadno řešitelná regulárním výrazem.
⟧,dnl _next_language_
⟦
M4 can operate in the preprocessor mode and can also be part of a⟦⟧NB()pipeline.
The input source code passes unchanged through except for nonterminal symbols.
The nonterminals found are expanded to terminals and the output along with the source code.
M4 can extend any other language where the preprocessor is insufficient (no recursion) or none.
It is important to select the left character for nonterminal expansion control, which must not collide with the input source code character.
However the character collision is easily solved by a regex.
⟧⟧)

CMDSYNOPSIS(, LANG(⟦M4 jako preprocesor – obecně⟧, ⟦M4 as preprocessor – in general⟧), ⟦
m4 root.m4 stem.m4 branch.m4 leaf.m4 file.c > preproc.file.c
⟧)

CMDSYNOPSIS(, LANG(⟦M4 jako preprocesor – bez dočasného souboru⟧, ⟦M4 as preprocessor – without intermediate file⟧), ⟦
m4 root.m4 stem.m4 branch.m4 leaf.m4 file.c | gcc -x c -o progr -
⟧)


BRIDGEHEAD(⟦
⟦CODE(⟦`'⟧) Výchozí znaky⟧,
dnl _next_language_
⟦CODE(⟦`'⟧) Default characters⟧,
⟧)

PARA(⟦⟦
Konfliktní znak CODE(⟦`⟧) ze vstupního zdrojového kódu je skryt do makra CODE(⟦`'LL()⟧).
Prázdný pár řídících znaků CODE(⟦`'⟧) před makrem CODE(⟦LL()⟧) slouží jako LINK(⟦oddělovač symbolů⟧, ⟦symbols_in_brackets⟧).
Při průchodu zdrojového kódu makro procesorem se makro CODE(⟦`'LL()⟧) přepíše zpátky na původní znak CODE(⟦`⟧) a⟦⟧NB()prázdný pár CODE(⟦`'⟧) je odstraněn.
⟧,dnl _next_language_
⟦
The conflicting character CODE(⟦`⟧) from the input source code is hidden into a⟦⟧NB()macro CODE(⟦`'LL()⟧).
An empty pair of control characters CODE(⟦`'⟧) before the macro serves as a⟦⟧NB()LINK(⟦symbol separator⟧, ⟦symbols_in_brackets⟧).
When the source code is passed through the macro processor, the CODE(⟦`'LL()⟧) macro is rewritten back to the original CODE(⟦`⟧) character and the empty pair CODE(⟦`'⟧) is removed.
⟧⟧)

define(⟦common_title_for_regex⟧, LANG(⟦M4 jako preprocesor s řídícími znaky⟧, ⟦M4 as preprocessor with control characters⟧))
define(⟦common_title⟧, ⟦ ⟧LANG(⟦jinak⟧, ⟦differently⟧))

CMDSYNOPSIS(, defn(⟦common_title_for_regex⟧)⟦: `'⟧, ⟦
sed 's/`/`'\''⟦LL()⟧/g' any.src | m4 rootq.m4 leaf.m4 -
⟧)

PARA(⟦⟦
Vyskytují-li se ve vstupním kódu komentáře XCODE(⟦#⟧) nebo XCODE(⟦dnl⟧), je nutné je skrýt.
Znaky CODE(⟦`'⟧) LINK(⟦vypnou⟧, ⟦symbols_in_brackets⟧) původní význam komentářů a budou odebrány při průchodu makro procesorem.⟦⟧BR()
Komentáře M4 XCODE(⟦#⟧) a XCODE(⟦dnl⟧) jsou skryty mezi výchozí znaky: XCODE(⟦`#'⟧) XCODE(⟦`dnl'⟧)
⟧,dnl _next_language_
⟦
If there are XCODE(⟦#⟧) or XCODE(⟦dnl⟧) comments in the source code, they must be hidden first.
The characters CODE(⟦`'⟧) LINK(⟦turn off⟧, ⟦symbols_in_brackets⟧) original meaning and will be removed by the macro processor.⟦⟧BR()
M4 XCODE(⟦#⟧) and XCODE(⟦dnl⟧) comments are hidden between default characters: XCODE(⟦`#'⟧) XCODE(⟦`dnl'⟧)
⟧⟧)

CMDSYNOPSIS(, defn(⟦common_title_for_regex⟧)⟦: `'⟧, ⟦
sed 's/`/`'\''⟦LL()⟧/g;s/#\|\<dnl\>/`&'\''/g' any.src | m4 rootq.m4 leaf.m4 -
⟧)

CMDSYNOPSIS(, defn(⟦common_title_for_regex⟧, ⟦common_title⟧)⟦: `'⟧, ⟦
sed 's/`/`'\''⟦LL()⟧/g;s/#/`#'\''/g;s/\<dnl\>/`dnl'\''/g' any.src | m4 …
⟧)


BRIDGEHEAD(⟦
⟦CODE(⟦[]⟧) Hranaté závorky⟧,
dnl _next_language_
⟦CODE(⟦[]⟧) Square brackets⟧,
⟧)

PARA(⟦⟦
Použijeme-li pro LINK(⟦řízení expanze neterminálů⟧, ⟦expansion_control⟧) hranaté závorky, stejným způsobem je skryta levá XCODE(⟦[⟧) hranatá závorka.
Vše ostatní platí jako pro výchozí znaky CODE(⟦`'⟧).
⟧,dnl _next_language_
⟦
If square brackets are used to LINK(⟦control the expansion⟧, ⟦expansion_control⟧) of nonterminals, the left XCODE(⟦[⟧) square bracket is hidden in the same way.
Everything else applies as for default characters CODE(⟦`'⟧).
⟧⟧)

CMDSYNOPSIS(, defn(⟦common_title_for_regex⟧)⟦: []⟧, ⟦
sed 's/\[/[]⟦LL()⟧/g' any.src | m4 rootb.m4 leaf.m4 - | …
⟧)

PARA(⟦⟦
Komentáře M4 XCODE(⟦#⟧) a XCODE(⟦dnl⟧) jsou skryté mezi závorkami: XCODE(⟦[#]⟧) XCODE(⟦[dnl]⟧)
⟧,dnl _next_language_
⟦
M4 XCODE(⟦#⟧) and XCODE(⟦dnl⟧) comments are hidden between parentheses: XCODE(⟦[#]⟧) XCODE(⟦[dnl]⟧)
⟧⟧)

CMDSYNOPSIS(, defn(⟦common_title_for_regex⟧)⟦: []⟧, ⟦
sed 's/\[/[]⟦LL()⟧/g;s/#\|\<dnl\>/[&]/g' any.src | m4 rootb.m4 leaf.m4 - | …
⟧)

CMDSYNOPSIS(, defn(⟦common_title_for_regex⟧, ⟦common_title⟧)⟦: []⟧, ⟦
sed 's/\[/[]⟦LL()⟧/g;s/#/[#]/g;s/\<dnl\>/[dnl]/g' any.src | m4 rootb.m4 …
⟧)


BRIDGEHEAD(⟦
⟦CODE(⟦␂␆⟧) Netisknutelné znaky⟧,
dnl _next_language_
⟦CODE(⟦␂␆⟧) Non printable characters⟧,
⟧)

PARA(⟦⟦
Pro řízení expanze neterminálů lze použít netisknutelné znaky BOLD(⟦CODE(⟦␂⟧)⟧) (SAMP(⟦0x02⟧)) a⟦⟧NB()BOLD(⟦CODE(⟦␆⟧)⟧) (SAMP(⟦0x06⟧)).
Tyto znaky nemohou kolidovat s⟦⟧NB()tisknutelnými znaky zdrojového kódu.
⟧,dnl _next_language_
⟦
Non printable characters BOLD(⟦CODE(⟦␂⟧)⟧) (SAMP(⟦0x02⟧)) and BOLD(⟦CODE(⟦␆⟧)⟧) (SAMP(⟦0x06⟧)) can be used to control the expansion of nonterminals.
These characters cannot interfere with printable source code characters.
⟧⟧)

CMDSYNOPSIS(, defn(⟦common_title_for_regex⟧)⟦: ␂␆⟧, ⟦
m4 rootn.m4 leaf.m4 any.src | gcc …
⟧)

PARA(⟦⟦
Komentáře M4 XCODE(⟦#⟧) a XCODE(⟦dnl⟧) jsou skryty mezi netisknutelné znaky: XCODE(⟦␂#␆⟧) XCODE(⟦␂dnl␆⟧)
⟧,dnl _next_language_
⟦
M4 XCODE(⟦#⟧) and XCODE(⟦dnl⟧) comments are hidden between non printable characters: XCODE(⟦␂#␆⟧) XCODE(⟦␂dnl␆⟧)
⟧⟧)

CMDSYNOPSIS(, defn(⟦common_title_for_regex⟧)⟦: ␂␆⟧, ⟦
sed 's/#\|\<dnl\>/␂&␆/g' any.src | m4 rootn.m4 leaf.m4 - | gcc …
⟧)

CMDSYNOPSIS(, defn(⟦common_title_for_regex⟧, ⟦common_title⟧)⟦: ␂␆⟧, ⟦
sed 's/#/␂#␆/g;s/\<dnl\>/␂dnl␆/g' any.src | m4 rootn.m4 leaf.m4 - | gcc …
⟧)


BRIDGEHEAD(⟦
⟦CODE(⟦⟦⟧⟧) UTF-8 znaky⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) UTF-8 characters⟧,
⟧)

PARA(⟦⟦
Expanzi neterminálů může také řídit vhodně zvolený pár UTF-8 znaků.
Běžný zdrojový kód takové znaky neobsahuje, proto nemusíme řešit kolizi levého řídícího XCODE(⟦LL()⟧) znaku.
UTF-8 znaky nabízí podobné výhody jako netisknutelné znaky.
⟧,dnl _next_language_
⟦
Expansion of nonterminals can also be controlled by a suitably selected UTF-8 character pair.
The usual source code does not contain such characters, so we do not have to solve the collision of the left control XCODE(⟦LL()⟧) character.
UTF-8 characters offer similar advantages to non printable characters.
⟧⟧)

CMDSYNOPSIS(, defn(⟦common_title_for_regex⟧)⟦: ⟦⟧⟧, ⟦
m4 rootu.m4 leaf.m4 any.src | gcc …
⟧)

PARA(⟦⟦
Komentáře M4 XCODE(⟦#⟧) a XCODE(⟦dnl⟧) jsou skryty mezi UTF-8 znaky: XCODE(⟦⟦#⟧⟧) XCODE(⟦⟦dnl⟧⟧)
⟧,dnl _next_language_
⟦
M4 XCODE(⟦#⟧) and XCODE(⟦dnl⟧) comments are hidden between UTF-8 characters: XCODE(⟦⟦#⟧⟧) XCODE(⟦⟦dnl⟧⟧)
⟧⟧)

CMDSYNOPSIS(, defn(⟦common_title_for_regex⟧)⟦: ⟦⟧⟧, ⟦
sed 's/#\|\<dnl\>/⟦⟦&⟧⟧/g' any.src | m4 rootu.m4 leaf.m4 - | gcc …
⟧)

CMDSYNOPSIS(, defn(⟦common_title_for_regex⟧, ⟦common_title⟧)⟦: ⟦⟧⟧, ⟦
sed 's/#/⟦#⟧/g;s/\<dnl\>/⟦dnl⟧/g' any.src | m4 rootu.m4 leaf.m4 - | gcc …
⟧)

undefine(⟦common_title_for_regex⟧, ⟦common_title⟧)

PARA_MONO(⟦⟦
try_it_yourself() LINK(⟦preproc_examples⟧, ⟦preproc_examples⟧)
⟧⟧)

BRIDGEHEAD(⟦
⟦Smíšený režim⟧,
dnl _next_language_
⟦Mixed mode⟧,
⟧)

PARA(⟦⟦
Smíšený režim je kombinací předchozích režimů a⟦⟧NB()je používán hlavně na pokusy.
Data nejsou oddělena od transformačních pravidel.
Listový soubor CODE(⟦leaf.m4⟧) obsahuje definice těchto pravidel spolu se vstupními daty.
⟧,dnl _next_language_
⟦
The mixed mode is a⟦⟧NB()combination of the previous modes and is mainly used for experiments.
The data is not separated from the rules for its transformation.
The leaf file CODE(⟦leaf.m4⟧) contains transformation rule definitions along with input data.
⟧⟧)

CMDSYNOPSIS(, LANG(⟦jak se naučit M4⟧, ⟦how to learn M4⟧), ⟦
m4 root.m4 leaf.m4
⟧)

PARA_MONO(⟦⟦
try_it_yourself() LINK(⟦m4_on_examples⟧, ⟦m4_on_examples⟧)
⟧⟧)


CHAPTER(⟦prerequisites_for_mastering⟧, ⟦
⟦Předpoklady pro zvládnutí M4⟧,
dnl _next_language_
⟦Prerequisites for mastering M4⟧,
⟧)

PARA(⟦⟦
Pro úspěšné zvládnutí tohoto makro jazyka je důležité splnit několik předpokladů.
M4 není jednoduchý jazyk, protože není možné v⟦⟧NB()něm myslet a⟦⟧NB()programovat jako v⟦⟧NB()běžném programovacím jazyce.
Nejdůležitější je uvědomit si, že se v⟦⟧NB()něm programují přepisovací pravidla gramatiky.
Každý řetězec je buď terminální nebo neterminální symbol včetně všech klíčových slov jazyka (symboly XCODE(⟦#⟧) a⟦⟧NB()CODE(⟦,⟧) jsou speciální případy neterminálů).
⟧,dnl _next_language_
⟦
To successfully master this macro language it is important to fulfill several prerequisites.
M4 is not a⟦⟧NB()simple language because it is not possible to think and program in it like an ordinary programming language.
The most important thing to realize is that it is used to program the grammar rules for rewriting.
Each string is either a⟦⟧NB()terminal or a⟦⟧NB()nonterminal symbol, including all language keywords (the symbols XCODE(⟦#⟧) and CODE(⟦,⟧) are special cases of nonterminals).
⟧⟧)

NOTE_WRAP(, defn(⟦WORD_NOTE⟧), ⟦

PLAIN_TEXT(⟦⟦
M4 záměrně nemá klíčová slova pro BOLD(⟦cykly⟧) (CODE(⟦for⟧)/CODE(⟦while⟧)), protože jeho základ je zcela jiný, než jaký mají procedurální nebo funkcionální jazyky.
⟧,dnl _next_language_
⟦
M4 intentionally does not have keywords for BOLD(⟦cycles⟧) (CODE(⟦for⟧)/CODE(⟦while⟧)) because its basis is quite different from procedural or functional languages.
⟧⟧)

HORIZONTAL_RULE()

ITEMIZEDLIST_WRAP(⟦

LISTITEM(⟦⟦
BOLD(⟦cykly⟧) jsou pouze levorekurzivní nebo pravorekurzivní
⟧,dnl _next_language_
⟦
BOLD(⟦loops⟧) are only left-recursive or right-recursive
⟧⟧)

LISTITEM(⟦⟦
BOLD(⟦větví⟧) se LINK(⟦řetězením symbolů⟧, ⟦branching_in_m4⟧) nebo klíčovými slovy CODE(⟦ifelse()⟧), CODE(⟦ifdef()⟧)
⟧,dnl _next_language_
⟦
BOLD(⟦branching⟧) is made by LINK(⟦symbol concatenation⟧, ⟦branching_in_m4⟧) or CODE(⟦ifelse()⟧), CODE(⟦ifdef()⟧) keywords
⟧⟧)

⟧)dnl ITEMIZEDLIST_WRAP

⟧)dnl NOTE_WRAP


SECT1(⟦
⟦Základy gramatik⟧,
dnl _next_language_
⟦Fundamentals of grammars⟧,
⟧)

PARA(⟦⟦
Základem všech gramatik jsou HEXPLAIN(⟦přepisovací pravidla⟧, ⟦⟦⟦6⟧, ⟦formal_definition⟧⟧⟧), jejichž podobu obecně popisuje:
⟧,dnl _next_language_
⟦
All grammars are based on the HEXPLAIN(⟦rules for rewriting⟧, ⟦⟦⟦6⟧, ⟦formal_definition⟧⟧⟧) and their forms are generally described:
⟧⟧)

BRIDGEHEAD(⟦formal_grammar_chomsky⟧, ⟦
⟦Formální gramatika (Chomského typu)⟧,
dnl _next_language_
⟦Formal grammar (Chomsky type)⟧,
⟧)

PROGRAMLISTING(⟦formal_definition⟧, ⟦
G = (N, Σ, P, S)
N: LANG(⟦konečná množina neterminálních symbolů⟧, ⟦a finite set of nonterminal symbols⟧)
Σ: LANG(⟦konečná množina terminálních symbolů⟧, ⟦a finite set of terminal symbols⟧)
   N ∩ Σ = ø
P: LANG(⟦konečná množina přepisovacích pravidel⟧, ⟦a finite set of production (rewrite) rules⟧)
   MM(⟦(N ∪ Σ)*⟧, x) MM(⟦N⟧, s) MM(⟦(N ∪ Σ)*⟧, x) → MM(⟦(N ∪ Σ)*⟧, s)
S: LANG(⟦je počáteční (startovací) symbol⟧, ⟦is the start symbol⟧)
   S ∈ N
⟧)dnl PROGRAMLISTING

PARA(⟦⟦
ULINK(⟦Formální gramatika⟧, ⟦Wikipedie⟧, ⟦https://cs.wikipedia.org/wiki/Form%C3%A1ln%C3%AD_gramatika⟧) popisuje ULINK(⟦podmnožiny⟧, ⟦Chomského hierarchie
(Wikipedie)⟧, ⟦https://cs.wikipedia.org/wiki/Chomsk%C3%A9ho_hierarchie⟧)
přepisovacích pravidel ULINK(⟦formálního jazyka⟧, ⟦Wikipedie⟧, ⟦https://cs.wikipedia.org/wiki/Form%C3%A1ln%C3%AD_jazyk⟧).
Jedna z⟦⟧NB()podmnožin se jmenuje HEXPLAIN(⟦ULINK(⟦bezkontextová gramatika⟧, ⟦Wikipedie⟧, ⟦https://cs.wikipedia.org/wiki/Bezkontextov%C3%A1_gramatika⟧)⟧, ⟦⟦⟦S,X⟧, ⟦formal_definition⟧⟧⟧),
krátce ABBREV(⟦CFG⟧, ⟦Context-Free Grammar – bezkontextová gramatika⟧).
Jak již bylo dříve zmíněno, přepisovací pravidla CFG pracují stejně jako přepisovací pravidla jazyka M4.
Některý z⟦⟧NB()následujících dílů seriálu se podrobněji zaměří na formální gramatiky.
⟧,dnl _next_language_
⟦
The ULINK(⟦Formal grammar⟧, ⟦Wikipedia⟧, ⟦https://en.wikipedia.org/wiki/Formal_grammar⟧) describes the ULINK(⟦subsets⟧, ⟦Chomsky hierarchy
(Wikipedie)⟧, ⟦https://en.wikipedia.org/wiki/Chomsky_hierarchy⟧) of the
ULINK(⟦formal language⟧, ⟦Wikipedia⟧, ⟦https://en.wikipedia.org/wiki/Formal_language⟧)
rewriting rules and one of the subsets is called HEXPLAIN(⟦ULINK(⟦context-free grammar⟧, ⟦Wikipedia⟧, ⟦https://en.wikipedia.org/wiki/Context-free_grammar⟧)⟧, ⟦⟦⟦S,X⟧, ⟦formal_definition⟧⟧⟧),
shortly ABBREV(⟦CFG⟧, ⟦Context-Free Grammar⟧).
As mentioned earlier, the CFG rewriting rules work the same as the M4 rewriting rules.
Some of the following episodes of this series will focus on formal grammar in detail.
⟧⟧)


SECT1(⟦
⟦Základy automatů⟧,
dnl _next_language_
⟦Fundamentals of automata⟧,
⟧)

PARA(⟦⟦
Schopnost používat převážně dvoustavové automaty je zásadní věc pro psaní jednoduchých M4 skriptů, protože převážná většina skriptů používá LINK(⟦malé automaty⟧, ⟦small_automaton⟧).
⟧,dnl _next_language_
⟦
The ability to use predominantly two-state automata is an essential thing for writing simple M4 scripts because the vast majority of scripts use LINK(⟦small automata⟧, ⟦small_automaton⟧).
⟧⟧)

BRIDGEHEAD(⟦testing_automaton⟧, ⟦
⟦Testovací automat⟧,
dnl _next_language_
⟦Testing automaton⟧,
⟧)

PARA(⟦⟦
Pořadí vstupních symbolů nebo jejich kontext lze otestovat automatem.
Splňují-li vstupní symboly požadované vlastnosti, automat skončí v⟦⟧NB()uzlu s⟦⟧NB()dvojitým kroužkem, kterým se označuje akceptující stav.
⟧,dnl _next_language_
⟦
The order of input symbols or their context can be tested by an automaton.
If the input symbols meet the required properties, the automaton ends up in⟦⟧NB()a⟦⟧NB()double-ring node which indicates the accepting state.
⟧⟧)

IMAGEDATA(⟦dfa_img⟧,dnl id
LANG(⟦deterministický konečný automat⟧, ⟦deterministic finite automaton⟧)⟦ (DFA)⟧,dnl title
⟦⟧,dnl class
⟦⟧,dnl style
⟦⟧,dnl anything
⟦img/dfa.png, https://i.iinfo.cz/images/149/dfa-1.png⟧,dnl src
⟦⟦
Příklad automatu⟦⟧REF(⟦Teorie automatů⟧, ⟦From Wikipedia, the free encyclopedia⟧, ⟦https://cs.wikipedia.org/wiki/Teorie_automat%C5%AF⟧, ⟦Wikipedie⟧) akceptující sudý počet (žádný je také sudý) symbolů CODE(⟦0⟧), ignorující symboly CODE(⟦1⟧).
Automat je shodný s⟦⟧NB()regulárním výrazem CODE(⟦(1*01*01*)*1*⟧).
⟧,dnl _next_language_
⟦
Example of an automaton⟦⟧REF(⟦Automata theory⟧, ⟦From Wikipedia, the free encyclopedia⟧, ⟦https://en.wikipedia.org/wiki/Automata_theory⟧, ⟦Wikipedia⟧) accepting an even number (none is even) of symbols CODE(⟦0⟧), ignoring symbols CODE(⟦1⟧).
The automaton is the same as the regular expression CODE(⟦(1*01*01*)*1*⟧).
⟧⟧)

PARA(⟦⟦
Předchozí automat lze zapsat jako ASCII art doprovázející M4 skript:
⟧,dnl _next_language_
⟦
The previous automaton can be written as an ASCII art accompanying the M4 script:
⟧⟧)

PROGRAMLISTING(, ⟦ASCII art ⟧LANG(⟦jako dokumentace M4 kódu⟧, ⟦for M4 code documentation⟧), ⟦
#          ____1
#         |   /
#      ___V__/   0    ____
# --->// S1 \\------>/ S2 \---.1
#     \\____//<------\____/<--'
#                0
⟧)dnl PROGRAMLISTING

BRIDGEHEAD(⟦generating_automaton⟧, ⟦
⟦Generující automat⟧,
dnl _next_language_
⟦Generating automaton⟧,
⟧)

PARA(⟦⟦
Vstupní symboly mění uzly automatu, čímž zároveň mění přepisovací pravidla pro generování kódu.
Příklad LINK(⟦generujícího automatu⟧, ⟦json_generating_automaton⟧) naleznete v⟦⟧NB()příloze:
⟧,dnl _next_language_
⟦
Input symbols change the nodes of the automaton, thereby changing the rewriting rules for code generation.
See the appendix for LINK(⟦this generating automaton⟧, ⟦json_generating_automaton⟧):
⟧⟧)

PROGRAMLISTING(, ⟦ASCII art ⟧LANG(⟦generujícího automatu⟧, ⟦of generating automaton⟧), ⟦
#      _______      ___________
# --->/ ERROR \--->/ NEXT_ITEM \---.
#     \_______/    \___________/<--'
⟧)dnl PROGRAMLISTING

_PARA(⟦⟦
První symbol ve stavu CODE(⟦ERROR⟧) vygeneruje záhlaví se závorkami a⟦⟧NB()vloží první položku.
Poté automat přejde do stavu CODE(⟦NEXT_ITEM⟧), ve kterém se pouze přidávají další položky.
Automat zůstává v⟦⟧NB()tomto stavu, dokud nejsou zpracována všechna data.
⟧,dnl _next_language_
⟦
The first symbol in the CODE(⟦ERROR⟧) state generates a⟦⟧NB()header with brackets and inserts the first item.
Then automaton make transition to CODE(⟦NEXT_ITEM⟧) state in which only next items are added.
The automaton remains in this state until all data has been processed.
⟧⟧)


SECT1(⟦
⟦(GNU) make⟧,
dnl _next_language_
⟦(GNU) make⟧,
⟧)

PARA(⟦⟦
Dobře navržený generátor kódu se obvykle skládá z⟦⟧NB()několika menších souborů, jejichž pořadí, závislosti a⟦⟧NB()parametry se zapisují do souboru CODE(⟦Makefile⟧).
Dobrá znalost tvorby CODE(⟦Makefile⟧) je proto základním předpokladem pro zvládnutí M4.
Čtení a údržba zdrojového kódu celkově zabere vždy více času než jeho tvorba.
Dobře strukturovaný CODE(⟦Makefile⟧) proto zásadním způsobem přispívá k⟦⟧NB()celkové přehlednosti výsledného generátoru kódu.
⟧,dnl _next_language_
⟦
A⟦⟧NB()well-designed code generator usually consists of several smaller files whose order, dependencies and parameters are written to the CODE(⟦Makefile⟧) file.
Good knowledge of CODE(⟦Makefile⟧) writing is therefore a⟦⟧NB()prerequisite for mastering M4.
Reading and maintaining source code generally takes more time than creating it.
A⟦⟧NB()well-structured CODE(⟦Makefile⟧) therefore significantly contributes to the overall clarity of the resulting code generator.
⟧⟧)

NOTE(, LANG(⟦tímto tématem se budeme zabývat jindy⟧, ⟦we will deal with this topic at another part⟧), ⟦⟦
Spouštění CODE(⟦make⟧)⟦⟧REF(⟦GNU Make Manual⟧, ⟦Free Software Foundation⟧, ⟦https://www.gnu.org/software/make/manual/make.html⟧) z⟦⟧NB()editoru kódu pomocí vhodné klávesové zkratky zásadně urychluje vývoj M4 kódu.
Soubor CODE(⟦~/.vimrc⟧) obsahuje XCODE(⟦nnoremap ⟦⟧LT()c-j⟦⟧GT() :make⟦⟧LT()cr⟦⟧GT()⟧).
⟧,dnl _next_language_
⟦
Executing CODE(⟦make⟧)⟦⟧REF(⟦GNU Make Manual⟧, ⟦Free Software Foundation⟧, ⟦https://www.gnu.org/software/make/manual/make.html⟧) from the code editor with a⟦⟧NB()shortcut key will significantly speed up M4 code development.
The file CODE(⟦~/.vimrc⟧) contains XCODE(⟦nnoremap ⟦⟧LT()c-j⟦⟧GT() :make⟦⟧LT()cr⟦⟧GT()⟧).
⟧⟧)


SECT1(⟦
⟦Vim⟧,
dnl _next_language_
⟦Vim⟧,
⟧)

PARA(⟦⟦
Zvládnutí editoru Vim⟦⟧REF(⟦Vim – všudypřítomný textový editor⟧, ⟦který edituje text rychlostí myšlenky⟧, ⟦https://www.vim.org/⟧) je důležitým předpokladem pro pohodlí a⟦⟧NB()rychlost psaní kódu M4.
Vim zkratky, definované klíčovým slovem CODE(⟦iabbrev⟧), ušetří velké množství zbytečně napsaného textu.
Tyto zkratky také významně snižují výskyt téměř neviditelných chyb způsobených nepárovou závorkou, čímž šetří ztracený čas vynaložený na ladění kódu.
⟧,dnl _next_language_
⟦
Mastering the Vim⟦⟧REF(⟦Vim – the ubiquitous text editor⟧, ⟦that edits text at the speed of thought⟧, ⟦https://www.vim.org/⟧) editor is an important prerequisite for the convenience and speed of writing M4 code.
Vim shortcuts, defined by the CODE(⟦iabbrev⟧) keyword, will save large amounts of unnecessary typing.
These shortcuts also significantly reduce the occurrence of almost invisible errors caused by an unpaired bracket, thus saving the lost time spent on debugging.
⟧⟧)


SECT1(⟦
⟦Talent a čas⟧,
dnl _next_language_
⟦Talent and time⟧,
⟧)

PARA(⟦⟦
M4 obvykle nejde zcela zvládnout přes víkend, zvláště chybí-li základy⟦⟧REF(⟦Automaty a⟦⟧NB()formální jazyky I⟧, ⟦Učební text FI MU⟧, ⟦https://is.muni.cz/elportal/estud/fi/js06/ib005/Formalni_jazyky_a_automaty_I.pdf⟧)
ULINK(⟦teorie⟦⟧NB()automatů⟧, ⟦Wikipedie⟧, ⟦https://cs.wikipedia.org/wiki/Teorie_automat%C5%AF⟧) a⟦⟧NB()ULINK(⟦formálních⟦⟧NB()gramatik⟧, ⟦Wikipedie⟧, ⟦https://cs.wikipedia.org/wiki/Form%C3%A1ln%C3%AD_gramatika⟧).
Ke zvládnutí jazyka M4 je nutné v⟦⟧NB()něm programovat delší období a⟦⟧NB()napsat množství špatného (složitého) M4 kódu, který z⟦⟧NB()vlastní vůle přepíšete kvůli lepšímu nápadu.
Tímto způsobem je možné postupně získat praxi.
⟧,dnl _next_language_
⟦
M4 usually cannot be mastered over the weekend, especially when the fundamentals⟦⟧REF(⟦Automaty a⟦⟧NB()formální jazyky I⟧, ⟦Učební text FI MU⟧, ⟦https://is.muni.cz/elportal/estud/fi/js06/ib005/Formalni_jazyky_a_automaty_I.pdf⟧) of
ULINK(⟦automata theory⟧, ⟦Wikipedia⟧, ⟦https://en.wikipedia.org/wiki/Automata_theory⟧) and ULINK(⟦formal⟦⟧NB()grammars⟧, ⟦Wikipedia⟧, ⟦https://en.wikipedia.org/wiki/Formal_grammar⟧) are lacking.
In order to master the M4 language, it is necessary to program in a⟦⟧NB()longer period of time and write amounts of bad (complex) M4 code that you rewrite for a⟦⟧NB()better idea.
In this way it is possible to gradually gain practice.
⟧⟧)

# a reference to a book that inspired me 😍
⟦⟧REF(⟦Automaty a⟦⟧NB()gramatiky⟧, ⟦Michal Chytil, 1. vydání, Praha, 331 s. 1984.⟧, ⟦https://is.muni.cz/publication/173173⟧)


APPENDIX(⟦code_generation_examples⟧, ⟦
⟦Příklady generování kódu⟧,
dnl _next_language_
⟦Code generation examples⟧,
⟧)

NOTE(, defn(⟦WORD_NOTE⟧), ⟦⟦
Příklady v⟦⟧NB()této příloze jsou složitější a⟦⟧NB()jejich cílem je ukázat praktické použití jazyka M4.
Podrobněji budou vysvětleny později.
⟧,dnl _next_language_
⟦
The examples in this appendix are more complex and are intended to demonstrate the practical use of M4.
They will be explained in detail later.
⟧⟧)


SECT1(⟦input_source_code⟧, ⟦
⟦CODE(⟦⟦⟧⟧) Vstupní zdrojový kód⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) Input source code⟧,
⟧)

PARA(⟦⟦
Vstupní zdrojový kód je podobný ABBREV(⟦CSV⟧, ⟦Comma Separated Values⟧), který se převede na libovolně složitý cílový kód jiného jazyka pomocí ABBREV(⟦CFG⟧, ⟦Context-Free Grammar – bezkontextová gramatika⟧), automatů a⟦⟧NB()výstupních front.
Zásobníky v⟦⟧NB()příkladech nejsou použity.
Vstupní zdrojový kód obsahuje speciální znaky, které je nutné skrýt:
⟧,dnl _next_language_
⟦
The input source code is similar to ABBREV(⟦CSV⟧, ⟦Comma Separated Values⟧), which is converted to arbitrarily complex target code of another language using ABBREV(⟦CFG⟧, ⟦Context-Free Grammar⟧), automata and output queues.
Stacks in the examples are not used.
The input source code contains special characters that must be hidden:
⟧⟧)

TEXTDATA(⟦messages/messages_raw.mc⟧,, ⟦s/\<ERROR\>/MM(r)/g⟧)

NOTE(, defn(⟦WORD_NOTE⟧), ⟦⟦
Vstupní soubor může také obsahovat poznámky, které nemusí být skryté v⟦⟧NB()komentářích XCODE(⟦#⟧), XCODE(⟦dnl⟧), CODE(⟦ifelse([…])⟧) nebo CODE(⟦[… někde uvnitř závorek …]⟧).
⟧,dnl _next_language_
⟦
The input file may also contain notes that may not be hidden in the comments XCODE(⟦#⟧), XCODE(⟦dnl⟧), CODE(⟦ifelse([…])⟧) or CODE(⟦[… somewhere inside brackets …]⟧).
⟧⟧)


SECT1(⟦
⟦CODE(⟦⟦⟧⟧) CSV: nejjednodušší příklad⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) CSV: simplest example⟧,
⟧)

PARA(⟦⟦
Tento příklad nepoužívá výstupní fronty, HEXPLAIN(⟦pouze vypisuje⟧, ⟦⟦⟦R, 5⟧, ⟦messages/hello.csv.m4⟧⟧, ⟦⟦1-3⟧, ⟦messages/hello.csv⟧⟧, ⟦⟦R, 3, 5, 7⟧, ⟦messages/messages_raw.mc⟧⟧⟧) ABBREV(⟦CSV⟧, ⟦Comma Separated Values⟧) oddělené znakem CODE(⟦TAB⟧) na HEXPLAIN(⟦standardní výstup⟧, ⟦⟦⟦4⟧, ⟦messages/hello.csv.m4⟧⟧⟧).
⟧,dnl _next_language_
⟦
This example does not use output queues, HEXPLAIN(⟦it only prints⟧, ⟦⟦⟦R, 5⟧, ⟦messages/hello.csv.m4⟧⟧, ⟦⟦1-3⟧, ⟦messages/hello.csv⟧⟧, ⟦⟦R, 3, 5, 7⟧, ⟦messages/messages_raw.mc⟧⟧⟧) ABBREV(⟦CSV⟧, ⟦Comma Separated Values⟧) separated by CODE(⟦TAB⟧) to HEXPLAIN(⟦standard output⟧, ⟦⟦⟦4⟧, ⟦messages/hello.csv.m4⟧⟧⟧).
⟧⟧)

TEXTDATA(⟦messages/hello.csv.m4⟧,, ⟦s/\<ERROR\>/MM(r)/g⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦messages/hello.csv.m4⟧, ⟦messages/messages_raw.mc⟧, ⟦messages/hello.csv⟧)
TEXTDATA(⟦messages/hello.csv⟧)


SECT1(⟦
⟦CODE(⟦⟦⟧⟧) CSV: počítadlo⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) CSV: counter⟧,
⟧)

PARA(⟦⟦
Příklad používá makro HCODE(⟦COUNT_UP⟧, ⟦⟦⟦A⟧, ⟦messages/counter.csv.m4⟧⟧⟧) ze souboru CODE(⟦countb.m4⟧), jehož ABBREV(⟦CODE(⟦β⟧)⟧, ⟦pravá strana přepisovacího pravidla⟧) se zkopíruje do pravé strany makra HCODE(⟦COUNTER⟧, ⟦⟦⟦2⟧, ⟦messages/counter.csv.m4⟧⟧⟧).
Během první expanze HCODE(⟦COUNTER⟧, ⟦⟦⟦5⟧, ⟦messages/counter.csv.m4⟧⟧⟧) proběhne inicializace jeho startovací hodnoty.
HEXPLAIN(⟦Další expanze⟧, ⟦⟦⟦B⟧, ⟦messages/counter.csv.m4⟧⟧⟧) vrátí HEXPLAIN(⟦číselný terminální symbol⟧, ⟦⟦⟦A⟧, ⟦messages/counter.csv⟧⟧⟧) a⟦⟧NB()proběhne zvýšení vnitřního pomocného (globálního) symbolu o⟦⟧NB()jedničku.
CODE(⟦COUNTER⟧) je malý automat.
⟧,dnl _next_language_
⟦
The example uses the HCODE(⟦COUNT_UP⟧, ⟦⟦⟦A⟧, ⟦messages/counter.csv.m4⟧⟧⟧) macro from the CODE(⟦countb.m4⟧) file whose ABBREV(⟦CODE(⟦β⟧)⟧, ⟦the right side of the rewriting rule⟧) is copied to the right side of the HCODE(⟦COUNTER⟧, ⟦⟦⟦2⟧, ⟦messages/counter.csv.m4⟧⟧⟧) macro.
During the first expansion of HCODE(⟦COUNTER⟧, ⟦⟦⟦5⟧, ⟦messages/counter.csv.m4⟧⟧⟧) its initial value is initialized.
HEXPLAIN(⟦Further expansion⟧, ⟦⟦⟦B⟧, ⟦messages/counter.csv.m4⟧⟧⟧) returns HEXPLAIN(⟦the numeric terminal symbol⟧, ⟦⟦⟦A⟧, ⟦messages/counter.csv⟧⟧⟧) and increases the inner auxiliary (global) symbol by one.
CODE(⟦COUNTER⟧) is a⟦⟧NB()small automaton.
⟧⟧)

TEXTDATA(⟦messages/counter.csv.m4⟧,, ⟦
s/\<COUNT_UP\>/MM(a)/
/\<ERR_\>/s/\<COUNTER\>/MM(b)/
⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦gfiles/countb.m4⟧, ⟦messages/counter.csv.m4⟧, ⟦messages/messages_raw.mc⟧, ⟦messages/counter.csv⟧)
TEXTDATA(⟦messages/counter.csv⟧,, ⟦
/^ERR_/s/[[:digit:]]\+/MM(a)/
⟧)


SECT1(⟦
⟦CODE(⟦💡⟧, ⟦jak se to dělá⟧,, ⟦cursor:help⟧) Úpravy speciálních znaků⟧,
dnl _next_language_
⟦CODE(⟦💡⟧, ⟦how to do it⟧,, ⟦cursor:help⟧) Modification of special characters⟧,
⟧)

PARA(⟦⟦
Každý typ výstupního kódu vyžaduje úpravu speciálních znaků.
Klíčové slovo jazyka M4 CODE(⟦patsubst()⟧) je nevhodné pro tento úkol.
Všechny speciální znaky vstupního souboru proto napřed skryjeme do HEXPLAIN(⟦vhodně pojmenovaných maker⟧, ⟦⟦⟦A⟧, ⟦messages/messages.mc⟧⟧⟧) pomocí regulárních výrazů.
⟧,dnl _next_language_
⟦
Each type of output code requires the modification of the special characters.
The M4 CODE(⟦patsubst()⟧) keyword is inappropriate for this type of task.
First, we hide all special characters of the input file into HEXPLAIN(⟦appropriately named macros⟧, ⟦⟦⟦A⟧, ⟦messages/messages.mc⟧⟧⟧) using regular expressions.
⟧⟧)

BRIDGEHEAD(⟦modified_input_source_code⟧, ⟦
⟦Upravený vstupní kód⟧,
dnl _next_language_
⟦Modified input code⟧,
⟧)

TEXTDATA(⟦messages/messages.mc⟧, LANG(⟦všechny speciální znaky jsou skryty do maker⟧, ⟦all special characters are hidden into macros⟧), ⟦
s/[[:upper:]]\+()/MM(a)/g
⟧)

TODO: zkotrolovat
_PARA(⟦⟦
Vytvoříme několik převodních souborů podle typu cílového kódu, makra pro hranaté závorky CODE(⟦[⟧) a CODE(⟦]⟧) jsou už definována v⟦⟧NB()kořenovém souboru.
⟧,dnl _next_language_
⟦
We create several conversion files according to the target code type, CODE(⟦[⟧) and CODE(⟦]⟧) macros for square brackets are already defined in the root file.
⟧⟧)

define(⟦conv_file⟧, LANG(⟦Převodní soubor pro⟧, ⟦Conversion file for⟧))

BRIDGEHEAD_MONO(⟦
⟦CODE(⟦⟦⟧⟧) conv_file XML⟦,⟧ XSLT⟦,⟧ HTML⟧,
⟧)

TEXTDATA(⟦messages/markup.m4⟧, LANG(⟦převodní soubor pro značkovací jazyky⟧, ⟦conversion file for markup languages⟧))

# hide  ‘"’ → DQ(), because of title="… &quot; … &quot; …"
BRIDGEHEAD(⟦
⟦CODE(⟦⟦⟧⟧) conv_file C⟦,⟧ JSON⟦,⟧ INI: XCODE(⟦DQ()řetězec⟦⟧DQ()⟧)⟧,
⟦CODE(⟦⟦⟧⟧) conv_file C⟦,⟧ JSON⟦,⟧ INI: XCODE(⟦DQ()string⟦⟧DQ()⟧)⟧,
⟧)

TEXTDATA(⟦messages/code.m4⟧, LANG(⟦převodní soubor pro zdrojový kód⟧, ⟦conversion file for a source code⟧))

# hide ‘"’ → DQ(), because of title="… &quot; … &quot; …"
BRIDGEHEAD(⟦
⟦CODE(⟦⟦⟧⟧) conv_file Bash: XCODE(⟦DQ()řetězec⟦⟧DQ()⟧)⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) conv_file Bash: XCODE(⟦DQ()string⟦⟧DQ()⟧)⟧,
⟧)

TEXTDATA(⟦messages/doubleq.m4⟧, XLANG(⟦převodní soubor pro Bash ⟦⟧DQ()řetězce v uvozovkách⟦⟧DQ()⟧, ⟦conversion file for Bash ⟦⟧DQ()strings in quotation marks⟦⟧DQ()⟧))

BRIDGEHEAD(⟦
⟦CODE(⟦⟦⟧⟧) conv_file Bash: XCODE(⟦AP()řetězec⟦⟧AP()⟧)⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) conv_file Bash: XCODE(⟦AP()string⟦⟧AP()⟧)⟧,
⟧)

TEXTDATA(⟦messages/apost.m4⟧, LANG(⟦převodní soubor pro Bash 'řetězce v apostrofech'⟧, ⟦conversion file for Bash 'strings in apostrophes'⟧))

BRIDGEHEAD(⟦
⟦CODE(⟦⟦⟧⟧) conv_file CSV⟦,⟧ M4 (vrátí všechny znaky zpátky)⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) conv_file CSV⟦,⟧ M4 (returns all characters)⟧,
⟧)undefine(⟦conv_file⟧)

TEXTDATA(⟦messages/unchanged.m4⟧, LANG(⟦převodní soubor vrátí všechny speciální znaky zpátky⟧, ⟦the conversion file puts all special characters back⟧))


SECT1(⟦
⟦CODE(⟦⟦⟧⟧) C: výstupní fronta⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) C: output queue⟧,
⟧)

PARA(⟦⟦
Příklad používá jednu HEXPLAIN(⟦výstupní frontu⟧, ⟦⟦⟦15⟧, ⟦messages/array.c.m4⟧⟧⟧) na znaky HCODE(⟦};⟧, ⟦⟦⟦16⟧, ⟦messages/array.c.m4⟧⟧, ⟦⟦9⟧, ⟦messages/array.c⟧⟧⟧) pro uzavření HEXPLAIN(⟦pole⟧, ⟦⟦⟦6-8⟧, ⟦messages/array.c⟧⟧, ⟦⟦5⟧, ⟦messages/array.c.m4⟧⟧⟧) na konci skriptu.
⟧,dnl _next_language_
⟦
The example uses one HEXPLAIN(⟦output queue⟧, ⟦⟦⟦15⟧, ⟦messages/array.c.m4⟧⟧⟧) for characters HCODE(⟦};⟧, ⟦⟦⟦16⟧, ⟦messages/array.c.m4⟧⟧, ⟦⟦9⟧, ⟦messages/array.c⟧⟧⟧) to close the HEXPLAIN(⟦array⟧, ⟦⟦⟦6-8⟧, ⟦messages/array.c⟧⟧, ⟦⟦5⟧, ⟦messages/array.c.m4⟧⟧⟧) at the end.
⟧⟧)

TEXTDATA(⟦messages/array.c.m4⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦messages/array.c.m4⟧, ⟦messages/code.m4⟧, ⟦messages/messages.mc⟧, ⟦messages/array.c⟧)
TEXTDATA(⟦messages/array.c⟧)


SECT1(⟦
⟦CODE(⟦⟦⟧⟧) INI: externí příkaz⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) INI: an external command⟧,
⟧)

PARA(⟦⟦
Příklad spustí externí příkaz HCODE(⟦date⟧, ⟦⟦⟦D⟧, ⟦messages/hello.ini.m4⟧⟧, ⟦⟦3⟧, ⟦messages/hello.ini⟧⟧⟧) a⟦⟧NB()jeho výstup umístí do hranatých závorek.
Výstupem externího příkazu jsou HEXPLAIN(⟦dvě položky oddělené čárkou⟧, ⟦⟦⟦A⟧, ⟦messages/hello.ini.m4⟧⟧⟧).
Makro HCODE(⟦SARG1()⟧, ⟦⟦⟦C⟧, ⟦messages/hello.ini.m4⟧⟧⟧) HEXPLAIN(⟦vybere první položku⟧, ⟦⟦⟦B⟧, ⟦messages/hello.ini.m4⟧⟧⟧), protože druhá položka obsahuje nežádoucí znak nového řádku CODE(⟦LF⟧) (SAMP(⟦0x0a⟧)).
⟧,dnl _next_language_
⟦
The example runs an external HCODE(⟦date⟧, ⟦⟦⟦D⟧, ⟦messages/hello.ini.m4⟧⟧, ⟦⟦3⟧, ⟦messages/hello.ini⟧⟧⟧) command and places its output in square brackets.
The output of an external command are HEXPLAIN(⟦two comma-separated items⟧, ⟦⟦⟦A⟧, ⟦messages/hello.ini.m4⟧⟧⟧).
The HCODE(⟦SARG1()⟧, ⟦⟦⟦C⟧, ⟦messages/hello.ini.m4⟧⟧⟧) macro HEXPLAIN(⟦selects the first item⟧, ⟦⟦⟦B⟧, ⟦messages/hello.ini.m4⟧⟧⟧) because the second item contains an unwanted CODE(⟦LF⟧) (SAMP(⟦0x0a⟧)) new line character.
⟧⟧)

TEXTDATA(⟦messages/hello.ini.m4⟧,, ⟦
/\<esyscmd\>/{
s/+\([^,]*\)/+<span class="NSP()b">\1<\x2fspan>/
s/,/MM(a)/
s/SARG1/MM(c)/
s/date \x27[^\x27]\+\x27/MM(d)/
}
⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦messages/hello.ini.m4⟧, ⟦messages/code.m4⟧, ⟦messages/messages.mc⟧, ⟦messages/hello.ini⟧)
TEXTDATA(⟦messages/hello.ini⟧)


SECT1(⟦
⟦CODE(⟦⟦⟧⟧) .h: hex počítadlo⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) .h: hex counter⟧,
⟧)

PARA(⟦⟦
Příklad používá makro HCODE(⟦COUNTER⟧, ⟦⟦⟦A, 2⟧, ⟦messages/messages.h.m4⟧⟧⟧) pro číslování výsledných ABBREV(⟦CPP⟧, ⟦Preprocesor jazyka C⟧) HEXPLAIN(⟦maker⟧, ⟦⟦⟦11⟧, ⟦messages/messages.h.m4⟧⟧, ⟦⟦8-10⟧, ⟦messages/messages.h⟧⟧⟧) a⟦⟧NB()jednu výstupní frontu.
Fronta číslo HCODE(⟦1⟧, ⟦⟦⟦23⟧, ⟦messages/messages.h.m4⟧⟧⟧) obsahuje direktivu preprocesoru HXCODE(⟦#endif⟧, ⟦⟦⟦24⟧, ⟦messages/messages.h.m4⟧⟧, ⟦⟦12⟧, ⟦messages/messages.h⟧⟧⟧) pro zakončení hlavičkového souboru.
Převod dekadické hodnoty počítadla na HEXPLAIN(⟦dvoumístné hex-a číslo⟧, ⟦⟦⟦B⟧, ⟦messages/messages.h.m4⟧⟧⟧) provádí klíčové slovo HCODE(⟦eval()⟧, ⟦⟦⟦C⟧, ⟦messages/messages.h.m4⟧⟧⟧).
⟧,dnl _next_language_
⟦
The example uses the HCODE(⟦COUNTER⟧, ⟦⟦⟦A, 2⟧, ⟦messages/messages.h.m4⟧⟧⟧) macro to number the resulting ABBREV(⟦CPP⟧, ⟦C preprocessor⟧) HEXPLAIN(⟦macros⟧, ⟦⟦⟦11⟧, ⟦messages/messages.h.m4⟧⟧, ⟦⟦8-10⟧, ⟦messages/messages.h⟧⟧⟧) and one output queue.
The queue number HCODE(⟦1⟧, ⟦⟦⟦23⟧, ⟦messages/messages.h.m4⟧⟧⟧) contains the preprocessor directive HXCODE(⟦#endif⟧, ⟦⟦⟦24⟧, ⟦messages/messages.h.m4⟧⟧, ⟦⟦12⟧, ⟦messages/messages.h⟧⟧⟧) to terminate the header file.
The decimal value of the counter is converted to the HEXPLAIN(⟦two-digit hex⟧, ⟦⟦⟦B⟧, ⟦messages/messages.h.m4⟧⟧⟧) by keyword HCODE(⟦eval()⟧, ⟦⟦⟦C⟧, ⟦messages/messages.h.m4⟧⟧⟧).
⟧⟧)

TEXTDATA(⟦messages/messages.h.m4⟧,, ⟦
s/\<COUNTER\>\((0)\)\?/MM(a)/g
/\<eval\>/{
s//MM(c)/
s/\<16, 2\>/MM(b)/
}
⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦gfiles/countb.m4⟧, ⟦messages/messages.h.m4⟧, ⟦messages/messages.mc⟧, ⟦messages/messages.h⟧)
TEXTDATA(⟦messages/messages.h⟧)


SECT1(⟦small_automaton⟧, ⟦
⟦CODE(⟦⟦⟧⟧) C: malý automat⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) C: small automaton⟧,
⟧)

PARA(⟦⟦
Příklad používá HEXPLAIN(⟦malý automat⟧, ⟦⟦⟦1-4⟧, ⟦messages/stringl.c.m4⟧⟧⟧) HCODE(⟦NEW_LINE⟧, ⟦⟦⟦7⟧, ⟦messages/stringl.c.m4⟧⟧⟧) pro generování znaku nového řádku HXCODE(⟦LF()⟧, ⟦⟦⟦A⟧, ⟦messages/stringl.c.m4⟧⟧, ⟦⟦A⟧, ⟦messages/stringl.c⟧⟧⟧) a⟦⟧NB()jednu výstupní frontu číslo HCODE(⟦1⟧, ⟦⟦⟦22⟧, ⟦messages/stringl.c.m4⟧⟧⟧) do které se vloží znaky HXCODE(⟦DQT();⟧, ⟦⟦⟦B⟧, ⟦messages/stringl.c.m4⟧⟧⟧) pro uzavření výsledného řetězce.
Poprvé se HCODE(⟦NEW_LINE⟧, ⟦⟦⟦C⟧, ⟦messages/stringl.c.m4⟧⟧⟧) přepíše na ABBREV(⟦HCODE(⟦ε⟧, ⟦⟦⟦D⟧, ⟦messages/stringl.c.m4⟧⟧⟧)⟧, ⟦epsilon – prázdný symbol⟧), podruhé a dále se přepíše na HXCODE(⟦LF()⟧, ⟦⟦⟦A⟧, ⟦messages/stringl.c.m4⟧⟧, ⟦⟦A⟧, ⟦messages/stringl.c⟧⟧⟧).
⟧,dnl _next_language_
⟦
The example uses HEXPLAIN(⟦a⟦⟧NB()small automaton⟧, ⟦⟦⟦1-4⟧, ⟦messages/stringl.c.m4⟧⟧⟧) HCODE(⟦NEW_LINE⟧, ⟦⟦⟦7⟧, ⟦messages/stringl.c.m4⟧⟧⟧) to generate a⟦⟧NB()newline HXCODE(⟦LF()⟧, ⟦⟦⟦A⟧, ⟦messages/stringl.c.m4⟧⟧, ⟦⟦A⟧, ⟦messages/stringl.c⟧⟧⟧) character and one output queue number HCODE(⟦1⟧, ⟦⟦⟦22⟧, ⟦messages/stringl.c.m4⟧⟧⟧) containing HXCODE(⟦DQT()⟧, ⟦⟦⟦B⟧, ⟦messages/stringl.c.m4⟧⟧⟧) characters to terminate resulting string.
Run the first time HCODE(⟦NEW_LINE⟧, ⟦⟦⟦C⟧, ⟦messages/stringl.c.m4⟧⟧⟧), is rewritten to ABBREV(⟦HCODE(⟦ε⟧, ⟦⟦⟦D⟧, ⟦messages/stringl.c.m4⟧⟧⟧)⟧, ⟦epsilon – empty symbol⟧), in all following ones, it is rewritten to HXCODE(⟦LF()⟧, ⟦⟦⟦A⟧, ⟦messages/stringl.c.m4⟧⟧, ⟦⟦A⟧, ⟦messages/stringl.c⟧⟧⟧).
⟧⟧)

TEXTDATA(⟦messages/stringl.c.m4⟧,, ⟦
s/\\n/MM(a)/
s/";/MM(b)/
s/ε/MM(d)/
/divert/s/\<NEW_LINE\>/MM(c)/
⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦messages/stringl.c.m4⟧, ⟦messages/code.m4⟧, ⟦messages/messages.mc⟧, ⟦messages/stringl.c⟧)
TEXTDATA(⟦messages/stringl.c⟧,, ⟦
s/\\n/MM(a)/g
⟧)


SECT1(⟦
⟦CODE(⟦⟦⟧⟧) C: malý automat 2⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) C: small automaton 2⟧,
⟧)

PARA(⟦⟦
Tento příklad je podobný předchozímu, avšak každý řetězec HEXPLAIN(⟦je na novém řádku⟧, ⟦⟦⟦A⟧, ⟦messages/string.c.m4⟧⟧, ⟦⟦A⟧, ⟦messages/string.c⟧⟧⟧).
⟧,dnl _next_language_
⟦
This example is similar to the previous one, but each string is on a⟦⟧NB()HEXPLAIN(⟦new line⟧, ⟦⟦⟦A⟧, ⟦messages/string.c.m4⟧⟧, ⟦⟦A⟧, ⟦messages/string.c⟧⟧⟧).
⟧⟧)

TEXTDATA_MLH(⟦messages/string.c.m4⟧,, ⟦s/\\n"\n"/MM(a)/⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦messages/string.c.m4⟧, ⟦messages/code.m4⟧, ⟦messages/messages.mc⟧, ⟦messages/string.c⟧)
TEXTDATA_MLH(⟦messages/string.c⟧,, ⟦s/\\n"\n"/MM(a)/g⟧)


SECT1(⟦output_queues_html⟧, ⟦
⟦CODE(⟦⟦⟧⟧) HTML: výstupní fronty⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) HTML: output queues⟧,
⟧)

PARA(⟦⟦
Příklad používá HEXPLAIN(⟦dvě výstupní fronty⟧, ⟦⟦⟦9, 27, 29⟧, ⟦messages/messages.html.m4⟧⟧⟧).
Fronta číslo HCODE(⟦1⟧, ⟦⟦⟦9, 27⟧, ⟦messages/messages.html.m4⟧⟧⟧) obsahuje HEXPLAIN(⟦odstavce⟧, ⟦⟦⟦10⟧, ⟦messages/messages.html.m4⟧⟧, ⟦⟦16-21⟧, ⟦messages/messages.html⟧⟧⟧),
fronta číslo HCODE(⟦2⟧, ⟦⟦⟦29⟧, ⟦messages/messages.html.m4⟧⟧⟧) HEXPLAIN(⟦uzavírací značky HTML⟧, ⟦⟦⟦30-31⟧, ⟦messages/messages.html.m4⟧⟧, ⟦⟦22-23⟧, ⟦messages/messages.html⟧⟧⟧) stránky.
HEXPLAIN(⟦Navigační odkazy⟧, ⟦⟦⟦8⟧, ⟦messages/messages.html.m4⟧⟧, ⟦⟦9-14⟧, ⟦messages/messages.html⟧⟧⟧) nemusí být nikde uloženy, HEXPLAIN(⟦jdou přímo na výstup⟧, ⟦⟦⟦7⟧, ⟦messages/messages.html.m4⟧⟧⟧).
Zprávy typu HCODE(⟦QUERY⟧, ⟦⟦⟦15⟧, ⟦messages/messages.html.m4⟧⟧⟧) a⟦⟧NB()HCODE(⟦WARNING⟧, ⟦⟦⟦16⟧, ⟦messages/messages.html.m4⟧⟧⟧) jsou zpracovány stejně jako zprávy typu HCODE(⟦ERROR⟧, ⟦⟦⟦5-12⟧, ⟦messages/messages.html.m4⟧⟧⟧).
⟧,dnl _next_language_
⟦
The example uses HEXPLAIN(⟦two output queues⟧, ⟦⟦⟦9, 27, 29⟧, ⟦messages/messages.html.m4⟧⟧⟧).
The queue number HCODE(⟦1⟧, ⟦⟦⟦9, 27⟧, ⟦messages/messages.html.m4⟧⟧⟧) contains HEXPLAIN(⟦paragraphs⟧, ⟦⟦⟦10⟧, ⟦messages/messages.html.m4⟧⟧, ⟦⟦16-21⟧, ⟦messages/messages.html⟧⟧⟧).
The queue number HCODE(⟦2⟧, ⟦⟦⟦29⟧, ⟦messages/messages.html.m4⟧⟧⟧) contains HEXPLAIN(⟦closing HTML tags⟧, ⟦⟦⟦30-31⟧, ⟦messages/messages.html.m4⟧⟧, ⟦⟦22-23⟧, ⟦messages/messages.html⟧⟧⟧).
HEXPLAIN(⟦Navigation links⟧, ⟦⟦⟦8⟧, ⟦messages/messages.html.m4⟧⟧, ⟦⟦9-14⟧, ⟦messages/messages.html⟧⟧⟧) do not have to be stored anywhere, they HEXPLAIN(⟦go straight to the output⟧, ⟦⟦⟦7⟧, ⟦messages/messages.html.m4⟧⟧⟧).
The HCODE(⟦QUERY⟧, ⟦⟦⟦15⟧, ⟦messages/messages.html.m4⟧⟧⟧) and HCODE(⟦WARNING⟧, ⟦⟦⟦16⟧, ⟦messages/messages.html.m4⟧⟧⟧) messages are processed in the same way as the HCODE(⟦ERROR⟧, ⟦⟦⟦5-12⟧, ⟦messages/messages.html.m4⟧⟧⟧) messages.
⟧⟧)

TEXTDATA(⟦messages/messages.html.m4⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦messages/messages.html.m4⟧, ⟦messages/markup.m4⟧, ⟦messages/messages.mc⟧, ⟦messages/messages.html⟧)
TEXTDATA(⟦messages/messages.html⟧)


SECT1(⟦branching_in_m4⟧, ⟦
⟦CODE(⟦⟦⟧⟧) Větvení gramatikou⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) Branching by grammar⟧,
⟧)

PARA(⟦⟦
Příklad ukazuje LINK(⟦větvení gramatikou⟧, ⟦branching_by_grammar⟧), argumenty maker se ignorují.
Vstupní neterminály se přepisují na terminály HCODE(⟦ERROR → 🐛⟧, ⟦🐛⟧, ⟦⟦⟦6, 13⟧, ⟦messages/insect.txt.m4⟧⟧, ⟦⟦A⟧, ⟦messages/insect.txt⟧⟧⟧),
HCODE(⟦QUERY → 🐜⟧, ⟦🐜⟧, ⟦⟦⟦6, 14⟧, ⟦messages/insect.txt.m4⟧⟧, ⟦⟦B⟧, ⟦messages/insect.txt⟧⟧⟧),
HCODE(⟦WARNING → 🐝⟧, ⟦🐝⟧, ⟦⟦⟦6, 15⟧, ⟦messages/insect.txt.m4⟧⟧, ⟦⟦C⟧, ⟦messages/insect.txt⟧⟧⟧).
⟧,dnl _next_language_
⟦
The example shows LINK(⟦branching by grammar⟧, ⟦branching_by_grammar⟧), macro arguments are ignored.
Input nonterminals are rewritten to terminals HCODE(⟦ERROR → 🐛⟧, ⟦🐛⟧, ⟦⟦⟦6, 13⟧, ⟦messages/insect.txt.m4⟧⟧, ⟦⟦A⟧, ⟦messages/insect.txt⟧⟧⟧),
HCODE(⟦QUERY → 🐜⟧, ⟦🐜⟧, ⟦⟦⟦6, 14⟧, ⟦messages/insect.txt.m4⟧⟧, ⟦⟦B⟧, ⟦messages/insect.txt⟧⟧⟧),
HCODE(⟦WARNING → 🐝⟧, ⟦🐝⟧, ⟦⟦⟦6, 15⟧, ⟦messages/insect.txt.m4⟧⟧, ⟦⟦C⟧, ⟦messages/insect.txt⟧⟧⟧).
⟧⟧)

TEXTDATA(⟦messages/insect.txt.m4⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦messages/insect.txt.m4⟧, ⟦messages/messages.mc⟧, ⟦messages/insect.txt⟧)
TEXTDATA(⟦messages/insect.txt⟧,, ⟦
s/🐛/MM(a)/g
s/🐜/MM(b)/g
s/🐝/MM(c)/g
⟧)

BRIDGEHEAD(⟦branching_by_grammar⟧, ⟦
⟦Větvení gramatikou – základní princip⟧,
dnl _next_language_
⟦Branching by grammar – basic principle⟧,
⟧)

PARA(⟦⟦
Proměnná HXCODE(⟦⟦$⟧0⟧, ⟦⟦⟦A⟧, ⟦nonterminals_for_branches⟧⟧⟧) se nahradí za HEXPLAIN(⟦jméno makra⟧, ⟦⟦⟦B⟧, ⟦nonterminals_for_branches⟧⟧⟧) a⟦⟧NB()HEXPLAIN(⟦zřetězí se s⟦⟧NB()dalším symbolem⟧, ⟦⟦⟦C⟧, ⟦nonterminals_for_branches⟧⟧⟧).
HEXPLAIN(⟦Nově vzniklý neterminál⟧, ⟦⟦⟦B, C⟧, ⟦nonterminals_for_branches⟧⟧⟧) se přepíše na odpovídající HEXPLAIN(⟦terminální symbol⟧, ⟦⟦⟦D⟧, ⟦nonterminals_for_branches⟧⟧⟧) (číslo fronty nebo jméno).
⟧,dnl _next_language_
⟦
The HXCODE(⟦⟦$⟧0⟧, ⟦⟦⟦A⟧, ⟦nonterminals_for_branches⟧⟧⟧) variable is replaced by HEXPLAIN(⟦the name of the macro⟧, ⟦⟦⟦B⟧, ⟦nonterminals_for_branches⟧⟧⟧) and HEXPLAIN(⟦concatenated with another symbol⟧, ⟦⟦⟦C⟧, ⟦nonterminals_for_branches⟧⟧⟧).
HEXPLAIN(⟦The newly formed nonterminal⟧, ⟦⟦⟦B, C⟧, ⟦nonterminals_for_branches⟧⟧⟧) is rewritten to the corresponding HEXPLAIN(⟦terminal symbol⟧, ⟦⟦⟦D⟧, ⟦nonterminals_for_branches⟧⟧⟧) (queue number or name).
⟧⟧)

PROGRAMLISTING(⟦nonterminals_for_branches⟧, LANG(⟦větvení gramatikou v M4⟧, ⟦grammar branching in M4⟧), ⟦
MM(⟦⟦$⟧0⟧, a)_QU → MM(⟦ERROR⟧, b)⟦⟧MM(⟦_QU⟧, c) → MM(⟦2⟧, d)
MM(⟦⟦$⟧0⟧, a)_END → MM(⟦ERROR⟧, b)⟦⟧MM(⟦_END⟧, c) → MM(⟦3⟧, d)
MM(⟦⟦$⟧0⟧, a)_NAME → MM(⟦ERROR⟧, b)⟦⟧MM(⟦_NAME⟧, c) → MM(⟦error⟧, d)
MM(⟦⟦$⟧0⟧, a)_QU → MM(⟦QUERY⟧, b)⟦⟧MM(⟦_QU⟧, c) → MM(⟦0⟧, d)
MM(⟦⟦$⟧0⟧, a)_END → MM(⟦QUERY⟧, b)⟦⟧MM(⟦_END⟧, c) → MM(⟦1⟧, d)
MM(⟦⟦$⟧0⟧, a)_NAME → MM(⟦QUERY⟧, b)⟦⟧MM(⟦_NAME⟧, c) → MM(⟦query⟧, d)
…
⟧)dnl PROGRAMLISTING


SECT1(⟦json_generating_automaton⟧, ⟦
⟦CODE(⟦⟦⟧⟧) JSON: generující automat⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) JSON: generating automaton⟧,
⟧)

PARA(⟦⟦
Příklad používá HEXPLAIN(⟦dvě výstupní fronty⟧, ⟦⟦⟦14, 30⟧, ⟦messages/atm.json.m4⟧⟧⟧) a⟦⟧NB()jeden HEXPLAIN(⟦generující automat⟧, ⟦⟦⟦1-3⟧, ⟦messages/atm.json.m4⟧⟧⟧).
První chybová zpráva CODE(⟦ERROR(⟦…⟧)⟧) ve stavu HCODE(⟦ERROR⟧, ⟦⟦⟦6-17⟧, ⟦messages/atm.json.m4⟧⟧⟧) vygeneruje HEXPLAIN(⟦záhlaví se závorkami⟧, ⟦⟦⟦12, 15⟧, ⟦messages/atm.json.m4⟧⟧, ⟦⟦3, 7⟧, ⟦messages/atm.json⟧⟧⟧) a⟦⟧NB()vypíše HEXPLAIN(⟦na výstup⟧, ⟦⟦⟦11⟧, ⟦messages/atm.json.m4⟧⟧⟧) HEXPLAIN(⟦první záznam⟧, ⟦⟦⟦13⟧, ⟦messages/atm.json.m4⟧⟧, ⟦⟦4⟧, ⟦messages/atm.json⟧⟧⟧).
HEXPLAIN(⟦Automat přejde⟧, ⟦⟦⟦8, 9⟧, ⟦messages/atm.json.m4⟧⟧⟧) do stavu HCODE(⟦NEXT_ITEM⟧, ⟦⟦⟦20-25⟧, ⟦messages/atm.json.m4⟧⟧⟧) což je ABBREV(⟦HCODE(⟦β⟧, ⟦⟦⟦19⟧, ⟦messages/atm.json.m4⟧⟧⟧) pravidlo⟧, ⟦takové pravidlo se používá jako pravá strana jiného přepisovacího pravidla⟧).
Následující chybové zprávy ve stavu HCODE(⟦NEXT_ITEM⟧, ⟦⟦⟦20-25⟧, ⟦messages/atm.json.m4⟧⟧⟧) pouze HEXPLAIN(⟦vypisují na výstup⟧, ⟦⟦⟦22⟧, ⟦messages/atm.json.m4⟧⟧⟧) HEXPLAIN(⟦jednotlivé záznamy⟧, ⟦⟦⟦23⟧, ⟦messages/atm.json.m4⟧⟧, ⟦⟦5, 6⟧, ⟦messages/atm.json⟧⟧⟧).
Na závěr výstupní fronty číslo HCODE(⟦1⟧, ⟦⟦⟦14⟧, ⟦messages/atm.json.m4⟧⟧⟧) a⟦⟧NB()HCODE(⟦2⟧, ⟦⟦⟦30⟧, ⟦messages/atm.json.m4⟧⟧⟧) vypíšou znaky HXCODE(⟦]⟧, ⟦⟦⟦15⟧, ⟦messages/atm.json.m4⟧⟧, ⟦⟦7⟧, ⟦messages/atm.json⟧⟧⟧) a⟦⟧NB()HCODE(⟦}}⟧, ⟦⟦⟦31⟧, ⟦messages/atm.json.m4⟧⟧, ⟦⟦8⟧, ⟦messages/atm.json⟧⟧⟧) čímž zakončí výsledný JSON.
⟧,dnl _next_language_
⟦
The example uses HEXPLAIN(⟦two output queues⟧, ⟦⟦⟦14, 30⟧, ⟦messages/atm.json.m4⟧⟧⟧) and one HEXPLAIN(⟦generating automaton⟧, ⟦⟦⟦1-3⟧, ⟦messages/atm.json.m4⟧⟧⟧).
The first CODE(⟦ERROR(⟦…⟧)⟧) error message in the HCODE(⟦ERROR⟧, ⟦⟦⟦6-17⟧, ⟦messages/atm.json.m4⟧⟧⟧) state generates HEXPLAIN(⟦a⟦⟧NB()header with brackets⟧, ⟦⟦⟦12, 15⟧, ⟦messages/atm.json.m4⟧⟧, ⟦⟦3, 7⟧, ⟦messages/atm.json⟧⟧⟧) and HEXPLAIN(⟦outputs⟧, ⟦⟦⟦11⟧, ⟦messages/atm.json.m4⟧⟧⟧) HEXPLAIN(⟦the first record⟧, ⟦⟦⟦13⟧, ⟦messages/atm.json.m4⟧⟧, ⟦⟦4⟧, ⟦messages/atm.json⟧⟧⟧).
HEXPLAIN(⟦The automaton goes⟧, ⟦⟦⟦8, 9⟧, ⟦messages/atm.json.m4⟧⟧⟧) to the state HCODE(⟦NEXT_ITEM⟧, ⟦⟦⟦20-25⟧, ⟦messages/atm.json.m4⟧⟧⟧) which is a⟦⟧NB()ABBREV(⟦HCODE(⟦β⟧, ⟦⟦⟦19⟧, ⟦messages/atm.json.m4⟧⟧⟧) rule⟧, ⟦the rule is used as the right side of another rewriting rule⟧).
The following error messages in the HCODE(⟦NEXT_ITEM⟧, ⟦⟦⟦20-25⟧, ⟦messages/atm.json.m4⟧⟧⟧) state only HEXPLAIN(⟦output⟧, ⟦⟦⟦22⟧, ⟦messages/atm.json.m4⟧⟧⟧) HEXPLAIN(⟦individual records⟧, ⟦⟦⟦23⟧, ⟦messages/atm.json.m4⟧⟧, ⟦⟦5, 6⟧, ⟦messages/atm.json⟧⟧⟧).
At the end the output queue number HCODE(⟦1⟧, ⟦⟦⟦14⟧, ⟦messages/atm.json.m4⟧⟧⟧) and number HCODE(⟦2⟧, ⟦⟦⟦30⟧, ⟦messages/atm.json.m4⟧⟧⟧) print the characters HXCODE(⟦]⟧, ⟦⟦⟦15⟧, ⟦messages/atm.json.m4⟧⟧, ⟦⟦7⟧, ⟦messages/atm.json⟧⟧⟧) and HCODE(⟦}}⟧, ⟦⟦⟦31⟧, ⟦messages/atm.json.m4⟧⟧, ⟦⟦8⟧, ⟦messages/atm.json⟧⟧⟧) to close the resulting JSON.
⟧⟧)

TEXTDATA(⟦messages/atm.json.m4⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦messages/atm.json.m4⟧, ⟦messages/code.m4⟧, ⟦messages/messages.mc⟧, ⟦messages/atm.json⟧)
TEXTDATA(⟦messages/atm.json⟧)


SECT2(⟦json_branch⟧, ⟦
⟦CODE(⟦⟦⟧⟧) JSON: pojmenované fronty⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) JSON: named queues⟧,
⟧)

PARA(⟦⟦
Příklad zpracovává další zprávy typu CODE(⟦QUERY⟧) a⟦⟧NB()CODE(⟦WARNING⟧).
Používá tři automaty a⟦⟧NB()šest výstupních front.
Generujeme-li složitější zdrojový kód, brzy narazíme na problém udržení konzistence indexů pro výstupní fronty.
Abychom se vyhnuli zmatku, pojmenujeme si fronty a⟦⟧NB()místo čísel používáme jména.
Abychom nemuseli definovat podobná pravidla, zkopírujeme si pravou stranu CODE(⟦ERROR⟧) (je to také ABBREV(⟦HCODE(⟦β⟧, ⟦⟦⟦21⟧, ⟦messages/qnames.json.m4⟧⟧⟧) pravidlo⟧, ⟦takové pravidlo se používá jako pravá strana jiného přepisovacího pravidla⟧)) do pravé strany pravidel CODE(⟦QUERY⟧) a⟦⟧NB()CODE(⟦WARNING⟧).
⟧,dnl _next_language_
⟦
The example processes other types of messages CODE(⟦QUERY⟧) and CODE(⟦WARNING⟧).
It uses three automata and six output queues.
If we generate more complex source code, we will soon encounter the problem of maintaining index consistency for output queues.
To avoid confusion, we use queue names instead of numbers.
To avoid having to define similar rules, we copy the right side of CODE(⟦ERROR⟧) (it is also a⟦⟧NB()ABBREV(⟦HCODE(⟦β⟧, ⟦⟦⟦21⟧, ⟦messages/qnames.json.m4⟧⟧⟧) rule⟧, ⟦the rule is used as the right side of another rewriting rule⟧)) to the right side of the CODE(⟦QUERY⟧) and CODE(⟦WARNING⟧) rules.
⟧⟧)

TEXTDATA(⟦messages/qnames.json.m4⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦messages/qnames.json.m4⟧, ⟦messages/code.m4⟧, ⟦messages/messages.mc⟧, ⟦messages/qnames.json⟧)
TEXTDATA(⟦messages/qnames.json⟧)


SECT2(⟦json_symbolic_queue_names⟧, ⟦
⟦CODE(⟦⟦⟧⟧) JSON: generované indexy front⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) JSON: generated queue indexes⟧,
⟧)

PARA(⟦⟦
Během vývoje se často mění pořadí a⟦⟧NB()počet výstupních front, což také vyžaduje častou změnu jejich indexů.
HEXPLAIN(⟦Indexy je proto vhodné generovat⟧, ⟦⟦⟦A⟧, ⟦messages/queues.m4⟧⟧⟧).
Můžeme pak používat prakticky neomezený počet front.
Následující příklad ukazuje, jak se tyto indexy generují.
⟧,dnl _next_language_
⟦
During development, the order and number of output queues often change, which also requires frequent changes of their indexes.
HEXPLAIN(⟦It is therefore appropriate to generate indexes⟧, ⟦⟦⟦A⟧, ⟦messages/queues.m4⟧⟧⟧).
We can then use a⟦⟧NB()virtually unlimited number of queues.
The following example shows how these indexes are generated.
⟧⟧)

TEXTDATA(⟦messages/queues.m4⟧,, ⟦/\<QUEUE_INDEX\>)$/s/\<QUEUE_INDEX\>/MM(a)/⟧)
TEXTDATA(⟦messages/messages.json.m4⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦gfiles/countb.m4⟧, ⟦messages/queues.m4⟧, ⟦messages/messages.json.m4⟧, ⟦messages/code.m4⟧, ⟦messages/messages.mc⟧, ⟦messages/messages.json⟧)
TEXTDATA(⟦messages/messages.json⟧)


SECT1(⟦
⟦CODE(⟦⟦⟧⟧) INI: nespojitý index front⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) INI: discontinuous queue index⟧,
⟧)

PARA(⟦⟦
Příklad používá HEXPLAIN(⟦tři automaty⟧, ⟦⟦⟦1-4⟧, ⟦messages/messages.ini.m4⟧⟧⟧) a⟦⟧NB()dvě výstupní fronty číslo HCODE(⟦2⟧, ⟦⟦⟦10, 26⟧, ⟦messages/messages.ini.m4⟧⟧⟧) a⟦⟧NB()HCODE(⟦4⟧, ⟦⟦⟦10, 26⟧, ⟦messages/messages.ini.m4⟧⟧⟧) definované v⟦⟧NB()odděleném souboru.
HEXPLAIN(⟦Názvy INI sekcí⟧, ⟦⟦⟦11⟧, ⟦messages/messages.ini.m4⟧⟧, ⟦⟦3, 6, 11⟧, ⟦messages/messages.ini⟧⟧⟧) jsou generovány HEXPLAIN(⟦řetězením symbolů⟧, ⟦⟦⟦A, R⟧, ⟦messages/messages.ini.m4⟧⟧⟧) (viz. LINK(⟦větvení⟧, ⟦branching_by_grammar⟧)).
Příklad používá stejný soubor pro výstupní fronty jako LINK(⟦příklad⟧, ⟦json_symbolic_queue_names⟧) pro generování JSON.
⟧,dnl _next_language_
⟦
The example uses HEXPLAIN(⟦three automata⟧, ⟦⟦⟦1-4⟧, ⟦messages/messages.ini.m4⟧⟧⟧) and two output queues number HCODE(⟦2⟧, ⟦⟦⟦10, 26⟧, ⟦messages/messages.ini.m4⟧⟧⟧) and HCODE(⟦4⟧, ⟦⟦⟦10, 26⟧, ⟦messages/messages.ini.m4⟧⟧⟧) defined in a⟦⟧NB()separate file.
HEXPLAIN(⟦INI section names⟧, ⟦⟦⟦11⟧, ⟦messages/messages.ini.m4⟧⟧, ⟦⟦3, 6, 11⟧, ⟦messages/messages.ini⟧⟧⟧) are generated by HEXPLAIN(⟦symbol chaining⟧, ⟦⟦⟦A, R⟧, ⟦messages/messages.ini.m4⟧⟧⟧) (see LINK(⟦branching⟧, ⟦branching_by_grammar⟧)).
The example uses the same file for output queues as the LINK(⟦example⟧, ⟦json_symbolic_queue_names⟧) to generate JSON.
⟧⟧)

TEXTDATA(⟦messages/messages.ini.m4⟧,, ⟦/^\[/s/\(.0\)\(_NAME\)/<span class="NSP()r">\1<\x2fspan><span class="NSP()a">\2<\x2fspan>/⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦messages/messages.ini.m4⟧, ⟦gfiles/countb.m4⟧, ⟦messages/queues.m4⟧, ⟦messages/code.m4⟧, ⟦messages/messages.mc⟧, ⟦messages/messages.ini⟧)
TEXTDATA(⟦messages/messages.ini⟧)


SECT1(⟦
⟦CODE(⟦⟦⟧⟧) XML: smíšené zprávy⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) XML: mixed messages⟧,
⟧)

PARA(⟦⟦
Příklad používá jednu výstupní frontu číslo HCODE(⟦1⟧, ⟦⟦⟦21⟧, ⟦messages/mixed.xml.m4⟧⟧⟧) pro uzavírací značku HXCODE(⟦⟦⟧LT()/messages⟦⟧GT()⟧, ⟦⟦⟦22⟧, ⟦messages/mixed.xml.m4⟧⟧, ⟦⟦28⟧, ⟦messages/mixed.xml⟧⟧⟧).
⟧,dnl _next_language_
⟦
The example uses one output queue number HCODE(⟦1⟧, ⟦⟦⟦21⟧, ⟦messages/mixed.xml.m4⟧⟧⟧) for the HXCODE(⟦⟦⟧LT()/messages⟦⟧GT()⟧, ⟦⟦⟦22⟧, ⟦messages/mixed.xml.m4⟧⟧, ⟦⟦28⟧, ⟦messages/mixed.xml⟧⟧⟧) closing tag.
⟧⟧)

TEXTDATA(⟦messages/mixed.xml.m4⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦messages/queues.m4⟧, ⟦messages/mixed.xml.m4⟧, ⟦messages/markup.m4⟧, ⟦messages/messages.mc⟧, ⟦messages/mixed.xml⟧)
TEXTDATA(⟦messages/mixed.xml⟧)


SECT1(⟦
⟦CODE(⟦⟦⟧⟧) XML: oddělené zprávy⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) XML: separated messages⟧,
⟧)

PARA(⟦⟦
Příklad seskupuje zprávy podle jejich typu pomocí výstupních front.
⟧,dnl _next_language_
⟦
The example groups messages by their type using output queues.
⟧⟧)

TEXTDATA(⟦messages/messages.xml.m4⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦messages/queues.m4⟧, ⟦messages/messages.xml.m4⟧, ⟦messages/markup.m4⟧, ⟦messages/messages.mc⟧, ⟦messages/messages.xml⟧)
TEXTDATA(⟦messages/messages.xml⟧)


SECT1(⟦
⟦CODE(⟦⟦⟧⟧) Bash XCODE(⟦PROMPT() echo ⟦⟧DQ()řetězec⟦⟧DQ()⟧)⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) Bash XCODE(⟦PROMPT() echo ⟦⟧DQ()string⟦⟧DQ()⟧)⟧,
⟧)

TEXTDATA(⟦messages/doubleq.sh.m4⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦messages/doubleq.sh.m4⟧, ⟦messages/doubleq.m4⟧, ⟦messages/messages.mc⟧, ⟦messages/doubleq.sh⟧)
TEXTDATA(⟦messages/doubleq.sh⟧)


SECT1(⟦
⟦CODE(⟦⟦⟧⟧) Bash XCODE(⟦PROMPT() echo 'řetězec'⟧)⟧,
dnl _next_language_
⟦CODE(⟦⟦⟧⟧) Bash XCODE(⟦PROMPT() echo 'string'⟧)⟧,
⟧)

TEXTDATA(⟦messages/apost.sh.m4⟧)
EXECUTED(⟦m4⟧, ⟦gfiles/root0u.m4⟧, ⟦messages/apost.sh.m4⟧, ⟦messages/apost.m4⟧, ⟦messages/messages.mc⟧, ⟦messages/apost.sh⟧)
TEXTDATA(⟦messages/apost.sh⟧)


APPENDIX(⟦preproc_examples⟧, ⟦
⟦Příklady preprocesoru⟧,
dnl _next_language_
⟦Preprocessor examples⟧,
⟧)

SECT1(⟦cpp_and_m4⟧, ⟦
⟦CODE(⟦`'⟧) Preprocesor jazyka C⟦⟧NB()a⟦⟧NB()M4⟧,
dnl _next_language_
⟦CODE(⟦`'⟧) C⟦⟧NB()preprocessor and M4⟧,
⟧)

PARA(⟦⟦
Direktivy ULINK(⟦CPP⟧, ⟦Preprocesor jazyka C⟧, ⟦https://cs.wikipedia.org/wiki/Preprocesor_jazyka_C⟧) jsou pro M4 jednořádkový komentář, což brání nežádoucí expanzi stejně pojmenovaných maker.
Definujeme-li bezpečnější makro HCODE(⟦SAF()⟧, ⟦⟦⟦5⟧, ⟦preproc/file.c.m4⟧⟧, ⟦⟦12⟧, ⟦preproc/file.c⟧⟧⟧), stejně pojmenované makro HCODE(⟦SAF ()⟧, ⟦⟦⟦8, 11⟧, ⟦preproc/file.c⟧⟧⟧) nebude přepsáno.
Jmenný prostor ABBREV(⟦CPP⟧, ⟦Preprocesor jazyka C⟧) tak BOLD(⟦může⟧) být zcela oddělen od jmenného prostoru M4.
Problematický znak XCODE(⟦`⟧) je skryt do makra HCODE(⟦LL()⟧, ⟦⟦⟦24⟧, ⟦preproc/file.c⟧⟧⟧).
Apostrof HCODE(⟦'⟧, ⟦⟦⟦A⟧, ⟦preproc/file.c⟧⟧, ⟦⟦A⟧, ⟦preproc/preproc.file.c⟧⟧⟧) ve zdrojovém kódu ničemu nevadí.
Apostrof uvnitř makra HXCODE(⟦ORD⟦⟧STRIKETHROUGH(⟦SPAN(⟦()⟧,,, ⟦color:rgba(0,0,0,.75)⟧)⟧,,, ⟦color:red⟧)⟧, ⟦⟦⟦4⟧, ⟦preproc/file.c.m4⟧⟧, ⟦⟦B⟧, ⟦preproc/file.c⟧⟧⟧) je skryt do makra HCODE(⟦RR()⟧, ⟦⟦⟦A⟧, ⟦preproc/file.c.m4⟧⟧⟧).
Všimněte si jmen funkcí HCODE(⟦define ()⟧, ⟦⟦⟦17, 27⟧, ⟦preproc/file.c⟧⟧, ⟦⟦17, 27⟧, ⟦preproc/preproc.file.c⟧⟧⟧) nebo HCODE(⟦ifelse ()⟧, ⟦⟦⟦18, 28⟧, ⟦preproc/file.c⟧⟧, ⟦⟦18, 28⟧, ⟦preproc/preproc.file.c⟧⟧⟧) a⟦⟧NB()kde je expandován HCODE(⟦SYMBOL⟧, ⟦⟦⟦C⟧, ⟦preproc/file.c⟧⟧, ⟦⟦C⟧, ⟦preproc/preproc.file.c⟧⟧, ⟦⟦C⟧, ⟦preproc/file.c.m4⟧⟧⟧).
⟧,dnl _next_language_
⟦
The ULINK(⟦CPP⟧, ⟦C preprocessor⟧, ⟦https://en.wikipedia.org/wiki/C_preprocessor⟧) directives are a⟦⟧NB()one-line comment for M4 preventing unwanted expansion of the same named macros.
If we define a⟦⟧NB()safer HCODE(⟦SAF()⟧, ⟦⟦⟦5⟧, ⟦preproc/file.c.m4⟧⟧, ⟦⟦12⟧, ⟦preproc/file.c⟧⟧⟧) macro, the similar HCODE(⟦SAF ()⟧, ⟦⟦⟦8, 11⟧, ⟦preproc/file.c⟧⟧⟧) macro will not be overwritten.
Thus, the ABBREV(⟦CPP⟧, ⟦C preprocessor⟧) namespace BOLD(⟦can be⟧) completely separated from the M4 namespace.
The problematic (backquote) character XCODE(⟦`⟧) is hidden in the HCODE(⟦LL()⟧, ⟦⟦⟦24⟧, ⟦preproc/file.c⟧⟧⟧) macro.
The apostrophe HCODE(⟦'⟧, ⟦⟦⟦A⟧, ⟦preproc/file.c⟧⟧, ⟦⟦A⟧, ⟦preproc/preproc.file.c⟧⟧⟧) does not matter in the source code.
Apostrophe inside HXCODE(⟦ORD⟦⟧STRIKETHROUGH(⟦SPAN(⟦()⟧,,, ⟦color:rgba(0,0,0,.75)⟧)⟧,,, ⟦color:red⟧)⟧, ⟦⟦⟦4⟧, ⟦preproc/file.c.m4⟧⟧, ⟦⟦B⟧, ⟦preproc/file.c⟧⟧⟧) macro is hidden in HCODE(⟦RR()⟧, ⟦⟦⟦A⟧, ⟦preproc/file.c.m4⟧⟧⟧) macro.
Note the HCODE(⟦define ()⟧, ⟦⟦⟦17, 27⟧, ⟦preproc/file.c⟧⟧, ⟦⟦17, 27⟧, ⟦preproc/preproc.file.c⟧⟧⟧) or HCODE(⟦ifelse ()⟧, ⟦⟦⟦18, 28⟧, ⟦preproc/file.c⟧⟧, ⟦⟦18, 28⟧, ⟦preproc/preproc.file.c⟧⟧⟧) function names and where the HCODE(⟦SYMBOL⟧, ⟦⟦⟦C⟧, ⟦preproc/file.c⟧⟧, ⟦⟦C⟧, ⟦preproc/preproc.file.c⟧⟧, ⟦⟦C⟧, ⟦preproc/file.c.m4⟧⟧⟧) is expanded.
⟧⟧)

TEXTDATA(⟦preproc/file.c.m4⟧,, ⟦
s/\<RR()/MM(a)/g
s/\<SYMBOL\>/MM(c)/g
⟧)
TEXTDATA(⟦preproc/file.c⟧,, ⟦
s/\x27/MM(a)/g
s/\<SYMBOL\>/MM(c)/g
/\<define\>/!s/\<ORD\>/MM(b)/
⟧)
EXECUTED(⟦m4 -DSYMBOL='Hello, world!'⟧, ⟦gfiles/root0q.m4⟧, ⟦preproc/file.c.m4⟧, ⟦preproc/file.c⟧, ⟦preproc/preproc.file.c⟧)
TEXTDATA(⟦preproc/preproc.file.c⟧,, ⟦
s/\x27/MM(a)/g
s/\<SYMBOL\>/MM(c)/g
⟧)


SECT1(⟦
⟦CODE(⟦`'⟧) CSS: vložení souboru⟦,⟧ komentář⟧,
dnl _next_language_
⟦CODE(⟦`'⟧) CSS: file inclusion⟦,⟧ comment⟧,
⟧)

PARA(⟦⟦
CSS používá znak HXCODE(⟦#⟧, ⟦⟦⟦A⟧, ⟦preproc/file.css.m4⟧⟧, ⟦⟦A⟧, ⟦preproc/preproc.file.css⟧⟧⟧) pro kódy barev, což je také začátek jednořádkového M4 komentáře.
Klíčové slovo HCODE(⟦changecom(/*,*/)⟧, ⟦⟦⟦A⟧, ⟦preproc/file.css⟧⟧⟧) nastaví víceřádkový komentář HCODE(⟦/* … */⟧, ⟦⟦⟦B⟧, ⟦preproc/preproc.file.css⟧⟧, ⟦⟦C⟧, ⟦preproc/file.css⟧⟧⟧) a⟦⟧NB()přepíše se na ABBREV(⟦CODE(⟦ε⟧)⟧, ⟦epsilon – prázdný symbol⟧).
Komentáře se vypínají stejným klíčovým slovem HCODE(⟦changecom⟧, ⟦⟦⟦B⟧, ⟦preproc/file.css⟧⟧⟧) bez parametrů.
⟧,dnl _next_language_
⟦
CSS uses the HXCODE(⟦#⟧, ⟦⟦⟦A⟧, ⟦preproc/file.css.m4⟧⟧, ⟦⟦A⟧, ⟦preproc/preproc.file.css⟧⟧⟧) character for color codes, which is also the beginning of a⟦⟧NB()one-line M4 comment.
The HCODE(⟦changecom(/*,*/)⟧, ⟦⟦⟦A⟧, ⟦preproc/file.css⟧⟧⟧) keyword sets a⟦⟧NB()multiline HCODE(⟦/* … */⟧, ⟦⟦⟦B⟧, ⟦preproc/preproc.file.css⟧⟧, ⟦⟦C⟧, ⟦preproc/file.css⟧⟧⟧) comment and rewrites itself into ABBREV(⟦CODE(⟦ε⟧)⟧, ⟦epsilon – empty symbol⟧).
The comments can be turned off with the same HCODE(⟦changecom⟧, ⟦⟦⟦B⟧, ⟦preproc/file.css⟧⟧⟧) keyword without parameters.
⟧⟧)

TEXTDATA(⟦preproc/foo.css⟧, LANG(⟦soubor vložený makro procesorem⟧, ⟦file embedded by the macro processor⟧))
TEXTDATA(⟦preproc/file.css.m4⟧,, ⟦/\<define\>/s/#/MM(a)/⟧)
TEXTDATA(⟦preproc/file.css⟧,, ⟦s/changecom(\/\*,\*\/)/MM(a)/;s/^changecom/MM(b)/;/\<DONTE\>/{/\<changecom\>/!s:/\*.*\*/:MM(c):}⟧)
EXECUTED(⟦m4 -DSYMBOL='Hello, world!'⟧, ⟦gfiles/root0q.m4⟧, ⟦preproc/file.css.m4⟧, ⟦preproc/file.css⟧, ⟦preproc/preproc.file.css⟧)
TEXTDATA(⟦preproc/preproc.file.css⟧,, ⟦s/#/MM(a)/g;/\<DONTE\>/s:/\*.*\*/:MM(b):⟧)


SECT1(⟦nprint_bash⟧, ⟦
⟦BOLD(⟦CODE(⟦␂␆⟧)⟧) Bash: netisknutelné znaky⟧,
dnl _next_language_
⟦BOLD(⟦CODE(⟦␂␆⟧)⟧) Bash: nonprintable characters⟧,
⟧)

PARA(⟦⟦
Bash používá oba znaky, CODE(⟦`⟧) a XCODE(⟦[⟧).
Nechceme-li je skrývat do makra CODE(⟦LL()⟧), můžeme použít pro LINK(⟦řízení expanze neterminálů⟧, ⟦expansion_control⟧) HEXPLAIN(⟦netisknutelné znaky⟧, ⟦zobrazené jako UTF-8 znaky⟧, ⟦⟦⟦A⟧, ⟦preproc/file.sh.m4⟧⟧, ⟦⟦A⟧, ⟦preproc/file.sh⟧⟧⟧), viz. příklad:
⟧,dnl _next_language_
⟦
Bash uses both CODE(⟦`⟧) and XCODE(⟦[⟧) characters.
If we do not want to hide them in an CODE(⟦LL()⟧) macro, we can use HEXPLAIN(⟦nonprintable characters⟧, ⟦displayed as UTF-8 characters⟧, ⟦⟦⟦A⟧, ⟦preproc/file.sh.m4⟧⟧, ⟦⟦A⟧, ⟦preproc/file.sh⟧⟧⟧) for LINK(⟦expansion control⟧, ⟦expansion_control⟧), see the example:
⟧⟧)

TEXTDATA(⟦preproc/file.sh.m4⟧,, ⟦s/[␂␆]/MM(a)/g⟧)
TEXTDATA(⟦preproc/file.sh⟧,, ⟦s/[␂␆]/MM(a)/g⟧)
EXECUTED(⟦m4 -DSYMBOL='Hello, world!'⟧, ⟦gfiles/root0n.m4⟧, ⟦preproc/file.sh.m4⟧, ⟦preproc/file.sh⟧, ⟦preproc/preproc.file.sh⟧)
TEXTDATA(⟦preproc/preproc.file.sh⟧)


APPENDIX(⟦m4_on_examples⟧, ⟦
⟦M4: příklady⟧,
dnl _next_language_
⟦M4: examples⟧,
⟧)


SECT1(⟦
⟦CODE(⟦[]⟧) JSON: levá závorka XCODE(⟦[⟧)⟧,
dnl _next_language_
⟦CODE(⟦[]⟧) JSON: left bracket XCODE(⟦[⟧)⟧,
⟧)

PARA(⟦⟦
Uvnitř hranatých závorek CODE(⟦[… se neterminály neexpandují …]⟧).
Proto je levá hranatá závorka XCODE(⟦[⟧) nahrazena makrem HCODE(⟦LL()⟧, ⟦⟦⟦6⟧, ⟦hello_world/json.m4⟧⟧, ⟦⟦3⟧, ⟦hello_world/hello_world.json⟧⟧⟧) z⟦⟧NB()kořenového souboru.
⟧,dnl _next_language_
⟦
The CODE(⟦[… nonterminals are not expanded …]⟧) inside square brackets.
Therefore, the left square bracket XCODE(⟦[⟧) is replaced by the HCODE(⟦LL()⟧, ⟦⟦⟦6⟧, ⟦hello_world/json.m4⟧⟧, ⟦⟦3⟧, ⟦hello_world/hello_world.json⟧⟧⟧) macro defined in the root file.
⟧⟧)

TEXTDATA(⟦hello_world/json.m4⟧)
EXECUTED(⟦m4 -DSYMBOL='Hello, world!'⟧, ⟦gfiles/root0b.m4⟧, ⟦hello_world/json.m4⟧, ⟦hello_world/hello_world.json⟧)
TEXTDATA(⟦hello_world/hello_world.json⟧)


SECT1(⟦
⟦CODE(⟦[]⟧) Bash: počítadla⟧,
dnl _next_language_
⟦CODE(⟦[]⟧) Bash: counters⟧,
⟧)

PARA(⟦⟦
Počítadla HCODE(⟦COUNT_UP⟧, ⟦⟦⟦A⟧, ⟦hello_world/sh.m4⟧⟧⟧) a⟦⟧NB()HCODE(⟦COUNT_DOWN⟧, ⟦⟦⟦B⟧, ⟦hello_world/sh.m4⟧⟧⟧) jsou definována v⟦⟧NB()souboru CODE(⟦countb.m4⟧).
HEXPLAIN(⟦Neterminály⟧, ⟦⟦⟦C⟧, ⟦hello_world/sh.m4⟧⟧⟧) HCODE(⟦[… uvnitř závorek …]⟧, ⟦⟦⟦20⟧, ⟦hello_world/sh.m4⟧⟧, ⟦⟦5⟧, ⟦hello_world/hello_world.sh⟧⟧⟧) nebudou expandovány, pouze se odeberou vnější závorky.
Nutno použít makro HCODE(⟦LL()⟧, ⟦⟦⟦30⟧, ⟦hello_world/sh.m4⟧⟧, ⟦⟦15⟧, ⟦hello_world/hello_world.sh⟧⟧⟧) z⟦⟧NB()kořenového souboru.
⟧,dnl _next_language_
⟦
The HCODE(⟦COUNT_UP⟧, ⟦⟦⟦A⟧, ⟦hello_world/sh.m4⟧⟧⟧) and HCODE(⟦COUNT_DOWN⟧, ⟦⟦⟦B⟧, ⟦hello_world/sh.m4⟧⟧⟧) counters are defined in the file CODE(⟦countb.m4⟧).
The HEXPLAIN(⟦nonterminals⟧, ⟦⟦⟦C⟧, ⟦hello_world/sh.m4⟧⟧⟧) HCODE(⟦[… inside brackets …]⟧, ⟦⟦⟦20⟧, ⟦hello_world/sh.m4⟧⟧, ⟦⟦5⟧, ⟦hello_world/hello_world.sh⟧⟧⟧) will not be expanded, only the outer brackets will be removed.
The HCODE(⟦LL()⟧, ⟦⟦⟦30⟧, ⟦hello_world/sh.m4⟧⟧, ⟦⟦15⟧, ⟦hello_world/hello_world.sh⟧⟧⟧) macro defined in the root file must be used.
⟧⟧)

TEXTDATA(⟦hello_world/sh.m4⟧,, ⟦
s/\<COUNT_UP\>/MM(a)/
s/\<COUNT_DOWN\>/MM(b)/
/^define/s/\<LEFT\>\|\<OP\>\|\<RIGHT\>/MM(c)/
⟧)
EXECUTED(⟦m4 -DSYMBOL='Hello, world!'⟧, ⟦gfiles/root0u.m4⟧, ⟦gfiles/countb.m4⟧, ⟦hello_world/sh.m4⟧, ⟦hello_world/hello_world.sh⟧)
TEXTDATA(⟦hello_world/hello_world.sh⟧)


SECT1(⟦symbols_in_brackets⟧, ⟦
⟦CODE(⟦[]⟧) .h: závorky CODE(⟦[]⟧)⟦,⟧ CODE(⟦[,]⟧)⟦,⟧ XCODE(⟦[#]⟧)⟦,⟧ XCODE(⟦[dnl]⟧)⟧,
dnl _next_language_
⟦CODE(⟦[]⟧) .h: brackets CODE(⟦[]⟧)⟦,⟧ CODE(⟦[,]⟧)⟦,⟧ XCODE(⟦[#]⟧)⟦,⟧ XCODE(⟦[dnl]⟧)⟧,
⟧)

PARA(⟦⟦
Prázdný pár HCODE(⟦[]⟧, ⟦⟦⟦A⟧, ⟦hello_world/h.m4⟧⟧⟧) (nebo prázdný symbol v⟦⟧NB()závorkách CODE(⟦[ε]⟧)) slouží jako oddělovač symbolů.
Závorky kolem znaku komentáře HXCODE(⟦[#]⟧, ⟦⟦⟦B⟧, ⟦hello_world/h.m4⟧⟧, ⟦⟦B⟧, ⟦hello_world/hello_world.h⟧⟧⟧) vypnou jeho původní význam, stejně jako vypnou význam ITALIC(⟦silnějšího⟧) M4 komentáře
HXCODE(⟦[dnl]⟧, ⟦⟦⟦C⟧, ⟦hello_world/h.m4⟧⟧, ⟦⟦C⟧, ⟦hello_world/hello_world.h⟧⟧⟧).
Vypnou také původní význam čárky CODE(⟦[,]⟧) jako oddělovače argumentů maker.
Tyto symboly se stanou obyčejnými terminálními symboly bez jakéhokoliv vedlejšího efektu.
⟧,dnl _next_language_
⟦
The empty pair HCODE(⟦[]⟧, ⟦⟦⟦A⟧, ⟦hello_world/h.m4⟧⟧⟧) (or the empty symbol in brackets CODE(⟦[ε]⟧)) serves as a⟦⟧NB()symbol separator.
Brackets around the comment character HXCODE(⟦[#]⟧, ⟦⟦⟦B⟧, ⟦hello_world/h.m4⟧⟧, ⟦⟦B⟧, ⟦hello_world/hello_world.h⟧⟧⟧) turn off its original meaning as well as the meaning of the ITALIC(⟦more powerful⟧) M4 comment
HXCODE(⟦[dnl]⟧, ⟦⟦⟦C⟧, ⟦hello_world/h.m4⟧⟧, ⟦⟦C⟧, ⟦hello_world/hello_world.h⟧⟧⟧).
They also turn off the original meaning of the comma CODE(⟦[,]⟧) as a⟦⟧NB()macro argument delimiter.
These symbols become ordinary terminal symbols without any side effect.
⟧⟧)

TEXTDATA(⟦hello_world/h.m4⟧,, ⟦
s/\[]/MM(a)/g
s/\[#]/MM(b)/
s/\[dnl]/MM(c)/
⟧)
EXECUTED(⟦m4 -DSYMBOL='Hello, world!'⟧, ⟦gfiles/root0b.m4⟧, ⟦hello_world/h.m4⟧, ⟦hello_world/hello_world.h⟧)
TEXTDATA(⟦hello_world/hello_world.h⟧,, ⟦
s/#/MM(b)/
s/\<dnl\>/MM(c)/
⟧)


SECT1(⟦safe_example⟧, ⟦
⟦CODE(⟦[]⟧) AWK: příklady bezpečnějších maker⟧,
dnl _next_language_
⟦CODE(⟦[]⟧) AWK: examples of safer macros⟧,
⟧)

PARA(⟦⟦
Univerzální výstraha HCODE(⟦DONTE⟧, ⟦⟦⟦A⟧, ⟦hello_world/awk.m4⟧⟧, ⟦⟦A⟧, ⟦hello_world/hello_world.awk⟧⟧⟧) se ignoruje bez závorek, stejně jako HCODE(⟦LL⟧, ⟦⟦⟦B⟧, ⟦hello_world/awk.m4⟧⟧, ⟦⟦B⟧, ⟦hello_world/hello_world.awk⟧⟧⟧), CODE(⟦RR⟧), …
Taková makra explicitně vytváří vývojář skriptů, prohlédněte si kořenový soubor CODE(⟦root1b.m4⟧).
⟧,dnl _next_language_
⟦
The universal alert HCODE(⟦DONTE⟧, ⟦⟦⟦A⟧, ⟦hello_world/awk.m4⟧⟧, ⟦⟦A⟧, ⟦hello_world/hello_world.awk⟧⟧⟧) is ignored without parentheses, such as for example HCODE(⟦LL⟧, ⟦⟦⟦B⟧, ⟦hello_world/awk.m4⟧⟧, ⟦⟦B⟧, ⟦hello_world/hello_world.awk⟧⟧⟧) or CODE(⟦RR⟧).
Such macros are explicitly created by a⟦⟧NB()script developer, see the root file CODE(⟦root1b.m4⟧).
⟧⟧)

TEXTDATA(⟦hello_world/awk.m4⟧,, ⟦
/\<BEGIN\>/{
s/\<DONTE\>/MM(a)/
s/\<LL\>/MM(b)/
}
⟧)
EXECUTED(⟦m4 -DSYMBOL='Hello, world!'⟧, ⟦gfiles/root1b.m4⟧, ⟦hello_world/awk.m4⟧, ⟦hello_world/hello_world.awk⟧)
TEXTDATA(⟦hello_world/hello_world.awk⟧,, ⟦
/\<BEGIN\>/{
s/\<DONTE\>/MM(a)/
s/\<LL\>/MM(b)/
}
⟧)


# A → ε
pushdef(⟦APPENDIX_APPEND_CODE⟧)# temporarily disable NOTE in appendix because no examples
APPENDIX(⟦questions_and_answers⟧, ⟦
⟦Proč používat M4 a⟦⟧NB()proč ne?⟧,
dnl _next_language_
⟦Why to use M4 and why not?⟧,
⟧)
popdef(⟦APPENDIX_APPEND_CODE⟧)# re-enable NOTE


SECT1(⟦why_to_use_m4⟧, ⟦
⟦CODE(⟦👍⟧) Proč generovat kód v⟦⟧NB()M4⟧,
dnl _next_language_
⟦CODE(⟦👍⟧) Why to generate code in M4⟧,
⟧)

ITEMIZEDLIST_WRAP(⟦

LISTITEM(⟦direct_use_of_cfg⟧, ⟦⟦
přímé použití LINK(⟦bezkontextové gramatiky⟧, ⟦context_free_grammar⟧) (rekurze zdarma)
UL(⟦LI(⟦pro transformaci dat stačí napsat minimum M4 kódu⟧)⟧)
⟧,dnl _next_language_
⟦
direct use of LINK(⟦context-free grammar⟧, ⟦context_free_grammar⟧) (recursion for free)
UL(⟦LI(⟦minimum M4 code is required for data transformation⟧)⟧)
⟧⟧)

LISTITEM(⟦direct_use_of_atm⟧, ⟦⟦
přímé použití automatů
UL(⟦LI(⟦možnost vymodelovat si potřebné algoritmy (M4 nepotřebuje verze)⟧)⟧)
⟧,dnl _next_language_
⟦
direct use of automata
UL(⟦LI(⟦possibility to model necessary algorithms (M4 does not need versions)⟧)⟧)
⟧⟧)

LISTITEM(⟦direct_use_of_stacks⟧, ⟦⟦
přímé použití zásobníků
UL(⟦LI(⟦zásobníky propojené s⟦⟧NB()automaty rozšiřují možnosti generátoru kódu⟧)⟧)
⟧,dnl _next_language_
⟦
direct use of stacks
UL(⟦LI(⟦stacks connected to automata extend capabilities of code generator⟧)⟧)
⟧⟧)

LISTITEM(⟦direct_use_of_queues⟧, ⟦⟦
přímé použití výstupních front pro dočasné uložení výsledných částí kódu
UL(⟦LI(⟦jednotlivé fronty jsou na závěr vypsány na výstup ve vzestupném pořadí⟧)⟧)
⟧,dnl _next_language_
⟦
direct use of output queues to temporarily store resulting pieces of code
UL(⟦LI(⟦individual queues are finally dumped to output in ascending order⟧)⟧)
⟧⟧)

LISTITEM(⟦significantly_faster_code_gener⟧, ⟦⟦
výrazně vyšší rychlost generování kódu (ve srovnání s⟦⟧NB()XSLT)
UL(⟦LI(⟦nízké nároky na výpočetní zdroje⟧)⟧)
⟧,dnl _next_language_
⟦
significantly faster code generation (compared to XSLT)
UL(⟦LI(⟦low demands on computing resources⟧)⟧)
⟧⟧)

⟧)dnl ITEMIZEDLIST_WRAP


SECT1(⟦why_not_use⟧, ⟦
⟦CODE(⟦👎⟧) Proč se vyhnout M4⟧,
dnl _next_language_
⟦CODE(⟦👎⟧) Why to avoid M4⟧,
⟧)

ITEMIZEDLIST_WRAP(⟦

LISTITEM(⟦low_level_language⟧, ⟦⟦
univerzální jazyk nízké úrovně (podobně jako jazyk C)
UL(⟦LI(⟦což výměnou poskytuje ohromnou flexibilitu jako UNIX⟧)⟧)
⟧,dnl _next_language_
⟦
low-level universal language (similar to C language)
UL(⟦LI(⟦which in return it provides tremendous flexibility as UNIX⟧)⟧)
⟧⟧)

LISTITEM(⟦nearly_forgotten_language⟧, ⟦⟦
téměř neexistující komunita vývojářů (podzim 2019)
UL(⟦LI(⟦M4 je zapomenutý jazyk, málo existujících projektů⟧)⟧)
⟧,dnl _next_language_
⟦
almost nonexistent developer community (as of Autumn 2019)
UL(⟦LI(⟦M4 is nearly forgotten language with small number of existing projects⟧)⟧)
⟧⟧)

LISTITEM(⟦unusual_language⟧, ⟦⟦
neobvyklé programovací paradigma vyžadující splnění LINK(⟦několika předpokladů⟧, ⟦prerequisites_for_mastering⟧)
UL(⟦LI(⟦BOLD(⟦právě proto⟧) lze M4 považovat za náročný jazyk⟧)⟧)
⟧,dnl _next_language_
⟦
unusual programming paradigm requiring LINK(⟦several prerequisites⟧, ⟦prerequisites_for_mastering⟧)
UL(⟦LI(⟦BOLD(⟦that is why⟧) the M4 can be considered a challenging language⟧)⟧)
⟧⟧)

LISTITEM(⟦experience_dependent⟧, ⟦⟦
produktivita značně závisí na zkušenostech (možný problém s⟦⟧NB()termíny)
UL(⟦LI(⟦psaní M4 skriptů vyžaduje BOLD(⟦základní⟧) znalost automatů a gramatik⟧)⟧)
⟧,dnl _next_language_
⟦
productivity greatly depends on experience (problem with short-term deadlines)
UL(⟦LI(⟦writing M4 scripts requires BOLD(⟦basic⟧) knowledge of automata and grammars⟧)⟧)
⟧⟧)

LISTITEM(⟦maintenance_could_be_hard⟧, ⟦⟦
údržba špatně napsaného M4 kódu není jednoduchá
UL(⟦LI(⟦existující M4 kód je snadné proměnit ve zmatek (nutný dohled!)⟧)⟧)
⟧,dnl _next_language_
⟦
maintaining badly written M4 code is not easy
UL(⟦LI(⟦existing M4 code is easily thrown into confusion (supervision required!)⟧)⟧)
⟧⟧)

⟧)dnl ITEMIZEDLIST_WRAP
