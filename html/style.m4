__HEADER([Josef Kubin], [2019/12/24], [root_cz])
___DESCR([creates a style sheet in the reserved namespace])
___POINT([the style sheet contains only the things that are actually used])

#      ______________________      _____________________
# --->/ FIRST_CLASS_RULE_SET \--->/ NEXT_CLASS_RULE_SET \---.
#     \______________________/    \_____________________/<--'
#
# A → β
define([NEXT_CLASS_RULE_SET], [ifelse([$1], [], [], [[,]pushdef([.$1], defn([CLASS_RULE_SET_KEY]))CLASS_SURROUNDINGS([$1])[]$0(shift($@))])])
define([FIRST_CLASS_RULE_SET], [pushdef([.$1], defn([CLASS_RULE_SET_KEY]))CLASS_SURROUNDINGS([$1])[]NEXT_CLASS_RULE_SET(shift($@))])

# process CSS definitions
# A → β
define([CSS_CLASS_RULE_SET], [

	ifdef([class{$1.$2.$3}key], [

		ROOT_ERROR([the rule set ‘$0($@)’ is redefined])
	])

	define([CLASS_RULE_SET_KEY], [class{$1.$2.$3}key])
	define([CLASS_SURROUNDINGS], [[$1]]ifelse([$2], [], [], [.NSP()])$[1[$3]])

	# once the rule set is written to stylesheet, it undefine itself
	# A → β
	define(defn([CLASS_RULE_SET_KEY]), [undefine(]LB()defn([CLASS_RULE_SET_KEY])RB()[)divert(INTERNAL_STYLE_DATA)]FIRST_CLASS_RULE_SET($2)[{patsubst(patsubst(patsubst([[[$4]]], [#], [[#]]), [
]), [;*])}divert(-1)
	])

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
