__HEADER([Josef Kubin], [2019/12/24], [root_cz])
___DESCR([combine selectors and creates a style sheet in the reserved namespace])
___POINT([the style sheet contains only the things that are actually used])

# three nested loops combine selectors for a ruleset
# A → β
define([CLASS_SELECTORS_COMBINE], [CLASS_SELECTORS_MIDDLE_LOOP($@)[]ifelse(NAR($1), [1], [], [$0(BRAC(shift($1)), [$2], [$3])])])
define([CLASS_SELECTORS_MIDDLE_LOOP], [CLASS_SELECTORS_INNER_LOOP($@)[]ifelse(NAR($2), [1], [], [$0([$1], BRAC(shift($2)), [$3])])])
define([CLASS_SELECTORS_INNER_LOOP], [CSS_EPSILON_FIRST[]SELECT_ARG1($1)[]CLASS_SELECTORS_MIDDLE($2)[]SELECT_ARG1($3)[]ifelse(NAR($3), [1], [], [$0([$1], [$2], BRAC(shift($3)))])])
define([CLASS_SELECTORS_MIDDLE], [ifelse([$1], [], [], [pushdef([.$1], defn([CLASS_RULE_SET_KEY]))[.NSP()$1]])])

#      CSS_EPSILON_FIRST
#      ___      ___
# --->/ ε \--->/ , \---.
#     \___/    \___/<--'
#
# process CSS definitions
# A → β
define([CSS_CLASS_RULE_SET], [

	ifdef([class{$1.$2.$3}key], [

		ROOT_ERROR([the rule set ‘$0($@)’ is redefined])
	])

	define([CSS_EPSILON_FIRST], [define([CSS_EPSILON_FIRST], [[,]])])
	define([CLASS_RULE_SET_KEY], [class{$1.$2.$3}key])

	# once the CSS rule set is written to stylesheet, it undefine itself (therefore it cannot be duplicated)
	# A → β
	define(defn([CLASS_RULE_SET_KEY]), [undefine(]LB()defn([CLASS_RULE_SET_KEY])RB()[)divert(INTERNAL_STYLE_DATA)]CLASS_SELECTORS_COMBINE([$1], [$2], [$3])[{patsubst(patsubst(patsubst([[[$4]]], [#], [[#]]), [
]), [;*])}divert(-1)
	])

	# If the second argument is empty, it inserts the rule set directly into the CSS
	ifelse([$2], [], [

		ADD_STYLE_TAG()

		# add rule to stylesheet
		indir(defn([CLASS_RULE_SET_KEY]))
	])
])

# A → β
define([ADD_CLASS_RULE_SET], [

	popdef([$1])

	# loop end condition
	ifdef([$1], [

		# left recursion
		$0([$1], defn([$1]))
	], [

		# A → ε
		define([$1])
	])

	ifdef([$2], [

		indir([$2])
	])
])

#      _______________      __________
# --->/ ADD_STYLE_TAG \--->/ undefine \
#     \_______________/    \__________/
#
# A → β
define([ADD_STYLE_TAG], [

	undefine([$0])

	divert(INTERNAL_STYLE_DATA)dnl
<style>dnl
divert(INTERNAL_STYLE_END)dnl
</style>
divert(-1)
])

# A → β
define([ADD_CLASS_ITEM], [

	ifdef([.$1], [

		ifelse(defn([.$1]), [], [], [

			ADD_STYLE_TAG()

			ADD_CLASS_RULE_SET([.$1], defn([.$1]))
		])
	], [

		ROOT_ERROR([unknown class ‘$1’])
	])

	ifelse([$#], [1], [], [

		# right recursion
		$0(shift($@))
	])
])

# if the class name(s) was used once, write only the class name(s)
# A → β
define([ADD_CLASS], [ifdef([$0 $1], [], [pushdef([CURRQU], divnum)divert(-1)

	# process class value(s)
	ADD_CLASS_ITEM(patsubst([$1], [ +], [,]))

	# define class name(s)
	define([$0 $1], NSP()patsubst([$1], [ +], [ NSP()]))

	divert(CURRQU)popdef([CURRQU])dnl
])defn([$0 $1])])

# unfinished
# A → β
define([FIND_AND_ADD_ID_RULE_SET], [NSP()defn(defn([FILE_PREFIX]).anch.[$1])])
define([ADD_ID_RULE], [NSP()[$1]])
