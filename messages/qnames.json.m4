# DO NOT WRITE INDEXES MANUALLY, use counter!
define([QUERY_QU],     0)
define([QUERY_END],    1)
define([ERROR_QU],     2)
define([ERROR_END],    3)
define([WARNING_QU],   4)
define([WARNING_END],  5)
define([LAST_QUEUE],   6)

# names of message types
define([WARNING_NAME], [warning])
define([ERROR_NAME],   [error])
define([QUERY_NAME],   [query])

#      _________      ___________
# --->/  ERROR  \--->/ NEXT_ITEM \---.
#     |  QUERY  |    \___________/<--'
#     \_WARNING_/

# A → β
# β
define([ERROR], [

	# transition to the next node
	define([$0], defn([NEXT_ITEM]))

	divert($0_QU),
	"$0_NAME": LB()
		{"[$1]": "$2"}dnl
divert($0_END)
	RB()dnl
divert(-1)
])

# β
define([NEXT_ITEM], [

	divert($0_QU),
		{"[$1]": "$2"}dnl
divert(-1)
])

# A → β
define([QUERY],        defn([ERROR]))
define([WARNING],      defn([ERROR]))

divert(0)dnl
{"queue_names": {
	"_comment": "DONTE()"dnl
divert(LAST_QUEUE)
}}
divert(-1)
