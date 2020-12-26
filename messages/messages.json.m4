#      _________      ___________
# --->/  ERROR  \--->/ NEXT_ITEM \---.
#     |  QUERY  |    \___________/<--'
#     \_WARNING_/

# A → β
# β
define(⟦ERROR⟧, ⟦

	# transition to the next node
	define(⟦$0⟧, defn(⟦NEXT_ITEM⟧))

	divert($0_QU),
	"$0_NAME": [
		{"⟦$1⟧": "$2"}dnl
divert($0_END)
	]dnl
divert(-1)
⟧)

# β
define(⟦NEXT_ITEM⟧, ⟦

	divert($0_QU),
		{"⟦$1⟧": "$2"}dnl
divert(-1)
⟧)

# A → β
define(⟦QUERY⟧,   defn(⟦ERROR⟧))
define(⟦WARNING⟧, defn(⟦ERROR⟧))

divert(0)dnl
{"messages": {
	"_comment": "DONTE()"dnl
divert(LAST_QUEUE)
}}
divert(-1)
