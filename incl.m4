___TITLE(⟦Josef Kubin⟧, ⟦2019,12,10⟧)
___DESCR(⟦repeated text patterns for ALL parts should be written here; modified files from the include keyword are invisible for make⟧)
__REASON(⟦no include keyword; Note: this is M4 not C!⟧)

# common tip box
# A → β
define(⟦the_series_is_generated⟧, ⟦
	NOTE(, defn(⟦WORD_NOTE⟧), ⟦⟦
Vícejazyčný seriál QUOTE(⟦BOLD(⟦SERIES_NAME⟧)⟧) je generován M4 skripty⟦⟧REF(⟦SERIES_NAME⟧, ⟦šablona s⟦⟧NB()příklady pro ULINK(⟦www.root.cz⟧, ⟦Root.cz – informace nejen ze světa Linuxu⟧, ⟦https://www.root.cz⟧)⟧, ⟦http://github.com/jkubin/m4root⟧),
které (možná) usnadní psaní článků a⟦⟧NB()seriálů pro ULINK(⟦www.root.cz⟧, ⟦Root.cz – informace nejen ze světa Linuxu⟧, ⟦https://www.root.cz/⟧) také jiným autorům.
Výsledkem seriálu je také sada ukázkových skriptů pro generování kódu.
⟧,dnl _next_language_
⟦
Multilingual series QUOTE(⟦BOLD(⟦SERIES_NAME⟧)⟧) are generated by M4 scripts⟦⟧REF(⟦SERIES_NAME⟧, ⟦a⟦⟧NB()template with examples for ULINK(⟦www.root.cz⟧, ⟦Root.cz – information not only from the Linux world⟧, ⟦https://www.root.cz⟧)⟧, ⟦http://github.com/jkubin/m4root⟧),
which will make it easier (maybe) for other authors to write articles on ULINK(⟦www.root.cz⟧, ⟦Root.cz – information not only from the Linux world⟧, ⟦https://www.root.cz/⟧).
The result of the series is also a set of sample scripts for generating code.
⟧⟧)
⟧)

# common code in all appendices
# A → β
define(⟦APPENDIX_APPEND_CODE⟧, ⟦
	INFO(, defn(⟦WORD_INFORMATION⟧), ⟦⟦
Znaky {EXPLAIN_CODE(⟦`'⟧, ⟦uvozovky⟧), EXPLAIN_CODE(⟦[]⟧, ⟦hranaté závorky⟧), EXPLAIN_CODE(⟦␂␆⟧, ⟦netisknutelné znaky⟧), EXPLAIN_CODE(⟦⟦⟧⟧, ⟦UTF-8 znaky⟧)} v⟦⟧NB()názvu příkladu LINK(⟦řídí expanzi neterminálů⟧, ⟦expansion_control⟧, ⟦intro.mc⟧).
⟧,dnl _next_language_
⟦
Chars. {EXPLAIN_CODE(⟦`'⟧, ⟦quotation marks⟧), EXPLAIN_CODE(⟦[]⟧, ⟦square brackets⟧), EXPLAIN_CODE(⟦␂␆⟧, ⟦nonprintable characters⟧), EXPLAIN_CODE(⟦⟦⟧⟧, ⟦UTF-8 characters⟧)} in the name controls the LINK(⟦expansion of nonterminals⟧, ⟦expansion_control⟧, ⟦intro.mc⟧).
⟧⟧)
⟧)

# common introductory text for perex
# A → β
define(⟦PARTINTRO_CS⟧, ⟦Makro procesor M4 se používá ke generování libovolně složitého kódu z⟦⟧NB()jednoduchého zdrojového kódu.⟧)

# common introductory text for perex
# A → β
define(⟦PARTINTRO_EN⟧, ⟦The M4 macro processor is used to generate arbitrarily complex code from simple source code.⟧)
