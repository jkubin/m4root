dnl vim:mps+=⟦\:⟧
dnl
dnl DO NOT EDIT! This file is generated automatically!
dnl
#       counters are automata
#      ______      ___________
# --->/ INIT \--->/ INCREMENT \---.
#     \______/    \_DECREMENT_/<--'
#

# tests automaton if it is initialized
# β₁
define(⟦TEST_ATM⟧, ⟦

	ifelse(⟦$#⟧, ⟦0⟧, ⟦

		ROOT_ERROR(⟦$0(…) must be initialized⟧)
	⟧)
⟧)

# β₁β₂
define(⟦COUNT_UP⟧, defn(⟦TEST_ATM⟧)⟦

	# the INIT node defines a unique symbol as the internal counter value
	define(⟦$0_val⟧, ⟦$1⟧)

	# transition to the INCREMENT node
	define(⟦$0⟧, ⟦$0_val⟦⟧define(⟦$0_val⟧, incr($0_val))⟧)
⟧)

# β₁β₂
define(⟦COUNT_DOWN⟧, defn(⟦TEST_ATM⟧)⟦

	# the INIT node defines a unique symbol as the internal counter value
	define(⟦$0_val⟧, ⟦$1⟧)

	# transition to the DECREMENT node
	define(⟦$0⟧, ⟦$0_val⟦⟧define(⟦$0_val⟧, decr($0_val))⟧)
⟧)
