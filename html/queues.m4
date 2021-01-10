# vim:ts=40:sw=40

__HEADER(⟦Josef Kubin⟧, ⟦2019,07,11⟧)
___DESCR(⟦definitions of indexes for output queues⟧)
__REASON(⟦each target generation file format has a specific list of queues⟧)

# define counter for output queues
define(⟦QUEUE_INDEX⟧, defn(⟦COUNT_UP⟧))

# init counter for queues
QUEUE_INDEX(1)

define(⟦BEGIN_OF_DOCUMENT⟧,	QUEUE_INDEX)
define(⟦BLOCK_FOR_PUBLISH⟧,	QUEUE_INDEX)
define(⟦INTERNAL_STYLE_DATA⟧,	QUEUE_INDEX)
define(⟦INTERNAL_STYLE_END⟧,	QUEUE_INDEX)
define(⟦HEADER_END_START_BODY⟧,	QUEUE_INDEX)
define(⟦BEGIN_OF_PARTIMAGE⟧,	QUEUE_INDEX)
define(⟦PARTINTRO_BLOCK⟧,	QUEUE_INDEX)
define(⟦END_OF_PARTIMAGE⟧,	QUEUE_INDEX)
define(⟦BEGIN_OF_ARTICLE⟧,	QUEUE_INDEX)
define(⟦START_OF_NAVIGATION⟧,	QUEUE_INDEX)
define(⟦JAVASCRIPT_DISABLED⟧,	QUEUE_INDEX)
define(⟦CHAPTER_NAVIG_DATA⟧,	QUEUE_INDEX)
define(⟦APPENDIX_NAVIG_DATA⟧,	QUEUE_INDEX)
define(⟦END_OF_NAVIGATION⟧,	QUEUE_INDEX)
define(⟦ARTICLE_CONTENT⟧,	QUEUE_INDEX)
define(⟦ARTICLE_REFER_CAPT⟧,	QUEUE_INDEX)
define(⟦ARTICLE_REFERENCES⟧,	QUEUE_INDEX)
define(⟦END_OF_REFERENCES⟧,	QUEUE_INDEX)
define(⟦ALL_PARTS_LIST⟧,	QUEUE_INDEX)
define(⟦ALL_PARTS_ITEMS⟧,	QUEUE_INDEX)
define(⟦ALL_PARTS_LIST_END⟧,	QUEUE_INDEX)
define(⟦APPENDIX_CONTENT_START⟧,	QUEUE_INDEX)
define(⟦APPENDIX_NAVIGATION⟧,	QUEUE_INDEX)
define(⟦APPENDIX_CONTENT⟧,	QUEUE_INDEX)
define(⟦JAVASCRIPT_CODE⟧,	QUEUE_INDEX)
define(⟦JAVASCRIPT_CODE_END⟧,	QUEUE_INDEX)
define(⟦JAVASCRIPT_CODE_INIT⟧,	QUEUE_INDEX)
define(⟦END_OF_DOCUMENT⟧,	QUEUE_INDEX)

# auxiliary command line queue
define(⟦COMMAND_ARGS_QUEUE⟧,	QUEUE_INDEX)

# (optionally) forget the counter and its internal value
undefine(

	⟦QUEUE_INDEX_val⟧,
	⟦QUEUE_INDEX⟧,

)
