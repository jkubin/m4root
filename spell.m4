# vim:ts=16:sw=16

__HEADER(⟦Josef Kubin⟧, ⟦2019/12/23⟧)
___DESCR(⟦converts inline and block-level elements into a plain text file for checking jargon and typos⟧)
__REASON(⟦plain text file for spell checking and for suggestions from other people (text can be easily edited)⟧)

# extracts MACRO(⟦…⟧, ⟦the text⟧, …) if defined (`the text' is a title)
# β
pushdef(⟦TITLE_ATTR⟧, ⟦

	ifelse(
		⟦$#⟧, ⟦2⟧, ⟦⟧,
		⟦$2⟧, ⟦⟧, ⟦⟧, ⟦

		divert(0)dnl
__line__
⟦[$2]⟧

divert(-1)
	⟧)
⟧)

# prints monolingual text
# β
pushdef(⟦PRINT_MONO⟧, defn(⟦TITLE_ATTR⟧)⟦

	divert(0)dnl
__line__
EXPAND_ARG1_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)

divert(-1)
⟧)

# prints the text selected by the language code
# β
pushdef(⟦PRINT_LANG⟧, defn(⟦TITLE_ATTR⟧)⟦

	divert(0)dnl
__line__
EXPAND_LANG_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)

divert(-1)
⟧)

# prints the text along with the number of characters
# β
pushdef(⟦PRINT_LANG_PEREX⟧, ⟦

	define(⟦SELITM⟧, SELECT_LANG_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦))

	divert(0)dnl
⟦#⟧ number of characters in perex (200 ±10 is recommended): esyscmd(⟦wc -m << EOF⟧
patsubst(defn(⟦SELITM⟧), ⟦,⟧, ⟦⟦,⟧⟧)
⟦EOF⟧)dnl
__line__
SELITM

divert(-1)
⟧)

# A → β
define(⟦PART⟧, ⟦

	define(⟦FILE_PREFIX⟧, __file__.LANG_CODE)

	divert(0)dnl
⟦#⟧ vim:wrap:spell:spelllang=LANG_CODE,en
#
⟦#⟧ DONTE()
#
⟦#⟧ __SOURCE(PAYR(__file__), SARG1(esyscmd(⟦date '+⟦⟦%Y%m%d-%R:%S⟧⟧,'⟧)), SARG1(esyscmd(⟦git log -1 --format='⟦⟦%h⟧⟧,' ⟧__file__)), SARG1(esyscmd(⟦git log -1 --format='⟦⟦%h⟧⟧,'⟧)))

divert(1)dnl
---
divert(-1)

⟧defn(⟦PRINT_LANG⟧))

# prints a hyperlink or a linked text that dereferences
# A → β
define(⟦LINK⟧, ⟦pushdef(⟦CURRQU⟧, divnum)divert(-1)

	# the more arguments the more link capabilities
	ifelse(
		⟦$#⟧, ⟦2⟧, ⟦
			pushdef(⟦PREF⟧, defn(⟦FILE_PREFIX⟧))
		⟧,
		⟦$#⟧, ⟦3⟧, ⟦
			pushdef(⟦PREF⟧, ⟦$3⟧.LANG_CODE)
		⟧,
		⟦$#⟧, ⟦4⟧, ⟦
			pushdef(⟦PREF⟧, ⟦$3.$4⟧)
		⟧, ⟦

		ROOT_ERROR(⟦$0($@) is not defined⟧)
	⟧)

	# find link in refs (for test)
	pushdef(⟦ANCH⟧, ifdef(__file__.mono.⟦$2⟧, ⟦defn(__file__.mono.⟦$2⟧)⟧, ⟦defn(defn(⟦PREF⟧).anch.⟦$2⟧)⟧))

	ifelse(defn(⟦ANCH⟧), ⟦⟧, ⟦

		ROOT_WARNING(⟦$0(⟦$1⟧, ⟦‘$2’ not found⟧, ⟦$3⟧, ⟦$4⟧); run ‘make -B refs …’ to regenerate⟧)
	⟧)

	# find caption in the associative array
	pushdef(⟦CAPT⟧, defn(defn(⟦PREF⟧).capt.⟦$1⟧))

	ifelse(defn(⟦CAPT⟧), ⟦⟧, ⟦

			# CAPT in refs not found, use the first LINK argument
			define(⟦CAPT⟧, ⟦$1⟧)
		⟧,
		⟦$1⟧, ⟦$2⟧, ⟦⟧, ⟦

			# CAPT in refs was found, but the arg1 and arg2 are different, therefore use the arg1
			define(⟦CAPT⟧, ⟦$1⟧)
	⟧)

	divert(CURRQU)dnl
CAPT⟦⟧popdef(⟦CURRQU⟧, ⟦PREF⟧, ⟦ANCH⟧, ⟦CAPT⟧)dnl
⟧)

