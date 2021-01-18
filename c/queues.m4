# vim:ts=40:sw=40

__AUTHOR(⟦Josef Kubin⟧, ⟦2020,05,16⟧)
___DESCR(⟦definitions of indexes for output queues⟧)
__REASON(⟦a specific list of queues for output code⟧)

# define counter for output queues
define(⟦QUEUE_INDEX⟧, defn(⟦COUNT_UP⟧))

# init counter for queues
QUEUE_INDEX(1)

define(⟦PART_HEADER⟧,	QUEUE_INDEX)
define(⟦PART_HEADER_END⟧,	QUEUE_INDEX)
define(⟦PARAGRAPHS⟧,	QUEUE_INDEX)
define(⟦PARAGRAPH_ARRAY⟧,	QUEUE_INDEX)
define(⟦PARAGRAPH_ARRAY_END⟧,	QUEUE_INDEX)
define(⟦PARAGRAPH_APPEND_ARRAY⟧,	QUEUE_INDEX)
define(⟦PARAGRAPH_APPEND_ARRAY_END⟧,	QUEUE_INDEX)
define(⟦CHAPTER_ARRAY⟧,	QUEUE_INDEX)
define(⟦CHAPTER_ARRAY_END⟧,	QUEUE_INDEX)
define(⟦APPENDIX_ARRAY⟧,	QUEUE_INDEX)
define(⟦APPENDIX_ARRAY_END⟧,	QUEUE_INDEX)
define(⟦BRIDGEHEAD_ARRAY⟧,	QUEUE_INDEX)
define(⟦BRIDGEHEAD_ARRAY_END⟧,	QUEUE_INDEX)
define(⟦REFERENCE_ARRAY⟧,	QUEUE_INDEX)
define(⟦REFERENCE_ARRAY_END⟧,	QUEUE_INDEX)
define(⟦REFERENCE_URL_ARRAY⟧,	QUEUE_INDEX)
define(⟦REFERENCE_URL_ARRAY_END⟧,	QUEUE_INDEX)
define(⟦SIZE_OF_ARRAY⟧,	QUEUE_INDEX)

# job done, (optionally) forget the counter and its internal value
undefine(

	⟦QUEUE_INDEX_val⟧,
	⟦QUEUE_INDEX⟧,

)
