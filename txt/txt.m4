# vim:ts=16:sw=16

__AUTHOR(⟦Josef Kubin⟧, ⟦2020,05,11⟧)
___DESCR(⟦generates a plain text file from (possibly multiple) source files⟧)
__REASON(⟦the total number of words and characters that would be printed⟧)

ifdef(⟦PRINT_HEADER⟧, ⟦

	divert(0)dnl
vim:ts=4:sw=4

DONTE()

divert(-1)
⟧)

# β
pushdef(⟦PRINT_EMPTY_LINE⟧, ⟦

	divert(CURRQU)
divert(-1)
⟧)

# β
pushdef(⟦PRINT_ITEM⟧, ⟦

	divert(CURRQU)dnl
EXPAND_REQUIRED_ITEM(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)

divert(-1)
⟧)

# β
pushdef(⟦PRINT_ITEM_NO_EMPTY_LINE⟧, ⟦

	divert(CURRQU)dnl
EXPAND_REQUIRED_ITEM(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)
divert(-1)
⟧)

# β
pushdef(⟦PRINT_IMAGE⟧, ⟦

	divert(CURRQU)dnl
WORD_IMAGE IMAGE_COUNTER: EXPAND_REQUIRED_ITEM(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)

divert(-1)
⟧)

# β
pushdef(⟦PRINT_PROGRAMLISTING⟧, ⟦

	divert(CURRQU)dnl
EXPAND_CASE_1(⟧defn(⟦SELECT_LAST_ARG⟧)⟦)

divert(-1)
⟧)

# β
pushdef(⟦PRINT_PROMPT_USR⟧, ⟦

	divert(CURRQU)dnl
PRMT() dnl
divert(-1)
⟧)

# β
pushdef(⟦PRINT_PROMPT_ROOT⟧, ⟦

	divert(CURRQU)dnl
PRMT_ROOT() dnl
divert(-1)
⟧)

# β
pushdef(⟦PRINT_BULLET⟧, ⟦

	divert(CURRQU)dnl
• dnl
divert(-1)
⟧)

# β
pushdef(⟦PRINT_NOTE_SYMBOL⟧, ⟦

	divert(CURRQU)dnl
🖹 dnl
divert(-1)
⟧)

# β
pushdef(⟦PRINT_INFO_SYMBOL⟧, ⟦

	divert(CURRQU)dnl
🛈 dnl
divert(-1)
⟧)

# β
pushdef(⟦PRINT_WARN_SYMBOL⟧, ⟦

	divert(CURRQU)dnl
⚠ dnl
divert(-1)
⟧)

# β
pushdef(⟦PRINT_EXCL_SYMBOL⟧, ⟦

	divert(CURRQU)dnl
❕ dnl
divert(-1)
⟧)

# β
pushdef(⟦PART_INIT⟧, defn(⟦PART_INIT⟧)⟦

	ifdef(⟦PRINT_HEADER⟧, ⟦

		divert(0)dnl
__SOURCE(PAYR(__file__), SARG1(esyscmd(⟦date '+⟦⟦%Y%m%d-%R:%S⟧⟧,'⟧)), SARG1(esyscmd(⟦git log -1 --format='⟦⟦%h⟧⟧,' ⟧__file__)), SARG1(esyscmd(⟦git log -1 --format='⟦⟦%h⟧⟧,'⟧)))

WORD_PART PART_COUNTER. dnl
divert(-1)
	⟧)

⟧defn(⟦PRINT_ITEM⟧))

#      ______      ___________
# --->/ PART \--->/ PART_NEXT \---.
#     \______/    \___________/<--'
#
# A → β
define(⟦PART⟧, ⟦

	# define counter for parts
	define(⟦PART_COUNTER⟧,	defn(⟦COUNT_UP⟧))
	PART_COUNTER(1)

	# transition to next node
	define(⟦$0⟧, defn(⟦PART_NEXT⟧))

⟧defn(⟦PART_INIT⟧))

