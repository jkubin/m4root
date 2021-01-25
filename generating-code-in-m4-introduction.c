/*
 * DO NOT EDIT! This file is generated automatically!
 * generated: 20210125-23:25:51
 *
 * __SOURCE(⟦c/c.m4⟧, ⟦20210125-14:44:24⟧, ⟦dcc3f72⟧, ⟦084dbe0⟧)
 * __SOURCE(⟦intro.mc⟧, ⟦20210125-23:12:24⟧, ⟦8449b39⟧, ⟦084dbe0⟧)
 *
 * Generating code in M4: introduction
 */

#define ARRAY_SIZE(x)	(sizeof(x)/sizeof((x)[0]))

static char ch_para_0[] =
"Readers of this series will learn how to write scripts for machine code generation.\n"
"The machine-generated code can be arbitrarily complex and can contain other internal dependencies.\n"
"Interdependent files with complex code are hardly sustainable for humans in a consistent state.\n"
"It is necessary to use some code generation mechanism.\n"
"The code generation is performed by a tool for text transformation – a macro processor.";

static char ch_para_1[] =
"The series focus on the practical use of the universal macro processor M4 (hereafter M4) using small examples.\n"
"It also describes the theoretical part of all its implementations.\n"
"The aim of the series is to acquaint the reader with this tool and also the programming language.\n"
"What is it used for, how to program in it and its advantages and disadvantages.";

static char ch_para_2[] =
"The introductory part describes the basic principles of the language with simple examples of use.\n"
"All examples use rewriting rules of context-free grammar.\n"
"Later we will learn how to use output queues,\n"
"automata, associative memories, stacks and pushdown automata.\n"
"We will also learn how to write testing automata to test input data.";

static char ch_para_3[] =
"The examples are a complementary part of the series and will be based to some extent on the discussion below the article.\n"
"At the beginning of each episode, some parts of the M4 language will be described and supplemented with a set of examples at the end.\n"
"Each part can be read in any order.";

static char ch_para_4[] =
"Macro languages were invented when the assembly language (ASM) dominated.\n"
"ASM source code usually contains identical instruction sequences that differ only in operand values.\n"
"Identical instruction sequences can be grouped into one word or a macro instruction.\n"
"The name usually describes the purpose of the hidden sequence of instructions.\n"
"These macro instructions are translated by the macro processor to the original instruction sequences, which are then translated into the executable machine code.\n"
"Programming in ASM using macro instructions is simpler, faster and less prone to human errors.";

static char ch_para_5[] =
"Later, macro languages were used to extend compiled programming languages because they made it possible to write a source code at the higher level of abstraction than offered by the programming language itself.\n"
"The speed, performance and efficiency of a complex lower-level programming language is maintained through macro languages.\n"
"However, it is important to understand all layers of code well.";

static char ch_para_6[] =
"Christopher Strachey introduced the basic idea of rewritable strings with arguments which recursively rewrite to other strings in his\n"
"GPM[1] in 1965.\n"
"The next generation of M3 and M4 macro processors basically just expanded the original GPM.\n"
"The basic idea of the original proposal remained the same.";

static char ch_para_7[] =
"Dennis Ritchie took over the basic idea of GPM and wrote an improved macro processor for generating source code of C (1972) language, which he himself designed.\n"
"The new macro processor was written for the minicomputer AP-3, hence the name M3.\n"
"This direct ancestor of the current M4 managed to significantly save heavy and time-consuming work and attract developers programming to other languages (FORTRAN, COBOL, PL/I, …).\n"
"Developers have customized M3 for these languages turning it into a universally usable M4 macro processor.";

static char ch_para_8[] =
"The M3 macro processor was also extended by Jim E. Weythman, the author of program construction, which is used in almost every M4 script:";

static char ch_para_9[] =
"Brian Kernighan has enhanced the M3 macro processor to the FORTRAN 66\n"
"preprocessor to create a hybrid language extension named RATFOR[2].\n"
"The basic program constructions of this extension (conditions, cycles) are the same as in C language.\n"
"Programming in RATFOR is similar to C programming.\n"
"The macro processor converts the source code back to FORTRAN, then the compiler performs the usual compilation to machine code.";

static char ch_para_10[] =
"The user manual[3] mentions other co-authors not mentioned here.\n"
"So it would be fairly unfair to write that the authors of the M4 macro processor (1977) are only two people.";

