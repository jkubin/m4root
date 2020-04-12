# vim:ts=40:sw=40

__HEADER([Josef Kubin], [2019/07/11], [root_cz])
___DESCR([the file contains words specific to the generated language])
___POINT([multilingual targets])

# name of the series
define([SERIES_NAME],	[Generating code in M4])
define([LANG_VERSION],	[English version])

# sets the appropriate locale for a command
define([LANG_LOCALES],	[LANG=en_US.UTF-8 ])
define([DATE_COMMAND],	defn([LANG_LOCALES])[ date '+[%B %-e, %Y],'])

# preview + publish
define([SENTENCE_ALL_PARTS],	[Series breakdown])
define([TITLE_INPUT_FILES], 	[input files])
define([TITLE_OUTPUT_FILE], 	[output file])
define([WORD_APPENDIX],	[Appendix])
define([WORD_COMMAND],	[command])
define([WORD_CONTENT],	[Content])
define([WORD_IMAGE],	[Picture])
define([WORD_IMPORTANT],	[important])
define([WORD_INFORMATION],	[for information])
define([WORD_NOTE],	[note])
define([WORD_REFERENCES],	[References])
define([WORD_SOURCE],	[link in the text])
define([WORD_SRC],	[Source: ])
define([WORD_TOP],	[Top])
define([WORD_UPDATED],	[updated])
define([WORD_WARNING],	[warning])

# another language
define([OTHER_LANG_PATH],	[../clanky/])
define([OTHER_LANG_CODE],	[cs])

# list of all languages
define([LANG_cs],	[Czech])
define([LANG_en],	[English])
