# vim:ts=16:sw=16

___TITLE(⟦Josef Kubin⟧, ⟦2020,12,28⟧)
___DESCR(⟦an example, how to generate a C source code⟧)
__REASON(⟦how to work with automata and queues⟧)

divert(0)dnl
/*
 * DONTE()
 * generated: SARG1(esyscmd(⟦date '+⟦%Y%m%d-%R:%S⟧,'⟧))
 *
 * __SOURCE(PAYR(__file__), SARG1(esyscmd(⟦git log -1 --date='format:%Y%m%d-%T' --pretty='format:⟦⟦%ad⟧, ⟦%h⟧⟧' -- ⟧__file__)), SARG1(esyscmd(⟦git log -1 --format='⟦⟦%h⟧⟧,'⟧)))
 * divert(PART_HEADER_END)dnl
 */

#define ARRAY_SIZE(x)	(sizeof(x)/sizeof((x)[0]))

divert(PARAGRAPH_ARRAY)dnl
char *chapters_paragraphs[] = {
divert(PARAGRAPH_ARRAY_END)dnl
};
divert(SIZE_OF_ARRAY)dnl
unsigned int chapters_paragraphs_len = ARRAY_SIZE(chapters_paragraphs);
divert(-1)

# creates multiline c string
# A → β
define(⟦C_STRING_EXPAND_LANG_CROP_WHITE_CHARS⟧, ⟦patsubst(patsubst(patsubst(⟧LL()LL()LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟧⟦, ⟦\s*\s*⟧, ⟦"⟧), ⟦
⟧, ⟦\\n"
"⟧), ⟦\<dnl\>\|#⟧, ⟦⟦\&⟧⟧)⟧)

# A → β
define(⟦C_STRING_EXPAND_ARG1_CROP_WHITE_CHARS⟧, ⟦patsubst(patsubst(patsubst(⟦⟦⟦$1⟧⟧⟧, ⟦\s*\s*⟧, ⟦"⟧), ⟦
⟧, ⟦\\n"
"⟧), ⟦\<dnl\>\|#⟧, ⟦⟦\&⟧⟧)⟧)

define(⟦PARA_COUNTER⟧, defn(⟦COUNT_UP⟧))
PARA_COUNTER(0)

define(⟦PARA_COUNTER_APPENDIX⟧, defn(⟦COUNT_UP⟧))
PARA_COUNTER_APPENDIX(0)

# A → β
define(⟦PARA_MONO⟧, ⟦

	define(⟦PARA_PTR_NAME⟧, ch_para_⟦⟧PARA_COUNTER)

	divert(PARAGRAPHS)dnl
static char PARA_PTR_NAME[] =
C_STRING_EXPAND_ARG1_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦);

divert(PARAGRAPH_ARRAY)dnl
	PARA_PTR_NAME,
divert(-1)
⟧)

# A → β
define(⟦PARA⟧, ⟦

	define(⟦PARA_PTR_NAME⟧, ch_para_⟦⟧PARA_COUNTER)

	divert(PARAGRAPHS)dnl
static char PARA_PTR_NAME[] =
C_STRING_EXPAND_LANG_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦);

divert(PARAGRAPH_ARRAY)dnl
	PARA_PTR_NAME,
divert(-1)
⟧)

# A → β
define(⟦PARA_MONO_APPENDIX⟧, ⟦

	define(⟦PARA_PTR_NAME⟧, ap_para_⟦⟧PARA_COUNTER_APPENDIX)

	divert(PARAGRAPHS)dnl
static char PARA_PTR_NAME[] =
C_STRING_EXPAND_ARG1_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦);

divert(PARAGRAPH_APPEND_ARRAY)dnl
	PARA_PTR_NAME,
divert(-1)
⟧)

# A → β
define(⟦PARA_APPENDIX⟧, ⟦

	define(⟦PARA_PTR_NAME⟧, ap_para_⟦⟧PARA_COUNTER_APPENDIX)

	divert(PARAGRAPHS)dnl
static char PARA_PTR_NAME[] =
C_STRING_EXPAND_LANG_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦);

divert(PARAGRAPH_APPEND_ARRAY)dnl
	PARA_PTR_NAME,
divert(-1)
⟧)

# β
define(⟦BRIDGEHEAD_NEXT⟧, ⟦

	divert(BRIDGEHEAD_ARRAY)dnl
	C_STRING_EXPAND_LANG_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦),
divert(-1)
⟧)

# A → β
define(⟦BRIDGEHEAD⟧, ⟦

	divert(BRIDGEHEAD_ARRAY)dnl
char *bridgehead[] = {
divert(BRIDGEHEAD_ARRAY_END)dnl
};
divert(-1)

	# transition to the next nodes
	define(⟦BRIDGEHEAD⟧,	defn(⟦BRIDGEHEAD_NEXT⟧))
	define(⟦BRIDGEHEAD_MONO⟧,	defn(⟦BRIDGEHEAD_MONO_NEXT⟧))

⟧defn(⟦BRIDGEHEAD_NEXT⟧))

# β
define(⟦BRIDGEHEAD_MONO_NEXT⟧, ⟦

	divert(BRIDGEHEAD_ARRAY)dnl
	C_STRING_EXPAND_ARG1_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦),
divert(-1)
⟧)

# A → β
define(⟦BRIDGEHEAD_MONO⟧, ⟦

	divert(BRIDGEHEAD_ARRAY)dnl
char *bridgehead[] = {
divert(BRIDGEHEAD_ARRAY_END)dnl
};
divert(-1)

	# transition to the next nodes
	define(⟦BRIDGEHEAD⟧,	defn(⟦BRIDGEHEAD_NEXT⟧))
	define(⟦BRIDGEHEAD_MONO⟧,	defn(⟦BRIDGEHEAD_MONO_NEXT⟧))

⟧defn(⟦BRIDGEHEAD_MONO_NEXT⟧))

# A → β
define(⟦PART⟧, defn(⟦PART_INIT⟧)⟦

	divert(PART_HEADER)dnl
__SOURCE(PAYR(__file__), SARG1(esyscmd(⟦git log -1 --date='format:%Y%m%d-%T' --pretty='format:⟦⟦%ad⟧, ⟦%h⟧⟧' -- ⟧__file__)), SARG1(esyscmd(⟦git log -1 --format='⟦⟦%h⟧⟧,'⟧)))
 *
 * EXPAND_LANG_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)
divert(-1)
⟧)

# β
define(⟦CHAPTER_NEXT⟧, ⟦

	# increment index
	CHAPTER_COUNTER
	define(⟦SECT1_COUNTER_val⟧, 0)
	define(⟦SECT2_COUNTER_val⟧, 0)
	define(⟦SECT3_COUNTER_val⟧, 0)

	divert(CHAPTER_ARRAY)dnl
	"CHAPTER_COUNTER_val EXPAND_LANG_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)",
divert(-1)
⟧)

#      _______________      ______________
# --->/ CHAPTER_FIRST \--->/ CHAPTER_NEXT \---.
#     \_______________/    \______________/<--'
# β
define(⟦CHAPTER_FIRST⟧, ⟦

	divert(CHAPTER_ARRAY)dnl
char *chapter[] = {
divert(CHAPTER_ARRAY_END)dnl
};
divert(SIZE_OF_ARRAY)dnl
unsigned int chapters_len = ARRAY_SIZE(chapter);
divert(-1)

	# transition to next node
	define(⟦$0⟧, defn(⟦CHAPTER_NEXT⟧))

⟧defn(⟦CHAPTER_NEXT⟧))

# A → β
define(⟦SECT1_ARTICLE⟧, ⟦

	# increment index
	SECT1_COUNTER
	define(⟦SECT2_COUNTER_val⟧, 0)

	divert(CHAPTER_ARRAY)dnl
	"CHAPTER_COUNTER_val.SECT1_COUNTER_val EXPAND_LANG_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)",
divert(-1)
⟧)

# A → β
define(⟦SECT2_ARTICLE⟧, ⟦

	# increment index
	SECT2_COUNTER
	define(⟦SECT3_COUNTER_val⟧, 0)

	divert(CHAPTER_ARRAY)dnl
	"CHAPTER_COUNTER_val.SECT1_COUNTER_val.SECT2_COUNTER_val EXPAND_LANG_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)",
divert(-1)
⟧)

# A → β
define(⟦SECT3_ARTICLE⟧, ⟦

	# increment index
	SECT3_COUNTER

	divert(CHAPTER_ARRAY)dnl
	"CHAPTER_COUNTER_val.SECT1_COUNTER_val.SECT2_COUNTER_val.SECT3_COUNTER_val EXPAND_LANG_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)",
divert(-1)
⟧)

# β
define(⟦APPENDIX_NEXT⟧, ⟦

	# increment index
	define(⟦APPENDIX_LETTER⟧, format(⟦%c⟧, APPENDIX_COUNTER))
	define(⟦SECT1_COUNTER_val⟧, 0)
	define(⟦SECT2_COUNTER_val⟧, 0)
	define(⟦SECT3_COUNTER_val⟧, 0)

	divert(APPENDIX_ARRAY)dnl
	"APPENDIX_LETTER EXPAND_LANG_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)",
divert(-1)
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

	# starting letter is ord('A') (= 65)
	define(⟦APPENDIX_COUNTER⟧, defn(⟦COUNT_UP⟧))
	APPENDIX_COUNTER(65)

	divert(APPENDIX_ARRAY)dnl
char *appendix[] = {
divert(APPENDIX_ARRAY_END)dnl
};
divert(PARAGRAPH_APPEND_ARRAY)dnl
char *appendix_paragraph[] = {
divert(PARAGRAPH_APPEND_ARRAY_END)dnl
};
divert(SIZE_OF_ARRAY)dnl
unsigned int appendix_len = ARRAY_SIZE(appendix);
unsigned int appendix_paragraphs_len = ARRAY_SIZE(appendix_paragraph);
divert(-1)

	# transition to the next nodes
	define(⟦APPENDIX⟧, defn(⟦APPENDIX_NEXT⟧))
	define(⟦PARA_MONO⟧, defn(⟦PARA_MONO_APPENDIX⟧))
	define(⟦PARA⟧, defn(⟦PARA_APPENDIX⟧))
	define(⟦SECT1⟧, defn(⟦SECT1_APPENDIX⟧))
	define(⟦SECT2⟧, defn(⟦SECT2_APPENDIX⟧))
	define(⟦SECT3⟧, defn(⟦SECT3_APPENDIX⟧))

⟧defn(⟦APPENDIX_NEXT⟧))

# β
define(⟦SECT1_APPENDIX⟧, ⟦

	# increment index
	SECT1_COUNTER
	define(⟦SECT2_COUNTER_val⟧, 0)

	divert(APPENDIX_ARRAY)dnl
	"APPENDIX_LETTER.SECT1_COUNTER_val EXPAND_LANG_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)",
divert(-1)
⟧)

# β
define(⟦SECT2_APPENDIX⟧, ⟦

	# increment index
	SECT2_COUNTER
	define(⟦SECT3_COUNTER_val⟧, 0)

	divert(APPENDIX_ARRAY)dnl
	"APPENDIX_LETTER.SECT1_COUNTER_val.SECT2_COUNTER_val EXPAND_LANG_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)",
divert(-1)
⟧)

# β
define(⟦SECT3_APPENDIX⟧, ⟦

	# increment index
	SECT3_COUNTER

	divert(APPENDIX_ARRAY)dnl
	"APPENDIX_LETTER.SECT1_COUNTER_val.SECT2_COUNTER_val.SECT3_COUNTER_val EXPAND_LANG_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)",
divert(-1)
⟧)

# inline elements

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
define(⟦ABBREV⟧,	defn(⟦BOLD⟧))
define(⟦ACRONYM⟧,	defn(⟦BOLD⟧))
define(⟦AMP⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦&⟧)⟧)
define(⟦AP⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦'⟧)⟧)
define(⟦BR⟧)
define(⟦BUTTON⟧,	defn(⟦BOLD⟧))
define(⟦CITATION⟧,	defn(⟦BOLD⟧))
define(⟦CODE⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦⟦$1⟧⟧)⟧)
define(⟦DEFINITION⟧,	defn(⟦BOLD⟧))
define(⟦DELETED⟧,	defn(⟦BOLD⟧))
define(⟦DQT⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦\"⟧)⟧)
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
define(⟦LF⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦\\n⟧)⟧)
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
define(⟦UNDERLINE⟧,	defn(⟦BOLD⟧))
define(⟦VARIABLE⟧,	defn(⟦BOLD⟧))
define(⟦WBR⟧)
define(⟦XCODE⟧,		defn(⟦BOLD⟧))

# inline elements for convenience

# A → β
define(⟦GRAY⟧,		defn(⟦BOLD⟧))
define(⟦PERSON⟧,	defn(⟦BOLD⟧))