static char ch_para_11[] =
"Today, there are several implementations that differ from the original implementation rather by small details.\n"
"The most common implementation of M4 is the GNU M4 used for Autotools\n"
"and for translating the simple sendmail.mc configuration file to complex sendmail.cf.\n"
"The author of this implementation (1990) is René Seindal.\n"
"To install m4, type the following command:";

static char ch_para_12[] =
"A detailed description of the keywords can be found in the documentation[4]:";

static char ch_para_13[] =
"M4 is based on context-free grammar, automata, stacks and output queues.\n"
"To understand M4, it is therefore crucial to understand the basic concepts of formal language theory –\n"
"terminal symbols (briefly terminals) and nonterminal symbols (briefly nonterminals).\n"
"These terms will be explained later in more detail.\n"
"The objective is to show the basic practical use of M4 language on examples.";

static char ch_para_14[] =
"Context-free grammar (shortly CFG) is a formal grammar in which all rules for rewriting have the A → β form.\n"
"The nonterminal A is rewritten to an arbitrarily long β string composed of nonterminals N or terminals Σ.\n"
"Kleene star means that nonterminal A can be rewritten to ε (rewriting rule A → ε).";

static char ch_para_15[] =
"The rules for rewriting are the same for context-free grammar and M4.";

static char ch_para_16[] =
"All M4 keywords are nonterminals (macros), which take action and are rewritten to ε or another symbol.\n"
"All keywords can be renamed or turned off completely.\n"
"This feature is crucial for the preprocessor mode.";

static char ch_para_17[] =
"The default character pair `' in M4 controls the expansion of nonterminals.\n"
"The keyword changequote() can change them to other characters, for example {[], ␂␆, ⟦⟧}.\n"
"The nonterminals that we do not want to (immediately) expand are surrounded by this pair of characters.\n"
"When passing through the macro processor, all the symbols between this character pair are terminal symbols and the outer character pair is removed.\n"
"The next pass will cause the expansion of the originally protected nonterminals.\n"
"The control character pair is set at the beginning of the root file.";

static char ch_para_18[] =
"Automata serve as “switches” of grammar rules.\n"
"Automata use the grammar rules for rewriting as nodes and change their states according to input symbols.\n"
"The currently used rule produces a specific code to the output queue (or several output queues) until the automaton moves to another node with a different rule.\n"
"The examples of generating automata are in appendix.";

static char ch_para_19[] =
"The output queues temporarily store the portions of the resulting code.\n"
"These parts are formed using the grammar rules for rewriting which subsequently rewrite input symbols.\n"
"The divert(ℤ) keyword sets the output queue.\n"
"Finally, all non-empty queues are dumped in ascending order to the standard output and compose the final code.\n"
"The examples of the output queues are in the appendix.";

static char ch_para_20[] =
"M4 is used to generate the source code of any programming language or as a preprocessor for any source code.";

static char ch_para_21[] =
"M4 transforms input data from .mc files to output data with the following command:";

static char ch_para_22[] =
"Two basic operations are performed during file loading:";

static char ch_para_23[] =
"The input1.mc and input2.mc files contain the input data in a format that allows them to be transformed into output data according to the rules in the previous .m4 files.\n"
"The .mc data files usually do not contain any transformation rules.";

static char ch_para_24[] =
"The input data may also come from the pipeline:";

static char ch_para_25[] =
"Try: Code generation examples";

static char ch_para_26[] =
"M4 can operate in the preprocessor mode and can also be part of a pipeline.\n"
"The input source code passes unchanged through except for nonterminal symbols.\n"
"The nonterminals found are expanded to terminals and the output along with the source code.\n"
"M4 can extend any other language where the preprocessor is insufficient (no recursion) or none.\n"
"It is important to select the left character for nonterminal expansion control, which must not collide with the input source code character.\n"
"However the character collision is easily solved by a regex.";

static char ch_para_27[] =
"The conflicting character ` from the input source code is hidden into a macro `'LL().\n"
"An empty pair of control characters `' before the macro serves as a symbol separator.\n"
"When the source code is passed through the macro processor, the `'LL() macro is rewritten back to the original ` character and the empty pair `' is removed.";

