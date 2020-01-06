#      NEW_LINE automaton
#      ___      ________
# --->/ ε \--->/ \n"LF" \---.
#     \___/    \________/<--'

# A → β
define([NEW_LINE], [define([$0], [\n"
"])])

# A → β
define([ERROR], [

	divert(0)NEW_LINE[]$2[]dnl
divert(-1)
])

divert(0)dnl
/*
 * DONTE()
 */

char error[[]] =
"divert(1)";
divert(-1)
