#      _______      ___________
# --->/ ERROR \--->/ NEXT_ITEM \---.
#     \_______/    \___________/<--'

# A → β
define(⟦ERROR⟧, ⟦

	# transition to the next node
	define(⟦$0⟧, defn(⟦NEXT_ITEM⟧))

	divert(0),
	"error": [
		{"⟦$1⟧": "$2"}dnl
divert(1)
	]
divert(-1)
⟧)

# β
define(⟦NEXT_ITEM⟧, ⟦

	divert(0),
		{"⟦$1⟧": "$2"}dnl
divert(-1)
⟧)

divert(0)dnl
{"generating_automaton": {
	"_comment": "DONTE()"dnl
divert(2)dnl
}}
divert(-1)