static char ch_para_28[] =
"If there are # or dnl comments in the source code, they must be hidden first.\n"
"The characters `' turn off original meaning and will be removed by the macro processor.\n"
"M4 # and dnl comments are hidden between default characters: `#' `dnl'";

static char ch_para_29[] =
"If square brackets are used to control the expansion of nonterminals, the left [ square bracket is hidden in the same way.\n"
"Everything else applies as for default characters `'.";

static char ch_para_30[] =
"M4 # and dnl comments are hidden between parentheses: [#] [dnl]";

static char ch_para_31[] =
"Non printable characters ␂ (0x02) and ␆ (0x06) can be used to control the expansion of nonterminals.\n"
"These characters cannot interfere with printable source code characters.";

static char ch_para_32[] =
"M4 # and dnl comments are hidden between non printable characters: ␂#␆ ␂dnl␆";

static char ch_para_33[] =
"Expansion of nonterminals can also be controlled by a suitably selected UTF-8 character pair.\n"
"The usual source code does not contain such characters, so we do not have to solve the collision of the left control ⟦ character.\n"
"UTF-8 characters offer similar advantages to non printable characters.";

static char ch_para_34[] =
"M4 # and dnl comments are hidden between UTF-8 characters: ⟦#⟧ ⟦dnl⟧";

static char ch_para_35[] =
"Try: Preprocessor examples";

static char ch_para_36[] =
"The mixed mode is a combination of the previous modes and is mainly used for experiments.\n"
"The data is not separated from the rules for its transformation.\n"
"The leaf file leaf.m4 contains transformation rule definitions along with input data.";

static char ch_para_37[] =
"Try: M4: examples";

static char ch_para_38[] =
"To successfully master this macro language it is important to fulfill several prerequisites.\n"
"M4 is not a simple language because it is not possible to think and program in it like an ordinary programming language.\n"
"The most important thing to realize is that it is used to program the grammar rules for rewriting.\n"
"Each string is either a terminal or a nonterminal symbol, including all language keywords (the symbols # and , are special cases of nonterminals).";

static char ch_para_39[] =
"All grammars are based on the rules for rewriting and their forms are generally described:";

static char ch_para_40[] =
"The Formal grammar describes the subsets of the\n"
"formal language\n"
"rewriting rules and one of the subsets is called context-free grammar,\n"
"shortly CFG.\n"
"As mentioned earlier, the CFG rewriting rules work the same as the M4 rewriting rules.\n"
"Some of the following episodes of this series will focus on formal grammar in detail.";

static char ch_para_41[] =
"The ability to use predominantly two-state automata is an essential thing for writing simple M4 scripts because the vast majority of scripts use small automata.";

static char ch_para_42[] =
"The order of input symbols or their context can be tested by an automaton.\n"
"If the input symbols meet the required properties, the automaton ends up in a double-ring node which indicates the accepting state.";

static char ch_para_43[] =
"The previous automaton can be written as an ASCII art accompanying the M4 script:";

static char ch_para_44[] =
"Input symbols change the nodes of the automaton, thereby changing the rewriting rules for code generation.\n"
"See the appendix for this generating automaton:";

static char ch_para_45[] =
"A well-designed code generator usually consists of several smaller files whose order, dependencies and parameters are written to the Makefile file.\n"
"Good knowledge of Makefile writing is therefore a prerequisite for mastering M4.\n"
"Reading and maintaining source code generally takes more time than creating it.\n"
"A well-structured Makefile therefore significantly contributes to the overall clarity of the resulting code generator.";

static char ch_para_46[] =
"Mastering the Vim[5] editor is an important prerequisite for the convenience and speed of writing M4 code.\n"
"Vim shortcuts, defined by the iabbrev keyword, will save large amounts of unnecessary typing.\n"
"These shortcuts also significantly reduce the occurrence of almost invisible errors caused by an unpaired bracket, thus saving the lost time spent on debugging.";

static char ch_para_47[] =
"M4 usually cannot be mastered over the weekend, especially when the fundamentals[6] of\n"
"automata theory and formal grammars are lacking.\n"
"In order to master the M4 language, it is necessary to program in a longer period of time and write amounts of bad (complex) M4 code that you rewrite for a better idea.\n"
"In this way it is possible to gradually gain practice.";

