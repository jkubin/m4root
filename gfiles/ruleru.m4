dnl vim:mps+=⟦\:⟧
dnl
dnl DO NOT EDIT! This file is generated automatically!
dnl
__AUTHOR(⟦Josef Kubin⟧, ⟦2019,11,16⟧)
___DESCR(⟦generates a string to truncate the next string (manually) because machine truncation is hardly acceptable⟧)
__REASON(⟦the computer cannot truncate the string to keep it human readable⟧)
___USAGE(⟦m4 rootu.m4 ruleru.m4 …⟧)

# a Java example (the string is obviously too long and requires human attention)
#
# /*                  1234567890123456789012345678901234567890 */
# System.out.println("Let's say: 'Hello, world!' It's damn good!");

ifdef(⟦TEST_ATM⟧, ⟦⟧, ⟦

	ROOT_ERROR(⟦add the file with the missing TEST_ATM macro to the command line⟧)
⟧)

# ruler as an automaton
#      ______      _______ 
# --->/ INIT \--->/ PRINT \
#     \______/    \_______/
#

# A → β
define(⟦📏dec⟧, ⟦ifelse(⟦$1⟧, ⟦1⟧, ⟦1⟧, ⟦indir(⟦$0⟧, decr($1))⟦⟧eval($1 % 10)⟧)⟧)

# β
define(⟦RULER_DEC⟧, defn(⟦TEST_ATM⟧)⟦

	# INIT node

	# generate ruler and transition to the next node (PRINT)
	define(⟦$0⟧, indir(⟦📏dec⟧, $1))
⟧)

# A → β
define(⟦📏hex⟧, ⟦ifelse(⟦$1⟧, ⟦1⟧, ⟦1⟧, ⟦indir(⟦$0⟧, decr($1))⟦⟧eval($1 % 16, 16)⟧)⟧)

# β
define(⟦RULER_HEX⟧, defn(⟦TEST_ATM⟧)⟦

	# INIT node

	# generate ruler and transition to the next node (PRINT)
	define(⟦$0⟧, indir(⟦📏hex⟧, $1))
⟧)