# appends list of references to the end of spell checking file
# A → β
define(⟦REF⟧, ⟦pushdef(⟦CURRQU⟧, divnum)divert(-1)

	divert(1)dnl

__line__
$1	$2
divert(CURRQU)popdef(⟦CURRQU⟧)dnl
⟧)

# HTML5 inline elements

# extracts data from ULINK(…) which has variable number of parameters, see html/inline.m4
# A → β
# β
define(⟦ULINK⟧, ⟦ifelse(
	⟦$#⟧, ⟦0⟧, ⟦⟧,
	⟦$#⟧, ⟦1⟧, ⟦⟧,
	⟦$#⟧, ⟦2⟧, ⟦$1⟧,
	⟦$2⟧, ⟦⟧, ⟦$1⟧,
	⟦$1 (⟦$2⟧)⟧)⟦⟧dnl
⟧)

# A → β
define(⟦HEXPLAIN⟧, defn(⟦ULINK⟧))

# A → β
# β
define(⟦HCODE⟧, ⟦ifelse(
	⟦$#⟧, ⟦0⟧, ⟦⟧,
	⟦$#⟧, ⟦1⟧, ⟦⟧,
	⟦$#⟧, ⟦2⟧, ⟦⟧,
	⟦$2⟧, ⟦⟧, ⟦⟧,
	⟦(⟦$2⟧)⟧)⟦⟧dnl
⟧)

# A → β
define(⟦HXCODE⟧, defn(⟦HCODE⟧))

# A → β
define(⟦BR⟧, ⟦
⟧)

# quotation marks are automatically set according to the language
# A → β
ifelse(defn(⟦LANG_CODE⟧), ⟦cs⟧, ⟦
	define(⟦QUOTE⟧,	⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦$2⟧, ⟦⟧, ⟦„$1“⟧, ⟦„$1“ (⟦$2⟧)⟧)⟧)
⟧, ⟦
	define(⟦QUOTE⟧,	⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦$2⟧, ⟦⟧, ⟦“$1”⟧, ⟦“$1” (⟦$2⟧)⟧)⟧)
⟧)

# A → β
# β
define(⟦BOLD⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦$2⟧, ⟦⟧, ⟦$1⟧, ⟦$1 (⟦$2⟧)⟧)⟧)

