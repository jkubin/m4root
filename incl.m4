__HEADER([Josef Kubin], [2019/12/10], [root_cz])
___DESCR([repeated text patterns for ALL parts should be written here; modified files from the include keyword are invisible for make])
___POINT([how to avoid include keyword; Note: this is M4 not C!])

# paired author name with image
# A → β
define([AUTHOR_NAME],		[Josef Kubín])
define(defn([AUTHOR_NAME]),	[pepa.png])

# common tip box
# A → β
define([the_series_is_generated], [
	NOTE(, defn([WORD_NOTE]), [[dnl czech
Vícejazyčný seriál QUOTE([BO([SERIES_NAME])]) je generován M4 skripty[]REF([SERIES_NAME], [vícejazyčná šablona s[]NB()příklady pro AH([www.root.cz], [Root.cz – informace nejen ze světa Linuxu], [https://www.root.cz])], [http://github.com/jkubin/m4root]),
které (možná) usnadní psaní článků a[]NB()seriálů pro AH([www.root.cz], [Root.cz – informace nejen ze světa Linuxu], [https://www.root.cz/]) také jiným autorům.
Výsledkem seriálu je také sada ukázkových skriptů pro generování kódu.
],
[dnl english: _next_language_
Multilingual series QUOTE([BO([SERIES_NAME])]) are generated by M4 scripts[]REF([SERIES_NAME], [multilingual template with examples for AH([www.root.cz], [Root.cz – information not only from the Linux world], [https://www.root.cz])], [http://github.com/jkubin/m4root]),
which will make it easier (maybe) for other authors to write articles on AH([www.root.cz], [Root.cz – information not only from the Linux world], [https://www.root.cz/]).
The result of the series is also a set of sample scripts for generating code.
]])
])

# common code in annex
# A → β
define([APPENDIX_APPEND_CODE], [
	INFO(, defn([WORD_INFORMATION]), [[dnl czech
Znaky {CODE([`']), CODE_M4([[]]), BO([CODE([␂␆])]), CODE([⟦⟧])} v[]NB()názvu příkladu LINK([řídí expanzi neterminálů], [expansion_control], [intro.mc]).
],
[dnl english: _next_language_
Chars. {CODE([`']), CODE_M4([[]]), BO([CODE([␂␆])]), CODE([⟦⟧])} in the name controls the LINK([expansion of nonterminals], [expansion_control], [intro.mc]).
]])
])

# common introductory text for perex
# A → β
define([PEREX_CS], [dnl czech
Makro procesor M4 se používá ke generování libovolně složitého kódu z[]NB()jednoduchého zdrojového kódu.
])

# common introductory text for perex
# A → β
define([PEREX_EN], [dnl english
The M4 macro processor is used to generate arbitrarily complex code from simple source code.
])
