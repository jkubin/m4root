__HEADER([Josef Kubin], [2020/05/16], [text])
___DESCR([automaton for generating text references])
___POINT([two nodes to generate references])

# REF([name], [description], [URL])
#      __________      __________
# --->/ REF_INIT \--->/ REF_NEXT \---.
#     \__________/    \__________/<--'
#
# β
define([REF_INIT], [pushdef([CURRQU], divnum)divert(-1)

	# set reference index, create symbol and an unique tuple
	define([REF_COUNTER], [1])
	define([REF_IDENTIFIER], defn([NSP], [REF_ANCH], [REF_COUNTER]))
	define([{$1|$2|$3}], REF_COUNTER)

	# transition to the next node
	define([$0], defn([REF_NEXT]))

	# create new entry for all references under the article
	divert(ARTICLE_REFERENCES)dnl
REF_COUNTER. $1[]ifelse([$2], [], [], [, $2])
$3

divert(CURRQU)popdef([CURRQU])dnl
BRAC(REF_COUNTER)dnl
])

# β
define([REF_NEXT], [pushdef([CURRQU], divnum)divert(-1)

	# test if the reference already exists
	ifdef([{$1|$2|$3}], [

		divert(CURRQU)popdef([CURRQU])dnl
BRAC(REF_COUNTER)dnl
], [
		# increment the reference counter
		define([REF_VALUE], define([REF_COUNTER], incr(REF_COUNTER))REF_COUNTER)
		define([REF_IDENTIFIER], defn([NSP], [REF_ANCH], [REF_VALUE]))
		define([{$1|$2|$3}], REF_VALUE)

		divert(ARTICLE_REFERENCES)dnl
REF_VALUE. $1[]ifelse([$2], [], [], [, $2])
$3

divert(CURRQU)popdef([CURRQU])dnl
BRAC(REF_VALUE)dnl
])dnl
])
