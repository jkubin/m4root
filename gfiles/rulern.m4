dnl vim:mps+=\:
dnl
dnl DO NOT EDIT! This file is generated automatically!
dnl
__HEADER(Josef Kubin, 2019/11/16, root)
___DESCR(generates a string to shorten another string (by hand) because truncation is hardly acceptable)
___POINT(computer cannot truncate the string to remain readable)
___USAGE(m4 rootb.m4 rulerb.m4 …)

# a Java example (the string is obviously too long)
#
# /*                  1234567890123456789012345678901234567890 */
# System.out.println("Let's say: 'Hello, world!' It's damn good!");

# ruler as an automaton
#      ______      _______ 
# --->/ INIT \--->/ PRINT \
#     \______/    \_______/
#

# A → β
define(📏dec, ifelse($1, 1, 1, indir($0, decr($1))eval($1 % 10)))

# β
define(RULER_DEC, defn(TEST_ATM)

	# generate ruler and transition to the next node (PRINT)
	define($0, indir(📏dec, $1))
)

# A → β
define(📏hex, ifelse($1, 1, 1, indir($0, decr($1))eval($1 % 16, 16)))

# β
define(RULER_HEX, defn(TEST_ATM)

	# generate ruler and transition to the next node (PRINT)
	define($0, indir(📏hex, $1))
)