# A → β
pushdef(⟦PART_FINISH⟧, ⟦

	# if the REF was used it changes automaton state to the REF_NEXT node
	ifelse(defn(⟦REF⟧), defn(⟦REF_NEXT⟧), ⟦

		# increment chapter index
		CHAPTER_COUNTER

		# add item to navigation and below the page
		divert(CHAPTER_NAVIG_DATA)dnl
CHAPTER_COUNTER_val WORD_REFERENCES
divert(ARTICLE_REFER_CAPT)dnl
CHAPTER_COUNTER_val WORD_REFERENCES
divert(-1)
	⟧)

	# if enabled, adds a code to references
	ifdef(⟦ADD_LINKS_TO_ALL_PARTS_OF_THE_SERIES⟧, ⟦

		define(⟦ALL_PARTS_COUNTER⟧, defn(⟦COUNT_UP⟧))
		ALL_PARTS_COUNTER(1)

		MAKE_ALL_PARTS(FILE_LIST)

		# increment chapter index
		CHAPTER_COUNTER

		# add item to navigation and below the page
		divert(CHAPTER_NAVIG_DATA)dnl
CHAPTER_COUNTER_val SENTENCE_ALL_PARTS
divert(ALL_PARTS_LIST)dnl
CHAPTER_COUNTER_val SENTENCE_ALL_PARTS
divert(ALL_PARTS_END)
divert(-1)
	⟧)
⟧)

# A → β
define(⟦PART_NEXT⟧, defn(⟦PART_FINISH⟧)⟦

	divert(0)dnl print all cached previous parts to the stdout, start the next part
undivert⟦⟧ifdef(⟦PRINT_HEADER⟧,
⟦------------------------ 8< ------------------------
⟧)dnl
divert(-1)

⟧defn(⟦PART_INIT⟧))

# completes the last part when exiting the script
m4wrap(defn(⟦PART_FINISH⟧))

# A → β
define(⟦MAKE_ALL_PARTS⟧, ⟦

	ifelse(⟦$1⟧, ⟦⟧, ⟦⟧, ⟦

		# set caption from associative memory
		divert(ALL_PARTS_ITEMS)dnl
	ALL_PARTS_COUNTER. defn(⟦$1⟧.LANG_CODE.capt)⟦⟧ifdef(OTHER_LANG_CODE⟦_OTHER_LANG⟧, ⟦, OTHER_LANG_CODE⟧)
divert(-1)

		# right recursive loop
		$0(shift($@))
	⟧)
⟧)

# β
define(⟦CHAPTER_NEXT⟧, ⟦

	# increment index
	CHAPTER_COUNTER
	define(⟦SECT1_COUNTER_val⟧, 0)
	define(⟦SECT2_COUNTER_val⟧, 0)
	define(⟦SECT3_COUNTER_val⟧, 0)

	define(⟦SELITM⟧, SELECT_REQUIRED_ITEM(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦))

	divert(CHAPTER_NAVIG_DATA)dnl
CHAPTER_COUNTER_val SELITM
divert(CURRQU)dnl
CHAPTER_COUNTER_val SELITM
divert(-1)
⟧)

#      _______________      ______________
# --->/ CHAPTER_FIRST \--->/ CHAPTER_NEXT \---.
#     \_______________/    \______________/<--'
# β
define(⟦CHAPTER_FIRST⟧, ⟦

	divert(START_OF_NAVIGATION)dnl generates table of content
defn(⟦WORD_CONTENT⟧)dnl
ifelse(defn(OTHER_LANG_CODE⟦⟧_OTHER_LANG), ⟦⟧, ⟦⟧, ⟦ (ARG1(OTHER_LANG_CODE)_OTHER_LANG)⟧)	mc dnl
esyscmd(⟦test -f ./⟧defn(⟦ARTICLE_PATH⟧)⟦/spell.txt⟧)ifelse(sysval, ⟦0⟧,     ⟦spl ⟧)dnl
esyscmd(⟦test -f ./⟧defn(⟦ARTICLE_PATH⟧)⟦.txt⟧)ifelse(sysval, ⟦0⟧,           ⟦txt ⟧)dnl
esyscmd(⟦test -f ./⟧defn(⟦ARTICLE_PATH⟧)⟦/publish.txt⟧)ifelse(sysval, ⟦0⟧,   ⟦pub ⟧)dnl
esyscmd(⟦test -f ./⟧defn(⟦ARTICLE_PATH⟧)⟦/index.html⟧)ifelse(sysval, ⟦0⟧,    ⟦dev ⟧)dnl
esyscmd(⟦test -f ./⟧defn(⟦ARTICLE_PATH⟧)⟦/preview.html⟧)ifelse(sysval, ⟦0⟧,  ⟦pre ⟧)dnl
esyscmd(⟦test -f ./⟧defn(⟦ARTICLE_PATH⟧)⟦.c⟧)ifelse(sysval, ⟦0⟧,             ⟦c ⟧)dnl
ifdef(⟦NEW_ARTICLE⟧, ⟦⟧, ⟦ WORD_UPDATED SARG1(esyscmd(defn(⟦DATE_COMMAND⟧)))⟧)
divert(END_OF_NAVIGATION)
divert(-1)

	# set article queue
	define(⟦CURRQU⟧, ARTICLE_CONTENT)

	# transition to next node
	define(⟦$0⟧, defn(⟦CHAPTER_NEXT⟧))

⟧defn(⟦CHAPTER_NEXT⟧))

