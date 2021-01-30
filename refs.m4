__AUTHOR(⟦Josef Kubin⟧, ⟦2019,12,11⟧)
___DESCR(⟦tests a logic flow (CHAPTER → SECT1 → SECT2 → SECT3) and generates references for anchors⟧)
__REASON(⟦extracts all IDs from files and creates associative pair⟧)

# define counter for output queues and source files
# A → β
define(⟦QUEUE_INDEX⟧,		defn(⟦COUNT_UP⟧))
define(⟦SOURCE_COUNTER⟧,	defn(⟦COUNT_UP⟧))

# init counters
QUEUE_INDEX(1)
SOURCE_COUNTER(1)

define(⟦NAVIGATION_LOGIC⟧,	QUEUE_INDEX)
define(⟦ANCHORS⟧,		QUEUE_INDEX)
define(⟦SEL_WORDS⟧,		QUEUE_INDEX)

# create aliases to existing macros
# A → β
define(⟦LL_ALIAS⟧, defn(⟦LL⟧))
define(⟦RR_ALIAS⟧, defn(⟦RR⟧))

# re-define problematic macros used in captions
# A → β
# A → ε
define(⟦AP⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦a⟧)⟧)
define(⟦BOLD⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦$1⟧)⟧)
define(⟦CODE⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦⟦$1⟧⟧)⟧)
define(⟦DQT⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦d⟧)⟧)
define(⟦DQ⟧,		defn(⟦DQT⟧))
define(⟦LF⟧,		⟦l⟧)
define(⟦LL⟧,		⟦u⟧)
define(⟦NB⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦ ⟧)⟧)
define(⟦RR⟧)
define(⟦XCODE⟧,		defn(⟦BOLD⟧))

