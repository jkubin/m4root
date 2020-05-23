# vim:ts=16:sw=16

__HEADER([Josef Kubin], [2020/05/11], [m4root])
___DESCR([creates a plain text file as a basis for other transformations])
___POINT([text file for total number of words and characters])

ifelse(defn([SOURCE]), [], [

	ROOT_ERROR([set the -DSOURCE='file.mc' on the command line])
])

# m4 -DWITHOUT_HEADER …	<--- provides a more accurate total number of words and characters
ifdef([WITHOUT_HEADER], [], [
	divert(0)dnl
vim:ts=4:sw=4

DONTE()
divert(-1)
])

# prints monolingual text
# β
pushdef([PRINT_MONO], [

	divert(CURRQU)dnl
EXPAND_ARG1_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)

divert(-1)
])

# prints the text selected by the language code
# β
pushdef([PRINT_LANG], [

	divert(CURRQU)dnl
EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)

divert(-1)
])

# create and init counter for images
define([IMAGE_COUNTER], defn([COUNT_UP]))
IMAGE_COUNTER(1)

# β
pushdef([PRINT_IMAGE], [

	divert(CURRQU)dnl
WORD_IMAGE IMAGE_COUNTER: EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)

divert(-1)
])

# β
pushdef([PRINT_PROGRAMLISTING], [

	divert(CURRQU)dnl
EXPAND_ARG1_WITHOUT_TRAILING_LF(]defn([SELECT_LAST])[)

divert(-1)
])

# A → β
pushdef([PRINT_PROMPT_USR], [

	divert(CURRQU)dnl
CMD() dnl
divert(-1)
])

# A → β
pushdef([PRINT_PROMPT_ROOT], [

	divert(CURRQU)dnl
ROO() dnl
divert(-1)
])

# A → β
pushdef([PRINT_BULLET], [

	divert(CURRQU)dnl
• dnl
divert(-1)
])

# β
pushdef([PRINT_NOTE_SYMBOL], [

	divert(CURRQU)dnl
🖹 dnl
divert(-1)
])

# β
pushdef([PRINT_INFO_SYMBOL], [

	divert(CURRQU)dnl
🛈 dnl
divert(-1)
])

# β
pushdef([PRINT_WARN_SYMBOL], [

	divert(CURRQU)dnl
⚠ dnl
divert(-1)
])

# β
pushdef([PRINT_EXCL_SYMBOL], [

	divert(CURRQU)dnl
❕ dnl
divert(-1)
])

# A → β
define([CAPTION], [

	# append a new line
	divert(END_OF_NAVIGATION)
divert(-1)

	# TODO: unfinished

	ifdef([WITHOUT_HEADER], [], [

		divert(0)dnl

__SOURCE(LB()defn([SOURCE])RB(), SARG1(esyscmd([date '+[[%Y%m%d-%R:%S]],'])), SARG1(esyscmd([git log -1 --format='[[%h]],' ]defn([SOURCE]))), SARG1(esyscmd([git log -1 --format='[[%h]],'])))

divert(-1)
	])

	# reset automata
	define([APPENDIX], defn([APPENDIX_INIT]))
	define([CURRQU], 0)
	define([SECT1], defn([SECT1_BODY]))
	define([SECT2], defn([SECT2_BODY]))

	]defn([PRINT_LANG])[

	# needed for LINK(…)
	define([FILE_PREFIX], __file__.LANG_CODE)

	# TODO: tady nastavit neterminalni pocitadlo
	#
	# define counters for chapters and sections
	define([CHAPTER_IDX], defn([COUNT_UP]))
	define([SECT1_IDX], defn([COUNT_UP]))
	define([SECT2_IDX], defn([COUNT_UP]))

	# init counters for chapters and sections
	CHAPTER_IDX(0)
	SECT1_IDX(0)
	SECT2_IDX(0)
])

