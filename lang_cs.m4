# vim:ts=40:sw=40

__HEADER([Josef Kubin], [2019/07/11], [root_cz])
___DESCR([the file contains language-specific words])
___POINT([multilingual targets])

# name of the series
define([SERIES_NAME],	[Generování kódu v M4])

# sets the appropriate locale for a command
define([LANG_LOCALES],	[LANG=cs_CZ.utf8])
define([DATE_COMMAND],	defn([LANG_LOCALES])[ date '+[%-e. %B %Y],'])

# preview + publish
define([SENTENCE_ALL_PARTS],	[Všechny díly seriálu])
define([TITLE_INPUT_FILES], 	[vstupní soubory])
define([TITLE_OUTPUT_FILE], 	[výstupní soubor])
define([WORD_APPENDIX],	[Příloha])
define([WORD_COMMAND],	[příkaz])
define([WORD_CONTENT],	[Obsah])
define([WORD_IMAGE],	[Obrázek])
define([WORD_IMPORTANT],	[důležité])
define([WORD_INFORMATION],	[pro informaci])
define([WORD_NOTE],	[poznámka])
define([WORD_REFERENCES],	[Odkazy])
define([WORD_SOURCE],	[odkaz v textu])
define([WORD_SRC],	[Zdroj: ])
define([WORD_TOP],	[Nahoru])
define([WORD_UPDATED],	[aktualizováno])
define([WORD_WARNING],	[varování])

# another language
define([OTHER_LANG_PATH],	[../texty/])
define([OTHER_LANG_CODE],	[en])

# list of all languages
define([cs_LANG],	[Česky])
define([en_LANG],	[Anglicky])