# A → β
define(⟦SECT1_ARTICLE⟧, ⟦

	# increment index
	SECT1_COUNTER
	define(⟦SECT2_COUNTER_val⟧, 0)

	define(⟦SELITM⟧, SELECT_REQUIRED_ITEM(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦))

	divert(CHAPTER_NAVIG_DATA)dnl
	CHAPTER_COUNTER_val.SECT1_COUNTER_val SELITM
divert(CURRQU)dnl
CHAPTER_COUNTER_val.SECT1_COUNTER_val SELITM
divert(-1)
⟧)

# A → β
define(⟦SECT2_ARTICLE⟧, ⟦

	# increment index
	SECT2_COUNTER
	define(⟦SECT3_COUNTER_val⟧, 0)

	define(⟦SELITM⟧, SELECT_REQUIRED_ITEM(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦))

	divert(CHAPTER_NAVIG_DATA)dnl
		CHAPTER_COUNTER_val.SECT1_COUNTER_val.SECT2_COUNTER_val SELITM
divert(CURRQU)dnl
CHAPTER_COUNTER_val.SECT1_COUNTER_val.SECT2_COUNTER_val SELITM
divert(-1)
⟧)

# A → β
define(⟦SECT3_ARTICLE⟧, ⟦

	# increment index
	SECT3_COUNTER

	define(⟦SELITM⟧, SELECT_REQUIRED_ITEM(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦))

	divert(CHAPTER_NAVIG_DATA)dnl
			CHAPTER_COUNTER_val.SECT1_COUNTER_val.SECT2_COUNTER_val.SECT3_COUNTER_val SELITM
divert(CURRQU)dnl
CHAPTER_COUNTER_val.SECT1_COUNTER_val.SECT2_COUNTER_val.SECT3_COUNTER_val SELITM
divert(-1)
⟧)

# β
define(⟦APPENDIX_NEXT⟧, ⟦

	# increment index
	define(⟦APPENDIX_LETTER⟧, format(⟦%c⟧, APPENDIX_COUNTER))
	define(⟦SECT1_COUNTER_val⟧, 0)
	define(⟦SECT2_COUNTER_val⟧, 0)
	define(⟦SECT3_COUNTER_val⟧, 0)

	define(⟦SELITM⟧, SELECT_REQUIRED_ITEM(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦))

	divert(APPENDIX_NAVIG_DATA)dnl
APPENDIX_LETTER SELITM
divert(APPENDIX_NAVIGATION)dnl
undivert(CURRQU)dnl
APPENDIX_LETTER SELITM
divert(CURRQU)
divert(-1)

	# temporarily change the current queue
	pushdef(⟦CURRQU⟧, APPENDIX_NAVIGATION)
	APPENDIX_APPEND_CODE()
	# set the previous queue
	popdef(⟦CURRQU⟧)
⟧)

#      ________________      _______________
# --->/ APPENDIX_FIRST \--->/ APPENDIX_NEXT \---.
#     \________________/    \_______________/<--'
#      _______      ________________
# --->/ SECT1 \--->/ SECT1_APPENDIX \---.
#     \_SECT2_/    \_SECT2_APPENDIX_/<--'
#
# β
define(⟦APPENDIX_FIRST⟧, ⟦

	# starting letter is ord('A') == 65
	define(⟦APPENDIX_COUNTER⟧, defn(⟦COUNT_UP⟧))
	APPENDIX_COUNTER(65)

	# set the queue
	define(⟦CURRQU⟧, APPENDIX_CONTENT)

	# a separator for TOC
	divert(APPENDIX_NAVIG_DATA)dnl
---
divert(-1)

	# transition to the next nodes
	define(⟦APPENDIX⟧, defn(⟦APPENDIX_NEXT⟧))
	define(⟦SECT1⟧, defn(⟦SECT1_APPENDIX⟧))
	define(⟦SECT2⟧, defn(⟦SECT2_APPENDIX⟧))
	define(⟦SECT3⟧, defn(⟦SECT3_APPENDIX⟧))

⟧defn(⟦APPENDIX_NEXT⟧))

# β
define(⟦SECT1_APPENDIX⟧, ⟦

	# increment index
	SECT1_COUNTER
	define(⟦SECT2_COUNTER_val⟧, 0)

	define(⟦SELITM⟧, SELECT_REQUIRED_ITEM(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦))

	divert(APPENDIX_NAVIGATION)dnl
	APPENDIX_LETTER.SECT1_COUNTER_val SELITM
divert(CURRQU)dnl
APPENDIX_LETTER.SECT1_COUNTER_val SELITM
divert(-1)
⟧)

