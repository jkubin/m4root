__HEADER(⟦Josef Kubin⟧, ⟦2020/05/31⟧, ⟦m4root⟧)
___DESCR(⟦initialization code of each target⟧)
__REASON(⟦reduces duplicate code⟧)

# β
define(⟦PART_INIT⟧, ⟦

	# needed for LINK(…) to dereference text from references
	define(⟦FILE_PREFIX⟧,	__file__.LANG_CODE)

	# set current queue to stdout
	define(⟦CURRQU⟧, 0)

	# reset automata
	define(⟦APPENDIX⟧,	defn(⟦APPENDIX_FIRST⟧))
	define(⟦CHAPTER⟧,	defn(⟦CHAPTER_FIRST⟧))
	define(⟦REF⟧,		defn(⟦REF_FIRST⟧))
	define(⟦SECT1⟧,		defn(⟦SECT1_ARTICLE⟧))
	define(⟦SECT2⟧,		defn(⟦SECT2_ARTICLE⟧))

	# define counters
	define(⟦CHAPTER_COUNTER⟧,	defn(⟦COUNT_UP⟧))
	define(⟦IMAGE_COUNTER⟧,	defn(⟦COUNT_UP⟧))
	define(⟦SECT1_COUNTER⟧,	defn(⟦COUNT_UP⟧))
	define(⟦SECT2_COUNTER⟧,	defn(⟦COUNT_UP⟧))

	# init counters
	CHAPTER_COUNTER(0)
	IMAGE_COUNTER(1)
	SECT1_COUNTER(0)
	SECT2_COUNTER(0)

	define(⟦ANCH_COUNTER_val⟧, ⟦1⟧)
	define(⟦ANCH_COUNTER⟧, ⟦define(⟦ANCH_COUNTER_val⟧, incr(ANCH_COUNTER_val))⟧)
⟧)
