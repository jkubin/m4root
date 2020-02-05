# vim:ts=16:sw=16

__HEADER([Josef Kubin], [2019/12/23], [root_cz])
___DESCR([converts inline and block-level elements into a plain text file for checking jargon and typos])
___POINT([plain text file for spell checking and for suggestions from other people (text can be easily edited)])

ifelse(defn([SOURCE]), [], [

	ROOT_ERROR([the source file name is missing])
])

# The first line: https://vim.fandom.com/wiki/Modeline_magic
# The second line: source_file	git_revision_of_source_file	creation_time
divert(0)dnl
[#] vim:wrap:spell:spelllang=LANG_CODE,en
#
[#] DONTE()
#
[#] __SOURCE(LB()defn([SOURCE]), ARG1(esyscmd([git log -1 --format='[0x%h],' ]defn([SOURCE]))), ARG1(esyscmd([date '+[%Y%m%d-%R:%S],']))])

divert(1)dnl
---
divert(-1)

# extracts title="the text" if defined
# β
pushdef([TITLE_ATTR], [

	ifelse(
		[$#], [2], [],
		[$2], [], [], [

		divert(0)dnl
__line__
[[$2]]

divert(-1)
	])
])

# prints monolingual text
# β
pushdef([PRINT_MONO], defn([TITLE_ATTR])[

	divert(0)dnl
__line__
EXPAND_ARG1_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)

divert(-1)
])

# prints text by language code
# β
pushdef([PRINT_LANG], defn([TITLE_ATTR])[

	divert(0)dnl
__line__
EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)

divert(-1)
])

# A → β
define([CAPTION], defn([PRINT_LANG])[

	define([FILE_PREFIX], __file__.LANG_CODE)
])

# write hyperlink text or dereference link address
# A → β
define([LINK], [pushdef([CURRQU], divnum)divert(-1)

	# the more arguments the more link capabilities
	ifelse(
		[$#], [2], [
			pushdef([PREF], defn([FILE_PREFIX]))
		],
		[$#], [3], [
			pushdef([PREF], [$3].LANG_CODE)
		],
		[$#], [4], [
			pushdef([PREF], [$3.$4])
		], [

		ROOT_ERROR([$0($@) is not defined])
	])

	# find link in refs
	ifelse(defn(defn([PREF]).anch.[$2]), [], [

		ROOT_WARNING([$0([$1], [‘$2’ not found], [$3], [$4]); run ‘make -B refs …’ to regenerate])
	])

	# find caption in refs
	pushdef([CAPT], defn(defn([PREF]).capt.[$1]))

	ifelse(defn([CAPT]), [], [

			# CAPT in refs not found, use the first LINK argument
			define([CAPT], [$1])
		],
		[$1], [$2], [], [

			# CAPT in refs was found, but the arg1 and arg2 are different, therefore use the arg1
			define([CAPT], [$1])
	])

	divert(CURRQU)dnl
CAPT[]popdef([CURRQU], [PREF], [CAPT])dnl
])

# append reference to the end of spell checking file
# A → β
define([REF], [pushdef([CURRQU], divnum)divert(-1)

	divert(1)dnl

__line__
$1	$2
divert(CURRQU)popdef([CURRQU])dnl
])

# HTML5 inline elements

# extracts data from AH(…) which has variable number of parameters, see html/inline.m4
# A → β
define([AH], [ifelse(
	[$#], [0], [],
	[$#], [1], [],
	[$#], [2], [$1],
	[$2], [], [$1],
	[$1 ([$2])])[]dnl
])

# A → β
define([BR], [
])

# A → β
# β
define([BO],		[ifelse([$#], [0], [[$0]], [$2], [], [$1], [$1 ([$2])])])
define([QM],		[ifelse([$#], [0], [[$0]], [$2], [], [„$1“], [„$1“ ([$2])])])

# A → β
# β
define([ABBR],		defn([BO]))
define([ACRO],		defn([BO]))
define([AP],		[ifelse([$#], [0], [[$0]], ['])])
define([BUTTON],	defn([BO]))
define([CITE],		defn([BO]))
define([CODE],		[ifelse([$#], [0], [[$0]], [$2], [], [], [([$2])])])
define([DEL],		defn([BO]))
define([DFN],		defn([BO]))
define([DQ],		[ifelse([$#], [0], [[$0]], ["])])
define([EM],		defn([BO]))
define([INS],		defn([BO]))
define([LABEL],		defn([BO]))
define([LI],		defn([BO]))
define([MARK],		defn([BO]))
define([METER],		defn([BO]))
define([NB],		[ifelse([$#], [0], [[$0]], [ ])])
define([OL],		defn([BO]))
define([PROGRESS],	defn([BO]))
define([QUOTE],		defn([QM]))
define([SAMP],		defn([CODE]))
define([SMALL],		defn([BO]))
define([SPAN],		defn([BO]))
define([SUB],		defn([BO]))
define([SUP],		defn([BO]))
define([TIME],		defn([BO]))
define([UL],		defn([BO]))
define([VAR],		defn([BO]))
define([WBR])
define([XSPAN],		[ifelse([$#], [0], [[$0]], [$2], [], [$1], [$1 ($2)])])

# custom HTML5 inline elements for convenience

# A → β
define([BUN],		defn([BO]))
define([CODE_BLUE],	defn([CODE]))
define([CODE_M4U],	defn([CODE]))
define([CODE_M4],	defn([CODE]))
define([CODE_UND],	defn([CODE]))
define([GRAY],		defn([BO]))
define([PERSON],	defn([BO]))

# HTML5 block-level elements

# A → β
define([ADDRESS_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([APPENDIX],		defn([PRINT_LANG], [APPENDIX_APPEND_CODE]))
define([ARTICLE_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([ASIDE_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([BLOCKQUOTE],		defn([PRINT_LANG]))
define([BLOCKQUOTE_MONO],		defn([PRINT_MONO]))
define([BRIDGEHEAD],		defn([PRINT_LANG]))
define([BRIDGEHEAD_MONO],		defn([PRINT_MONO]))
define([CHAPTER],		defn([PRINT_LANG]))
define([COMMAND], 		defn([TITLE_ATTR]))
define([COMMENT_MONO],		defn([PRINT_MONO]))
define([DESCRIPTION_LIST_DESC],		defn([PRINT_LANG]))
define([DESCRIPTION_LIST_DESC_MONO],	defn([PRINT_MONO]))
define([DESCRIPTION_LIST_TERM],		defn([PRINT_LANG]))
define([DESCRIPTION_LIST_TERM_MONO],	defn([PRINT_MONO]))
define([DESCRIPTION_LIST_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([DETAILS_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([DIV],			defn([PRINT_LANG]))
define([DIV_MONO],		defn([PRINT_MONO]))
define([DIV_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([FIGCAPTION],		defn([PRINT_LANG]))
define([FIGCAPTION_MONO],		defn([PRINT_MONO]))
define([FIGURE_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([FOOTER_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([FORM_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([HEADER_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([IMAGEDATA],		defn([PRINT_LANG]))
define([ITEMIZEDLIST_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([LISTITEM],		defn([PRINT_LANG]))
define([LISTITEM_MONO],		defn([PRINT_MONO]))
define([MAIN_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([NAV],			defn([PRINT_LANG]))
define([NAV_MONO],		defn([PRINT_MONO]))
define([NOTE],			defn([PRINT_LANG]))
define([NOTE_MONO],		defn([PRINT_MONO]))
define([NOTE_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([ORDEREDLIST_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([PARA],			defn([PRINT_LANG]))
define([PARA_MONO],		defn([PRINT_MONO]))
define([PEREX],			defn([PRINT_LANG]))
define([PLAIN_TEXT],		defn([PRINT_LANG]))
define([PLAIN_TEXT_MONO],		defn([PRINT_MONO]))
define([PROGRAMLISTING], 		defn([TITLE_ATTR]))
define([SECT1],			defn([PRINT_LANG]))
define([SECT2],			defn([PRINT_LANG]))
define([SECTION_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([SUMMARY],		defn([PRINT_LANG]))
define([SUMMARY_MONO],		defn([PRINT_MONO]))
define([TABLE_CAPTION],		defn([PRINT_LANG]))
define([TABLE_CAPTION_MONO],		defn([PRINT_MONO]))
define([TABLE_COLGROUP_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([TABLE_DATA],		defn([PRINT_LANG]))
define([TABLE_DATA_MONO],		defn([PRINT_MONO]))
define([TABLE_HEAD],		defn([PRINT_LANG]))
define([TABLE_HEAD_MONO],		defn([PRINT_MONO]))
define([TABLE_ROW_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([TABLE_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([TBODY_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([TFOOT_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([THEAD_WRAP],		defn([TITLE_ATTR], [EXPAND_LAST]))
define([TILE_BOX],		defn([PRINT_LANG]))

# for plugins
# β
pushdef([SPELLCHECK_FILE_TITLE], [

	ifelse(
		[$#], [1], [], [

		divert(0)dnl
__line__
LB()$2[]RB()

divert(-1)
	])
])

# A → β
define([INSERT_FILE_AND_LINK], defn([SPELLCHECK_FILE_TITLE]))

popdef(

	[PRINT],
	[SPELLCHECK_FILE_TITLE],
	[TITLE_ATTR],

)