# set an unique key
# β
pushdef(⟦SET_UNIQ_KEY_FOR_LINK⟧, ⟦

	ifdef(⟦#ID⟧, ⟦

		# create a unique string
		define(⟦UNIQ⟧, defn(⟦FILE_PREFIX⟧, ⟦#ID⟧))

		# already has a value?
		ifdef(defn(⟦UNIQ⟧), ⟦

			ROOT_ERROR(⟦internal reference ‘$0(⟧PAYR(defn(⟦#ID⟧))⟦, …)’ is not unique, the first occurrence on:⟧defn(defn(⟦UNIQ⟧)))
		⟧)

		# assign (file:line) value for later error message
		define(defn(⟦UNIQ⟧), __file__:__line__)

		define(⟦REFERENCE_KEY⟧, defn(⟦#ID⟧))
	⟧, ⟦
		define(⟦REFERENCE_KEY⟧, defn(⟦SELITM⟧))
	⟧)
⟧)

# A → β
define(⟦CREATE_REFERENCE⟧, ⟦

	# test for name collision
	ifdef(⟦$1⟧, ⟦

		ROOT_ERROR(⟦$1 collides with a macro name; use different name⟧)
	⟧)

	# remove permitted characters, remains forbidden char(s)
	ifelse(patsubst(⟦⟦$1⟧⟧, ⟦[0-9A-Za-z_]⟧), ⟦⟧, ⟦⟧, ⟦

		ROOT_ERROR(⟦forbidden character(s) found in $2(⟦$1⟧, …)⟧)
	⟧)

	# translit upper case to lower case, change underscore to dash
	define(⟦STRING⟧, translit(⟦⟦$1⟧⟧, ⟦_A-Z⟧, ⟦-a-z⟧))

	# create a unique string
	define(⟦UNIQ⟧, defn(⟦FILE_PREFIX⟧, ⟦STRING⟧))

	# already has a value?
	ifdef(defn(⟦UNIQ⟧), ⟦

		ROOT_ERROR(⟦html anchor ‘$2(⟧PAYR(defn(⟦STRING⟧))⟦, …)’ is not unique, first occurrence on:⟧defn(defn(⟦UNIQ⟧)))
	⟧)

	# assign value for later error message (file:line)
	define(defn(⟦UNIQ⟧), __file__:__line__)

	# print ordinary reference to an identifier
	PRINT_ORDINARY_RULE(defn(⟦FILE_PREFIX⟧).anch.⟦$1⟧, defn(⟦NSP⟧, ⟦STRING⟧))
⟧)

# β
pushdef(⟦PROCESS_ID⟧, ⟦

	# if more than 1 param, then the $⟦1⟧ is surely #ID
	ifelse(
		⟦$#⟧, ⟦1⟧, ⟦⟧,
		⟦$1⟧, ⟦⟧, ⟦⟧, ⟦

		CREATE_REFERENCE(⟦$1⟧, ⟦$0⟧)
	⟧)
⟧)

# β
pushdef(⟦PROCESS_ID_UNPAIRED⟧, ⟦

	ifelse(⟦$1⟧, ⟦⟧, ⟦⟧, ⟦

		CREATE_REFERENCE(⟦$1⟧, ⟦$0⟧)
	⟧)
⟧)

# FIXME: unfinished
# A → β
define(⟦TEST_CHARS_IN_STRING⟧, ⟦

	# test for empty captions (contains only ⟦%%%⟧ placeholder)
	ifelse(patsubst(⟦⟦$1⟧⟧, ⟦[%]⟧), ⟦⟧, ⟦

		ROOT_ERROR(⟦write an [:alnum:]+ chars please⟧)
	⟧)

	ifelse(patsubst(⟦⟦$1⟧⟧, ⟦
⟧), ⟦$1⟧, ⟦⟧, ⟦

		ROOT_ERROR(⟦‘$1’ contains prohibited char '\n'⟧)
	⟧)
⟧)

# the resulting string must be tested
# β
pushdef(⟦TEST_RESULTING_STRING⟧, ⟦

	ifelse(NAR(SELITM), ⟦1⟧, ⟦⟧, ⟦

		ROOT_ERROR(⟦comma is not protected, use the brackets: ‘,’ → ‘⟦,⟧’ $0(⟧PAYR(defn(⟦SELITM⟧))⟦)⟧)
	⟧)

	TEST_CHARS_IN_STRING(defn(⟦SELITM⟧))

	# create an unique string for test
	define(⟦UNIQ⟧, defn(⟦FILE_PREFIX⟧, ⟦SELITM⟧))

	# is the string is really unique?
	ifdef(defn(⟦UNIQ⟧), ⟦

		ROOT_ERROR(⟦anchor ‘⟧defn(⟦SELITM⟧)⟦’ from $0(⟧PAYR(defn(⟦SELITM⟧))⟦) is not unique, the first occurrence on:⟧defn(defn(⟦UNIQ⟧)))
	⟧)

	# assign (file:line) value for later error message
	define(defn(⟦UNIQ⟧), __file__:__line__)
⟧)

# β
pushdef(⟦SELECT_REQ_ITEM⟧, ⟦

	ifelse(⟦$#⟧, ⟦1⟧, ⟦
		undefine(⟦#ID⟧)
	⟧, ⟦
		define(⟦#ID⟧, ⟦$1⟧)
	⟧)

	define(⟦SELITM⟧, SELECT_REQUIRED_ITEM(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦))
⟧)

# A → β
define(⟦PART⟧, defn(⟦SELECT_REQ_ITEM⟧, ⟦TEST_RESULTING_STRING⟧)⟦

	define(⟦FILE_PREFIX⟧, __file__.LANG_CODE)

	⟧defn(⟦SET_UNIQ_KEY_FOR_LINK⟧)⟦

	# expand string because of target languages in references
	define(⟦SELITM⟧, SELITM)

	divert(NAVIGATION_LOGIC)dnl
NAVIGATION(__file__, LANG_CODE, defn(⟦SELITM⟧), SOURCE_COUNTER)
divert(-1)
⟧)

# A → β
define(⟦NAVIGATION⟧, ⟦dnl
⟦define(⟦$1.$2.capt⟧, ⟦$3⟧)
filedefine(⟦$1.$2.anch⟧, ⟦
$3
⟧)
define(⟦$4.$2.capt⟧, ⟦$3⟧)
filedefine(⟦$4.$2.anch⟧, ⟦
$3
⟧)
define(⟦#.$2.$3⟧, ⟦$4⟧)⟧
⟧)

# replaces punctuation with letters to make the references unique
# A → β
define(⟦PREPARE_FOR_EXTERNAL_REGEX⟧, ⟦

	divert(ANCHORS)dnl
anch⟦define(⟦$1⟧, ⟧LL_ALIAS()
translit(⟦$2⟧, ⟦!"#$%&`'*+/:;<=>?@[\]^{}|~⟧,
               ⟦xzhdpmbasunwvfegqtlkrcijoy⟧)
RR_ALIAS()⟦)⟧
divert(-1)
⟧)

# A → β
define(⟦PRINT_ORDINARY_RULE⟧, ⟦

	divert(ANCHORS)dnl
⟦define(⟦$1⟧, ⟦$2⟧)⟧
divert(-1)
⟧)

# β
pushdef(⟦PRINT_ITEMS⟧, ⟦

	# if identifier is not empty, create reference to caption
	ifelse(defn(⟦#ID⟧), ⟦⟧, ⟦⟧, ⟦

		PRINT_ORDINARY_RULE(defn(⟦FILE_PREFIX⟧).capt.defn(⟦REFERENCE_KEY⟧), defn(⟦SELITM⟧))
	⟧)

	# creates a reference
	PREPARE_FOR_EXTERNAL_REGEX(defn(⟦FILE_PREFIX⟧).anch.defn(⟦REFERENCE_KEY⟧), defn(⟦NSP⟧, ⟦SELITM⟧))

	# create string from caption for testing
	divert(ANCHORS)dnl
⟦define(⟧PAYR(defn(⟦FILE_PREFIX⟧).uniq.defn(⟦SELITM⟧)))
divert(-1)
⟧)

# A → β
# β
define(⟦CHAPTER⟧, defn(⟦SELECT_REQ_ITEM⟧, ⟦TEST_RESULTING_STRING⟧, ⟦SET_UNIQ_KEY_FOR_LINK⟧, ⟦PRINT_ITEMS⟧)⟦

	define(⟦DOC_NODE⟧, defn(⟦$0⟧))
⟧)

# A → β
define(⟦SECT1⟧, defn(⟦SELECT_REQ_ITEM⟧, ⟦TEST_RESULTING_STRING⟧, ⟦SET_UNIQ_KEY_FOR_LINK⟧, ⟦PRINT_ITEMS⟧)⟦

	# logic flow test
	ifelse(
		defn(⟦DOC_NODE⟧), defn(⟦CHAPTER⟧), ⟦⟧,
		defn(⟦DOC_NODE⟧), defn(⟦SECT1⟧), ⟦⟧,
		defn(⟦DOC_NODE⟧), defn(⟦SECT2⟧), ⟦⟧, ⟦

		ROOT_ERROR(⟦SECT1 must follow CHAPTER or SECT2⟧)
	⟧)

	# set automaton to the current node
	define(⟦DOC_NODE⟧, defn(⟦$0⟧))
⟧)

# A → β
define(⟦SECT2⟧, defn(⟦SELECT_REQ_ITEM⟧, ⟦TEST_RESULTING_STRING⟧, ⟦SET_UNIQ_KEY_FOR_LINK⟧, ⟦PRINT_ITEMS⟧)⟦

	# logic flow test
	ifelse(
		defn(⟦DOC_NODE⟧), defn(⟦SECT1⟧), ⟦⟧,
		defn(⟦DOC_NODE⟧), defn(⟦SECT2⟧), ⟦⟧, ⟦

		ROOT_ERROR(⟦SECT2 must follow SECT1 or SECT2⟧)
	⟧)

	# set automaton to the current node
	define(⟦DOC_NODE⟧, defn(⟦$0⟧))
⟧)

# A → β
define(⟦SECT3⟧, defn(⟦SELECT_REQ_ITEM⟧, ⟦TEST_RESULTING_STRING⟧, ⟦SET_UNIQ_KEY_FOR_LINK⟧, ⟦PRINT_ITEMS⟧)⟦

	# logic flow test
	ifelse(
		defn(⟦DOC_NODE⟧), defn(⟦SECT2⟧), ⟦⟧,
		defn(⟦DOC_NODE⟧), defn(⟦SECT3⟧), ⟦⟧, ⟦

		ROOT_ERROR(⟦SECT3 must follow SECT2 or SECT3⟧)
	⟧)

	# set automaton to the current node
	define(⟦DOC_NODE⟧, defn(⟦$0⟧))
⟧)

# A → β
define(⟦APPENDIX⟧, defn(⟦CHAPTER⟧))

# connects source files to generated files, languages, captions and anchors
divert(0)dnl
⟦#⟧ DONTE()
⟦
__AUTHOR(⟦Josef Kubin⟧, ⟦2019,12,11⟧)
___DESCR(⟦(generated) an associative memory for linking references, contains captions and ID⟧)
__REASON(⟦simple hash database for linking references⟧)
⟧
# A → β
divert(ANCHORS)dnl
# A → β
divert(SEL_WORDS)dnl

# A → β
⟦define(⟧LL_ALIAS()LANG_CODE⟦⟧_OTHER_LANG⟧, LL_ALIAS()ARG1(LANG_CODE)_LANG⟧)
divert(-1)

# A → β
define(⟦ADDRESS_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦ARTICLE_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦ASIDE_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦BLOCKQUOTE⟧,			defn(⟦PROCESS_ID⟧))
define(⟦BRIDGEHEAD⟧,			defn(⟦SELECT_REQ_ITEM⟧, ⟦TEST_RESULTING_STRING⟧, ⟦SET_UNIQ_KEY_FOR_LINK⟧, ⟦PRINT_ITEMS⟧))
define(⟦DESCRIPTION_LIST_DESC⟧,		defn(⟦PROCESS_ID⟧))
define(⟦DESCRIPTION_LIST_TERM⟧,		defn(⟦PROCESS_ID⟧))
define(⟦DESCRIPTION_LIST_WRAP⟧,		defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦DETAILS_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦DIV⟧,				defn(⟦PROCESS_ID⟧))
define(⟦DIV_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦ENTRY⟧,				defn(⟦PROCESS_ID⟧))
define(⟦ENTRY_HEAD⟧,			defn(⟦PROCESS_ID⟧))
define(⟦EXCL⟧,				defn(⟦PROCESS_ID⟧))
define(⟦FIGCAPTION⟧,			defn(⟦PROCESS_ID⟧))
define(⟦FIGURE_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦FOOTER_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦FORM_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦HEADER_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦HORIZONTAL_RULE⟧,		defn(⟦PROCESS_ID_UNPAIRED⟧))
define(⟦INFO⟧,				defn(⟦PROCESS_ID⟧))
define(⟦ITEMIZEDLIST_WRAP⟧,		defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦LISTITEM⟧,			defn(⟦PROCESS_ID⟧))
define(⟦MAIN_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦NAV⟧,				defn(⟦PROCESS_ID⟧))
define(⟦NOTE⟧,				defn(⟦PROCESS_ID⟧))
define(⟦NOTE_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦ORDEREDLIST_WRAP⟧,		defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦PARA⟧,				defn(⟦PROCESS_ID⟧))
define(⟦ROW_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦SECTION_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦SUMMARY⟧,			defn(⟦PROCESS_ID⟧))
define(⟦TABLE_CAPTION⟧,			defn(⟦PROCESS_ID⟧))
define(⟦TABLE_COL⟧,			defn(⟦PROCESS_ID_UNPAIRED⟧))
define(⟦TABLE_COLGROUP_WRAP⟧,		defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦TABLE_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦TBODY_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦TFOOT_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦THEAD_WRAP⟧,			defn(⟦PROCESS_ID⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦TILE_BOX⟧,			defn(⟦PROCESS_ID⟧))
define(⟦WARN⟧,				defn(⟦PROCESS_ID⟧))

# forget local β rules (good for frozen files)
popdef(

	⟦PRINT_ITEMS⟧,
	⟦PROCESS_ID_UNPAIRED⟧,
	⟦PROCESS_ID⟧,
	⟦SELECT_REQ_ITEM⟧,
	⟦SET_UNIQ_KEY_FOR_LINK⟧,
	⟦TEST_RESULTING_STRING⟧,

)
