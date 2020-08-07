# vim:ts=40:sw=40

__HEADER([Josef Kubin], [2019/07/11], [root_cz])
___DESCR([the file contains language-specific words])
___POINT([multilingual targets])

# name of the series
define([SERIES_NAME],	[Generating code in M4])

# sets the appropriate locale for commands
define([LANG_LOCALES],	[LANG=en_US.UTF-8 ])

# sets a command
define([DATE_COMMAND],	defn([LANG_LOCALES])[ date '+[%B %-e, %Y],'])

# preview + publish
define([LANG_RPM_PACKAGE],	[everything needed for the development of M4 scripts for source code generation])
define([LANG_SRPM_PACKAGE],	[source RPM package])
define([SENTENCE_ALL_PARTS],	[Series breakdown])
define([TITLE_INPUT_FILES], 	[input files])
define([TITLE_OUTPUT_FILE], 	[output file])
define([WORD_APPENDIX],	[Appendix])
define([WORD_ARTICLE_HTML],	[generated html page for off-line development])
define([WORD_ARTICLE_MARKDOWN],	[generated text in markdown format])
define([WORD_ARTICLE_SOURCE],	[source text for all generated texts])
define([WORD_ARTICLE_TEXT],	[generated text for estimating the number of characters])
define([WORD_COMMAND],	[command])
define([WORD_CONTENT],	[Content])
define([WORD_IMAGE],	[Picture])
define([WORD_IMPORTANT],	[important])
define([WORD_INFORMATION],	[for information])
define([WORD_NOTE],	[note])
define([WORD_PART],	[Part])
define([WORD_PUBLISH_TEXT],	[generated text that you are currently reading and that has been entered into the content management system (CMS)])
define([WORD_REFERENCES],	[References])
define([WORD_SOURCE],	[link in the text])
define([WORD_SPELL_TEXT],	[generated text for spell checking and jargon (designed for Vim)])
define([WORD_SRC],	[Source: ])
define([WORD_TOP],	[Top])
define([WORD_UPDATED],	[updated])
define([WORD_WARNING],	[warning])

# another language
define([OTHER_LANG_PATH],	[../clanky/])
define([OTHER_LANG_CODE],	[cs])

# list of all languages
define([cs_LANG],	[Czech])
define([en_LANG],	[English])
