# vim:ts=16:sw=16

__AUTHOR(⟦Josef Kubin⟧, ⟦2019,12,23⟧)
___DESCR(⟦converts inline and block-level elements into a plain text file for checking jargon and typos⟧)
__REASON(⟦plain text file for spell checking and for suggestions from other people (text can be easily edited)⟧)

# extracts `the text' from A_MACRO(⟦…⟧, ⟦the text⟧, ⟦⟦…⟧⟧)
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

# prints the text selected by the language code
# β
pushdef(⟦PRINT_ITEM⟧, defn(⟦TITLE_ATTR⟧)⟦

	divert(0)dnl
__line__
EXPAND_REQUIRED_ITEM(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)

divert(-1)
⟧)

# prints the text along with the number of characters
# β
pushdef(⟦PRINT_ITEM_PEREX⟧, ⟦

	define(⟦SELITM⟧, SELECT_REQUIRED_ITEM(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦))

	divert(0)dnl
⟦#⟧ number of characters in perex (200 ±10 is recommended): esyscmd(⟦wc -m << EOF⟧
patsubst(defn(⟦SELITM⟧), ⟦\<dnl\>\|[#,]⟧, ⟦⟦\&⟧⟧)
⟦EOF⟧)dnl end of an external command
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
⟦#⟧ __SOURCE(LL()__file__⟦⟧RR(), SARG1(esyscmd(⟦date '+⟦⟦%Y%m%d-%R:%S⟧⟧,'⟧)), SARG1(esyscmd(⟦git log -1 --format='⟦⟦%h⟧⟧,' ⟧__file__)), SARG1(esyscmd(⟦git log -1 --format='⟦⟦%h⟧⟧,'⟧)))

divert(1)dnl
---
divert(-1)

⟧defn(⟦PRINT_ITEM⟧))

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

	ifelse(
		defn(⟦CAPT⟧), ⟦⟧, ⟦

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

# HTML5 block-level elements and other macros

# A → β
define(⟦ADDRESS_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦APPENDIX⟧,		defn(⟦PRINT_ITEM⟧, ⟦APPENDIX_APPEND_CODE⟧))
define(⟦ARTICLE_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦ASIDE_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦BLOCKQUOTE⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦BRIDGEHEAD⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦CHAPTER⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦CMDFILES_ROOT⟧, 		defn(⟦TITLE_ATTR⟧))
define(⟦CMDFILES⟧, 		defn(⟦TITLE_ATTR⟧))
define(⟦CMDSYNOPSIS_ROOT⟧, 		defn(⟦TITLE_ATTR⟧))
define(⟦CMDSYNOPSIS⟧, 		defn(⟦TITLE_ATTR⟧))
define(⟦DESCRIPTION_LIST_DESC⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦DESCRIPTION_LIST_TERM⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦DESCRIPTION_LIST_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦DETAILS_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦DIV_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦DIV⟧,			defn(⟦PRINT_ITEM⟧))
define(⟦ENTRY_HEAD⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦ENTRY⟧,			defn(⟦PRINT_ITEM⟧))
define(⟦EXCL⟧,			defn(⟦PRINT_ITEM⟧))
define(⟦FIGCAPTION⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦FIGURE_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦FOOTER_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦FORM_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦HEADER_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦IMAGEDATA⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦INFO⟧,			defn(⟦PRINT_ITEM⟧))
define(⟦ITEMIZEDLIST_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦LISTITEM⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦MAIN_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦NAV⟧,			defn(⟦PRINT_ITEM⟧))
define(⟦NOTE_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦NOTE⟧,			defn(⟦PRINT_ITEM⟧))
define(⟦ORDEREDLIST_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦PARA⟧,			defn(⟦PRINT_ITEM⟧))
define(⟦PARTINTRO⟧,		defn(⟦PRINT_ITEM_PEREX⟧))
define(⟦PLAIN_TEXT⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦PROGRAMLISTING⟧, 		defn(⟦TITLE_ATTR⟧))
define(⟦ROW_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦SECT1⟧,			defn(⟦PRINT_ITEM⟧))
define(⟦SECT2⟧,			defn(⟦PRINT_ITEM⟧))
define(⟦SECTION_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦SUMMARY⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦TABLE_COLGROUP_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦TABLE_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦TBODY_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦TEXTDATA_MLH⟧, 		defn(⟦TITLE_ATTR⟧))
define(⟦TEXTDATA⟧, 		defn(⟦TITLE_ATTR⟧))
define(⟦TFOOT_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦THEAD_WRAP⟧,		defn(⟦TITLE_ATTR⟧, ⟦EXPAND_LAST_ARG⟧))
define(⟦TILE_BOX⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦TTITLE⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦WARN⟧,			defn(⟦PRINT_ITEM⟧))

popdef(

	⟦PRINT_ITEM_PEREX⟧,
	⟦PRINT_ITEM⟧,
	⟦TITLE_ATTR⟧,

)
