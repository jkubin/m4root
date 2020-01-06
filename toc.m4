# vim:ts=8:sw=8

__HEADER([Josef Kubin], [2019/08/25], [root_cz])
___DESCR([definitions of queues; table of content; languages])
___POINT([source files and their order])

# define counter for output queues
# A → β
define([QUEUE_INDEX], defn([COUNT_UP]))

# init counter
QUEUE_INDEX(1)

# the order of the files is important for the TOC
define([intro.mc],		QUEUE_INDEX)

ifelse([
define([fundamentals.mc],	QUEUE_INDEX)
define([context_free_grammar.mc],	QUEUE_INDEX)
define([demo.mc],		QUEUE_INDEX)
define([outqueues.mc],		QUEUE_INDEX)
define([automata.mc],		QUEUE_INDEX)
define([workflow.mc],		QUEUE_INDEX)
define([automata_theory.mc],	QUEUE_INDEX)
define([validation.mc],		QUEUE_INDEX)
define([root_files.mc],		QUEUE_INDEX)
define([debugging.mc],		QUEUE_INDEX)
define([counters.mc],		QUEUE_INDEX)
define([frozen.mc],		QUEUE_INDEX)
define([multilang.mc],		QUEUE_INDEX)
define([pitfalls.mc],		QUEUE_INDEX)
define([lsystem.mc],		QUEUE_INDEX)
])dnl comment

# keep it after files
define([END_OF_TOC],		QUEUE_INDEX)

# the order of languages is important for the navigation order
define([LANG_CODE_cs],		QUEUE_INDEX)
define([LANG_CODE_en],		QUEUE_INDEX)

# keep it after lang codes
define([END_OF_LANG_CODES],	QUEUE_INDEX)

# data for navigation logic: previous, current, next
define([NAVIGATION_LOGIC],	QUEUE_INDEX)

# data for anchors
define([ANCHORS],		QUEUE_INDEX)

# selected words from the language
define([SEL_WORDS],		QUEUE_INDEX)

# the name of this file for error messages (what an unsuspecting user should do)
define([TOC_FILE_NAME],		__file__)

# (optionally) forget counter
undefine([QUEUE_INDEX])