static char ap_para_0[] =
"The input source code is similar to CSV, which is converted to arbitrarily complex target code of another language using CFG, automata and output queues.\n"
"Stacks in the examples are not used.\n"
"The input source code contains special characters that must be hidden:";

static char ap_para_1[] =
"This example does not use output queues, it only prints CSV separated by TAB to standard output.";

static char ap_para_2[] =
"The example uses the COUNT_UP macro from the countu.m4 file whose β is copied to the right side of the COUNTER macro.\n"
"During the first expansion of COUNTER its initial value is initialized.\n"
"Further expansion returns the numeric terminal symbol and increases the inner auxiliary (global) symbol by one.\n"
"COUNTER is a small automaton.";

static char ap_para_3[] =
"Each type of output code requires the modification of the special characters.\n"
"The M4 patsubst() keyword is inappropriate for this type of task.\n"
"First, we hide all special characters of the input file into appropriately named macros using regular expressions.";

static char ap_para_4[] =
"The example uses one output queue for characters }; to close the array at the end.";

static char ap_para_5[] =
"The example runs an external date command and places its output in square brackets.\n"
"The output of an external command are two comma-separated items.\n"
"The SARG1() macro selects the first item because the second item contains an unwanted LF (0x0a) new line character.";

static char ap_para_6[] =
"The example uses the COUNTER macro to number the resulting CPP macros and one output queue.\n"
"The queue number 1 contains the preprocessor directive #endif to terminate the header file.\n"
"The decimal value of the counter is converted to the two-digit hex by keyword eval().";

static char ap_para_7[] =
"The example uses a small automaton NEW_LINE to generate a newline \\n character and one output queue number 1 containing \" characters to terminate resulting string.\n"
"Run the first time NEW_LINE, is rewritten to ε, in all following ones, it is rewritten to \\n.";

static char ap_para_8[] =
"This example is similar to the previous one, but each string is on a new line.";

static char ap_para_9[] =
"The example uses two output queues.\n"
"The queue number 1 contains paragraphs.\n"
"The queue number 2 contains closing HTML tags.\n"
"Navigation links do not have to be stored anywhere, they go straight to the output.\n"
"The QUERY and WARNING messages are processed in the same way as the ERROR messages.";

static char ap_para_10[] =
"The example shows branching by grammar, macro arguments are ignored.\n"
"Input nonterminals are rewritten to terminals ERROR → 🐛,\n"
"QUERY → 🐜,\n"
"WARNING → 🐝.";

static char ap_para_11[] =
"The $0 variable is replaced by the name of the macro and concatenated with another symbol.\n"
"The newly formed nonterminal is rewritten to the corresponding terminal symbol (queue number or name).";

static char ap_para_12[] =
"The example uses two output queues and one generating automaton.\n"
"The first ERROR(⟦…⟧) error message in the ERROR state generates a header with brackets and outputs the first record.\n"
"The automaton goes to the state NEXT_ITEM which is a β rule.\n"
"The following error messages in the NEXT_ITEM state only output individual records.\n"
"At the end the output queue number 1 and number 2 print the characters ] and }} to close the resulting JSON.";

static char ap_para_13[] =
"The example processes other types of messages QUERY and WARNING.\n"
"It uses three automata and six output queues.\n"
"If we generate more complex source code, we will soon encounter the problem of maintaining index consistency for output queues.\n"
"To avoid confusion, we use queue names instead of numbers.\n"
"To avoid having to define similar rules, we copy the right side of ERROR (it is also a β rule) to the right side of the QUERY and WARNING rules.";

static char ap_para_14[] =
"During development, the order and number of output queues often change, which also requires frequent changes of their indexes.\n"
"It is therefore appropriate to generate indexes.\n"
"We can then use a virtually unlimited number of queues.\n"
"The following example shows how these indexes are generated.";

static char ap_para_15[] =
"The example uses three automata and two output queues number 2 and 4 defined in a separate file.\n"
"INI section names are generated by symbol chaining (see branching).\n"
"The example uses the same file for output queues as the example to generate JSON.";

static char ap_para_16[] =
"The example uses one output queue number 1 for the </messages> closing tag.";

static char ap_para_17[] =
"The example groups messages by their type using output queues.";