# β
define(⟦SECT2_APPENDIX⟧, ⟦

	# increment index
	SECT2_COUNTER
	define(⟦SECT3_COUNTER_val⟧, 0)

	define(⟦SELITM⟧, SELECT_REQUIRED_ITEM(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦))

	divert(APPENDIX_NAVIGATION)dnl
		APPENDIX_LETTER.SECT1_COUNTER_val.SECT2_COUNTER_val SELITM
divert(CURRQU)dnl
APPENDIX_LETTER.SECT1_COUNTER_val.SECT2_COUNTER_val SELITM
divert(-1)
⟧)

# β
define(⟦SECT3_APPENDIX⟧, ⟦

	# increment index
	SECT2_COUNTER

	define(⟦SELITM⟧, SELECT_REQUIRED_ITEM(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦))

	divert(APPENDIX_NAVIGATION)dnl
			APPENDIX_LETTER.SECT1_COUNTER_val.SECT2_COUNTER_val.SECT3_COUNTER_val SELITM
divert(CURRQU)dnl
APPENDIX_LETTER.SECT1_COUNTER_val.SECT2_COUNTER_val.SECT3_COUNTER_val SELITM
divert(-1)
⟧)

# inline elements

# A → β
define(⟦BR⟧, ⟦
⟧)

# correct quotes are automatically set according to the language code
# A → β
ifelse(defn(⟦LANG_CODE⟧), ⟦cs⟧, ⟦
	define(⟦QUOTE⟧,	⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦„$1“⟧)⟧)
⟧, ⟦
	define(⟦QUOTE⟧,	⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦“$1”⟧)⟧)
⟧)

# A → β
# β
define(⟦BOLD⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦$1⟧)⟧)

# A → β
# A → ε
# β
#define(⟦XSPAN⟧,		defn(⟦BOLD⟧))
define(⟦ABBREV⟧,	defn(⟦BOLD⟧))
define(⟦ACRONYM⟧,	defn(⟦BOLD⟧))
define(⟦AMP⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦&⟧)⟧)
define(⟦AP⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦'⟧)⟧)
define(⟦BUTTON⟧,	defn(⟦BOLD⟧))
define(⟦CITATION⟧,	defn(⟦BOLD⟧))
define(⟦CODE⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦⟦$1⟧⟧)⟧)
define(⟦DEFINITION⟧,	defn(⟦BOLD⟧))
define(⟦DELETED⟧,	defn(⟦BOLD⟧))
define(⟦DQT⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦"⟧)⟧)
define(⟦DQ⟧,		defn(⟦DQT⟧))
define(⟦EMPHASIS⟧,	defn(⟦BOLD⟧))
define(⟦EXPLAIN_CODE⟧,	defn(⟦CODE⟧))
define(⟦EXPLAIN_XCODE⟧,	defn(⟦BOLD⟧))
define(⟦EXPLAIN⟧,	defn(⟦BOLD⟧))
define(⟦GT⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦>⟧)⟧)
define(⟦HCODE⟧,		defn(⟦CODE⟧))
define(⟦HEXPLAIN⟧,	defn(⟦BOLD⟧))
define(⟦HXCODE⟧,	defn(⟦BOLD⟧))
define(⟦INSERTED⟧,	defn(⟦BOLD⟧))
define(⟦ITALIC⟧,	defn(⟦BOLD⟧))
define(⟦LABEL⟧,		defn(⟦BOLD⟧))
define(⟦LF⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦\n⟧)⟧)
define(⟦LI⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦• $1⟧)⟧)
define(⟦LT⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦<⟧)⟧)
define(⟦MARK⟧,		defn(⟦BOLD⟧))
define(⟦METER⟧,		defn(⟦BOLD⟧))
define(⟦MM⟧,		defn(⟦BOLD⟧))
define(⟦NB⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦ ⟧)⟧)
define(⟦OL⟧,		defn(⟦LI⟧))
define(⟦PROGRESS⟧,	defn(⟦BOLD⟧))
define(⟦SAMP⟧,		defn(⟦BOLD⟧))
define(⟦SMALL⟧,		defn(⟦BOLD⟧))
define(⟦SPAN⟧,		defn(⟦BOLD⟧))
define(⟦STRIKETHROUGH⟧,	defn(⟦BOLD⟧))
define(⟦STRONG⟧,	defn(⟦BOLD⟧))
define(⟦SUBSCRIPT⟧,	defn(⟦BOLD⟧))
define(⟦SUPERSCRIPT⟧,	defn(⟦BOLD⟧))
define(⟦TIME⟧,		defn(⟦BOLD⟧))
define(⟦ULINK⟧,		defn(⟦BOLD⟧))
define(⟦UL⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦	$1⟧)⟧)
define(⟦UNDERLINE⟧,	defn(⟦BOLD⟧))
define(⟦VARIABLE⟧,	defn(⟦BOLD⟧))
define(⟦WBR⟧)
define(⟦XCODE⟧,		defn(⟦BOLD⟧))

