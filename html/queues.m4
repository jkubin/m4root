__HEADER([Josef Kubin], [2019/07/11], [root_cz])
___DESCR([definitions of output queues])
___POINT([each target file format has a specific queue list])

# define counter for output queues
define([QUEUE_INDEX], defn([COUNT_UP]))

# init counter
QUEUE_INDEX(1)

define([BEGIN_OF_ARTICLE],	QUEUE_INDEX)
define([INTERNAL_STYLE_DATA],	QUEUE_INDEX)
define([INTERNAL_STYLE_END],	QUEUE_INDEX)
define([START_OF_NAVIGATION],	QUEUE_INDEX)
define([JAVASCRIPT_DISABLED],	QUEUE_INDEX)
define([CHAPTER_NAVIG_DATA],	QUEUE_INDEX)
define([APPENDIX_NAVIG_DATA],	QUEUE_INDEX)
define([END_OF_NAVIGATION],	QUEUE_INDEX)
define([ARTICLE_CONTENT],	QUEUE_INDEX)
define([ARTICLE_REFER_CAPT],	QUEUE_INDEX)
define([ARTICLE_REFERENCES],	QUEUE_INDEX)
define([END_OF_REFERENCES],	QUEUE_INDEX)
define([ALL_PARTS_LIST],	QUEUE_INDEX)
define([ALL_PARTS_ITEMS],	QUEUE_INDEX)
define([ALL_PARTS_LIST_END],	QUEUE_INDEX)
define([APPENDIX_CONTENT_START],	QUEUE_INDEX)
define([APPENDIX_NAVIGATION],	QUEUE_INDEX)
define([APPENDIX_CONTENT],		QUEUE_INDEX)
define([JAVASCRIPT_CODE],	QUEUE_INDEX)
define([JAVASCRIPT_CODE_END],	QUEUE_INDEX)
define([END_OF_ARTICLE],	QUEUE_INDEX)

# auxiliary queues for processing input files
define([REFERENCES_TO_FILES],	QUEUE_INDEX)

# (optionally) forget counter and its internal value
undefine(

	[QUEUE_INDEX_val],
	[QUEUE_INDEX],

)
