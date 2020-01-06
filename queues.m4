__HEADER([Josef Kubin], [2019/07/11], [root_cz])
___DESCR([definitions of output queues])

# define counter for output queues
define([QUEUE_INDEX], defn([COUNT_UP]))

# init counter
QUEUE_INDEX(1)

define([INTERNAL_STYLE_DATA],	QUEUE_INDEX)
define([INTERNAL_STYLE_END],	QUEUE_INDEX)
define([START_OF_NAVIGATION],	QUEUE_INDEX)
define([CHAPTER_NAVIG_DATA],	QUEUE_INDEX)
define([ANNEX_NAVIG_DATA],	QUEUE_INDEX)
define([END_OF_NAVIGATION],	QUEUE_INDEX)
define([ARTICLE_CONTENT],	QUEUE_INDEX)
define([ARTICLE_REFER_CAPT],	QUEUE_INDEX)
define([ARTICLE_REFERENCES],	QUEUE_INDEX)
define([END_OF_REFERENCES],	QUEUE_INDEX)
define([ALL_PARTS_LIST],	QUEUE_INDEX)
define([ALL_PARTS_ITEMS],	QUEUE_INDEX)
define([ALL_PARTS_LIST_END],	QUEUE_INDEX)
define([ANNEX_CONTENT_START],	QUEUE_INDEX)
define([ANNEX_NAVIGATION],	QUEUE_INDEX)
define([ANNEX_CONTENT],		QUEUE_INDEX)
define([END_OF_ARTICLE],	QUEUE_INDEX)

# auxiliary queues for processing input files
define([PROCESSED_FILES],	QUEUE_INDEX)
define([REFERENCES_TO_FILES],	QUEUE_INDEX)

# (optionally) forget counter and its internal value
undefine(

	[#+QUEUE_INDEX+#],
	[QUEUE_INDEX],

)