static char ap_para_18[] =
"The CPP directives are a one-line comment for M4 preventing unwanted expansion of the same named macros.\n"
"If we define a safer SAF() macro, the similar SAF () macro will not be overwritten.\n"
"Thus, the CPP namespace can be completely separated from the M4 namespace.\n"
"The problematic (backquote) character ` is hidden in the LL() macro.\n"
"The apostrophe ' does not matter in the source code.\n"
"Apostrophe inside ORD() macro is hidden in RR() macro.\n"
"Note the define () or ifelse () function names and where the SYMBOL is expanded.";

static char ap_para_19[] =
"CSS uses the # character for color codes, which is also the beginning of a one-line M4 comment.\n"
"The changecom(/*,*/) keyword sets a multiline /* … */ comment and rewrites itself into ε.\n"
"The comments can be turned off with the same changecom keyword without parameters.";

static char ap_para_20[] =
"Bash uses both ` and [ characters.\n"
"If we do not want to hide them in an LL() macro, we can use nonprintable characters for expansion control, see the example:";

static char ap_para_21[] =
"The [… nonterminals are not expanded …] inside square brackets.\n"
"Therefore, the left square bracket [ is replaced by the LL() macro defined in the root file.";

static char ap_para_22[] =
"The COUNT_UP and COUNT_DOWN counters are defined in the file countu.m4.\n"
"The nonterminals [… inside brackets …] will not be expanded, only the outer brackets will be removed.\n"
"The LL() macro defined in the root file must be used.";

static char ap_para_23[] =
"The empty pair [] (or the empty symbol in brackets [ε]) serves as a symbol separator.\n"
"Brackets around the comment character [#] turn off its original meaning as well as the meaning of the more powerful M4 comment\n"
"[dnl].\n"
"They also turn off the original meaning of the comma [,] as a macro argument delimiter.\n"
"These symbols become ordinary terminal symbols without any side effect.";

static char ap_para_24[] =
"The universal alert DONTE is ignored without parentheses, such as for example LL or RR.\n"
"Such macros are explicitly created by a script developer, see the root file root1b.m4.";

