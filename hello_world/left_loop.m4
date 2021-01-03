# finite left-recursive loop

# A → β
define([HELLO], [

	# loop end condition
	ifelse([$1], [0], [], [

		# recursion
		$0(decr($1))
	])

	divert(0)dnl
$1RR() SYMBOL
divert(-1)
])

HELLO(9)
