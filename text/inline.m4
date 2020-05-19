__HEADER([Josef Kubin], [2020/05/16], [text])
___DESCR([processes inline elements])
___POINT([several inline elements])

# mozna vyhodit ze spell

# prints a hyperlink or a linked text that dereferences
# A → β
define([LINK], [pushdef([CURRQU], divnum)divert(-1)

	# the more arguments the more link capabilities
	ifelse(
		[$#], [2], [
			pushdef([PREF], defn([FILE_PREFIX]))
		],
		[$#], [3], [
			pushdef([PREF], [$3].LANG_CODE)
		],
		[$#], [4], [
			pushdef([PREF], [$3.$4])
		], [

		ROOT_ERROR([$0($@) is not defined])
	])

	# find link in refs (for test)
	pushdef([ANCH], ifdef(__file__.mono.[$2], [defn(__file__.mono.[$2])], [defn(defn([PREF]).anch.[$2])]))

	ifelse(defn([ANCH]), [], [

		ROOT_WARNING([$0([$1], [‘$2’ not found], [$3], [$4]); run ‘make -B refs …’ to regenerate])
	])

	# find caption in the associative array
	pushdef([CAPT], defn(defn([PREF]).capt.[$1]))

	ifelse(defn([CAPT]), [], [

			# CAPT in refs not found, use the first LINK argument
			define([CAPT], [$1])
		],
		[$1], [$2], [], [

			# CAPT in refs was found, but the arg1 and arg2 are different, therefore use the arg1
			define([CAPT], [$1])
	])

	divert(CURRQU)dnl
CAPT[]popdef([CURRQU], [PREF], [ANCH], [CAPT])dnl
])

#      _____      __________
# --->/ REF \--->/ REF_NEXT \---.
#     \_____/    \__________/<--'
#
# REF([name], [description], [URL])
# A → β
define([REF], [pushdef([CURRQU], divnum)divert(-1)

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