char *chapters_paragraphs[] = {
	ch_para_0,
	ch_para_1,
	ch_para_2,
	ch_para_3,
	ch_para_4,
	ch_para_5,
	ch_para_6,
	ch_para_7,
	ch_para_8,
	ch_para_9,
	ch_para_10,
	ch_para_11,
	ch_para_12,
	ch_para_13,
	ch_para_14,
	ch_para_15,
	ch_para_16,
	ch_para_17,
	ch_para_18,
	ch_para_19,
	ch_para_20,
	ch_para_21,
	ch_para_22,
	ch_para_23,
	ch_para_24,
	ch_para_25,
	ch_para_26,
	ch_para_27,
	ch_para_28,
	ch_para_29,
	ch_para_30,
	ch_para_31,
	ch_para_32,
	ch_para_33,
	ch_para_34,
	ch_para_35,
	ch_para_36,
	ch_para_37,
	ch_para_38,
	ch_para_39,
	ch_para_40,
	ch_para_41,
	ch_para_42,
	ch_para_43,
	ch_para_44,
	ch_para_45,
	ch_para_46,
	ch_para_47,
};
char *appendix_paragraph[] = {
	ap_para_0,
	ap_para_1,
	ap_para_2,
	ap_para_3,
	ap_para_4,
	ap_para_5,
	ap_para_6,
	ap_para_7,
	ap_para_8,
	ap_para_9,
	ap_para_10,
	ap_para_11,
	ap_para_12,
	ap_para_13,
	ap_para_14,
	ap_para_15,
	ap_para_16,
	ap_para_17,
	ap_para_18,
	ap_para_19,
	ap_para_20,
	ap_para_21,
	ap_para_22,
	ap_para_23,
	ap_para_24,
};
char *chapter[] = {
	"1 Introduction",
	"1.1 Examples for readers",
	"2 History of macro languages",
	"3 Basics of M4",
	"3.1 Context-free grammar",
	"3.2 Automata",
	"3.3 Output queues",
	"4 Main uses of M4",
	"4.1 The code generation",
	"4.2 The preprocessor",
	"5 Prerequisites for mastering M4",
	"5.1 Fundamentals of grammars",
	"5.2 Fundamentals of automata",
	"5.3 (GNU) make",
	"5.4 Vim",
	"5.5 Talent and time",
};
char *appendix[] = {
	"A Code generation examples",
	"A.1 ⟦⟧ Input source code",
	"A.2 ⟦⟧ CSV: simplest example",
	"A.3 ⟦⟧ CSV: counter",
	"A.4 💡 Modification of special characters",
	"A.5 ⟦⟧ C: output queue",
	"A.6 ⟦⟧ INI: an external command",
	"A.7 ⟦⟧ .h: hex counter",
	"A.8 ⟦⟧ C: small automaton",
	"A.9 ⟦⟧ C: small automaton 2",
	"A.10 ⟦⟧ HTML: output queues",
	"A.11 ⟦⟧ Branching by grammar",
	"A.12 ⟦⟧ JSON: generating automaton",
	"A.12.1 ⟦⟧ JSON: named queues",
	"A.12.2 ⟦⟧ JSON: generated queue indexes",
	"A.13 ⟦⟧ INI: discontinuous queue index",
	"A.14 ⟦⟧ XML: mixed messages",
	"A.15 ⟦⟧ XML: separated messages",
	"A.16 ⟦⟧ Bash $ echo \"string\"",
	"A.17 ⟦⟧ Bash $ echo 'string'",
	"B Preprocessor examples",
	"B.1 `' C preprocessor and M4",
	"B.2 `' CSS: file inclusion, comment",
	"B.3 ␂␆ Bash: nonprintable characters",
	"C M4: examples",
	"C.1 [] JSON: left bracket [",
	"C.2 [] Bash: counters",
	"C.3 [] .h: brackets [], [,], [#], [dnl]",
	"C.4 [] AWK: examples of safer macros",
	"D Why to use M4 and why not?",
	"D.1 👍 Why to generate code in M4",
	"D.2 👎 Why to avoid M4",
};
char *bridgehead[] = {
	"GPM (General Purpose Macro-generator)",
	"M3",
	"M4",
	"GNU M4",
	"M4 rewriting rules",
	"Nonterminal expansion control",
	"`' Default characters",
	"[] Square brackets",
	"␂␆ Non printable characters",
	"⟦⟧ UTF-8 characters",
	"Mixed mode",
	"Formal grammar (Chomsky type)",
	"Testing automaton",
	"Generating automaton",
	"Modified input code",
	"⟦⟧ Conversion file for XML, XSLT, HTML",
	"⟦⟧ Conversion file for C, JSON, INI: \"string\"",
	"⟦⟧ Conversion file for Bash: \"string\"",
	"⟦⟧ Conversion file for Bash: 'string'",
	"⟦⟧ Conversion file for CSV, M4 (returns all characters)",
	"Branching by grammar – basic principle",
};
char *reference[] = {
	"1. A General Purpose Macro-generator, Computer Journal 8, 3 (1965), 225–41",
	"2. RATFOR — A Preprocessor for a Rational Fortran, Brian W. Kernighan",
	"3. The M4 Macro Processor, Bell Laboratories (1977)",
	"4. GNU M4 - GNU macro processor, Free Software Foundation",
	"5. Vim – the ubiquitous text editor, that edits text at the speed of thought",
	"6. Automaty a formální jazyky I, Učební text FI MU",
	"7. Automaty a gramatiky, Michal Chytil, 1. vydání, Praha, 331 s. 1984.",
};
char *reference_url[] = {
	"http://dx.doi.org/10.1093/comjnl/8.3.225",
	"https://wolfram.schneider.org/bsd/7thEdManVol2/ratfor/ratfor.pdf",
	"https://wolfram.schneider.org/bsd/7thEdManVol2/m4/m4.pdf",
	"https://www.gnu.org/software/m4/manual/",
	"https://www.vim.org/",
	"https://is.muni.cz/elportal/estud/fi/js06/ib005/Formalni_jazyky_a_automaty_I.pdf",
	"https://is.muni.cz/publication/173173",
};
unsigned int chapters_paragraphs_len = ARRAY_SIZE(chapters_paragraphs);
unsigned int chapters_len = ARRAY_SIZE(chapter);
unsigned int references_len = ARRAY_SIZE(reference);
unsigned int appendix_len = ARRAY_SIZE(appendix);
unsigned int appendix_paragraphs_len = ARRAY_SIZE(appendix_paragraph);
