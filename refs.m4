__HEADER([Josef Kubin], [2019/12/11], [root_cz])
___DESCR([tests chapter logic flow test (chapter → sub-chapter → sub-sub-chatper) and generates references for anchors])
___POINT([find all ID in HTML tags])

# create aliases to existing macros
# A → β
define([LBR], defn([LB]))
define([RBR], defn([RB]))

# re-define problematic macros used in captions
# A → β
define([AP], [ifelse([$#], [0], [[$0]], ['])])
define([BO], [ifelse([$#], [0], [[$0]], [$1])])
define([DQ], [ifelse([$#], [0], [[$0]], ["])])
define([NB], [ifelse([$#], [0], [[$0]], [ ])])
define([CODE], defn([BO]))
define([CODE_M4], [ifelse([$#], [0], [[$0]], [[$1]])])
define([LB], [b])
define([LQ], [g])
define([LN], [n])
define([LU], [u])

# A → ε
define([RB])
define([RQ])
define([RN])
define([RU])

# set unique key
# β
pushdef([SET_UNIQ_KEY_FOR_LINK], [

	ifdef([#ID], [

		# create a unique string
		define([UNIQ], defn([FILE_PREFIX], [#ID]))

		# already has a value?
		ifdef(defn([UNIQ]), [

			ROOT_ERROR([internal reference ‘$0(]BRAC(defn([#ID]))[, …)’ is not unique, first occurrence on:]defn(defn([UNIQ])))
		])

		# assign (file:line) value for later error message
		define(defn([UNIQ]), __file__:__line__)

		define([REFERENCE_KEY], defn([#ID]))
	], [
		define([REFERENCE_KEY], defn([SELITM]))
	])
])

# A → β
define([CREATE_REFERENCE], [

	# test for name collision
	ifdef([$1], [

		ROOT_ERROR([$1 collides with a macro name; use different name])
	])

	# filter permitted characters
	ifelse(patsubst([[$1]], [[0-9A-Za-z_]]), [], [], [

		ROOT_ERROR([forbidden characters found in $2([$1], …)])
	])

	# translit upper case to lower case, change underscore to dash
	define([STRING], translit([[$1]], [_A-Z], [-a-z]))

	# create a unique string
	define([UNIQ], defn([FILE_PREFIX], [STRING]))

	# already has a value?
	ifdef(defn([UNIQ]), [

		ROOT_ERROR([html anchor ‘$2(]BRAC(defn([STRING]))[, …)’ is not unique, first occurrence on:]defn(defn([UNIQ])))
	])

	# assign value for later error message (file:line)
	define(defn([UNIQ]), __file__:__line__)

	# create reference to identifier
	PRINT_LINE(anch.[$1], defn([STRING]))
])

# β
pushdef([PROCESS_ID], [

	# if more than 1 param, then the $[1] is surely #ID
	ifelse(
		[$#], [1], [],
		[$1], [], [], [

		CREATE_REFERENCE([$1], [$0])
	])
])

# β
pushdef([PROCESS_ID_UNPAIRED], [

	ifelse([$1], [], [], [

		CREATE_REFERENCE([$1], [$0])
	])
])

# anchors are shortened to a reasonable length (should not be a problem)
# β
pushdef([ANCHORS_SED], [

	define([SED_FILE], [anchors.sed])
])

# captions are also filenames, so they must not be truncated unless we want strange filenames
# β
pushdef([CAPTIONS_SED], [

	define([SED_FILE], [captions.sed])
])

# transliterate problematic characters for heredoc and expand SELITM to terminals
# the new line from the resulting string is removed by ARG1
# execute sed as an external command for strings
# β
pushdef([EXECUTE_SED], [

	ifelse(NAR(SELITM), [1], [], [

		ROOT_ERROR([comma is not protected, use square brackets: ‘,’ → [,] $0(]BRAC(defn([SELITM]))[)])
	])

	define([STRING], ARG1(esyscmd([sed -f ]SED_FILE[ << EOF]
translit(defn([SELITM]), [*$`'@#], [xdbath])
[EOF])))

	# stop if an error occurred
	ifelse(sysval, [0], [], [

		ROOT_ERROR([an external command error occured])
	])
])

# the resulting string must be tested
# β
pushdef([TEST_RESULT], [

	# is string is empty?
	ifelse(defn([STRING]), [], [

		ROOT_ERROR([anchor is empty, write an [:alnum:]+ content please])
	])

	# create a unique string
	define([UNIQ], defn([FILE_PREFIX], [STRING]))

	# already has a value?
	ifdef(defn([UNIQ]), [

		ROOT_ERROR([anchor ‘]defn([STRING])[’ from $0(]BRAC(defn([SELITM]))[) is not unique, first occurrence on:]defn(defn([UNIQ])))
	])

	# assign (file:line) value for later error message
	define(defn([UNIQ]), __file__:__line__)
])

# A → β
define([CAPTION], [

	# input files are defined in TOC_FILE_NAME
	ifdef(__file__, [], [

		ROOT_ERROR([new input file found, open the ‘]TOC_FILE_NAME[’ and include it in the file list])
	])

	]defn([MULTILINGUAL_HEADINGS], [CAPTIONS_SED], [EXECUTE_SED], [TEST_RESULT])[

	define([FILE_PREFIX], __file__.LANG_CODE)

	]defn([SET_UNIQ_KEY_FOR_LINK])[

	# expand string because of target languages in references
	define([SELITM], SELITM)

	divert(NAVIGATION_LOGIC)dnl
NAVIGATION(__file__, LANG_CODE, defn([SELITM]), defn([STRING]), defn(__file__))
divert(-1)
])

# A → β
define([NAVIGATION], [dnl
[define([$1.$2.capt], [$3])
define([$1.$2.anch], [$4])
define([$5.$2.capt], [$3])
define([$5.$2.anch], [$4])
define([#.$2.$3], [$5])]
])

# A → β
define([PRINT_LINE], [

	divert(ANCHORS)dnl
[define(]BRAC(defn([FILE_PREFIX]).[$1])[, [$2])]
divert(-1)
])

# β
pushdef([PRINT_ITEMS], [

	# if identifier is not empty, create reference to caption
	ifelse(defn([#ID]), [], [], [

		PRINT_LINE(capt.defn([REFERENCE_KEY]), defn([SELITM]))
	])

	# create html anchor
	PRINT_LINE(anch.defn([REFERENCE_KEY]), defn([STRING]))

	# create string from caption for testing
	divert(ANCHORS)dnl
[define(]BRAC(defn([FILE_PREFIX]).uniq.defn([SELITM])))
divert(-1)
])

# A → β
# β
define([CHAPTER], defn([MULTILINGUAL_HEADINGS], [ANCHORS_SED], [EXECUTE_SED], [TEST_RESULT])[

	define([$0_NODE], defn([$0]))

	]defn([SET_UNIQ_KEY_FOR_LINK], [PRINT_ITEMS])[
])

# A → β
define([SUB_CHAPTER], defn([MULTILINGUAL_HEADINGS], [ANCHORS_SED], [EXECUTE_SED], [TEST_RESULT])[

	# chapter logic flow test
	ifelse(
		defn([CHAPTER_NODE]), defn([CHAPTER]), [],
		defn([CHAPTER_NODE]), defn([SUB_CHAPTER]), [],
		defn([CHAPTER_NODE]), defn([SUB_SUB_CHAPTER]), [], [

		ROOT_ERROR([sub-chapter must follow chapter or sub-sub-chapter])
	])

	# set automaton to sub-chapter node
	define([CHAPTER_NODE], defn([$0]))

	]defn([SET_UNIQ_KEY_FOR_LINK], [PRINT_ITEMS])[
])

# A → β
define([SUB_SUB_CHAPTER], defn([MULTILINGUAL_HEADINGS], [ANCHORS_SED], [EXECUTE_SED], [TEST_RESULT])[

	# chapter logic flow test
	ifelse(
		defn([CHAPTER_NODE]), defn([SUB_CHAPTER]), [],
		defn([CHAPTER_NODE]), defn([SUB_SUB_CHAPTER]), [], [

		ROOT_ERROR([sub-sub-chapter must follow sub-chapter or sub-sub-chapter])
	])

	# set automaton to sub-sub-chapter node
	define([CHAPTER_NODE], defn([$0]))

	]defn([SET_UNIQ_KEY_FOR_LINK], [PRINT_ITEMS])[
])

# annex is the same as chapter except of the inner comment
# Keep the first new line for unique automaton node: (ANNEX <-/-> CHAPTER)!
# A → β
define([ANNEX], [
]defn([CHAPTER]))

# A → β
define([SUB_ANNEX], defn([MULTILINGUAL_HEADINGS], [ANCHORS_SED], [EXECUTE_SED], [TEST_RESULT])[

	# chapter logic flow test
	ifelse(
		defn([ANNEX_NODE]), defn([ANNEX]), [],
		defn([ANNEX_NODE]), defn([SUB_ANNEX]), [],
		defn([ANNEX_NODE]), defn([SUB_SUB_ANNEX]), [], [

		ROOT_ERROR([sub-chapter must follow chapter or sub-sub-chapter])
	])

	# set automaton to sub-annex
	define([ANNEX_NODE], defn([$0]))

	]defn([SET_UNIQ_KEY_FOR_LINK], [PRINT_ITEMS])[
])

# A → β
define([SUB_SUB_ANNEX], defn([MULTILINGUAL_HEADINGS], [ANCHORS_SED], [EXECUTE_SED], [TEST_RESULT])[

	# chapter logic flow test
	ifelse(
		defn([ANNEX_NODE]), defn([SUB_ANNEX]), [],
		defn([ANNEX_NODE]), defn([SUB_SUB_ANNEX]), [], [

		ROOT_ERROR([sub-sub-chapter must follow sub-chapter or sub-sub-chapter])
	])

	# set automaton to sub-sub-annex
	define([ANNEX_NODE], defn([$0]))

	]defn([SET_UNIQ_KEY_FOR_LINK], [PRINT_ITEMS])[
])

# A → β
define([WORD], [

	ifdef([$1], [], [

		ROOT_ERROR([the macro ‘$1’ is not defined])
	])

	divert(SEL_WORDS)dnl
[define(]LBR()LANG_CODE.[$1]RBR(), LBR()defn([LANG_VERSION])RBR())
divert(-1)
])

# connects source files to generated files, languages, captions and anchors
divert(0)dnl
[#] DONTE()

# associative memory for linking references
# A → β
divert(ANCHORS)dnl
# captions and ID
# A → β
divert(SEL_WORDS)dnl

# selected words from the current language
# A → β
divert(-1)

WORD([LANG_VERSION])

# A → β
define([ADDRESS_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([ARTICLE_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([ASIDE_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([BLOCKQUOTE],			defn([PROCESS_ID]))
define([BLOCKQUOTE_MONO],		defn([PROCESS_ID]))
define([DESCRIPTION_LIST_DESC],		defn([PROCESS_ID]))
define([DESCRIPTION_LIST_DESC_MONO],	defn([PROCESS_ID]))
define([DESCRIPTION_LIST_TERM],		defn([PROCESS_ID]))
define([DESCRIPTION_LIST_TERM_MONO],	defn([PROCESS_ID]))
define([DESCRIPTION_LIST_WRAP],		defn([PROCESS_ID], [EXPAND_LAST]))
define([DETAILS_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([DIV],				defn([PROCESS_ID]))
define([DIV_MONO],			defn([PROCESS_ID]))
define([DIV_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([FIGCAPTION],			defn([PROCESS_ID]))
define([FIGCAPTION_MONO],		defn([PROCESS_ID]))
define([FIGURE_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([FOOTER_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([FORM_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([HEADER_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([HEADING],			defn([MULTILINGUAL_HEADINGS], [ANCHORS_SED], [EXECUTE_SED], [TEST_RESULT], [SET_UNIQ_KEY_FOR_LINK], [PRINT_ITEMS]))
define([HEADING_MONO],			defn([MONOLINGUAL_HEADINGS], [ANCHORS_SED], [EXECUTE_SED], [TEST_RESULT], [SET_UNIQ_KEY_FOR_LINK], [PRINT_ITEMS]))
define([HORIZONTAL_RULE],		defn([PROCESS_ID_UNPAIRED]))
define([IMG],				defn([PROCESS_ID]))
define([LIST_ITEM],			defn([PROCESS_ID]))
define([LIST_ITEM_MONO],		defn([PROCESS_ID]))
define([MAIN_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([NAV],				defn([PROCESS_ID]))
define([NAV_MONO],			defn([PROCESS_ID]))
define([ORDERED_LIST_WRAP],		defn([PROCESS_ID], [EXPAND_LAST]))
define([PARA],				defn([PROCESS_ID]))
define([PARA_MONO],			defn([PROCESS_ID]))
define([PRE],				defn([PROCESS_ID]))
define([SECTION_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([SUMMARY],			defn([PROCESS_ID]))
define([SUMMARY_MONO],			defn([PROCESS_ID]))
define([TABLE_CAPTION],			defn([PROCESS_ID]))
define([TABLE_CAPTION_MONO],		defn([PROCESS_ID]))
define([TABLE_COLGROUP_WRAP],		defn([PROCESS_ID], [EXPAND_LAST]))
define([TABLE_COL],			defn([PROCESS_ID_UNPAIRED]))
define([TABLE_DATA],			defn([PROCESS_ID]))
define([TABLE_DATA_MONO],		defn([PROCESS_ID]))
define([TABLE_HEAD],			defn([PROCESS_ID]))
define([TABLE_HEAD_MONO],		defn([PROCESS_ID]))
define([TABLE_ROW_WRAP],		defn([PROCESS_ID], [EXPAND_LAST]))
define([TABLE_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([TBODY_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([TFOOT_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([THEAD_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([TILE_BOX],			defn([PROCESS_ID]))
define([TIP_BOX],			defn([PROCESS_ID]))
define([TIP_BOX_MONO],			defn([PROCESS_ID]))
define([TIP_BOX_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([UNORDERED_LIST_WRAP],		defn([PROCESS_ID], [EXPAND_LAST]))

# forget local β rules (good for frozen files)
popdef(

	[ANCHORS_SED],
	[CAPTIONS_SED],
	[EXECUTE_SED],
	[LANG_REC],
	[MONO_REC],
	[PRINT_ITEMS],
	[PROCESS_ID],
	[PROCESS_ID_UNPAIRED],
	[SET_UNIQ_KEY_FOR_LINK],
	[TEST_RESULT],

)