# β
define([INIT_INDICES_SELECT_LANG], [

	# A → ε
	define([#S0])
	define([#S1])
	define([#S2])

	define([SELITM], SELECT_LANG(]defn([EXPAND_LAST])[))
])

# β
pushdef([CHAPTER_COMMON_CODE], [

	define([CURRQU], ARTICLE_CONTENT)

	divert(CHAPTER_NAVIG_DATA)dnl
defn([INDENT_LEVEL], [#S0], [#S1], [#S2]) SELITM
divert(CURRQU)dnl
defn([#S0], [#S1], [#S2]) SELITM
divert(-1)
])

# A → β
define([CHAPTER], defn([INIT_INDICES_SELECT_LANG])[

	# increment index
	CHAPTER_IDX

	# assign indexes
	define([SECT1_IDX_val], 0)
	define([SECT2_IDX_val], 0)

	define([#S0], CHAPTER_IDX_val)
	define([INDENT_LEVEL])

]defn([CHAPTER_COMMON_CODE]))

# A → β
define([SECT1_BODY], defn([INIT_INDICES_SELECT_LANG])[

	# increment index
	SECT1_IDX
	define([SECT2_IDX_val], 0)

	# assign indexes
	define([#S0], CHAPTER_IDX_val)
	define([#S1], .SECT1_IDX_val)

	define([INDENT_LEVEL], [	])

]defn([CHAPTER_COMMON_CODE]))

# A → β
define([SECT2_BODY], defn([INIT_INDICES_SELECT_LANG])[

	# increment index
	SECT2_IDX

	# assign indexes
	define([#S0], CHAPTER_IDX_val)
	define([#S1], .SECT1_IDX_val)
	define([#S2], .SECT2_IDX_val)

	define([INDENT_LEVEL], [		])

]defn([CHAPTER_COMMON_CODE]))

# β
define([APPENDIX_NODE], defn([INIT_INDICES_SELECT_LANG])[

	# assign and increment letter index
	define([APPENDIX_LETTER], format([%c], APPENDIX_IDX))
	define([SECT1_IDX_val], 0)
	define([SECT2_IDX_val], 0)

	# assign indexes
	define([#S0], APPENDIX_LETTER)

	# set the current queue
	define([CURRQU], APPENDIX_CONTENT)

	divert(APPENDIX_NAVIG_DATA)dnl
defn([#S0], [#S1], [#S2]) SELITM
divert(APPENDIX_NAVIGATION)dnl

undivert(CURRQU)dnl
defn([#S0], [#S1], [#S2]) SELITM
divert(-1)

	# temporarily change the current queue
	pushdef([CURRQU], [APPENDIX_NAVIGATION])
	APPENDIX_APPEND_CODE()
	# set the previous queue
	popdef([CURRQU])
])

#      _______________      _______________
# --->/ APPENDIX_INIT \--->/ APPENDIX_NODE \---.
#     \_______________/    \_______________/<--'
#      ____________      ________________
# --->/ SECT1_BODY \--->/ SECT1_APPENDIX \---.
#     \_SECT2_BODY_/    \_SECT2_APPENDIX_/<--'
#
# β
define([APPENDIX_INIT], [

	# starting letter is 65: ord('A')
	define([APPENDIX_IDX], defn([COUNT_UP]))
	APPENDIX_IDX(65)

	# add a separator between article body and appendixes
	divert(APPENDIX_NAVIG_DATA)dnl
---
divert(-1)

	# transition to the next node(s)
	define([APPENDIX], defn([APPENDIX_NODE]))
	define([SECT1], defn([SECT1_APPENDIX]))
	define([SECT2], defn([SECT2_APPENDIX]))

]defn([APPENDIX_NODE]))

# β
define([SECT1_APPENDIX], defn([INIT_INDICES_SELECT_LANG])[

	# increment index
	SECT1_IDX
	define([SECT2_IDX_val], 0)

	# assign indexes
	define([#S0], APPENDIX_LETTER)
	define([#S1], .SECT1_IDX_val)

	divert(APPENDIX_NAVIGATION)dnl
	defn([#S0], [#S1], [#S2]) SELITM
divert(CURRQU)dnl
defn([#S0], [#S1], [#S2]) SELITM
divert(-1)
])

# β
define([SECT2_APPENDIX], defn([INIT_INDICES_SELECT_LANG])[

	# increment index
	SECT2_IDX

	# assign indexes
	define([#S0], APPENDIX_LETTER)
	define([#S1], .SECT1_IDX_val)
	define([#S2], .SECT2_IDX_val)

	divert(APPENDIX_NAVIGATION)dnl
		defn([#S0], [#S1], [#S2]) SELITM
divert(CURRQU)dnl
defn([#S0], [#S1], [#S2]) SELITM
divert(-1)
])

# prints a line as a separator
# A → β
_define([HORIZONTAL_RULE], [

	divert(CURRQU)dnl
---
divert(-1)
])

# HTML5 inline elements

# A → β
define([BR], [
])

# quotation marks are automatically set according to the language code
# A → β
ifelse(defn([LANG_CODE]), [cs], [
	define([QUOTE],	[ifelse([$#], [0], [[$0]], [„$1“])])
], [
	define([QUOTE],	[ifelse([$#], [0], [[$0]], [“$1”])])
])

# A → β
# β
define([BOLD],		[ifelse([$#], [0], [[$0]], [$1])])

# A → β
# A → ε
# β
define([ABBREV],	defn([BOLD]))
define([ACRONYM],	defn([BOLD]))
define([AMP],		[ifelse([$#], [0], [[$0]], [&])])
define([AP],		[ifelse([$#], [0], [[$0]], ['])])
define([BUTTON],	defn([BOLD]))
define([CITATION],	defn([BOLD]))
define([CODE],		defn([BOLD]))
define([CODE_M4],	[ifelse([$#], [0], [[$0]], [[$1]])])
define([DEFINITION],	defn([BOLD]))
define([DELETED],	defn([BOLD]))
define([DQ],		[ifelse([$#], [0], [[$0]], ["])])
define([EMPHASIS],	defn([BOLD]))
define([GT],		[ifelse([$#], [0], [[$0]], [>])])
define([HCODE],		defn([BOLD]))
define([HCODE_M4],	defn([CODE_M4]))
define([HEXPL],		defn([BOLD]))
define([HEXPL_M4],	defn([CODE_M4]))
define([INS],		defn([BOLD]))
define([ITALIC],	defn([BOLD]))
define([LABEL],		defn([BOLD]))
define([LI],		[ifelse([$#], [0], [[$0]], [• $1])])
define([LT],		[ifelse([$#], [0], [[$0]], [<])])
define([MARK],		defn([BOLD]))
define([METER],		defn([BOLD]))
define([MM],		defn([BOLD]))
define([NB],		[ifelse([$#], [0], [[$0]], [ ])])
define([OL],		defn([LI]))
define([PROGRESS],	defn([BOLD]))
define([SAMP],		defn([BOLD]))
define([SMALL],		defn([BOLD]))
define([SPAN],		defn([BOLD]))
define([STRIKETHROUGH],	defn([BOLD]))
define([STRONG],	defn([BOLD]))
define([SUBSCRIPT],	defn([BOLD]))
define([SUPERSCRIPT],	defn([BOLD]))
define([TIME],		defn([BOLD]))
define([ULINK],		defn([BOLD]))
define([UL],		[ifelse([$#], [0], [[$0]], [	$1])])
define([UNDERLINE],	defn([BOLD]))
define([VARIABLE],	defn([BOLD]))
define([WBR])
define([XSPAN],		defn([BOLD]))

# custom HTML5 inline elements for convenience

# A → β
#define([BUN],		defn([BOLD]))
define([CODE_BLUE],	defn([BOLD]))
define([CODE_M4U],	defn([CODE_M4]))
define([CODE_UND],	defn([BOLD]))
define([EXPL],		defn([BOLD]))
define([EXPL_M4],	defn([CODE_M4]))
define([GRAY],		defn([BOLD]))
define([PERSON],	defn([BOLD]))

# HTML5 block-level elements

# A → β
define([ADDRESS_WRAP],		defn([EXPAND_LAST]))
define([ARTICLE_WRAP],		defn([EXPAND_LAST]))
define([ASIDE_WRAP],		defn([EXPAND_LAST]))
define([BLOCKQUOTE],		defn([PRINT_LANG]))
define([BLOCKQUOTE_MONO],		defn([PRINT_MONO]))
define([BRIDGEHEAD],		defn([PRINT_LANG]))
define([BRIDGEHEAD_MONO],		defn([PRINT_MONO]))
define([COMMAND_ROOT], 		defn([PRINT_PROMPT_ROOT], [PRINT_PROGRAMLISTING]))
define([COMMAND_USR], 		defn([PRINT_PROMPT_USR], [PRINT_PROGRAMLISTING]))
define([COMMENT_MONO],		defn([PRINT_MONO]))
define([DESCRIPTION_LIST_DESC],		defn([PRINT_LANG]))
define([DESCRIPTION_LIST_DESC_MONO],	defn([PRINT_MONO]))
define([DESCRIPTION_LIST_TERM],		defn([PRINT_LANG]))
define([DESCRIPTION_LIST_TERM_MONO],	defn([PRINT_MONO]))
define([DESCRIPTION_LIST_WRAP],		defn([EXPAND_LAST]))
define([DETAILS_WRAP],		defn([EXPAND_LAST]))
define([DIV],			defn([PRINT_LANG]))
define([DIV_MONO],		defn([PRINT_MONO]))
define([DIV_WRAP],		defn([EXPAND_LAST]))
define([ENTRY],			defn([PRINT_LANG]))
define([ENTRY_HEAD],		defn([PRINT_LANG]))
define([ENTRY_HEAD_MONO],		defn([PRINT_MONO]))
define([ENTRY_MONO],		defn([PRINT_MONO]))
define([EXCL],			defn([PRINT_EXCL_SYMBOL], [PRINT_LANG]))
define([FIGCAPTION],		defn([PRINT_LANG]))
define([FIGCAPTION_MONO],		defn([PRINT_MONO]))
define([FIGURE_WRAP],		defn([EXPAND_LAST]))
define([FOOTER_WRAP],		defn([EXPAND_LAST]))
define([FORM_WRAP],		defn([EXPAND_LAST]))
define([HEADER_WRAP],		defn([EXPAND_LAST]))
define([IMAGEDATA],		defn([PRINT_IMAGE]))
define([INFO],			defn([PRINT_INFO_SYMBOL], [PRINT_LANG]))
define([ITEMIZEDLIST_WRAP],		defn([EXPAND_LAST]))
define([LISTITEM],		defn([PRINT_BULLET], [PRINT_LANG]))
define([LISTITEM_MONO],		defn([PRINT_BULLET], [PRINT_MONO]))
define([MAIN_WRAP],		defn([EXPAND_LAST]))
define([NAV],			defn([PRINT_LANG]))
define([NAV_MONO],		defn([PRINT_MONO]))
define([NOTE],			defn([PRINT_NOTE_SYMBOL], [PRINT_LANG]))
define([NOTE_MONO],		defn([PRINT_MONO]))
define([NOTE_WRAP],		defn([EXPAND_LAST]))
define([ORDEREDLIST_WRAP],		defn([EXPAND_LAST]))
define([PARA],			defn([PRINT_LANG]))
define([PARA_MONO],		defn([PRINT_MONO]))
define([PEREX],			defn([PRINT_LANG]))
define([PLAIN_TEXT],		defn([PRINT_LANG]))
define([PLAIN_TEXT_MONO],		defn([PRINT_MONO]))
define([PROGRAMLISTING], 		defn([PRINT_PROGRAMLISTING]))
define([ROW_WRAP],		defn([EXPAND_LAST]))
define([SECTION_WRAP],		defn([EXPAND_LAST]))
define([SUMMARY],		defn([PRINT_LANG]))
define([SUMMARY_MONO],		defn([PRINT_MONO]))
define([TABLE_COLGROUP_WRAP],		defn([EXPAND_LAST]))
define([TABLE_WRAP],		defn([EXPAND_LAST]))
define([TBODY_WRAP],		defn([EXPAND_LAST]))
define([TFOOT_WRAP],		defn([EXPAND_LAST]))
define([THEAD_WRAP],		defn([EXPAND_LAST]))
define([TILE_BOX],		defn([PRINT_LANG]))
define([TTITLE],		defn([PRINT_LANG]))
define([TTITLE_MONO],		defn([PRINT_MONO]))
define([WARN],			defn([PRINT_WARN_SYMBOL], [PRINT_LANG]))

popdef(

	[PRINT_BULLET],
	[PRINT_LANG],
	[PRINT_MONO],
	[PRINT_PROGRAMLISTING],
	[PRINT_PROMPT_ROOT],
	[PRINT_PROMPT_USR],

)