# inline elements for convenience

# A → β
#define(⟦BUN⟧,		defn(⟦BOLD⟧))
#define(⟦CODE_BLUE⟧,	defn(⟦BOLD⟧))
#define(⟦CODE_M4U⟧,	defn(⟦CODE⟧))
#define(⟦CODE_UND⟧,	defn(⟦BOLD⟧))
define(⟦GRAY⟧,		defn(⟦BOLD⟧))
define(⟦PERSON⟧,	defn(⟦BOLD⟧))

# block-level elements

# A → β
define(⟦ADDRESS_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦ARTICLE_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦ASIDE_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦BLOCKQUOTE⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦BRIDGEHEAD⟧,		defn(⟦PRINT_ITEM_NO_EMPTY_LINE⟧))
define(⟦CMDSYNOPSIS⟧, 		defn(⟦PRINT_PROMPT_USR⟧, ⟦PRINT_PROGRAMLISTING⟧))
define(⟦CMDSYNOPSIS_ROOT⟧, 		defn(⟦PRINT_PROMPT_ROOT⟧, ⟦PRINT_PROGRAMLISTING⟧))
define(⟦DESCRIPTION_LIST_DESC⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦DESCRIPTION_LIST_TERM⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦DESCRIPTION_LIST_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦DETAILS_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦DIV⟧,			defn(⟦PRINT_ITEM⟧))
define(⟦DIV_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦ENTRY⟧,			defn(⟦PRINT_ITEM⟧))
define(⟦ENTRY_HEAD⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦EXCL⟧,			defn(⟦PRINT_EXCL_SYMBOL⟧, ⟦PRINT_ITEM⟧))
define(⟦FIGCAPTION⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦FIGURE_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦FOOTER_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦FORM_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦HEADER_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦IMAGEDATA⟧,		defn(⟦PRINT_IMAGE⟧))
define(⟦INFO⟧,			defn(⟦PRINT_INFO_SYMBOL⟧, ⟦PRINT_ITEM⟧))
define(⟦ITEMIZEDLIST_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧, ⟦PRINT_EMPTY_LINE⟧))
define(⟦LISTITEM⟧,		defn(⟦PRINT_BULLET⟧, ⟦PRINT_ITEM_NO_EMPTY_LINE⟧))
define(⟦MAIN_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦NAV⟧,			defn(⟦PRINT_ITEM⟧))
define(⟦NOTE⟧,			defn(⟦PRINT_NOTE_SYMBOL⟧, ⟦PRINT_ITEM⟧))
define(⟦NOTE_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦ORDEREDLIST_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦PARA⟧,			defn(⟦PRINT_ITEM⟧))
define(⟦PARTINTRO⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦PLAIN_TEXT⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦PROGRAMLISTING⟧, 		defn(⟦PRINT_PROGRAMLISTING⟧))
define(⟦ROW_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦SECTION_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦SUMMARY⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦TABLE_COLGROUP_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦TABLE_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦TBODY_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦TFOOT_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦THEAD_WRAP⟧,		defn(⟦EXPAND_LAST_ARG⟧))
define(⟦TILE_BOX⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦TTITLE⟧,		defn(⟦PRINT_ITEM⟧))
define(⟦WARN⟧,			defn(⟦PRINT_WARN_SYMBOL⟧, ⟦PRINT_ITEM⟧))

popdef(

	⟦PART_FINISH⟧,
	⟦PART_INIT⟧,
	⟦PRINT_BULLET⟧,
	⟦PRINT_EMPTY_LINE⟧,
	⟦PRINT_EXCL_SYMBOL⟧,
	⟦PRINT_IMAGE⟧,
	⟦PRINT_INFO_SYMBOL⟧,
	⟦PRINT_ITEM⟧,
	⟦PRINT_ITEM_NO_EMPTY_LINE⟧,
	⟦PRINT_NOTE_SYMBOL⟧,
	⟦PRINT_PROGRAMLISTING⟧,
	⟦PRINT_PROMPT_ROOT⟧,
	⟦PRINT_PROMPT_USR⟧,
	⟦PRINT_WARN_SYMBOL⟧,

)
