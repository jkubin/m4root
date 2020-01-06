#      _________      ___________
# --->/  ERROR  \--->/ NEXT_ITEM \---.
#     |  QUERY  |    \___________/<--'
#     \_WARNING_/

# A → β
# β
define([ERROR], [

	divert($0_QU)
BRAC($0_NAME)
[$1]="$2"
divert(-1)

	# transition to the next node
	define([$0], defn([NEXT_ITEM]))
])

# A → β
define([QUERY],   defn([ERROR]))
define([WARNING], defn([ERROR]))

# A → β
define([NEXT_ITEM], [

	divert($0_QU)dnl
[$1]="$2"
divert(-1)
])

divert(0)dnl
; DONTE()
divert(-1)
