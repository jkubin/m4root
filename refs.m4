__HEADER([Josef Kubin], [2019/12/11], [root_cz])
___DESCR([tests logic flow (CHAPTER → SECT1 → SECT2) and generates references for anchors])
___POINT([extracts all IDs from files and creates associative pair])

# define counter for output queues and source files
# A → β
define([QUEUE_INDEX], defn([COUNT_UP]))
define([SOURCE_COUNTER], defn([COUNT_UP]))

# init counters
QUEUE_INDEX(1)
SOURCE_COUNTER(1)

define([NAVIGATION_LOGIC],	QUEUE_INDEX)
define([ANCHORS],		QUEUE_INDEX)
define([SEL_WORDS],		QUEUE_INDEX)

# create aliases to existing macros
# A → β
define([LBR], defn([LB]))
define([RBR], defn([RB]))

# re-define problematic macros used in captions
# A → β
define([AP],		[ifelse([$#], [0], [[$0]], [a])])
define([BOLD],		[ifelse([$#], [0], [[$0]], [$1])])
define([CODE],		[ifelse([$#], [0], [[$0]], [[$1]])])
define([DQ],		[ifelse([$#], [0], [[$0]], [d])])
define([LB],		[b])
define([LN],		[n])
define([LQ],		[g])
define([LU],		[u])
define([NB],		[ifelse([$#], [0], [[$0]], [ ])])
define([XCODE],		defn([BOLD]))

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

			ROOT_ERROR([internal reference ‘$0(]BRAC(defn([#ID]))[, …)’ is not unique, the first occurrence on:]defn(defn([UNIQ])))
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

	# remove permitted characters, remains forbidden char(s)
	ifelse(patsubst([[$1]], [[0-9A-Za-z_]]), [], [], [

		ROOT_ERROR([forbidden character(s) found in $2([$1], …)])
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

	# print ordinary reference to an identifier
	PRINT_ORDINARY_RULE(defn([FILE_PREFIX]).anch.[$1], defn([NSP], [STRING]))
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

# FIXME: unfinished
# A → β
define([TEST_CHARS_IN_STRING], [

	# test punct chars
	ifelse(patsubst([[$1]], [[%]]), [], [

		ROOT_ERROR([write an [:alnum:]+ chars please])
	])

	ifelse(patsubst([[$1]], [
]), [$1], [], [

		ROOT_ERROR([‘$1’ contains prohibited char '\n'])
	])
])

# the resulting string must be tested
# β
pushdef([TEST_STRING], [

	ifelse(NAR(SELITM), [1], [], [

		ROOT_ERROR([comma is not protected, use square brackets: ‘,’ → [,] $0(]BRAC(defn([SELITM]))[)])
	])

	TEST_CHARS_IN_STRING(defn([SELITM]))

	# create a unique string for test
	define([UNIQ], defn([FILE_PREFIX], [SELITM]))

	# already has a value?
	ifdef(defn([UNIQ]), [

		ROOT_ERROR([anchor ‘]defn([SELITM])[’ from $0(]BRAC(defn([SELITM]))[) is not unique, the first occurrence on:]defn(defn([UNIQ])))
	])

	# assign (file:line) value for later error message
	define(defn([UNIQ]), __file__:__line__)
])


# A → β
define([PART], defn([MULTILINGUAL_HEADINGS], [TEST_STRING])[

	define([FILE_PREFIX], __file__.LANG_CODE)

	]defn([SET_UNIQ_KEY_FOR_LINK])[

	# expand string because of target languages in references
	define([SELITM], SELITM)

	divert(NAVIGATION_LOGIC)dnl
NAVIGATION(__file__, LANG_CODE, defn([SELITM]), SOURCE_COUNTER)
divert(-1)
])

# A → β
define([NAVIGATION], [dnl
[define([$1.$2.capt], [$3])
filedefine([$1.$2.anch], [
$3
])
define([$4.$2.capt], [$3])
filedefine([$4.$2.anch], [
$3
])
define([#.$2.$3], [$4])]
])

# string have to be expanded
# A → β
define([PREPARING_FOR_REGEX], [

	divert(ANCHORS)dnl
anch[define([$1], ]LBR()
translit([$2], [*$`'@#], [xdbath])
RBR()[)]
divert(-1)
])

# A → β
define([PRINT_ORDINARY_RULE], [

	divert(ANCHORS)dnl
[define([$1], [$2])]
divert(-1)
])

# β
pushdef([PRINT_ITEMS], [

	# if identifier is not empty, create reference to caption
	ifelse(defn([#ID]), [], [], [

		PRINT_ORDINARY_RULE(defn([FILE_PREFIX]).capt.defn([REFERENCE_KEY]), defn([SELITM]))
	])

	# print anchor
	PREPARING_FOR_REGEX(defn([FILE_PREFIX]).anch.defn([REFERENCE_KEY]), defn([NSP], [SELITM]))

	# create string from caption for testing
	divert(ANCHORS)dnl
[define(]BRAC(defn([FILE_PREFIX]).uniq.defn([SELITM])))
divert(-1)
])

# A → β
# β
define([CHAPTER], defn([MULTILINGUAL_HEADINGS], [TEST_STRING], [SET_UNIQ_KEY_FOR_LINK], [PRINT_ITEMS])[

	define([DOC_NODE], defn([$0]))
])

# A → β
define([SECT1], defn([MULTILINGUAL_HEADINGS], [TEST_STRING], [SET_UNIQ_KEY_FOR_LINK], [PRINT_ITEMS])[

	# logic flow test
	ifelse(
		defn([DOC_NODE]), defn([CHAPTER]), [],
		defn([DOC_NODE]), defn([SECT1]), [],
		defn([DOC_NODE]), defn([SECT2]), [], [

		ROOT_ERROR([SECT1 must follow CHAPTER or SECT2])
	])

	# set automaton to the current node
	define([DOC_NODE], defn([$0]))
])

# A → β
define([SECT2], defn([MULTILINGUAL_HEADINGS], [TEST_STRING], [SET_UNIQ_KEY_FOR_LINK], [PRINT_ITEMS])[

	# logic flow test
	ifelse(
		defn([DOC_NODE]), defn([SECT1]), [],
		defn([DOC_NODE]), defn([SECT2]), [], [

		ROOT_ERROR([SECT2 must follow SECT1 or SECT2])
	])

	# set automaton to the current node
	define([DOC_NODE], defn([$0]))
])

# A → β
define([APPENDIX], defn([CHAPTER]))

# connects source files to generated files, languages, captions and anchors
divert(0)dnl
[#] DONTE()
[
__HEADER([Josef Kubin], [2019/12/11], [root_cz])
___DESCR([(this is a generated file) associative memory to linking references, contains captions and ID])
___POINT([simple hash database for linking references])
]
# A → β
divert(ANCHORS)dnl
# A → β
divert(SEL_WORDS)dnl

# A → β
[define(]LBR()LANG_CODE[]_OTHER_LANG], LBR()ARG1(LANG_CODE)_LANG])
divert(-1)

# A → β
define([ADDRESS_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([ARTICLE_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([ASIDE_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([BLOCKQUOTE],			defn([PROCESS_ID]))
define([BLOCKQUOTE_MONO],		defn([PROCESS_ID]))
define([BRIDGEHEAD],			defn([MULTILINGUAL_HEADINGS], [TEST_STRING], [SET_UNIQ_KEY_FOR_LINK], [PRINT_ITEMS]))
define([BRIDGEHEAD_MONO],		defn([MONOLINGUAL_HEADINGS], [TEST_STRING], [SET_UNIQ_KEY_FOR_LINK], [PRINT_ITEMS]))
define([DESCRIPTION_LIST_DESC],		defn([PROCESS_ID]))
define([DESCRIPTION_LIST_DESC_MONO],	defn([PROCESS_ID]))
define([DESCRIPTION_LIST_TERM],		defn([PROCESS_ID]))
define([DESCRIPTION_LIST_TERM_MONO],	defn([PROCESS_ID]))
define([DESCRIPTION_LIST_WRAP],		defn([PROCESS_ID], [EXPAND_LAST]))
define([DETAILS_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([DIV],				defn([PROCESS_ID]))
define([DIV_MONO],			defn([PROCESS_ID]))
define([DIV_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([ENTRY],				defn([PROCESS_ID]))
define([ENTRY_HEAD],			defn([PROCESS_ID]))
define([ENTRY_HEAD_MONO],		defn([PROCESS_ID]))
define([ENTRY_MONO],			defn([PROCESS_ID]))
define([EXCL],				defn([PROCESS_ID]))
define([FIGCAPTION],			defn([PROCESS_ID]))
define([FIGCAPTION_MONO],		defn([PROCESS_ID]))
define([FIGURE_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([FOOTER_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([FORM_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([HEADER_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([HORIZONTAL_RULE],		defn([PROCESS_ID_UNPAIRED]))
define([INFO],				defn([PROCESS_ID]))
define([ITEMIZEDLIST_WRAP],		defn([PROCESS_ID], [EXPAND_LAST]))
define([LISTITEM],			defn([PROCESS_ID]))
define([LISTITEM_MONO],			defn([PROCESS_ID]))
define([MAIN_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([NAV],				defn([PROCESS_ID]))
define([NAV_MONO],			defn([PROCESS_ID]))
define([NOTE],				defn([PROCESS_ID]))
define([NOTE_MONO],			defn([PROCESS_ID]))
define([NOTE_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([ORDEREDLIST_WRAP],		defn([PROCESS_ID], [EXPAND_LAST]))
define([PARA],				defn([PROCESS_ID]))
define([PARA_MONO],			defn([PROCESS_ID]))
define([ROW_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([SECTION_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([SUMMARY],			defn([PROCESS_ID]))
define([SUMMARY_MONO],			defn([PROCESS_ID]))
define([TABLE_CAPTION],			defn([PROCESS_ID]))
define([TABLE_CAPTION_MONO],		defn([PROCESS_ID]))
define([TABLE_COL],			defn([PROCESS_ID_UNPAIRED]))
define([TABLE_COLGROUP_WRAP],		defn([PROCESS_ID], [EXPAND_LAST]))
define([TABLE_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([TBODY_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([TFOOT_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([THEAD_WRAP],			defn([PROCESS_ID], [EXPAND_LAST]))
define([TILE_BOX],			defn([PROCESS_ID]))
define([WARN],				defn([PROCESS_ID]))

# forget local β rules (good for frozen files)
popdef(

	[LANG_REC],
	[MONO_REC],
	[PRINT_ITEMS],
	[PROCESS_ID],
	[PROCESS_ID_UNPAIRED],
	[SET_UNIQ_KEY_FOR_LINK],
	[TEST_STRING],

)