# A → β
# A → ε
# β
#define(⟦MM⟧)	<--- unattainable
#define(⟦XSPAN⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦$2⟧, ⟦⟧, ⟦$1⟧, ⟦$1 ($2)⟧)⟧)	<--- expands title
define(⟦ABBREV⟧,	defn(⟦BOLD⟧))
define(⟦ACRONYM⟧,	defn(⟦BOLD⟧))
define(⟦AMP⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦&⟧)⟧)
define(⟦AP⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦'⟧)⟧)
define(⟦BUTTON⟧,	defn(⟦BOLD⟧))
define(⟦CITATION⟧,	defn(⟦BOLD⟧))
define(⟦CODE⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦$2⟧, ⟦⟧, ⟦⟧, ⟦(⟦$2⟧)⟧)⟧)
define(⟦DEFINITION⟧,	defn(⟦BOLD⟧))
define(⟦DELETED⟧,	defn(⟦BOLD⟧))
define(⟦DQT⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦"⟧)⟧)
define(⟦DQ⟧,		defn(⟦DQT⟧))
define(⟦EMPHASIS⟧,	defn(⟦BOLD⟧))
define(⟦GT⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦>⟧)⟧)
define(⟦INSERTED⟧,	defn(⟦BOLD⟧))
define(⟦ITALIC⟧,	defn(⟦BOLD⟧))
define(⟦LABEL⟧,		defn(⟦BOLD⟧))
define(⟦LF⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦\n⟧)⟧)
define(⟦LI⟧,		defn(⟦BOLD⟧))
define(⟦LT⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦<⟧)⟧)
define(⟦MARK⟧,		defn(⟦BOLD⟧))
define(⟦METER⟧,		defn(⟦BOLD⟧))
define(⟦NB⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦ ⟧)⟧)
define(⟦OL⟧,		defn(⟦BOLD⟧))
define(⟦PROGRESS⟧,	defn(⟦BOLD⟧))
define(⟦SAMP⟧,		defn(⟦CODE⟧))
define(⟦SMALL⟧,		defn(⟦BOLD⟧))
define(⟦SPAN⟧,		defn(⟦BOLD⟧))
define(⟦STRIKETHROUGH⟧,	defn(⟦BOLD⟧))
define(⟦STRONG⟧,	defn(⟦BOLD⟧))
define(⟦SUBSCRIPT⟧,	defn(⟦BOLD⟧))
define(⟦SUPERSCRIPT⟧,	defn(⟦BOLD⟧))
define(⟦TIME⟧,		defn(⟦BOLD⟧))
define(⟦UL⟧,		defn(⟦BOLD⟧))
define(⟦UNDERLINE⟧,	defn(⟦BOLD⟧))
define(⟦VARIABLE⟧,	defn(⟦BOLD⟧))
define(⟦WBR⟧)

# custom HTML5 inline elements for convenience

# A → β
#define(⟦BUN⟧,		defn(⟦BOLD⟧))
#define(⟦CODE_BLUE⟧,	defn(⟦CODE⟧))
#define(⟦CODE_M4U⟧,	defn(⟦CODE⟧))
#define(⟦CODE_UND⟧,	defn(⟦CODE⟧))
define(⟦EXPLAIN⟧,	defn(⟦BOLD⟧))
define(⟦EXPLAIN_CODE⟧,	defn(⟦CODE⟧))
define(⟦EXPLAIN_XCODE⟧,	defn(⟦BOLD⟧))
define(⟦GRAY⟧,		defn(⟦BOLD⟧))
define(⟦PERSON⟧,	defn(⟦BOLD⟧))
define(⟦XCODE⟧,		defn(⟦CODE⟧))

# HTML5 block-level elements

