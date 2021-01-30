__AUTHOR(⟦Josef Kubin⟧, ⟦2021,01,30⟧)
___DESCR(⟦macros for automatic increment/decrement counters⟧)
__REASON(⟦painless generation of sequence numbers in scripts⟧)
___USAGE(⟦m4 rootb.m4 countb.m4 … data.mc > output.file⟧)

#       counters are automata
#      ______      ___________
# --->/ INIT \--->/ INCREMENT \---.
#     \______/    \_DECREMENT_/<--'
#
# Usage:
# define(⟦MY_COUNTER⟧, defn(⟦COUNT_UP⟧))
# MY_COUNTER(3)
#
# MY_COUNTER → 3
# MY_COUNTER → 4
# MY_COUNTER → 5
# …

# tests automaton if a macro is initialized
# β₁
define([TEST_ATM], [

	ifelse([$#], [0], [

		ROOT_ERROR([$0(…) must be initialized])
	])
])

# β₁β₂
define([COUNT_UP], defn([TEST_ATM])[

	# the INIT node defines a unique symbol as the internal counter value
	define([$0_val], [$1])

	# transition to the INCREMENT node
	define([$0], [$0_val[]define([$0_val], incr($0_val))])
])

# β₁β₂
define([COUNT_DOWN], defn([TEST_ATM])[

	# the INIT node defines a unique symbol as the internal counter value
	define([$0_val], [$1])

	# transition to the DECREMENT node
	define([$0], [$0_val[]define([$0_val], decr($0_val))])
])
