# vim:ts=32:sw=32

__HEADER([Josef Kubin], [2019/08/25], [root_cz])
___DESCR([definitions of queues; table of content; languages])
___POINT([source files and their order])

# define counter for output queues
# A → β
define([QUEUE_INDEX], defn([COUNT_UP]))

# init counter
QUEUE_INDEX(1)

# the order of the files is important for the TOC
define([intro.mc],	QUEUE_INDEX)
#define([infro.mc],	QUEUE_INDEX)
define([fundamentals.mc],	QUEUE_INDEX)

# keep it after files
define([END_OF_TOC],	QUEUE_INDEX)

# the order of languages is important for the navigation order
define([LANG_CODE_cs],	QUEUE_INDEX)
define([LANG_CODE_en],	QUEUE_INDEX)

# keep it after lang codes
define([END_OF_LANG_CODES],	QUEUE_INDEX)

# data for navigation logic: previous, current, next
define([NAVIGATION_LOGIC],	QUEUE_INDEX)

# data for anchors
define([ANCHORS],	QUEUE_INDEX)

# selected words from the language
define([SEL_WORDS],	QUEUE_INDEX)

# the name of this file for error messages (what an unsuspecting user should do)
define([TOC_FILE_NAME],	__file__)

# (optionally) forget counter
undefine([QUEUE_INDEX])