# A → β
define(⟦ADDRESS_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦APPENDIX⟧,		defn(⟦PRINT_LANG⟧, ⟦APPENDIX_APPEND_CODE⟧))
define(⟦ARTICLE_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦ASIDE_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦BLOCKQUOTE⟧,		defn(⟦PRINT_LANG⟧))
define(⟦BLOCKQUOTE_MONO⟧,		defn(⟦PRINT_MONO⟧))
define(⟦BRIDGEHEAD⟧,		defn(⟦PRINT_LANG⟧))
define(⟦BRIDGEHEAD_MONO⟧,		defn(⟦PRINT_MONO⟧))
define(⟦CHAPTER⟧,		defn(⟦PRINT_LANG⟧))
define(⟦CMDSYNOPSIS⟧, 		defn(⟦TITLE_ATTR⟧))
define(⟦CMDSYNOPSIS_ROOT⟧, 		defn(⟦TITLE_ATTR⟧))
define(⟦COMMENT_MONO⟧,		defn(⟦PRINT_MONO⟧))
define(⟦DESCRIPTION_LIST_DESC⟧,		defn(⟦PRINT_LANG⟧))
define(⟦DESCRIPTION_LIST_DESC_MONO⟧,	defn(⟦PRINT_MONO⟧))
define(⟦DESCRIPTION_LIST_TERM⟧,		defn(⟦PRINT_LANG⟧))
define(⟦DESCRIPTION_LIST_TERM_MONO⟧,	defn(⟦PRINT_MONO⟧))
define(⟦DESCRIPTION_LIST_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦DETAILS_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦DIV⟧,			defn(⟦PRINT_LANG⟧))
define(⟦DIV_MONO⟧,		defn(⟦PRINT_MONO⟧))
define(⟦DIV_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦ENTRY⟧,			defn(⟦PRINT_LANG⟧))
define(⟦ENTRY_HEAD⟧,		defn(⟦PRINT_LANG⟧))
define(⟦ENTRY_HEAD_MONO⟧,		defn(⟦PRINT_MONO⟧))
define(⟦ENTRY_MONO⟧,		defn(⟦PRINT_MONO⟧))
define(⟦EXCL⟧,			defn(⟦PRINT_LANG⟧))
define(⟦FIGCAPTION⟧,		defn(⟦PRINT_LANG⟧))
define(⟦FIGCAPTION_MONO⟧,		defn(⟦PRINT_MONO⟧))
define(⟦FIGURE_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦FOOTER_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦FORM_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦HEADER_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦IMAGEDATA⟧,		defn(⟦PRINT_LANG⟧))
define(⟦INFO⟧,			defn(⟦PRINT_LANG⟧))
define(⟦ITEMIZEDLIST_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦LISTITEM⟧,		defn(⟦PRINT_LANG⟧))
define(⟦LISTITEM_MONO⟧,		defn(⟦PRINT_MONO⟧))
define(⟦MAIN_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦NAV⟧,			defn(⟦PRINT_LANG⟧))
define(⟦NAV_MONO⟧,		defn(⟦PRINT_MONO⟧))
define(⟦NOTE⟧,			defn(⟦PRINT_LANG⟧))
define(⟦NOTE_MONO⟧,		defn(⟦PRINT_MONO⟧))
define(⟦NOTE_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦ORDEREDLIST_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦PARA⟧,			defn(⟦PRINT_LANG⟧))
define(⟦PARA_MONO⟧,		defn(⟦PRINT_MONO⟧))
define(⟦PARTINTRO⟧,		defn(⟦PRINT_LANG_PEREX⟧))
define(⟦PLAIN_TEXT⟧,		defn(⟦PRINT_LANG⟧))
define(⟦PLAIN_TEXT_MONO⟧,		defn(⟦PRINT_MONO⟧))
define(⟦PROGRAMLISTING⟧, 		defn(⟦TITLE_ATTR⟧))
define(⟦ROW_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦SECT1⟧,			defn(⟦PRINT_LANG⟧))
define(⟦SECT2⟧,			defn(⟦PRINT_LANG⟧))
define(⟦SECTION_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦SUMMARY⟧,		defn(⟦PRINT_LANG⟧))
define(⟦SUMMARY_MONO⟧,		defn(⟦PRINT_MONO⟧))
define(⟦TABLE_COLGROUP_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦TABLE_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦TBODY_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦TFOOT_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦THEAD_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦TILE_BOX⟧,		defn(⟦PRINT_LANG⟧))
define(⟦TTITLE⟧,		defn(⟦PRINT_LANG⟧))
define(⟦TTITLE_MONO⟧,		defn(⟦PRINT_MONO⟧))
define(⟦WARN⟧,			defn(⟦PRINT_LANG⟧))

# A → β
# β
define(⟦TEXTDATA⟧, ⟦

	ifelse(
		⟦$#⟧, ⟦1⟧, ⟦⟧, ⟦

		divert(0)dnl
__line__
[$2]

divert(-1)
	⟧)
⟧)

# A → β
define(⟦TEXTDATA_MLH⟧, defn(⟦TEXTDATA⟧))

popdef(

	⟦PRINT_LANG⟧,
	⟦PRINT_LANG_PEREX⟧,
	⟦PRINT_MONO⟧,
	⟦TITLE_ATTR⟧,

)
