# vim:ts=40:sw=40

__HEADER([Josef Kubin], [2019/07/11], [root_cz])
___DESCR([the file contains language-specific words])
__REASON([multilingual targets])

# name of the series
define([SERIES_NAME],	[Generování kódu v M4])

# sets the appropriate locale for other commands (not only `date')
define([LANG_LOCALES],	[LANG=cs_CZ.utf8])

# sets a command
define([DATE_COMMAND],	defn([LANG_LOCALES])[ date '+[%-e. %B %Y],'])

# preview + publish
define([LANG_RPM_PACKAGE],	[vše potřebné pro vývoj M4 skriptů pro generování zdrojového kódu])
define([LANG_SRPM_PACKAGE],	[zdrojový RPM balíček])
define([SENTENCE_ALL_PARTS],	[Všechny díly seriálu])
define([TITLE_INPUT_FILES], 	[vstupní soubory])
define([TITLE_OUTPUT_FILE], 	[výstupní soubor])
define([WORD_APPENDIX],	[Příloha])
define([WORD_ARTICLE_DEVELOPMENT],	[vygenerovaná html stránka pro off-line vývoj])
define([WORD_ARTICLE_MARKDOWN],	[vygenerovaný text ve formátu markdown])
define([WORD_ARTICLE_PREVIEW],	[vygenerovaná html stránka pro off-line náhled])
define([WORD_ARTICLE_SOURCE],	[zdrojový kód článku])
define([WORD_ARTICLE_TEXT],	[vygenerovaný text pro odhad počtu znaků])
define([WORD_CLIPBOARD],	[vybrat text])
define([WORD_COMMAND],	[příkaz])
define([WORD_CONTENT],	[Obsah])
define([WORD_IMAGE],	[Obrázek])
define([WORD_IMPORTANT],	[důležité])
define([WORD_INFORMATION],	[pro informaci])
define([WORD_NOTE],	[poznámka])
define([WORD_PART],	[Část])
define([WORD_PUBLISH_TEXT],	[vygenerovaný text, který právě čtete a který byl vložen do redakčního systému (CMS)])
define([WORD_REFERENCES],	[Odkazy])
define([WORD_SOURCE],	[odkaz v textu])
define([WORD_SPELL_TEXT],	[vygenerovaný text pro kontrolu překlepů a žargonu (určeno pro Vim)])
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
