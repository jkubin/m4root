__HEADER([Josef Kubin], [2019/12/24], [root_cz])
___DESCR([creates a style sheet in the reserved namespace])
___POINT([the style sheet contains only the things that are actually used])

# process CSS definitions
# A → β
define([CSS_RULE_SET], [

	ifdef([$1$2$3{}], [

		ROOT_ERROR([class ‘$0($@)’ redefined, first occurrence on:]defn([$1$2$3{}]))
	])

	define([$1$2$3{}], __line__)

	pushdef([.$2], [$1.]NSP()[$2$3])
	pushdef(defn([.$2]), [$4])
])

# hide problematic characters: [,#]
# _intentional_ macro-expansion (language-dependent names)
# A → β
# β
define([ADD_CSS_RULE_SET], [

	popdef([$1])

	# loop end condition
	ifdef([$1], [

		# left recursion
		$0(defn([$1]), defn(defn([$1])))
	])

	divert(INTERNAL_STYLE_DATA)dnl
[$1]{patsubst(patsubst([$2], [[,#]], [[[\&]]]), [
])}dnl
divert(-1)
])

#      ____________________      __________________
# --->/ ADD_INTERNAL_STYLE \--->/ ADD_CSS_RULE_SET \---.
#     \____________________/    \__________________/<--'
#
# A → β
define([ADD_INTERNAL_STYLE], [

	divert(INTERNAL_STYLE_DATA)dnl
<style>dnl
divert(INTERNAL_STYLE_END)dnl
</style>
divert(-1)

	ADD_CSS_RULE_SET($@)

	define([$0], defn([ADD_CSS_RULE_SET]))
])

# A → β
define([ADD_CLASS_ITEMS], [

	# test whether the required class is defined
	ifdef([.$1], [], [

		ROOT_ERROR([unknown class ‘$1’])
	])

	# add an item to the style sheet if it has not already been added
	ifdef(defn([.$1]), [

		ADD_INTERNAL_STYLE(defn([.$1]), defn(defn([.$1])))dnl
	])

	divert(CURRQU)dnl
SPACE_AS_SEPARATOR()NSP()[$1]dnl
divert(-1)

	# loop end condition
	ifelse([$#], [1], [], [

		# recursion
		$0(shift($@))
	])
])

#      SPACE_AUTOMATON
#      ___      _____
# --->/ ε \--->/ " " \---.
#     \___/    \_____/<--'
# β
define([SPACE_AUTOMATON], [define([$0], [ ])])

# A → β
define([ADD_CLASS], [pushdef([CURRQU], divnum)divert(-1)

	# reset automaton
	# A → β
	define([SPACE_AS_SEPARATOR], defn([SPACE_AUTOMATON]))

	# process class values separated by a space
	ADD_CLASS_ITEMS(patsubst([$1], [ +], [,]))

	divert(CURRQU)popdef([CURRQU])dnl
])

# unfinished
# A → β
define([FIND_AND_ADD_ID_RULE_SET], [NSP()defn(defn([FILE_PREFIX]).anch.[$1])])

# unfinished
define([ADD_ID_RULE], [NSP()[$1]])
