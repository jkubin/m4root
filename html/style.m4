__HEADER([Josef Kubin], [2019/12/24], [root_cz])
___DESCR([creates a style sheet in a dedicated namespace; avoid inline CSS])
___POINT([the purpose is a small customization of the parent web page])

# unfinished!

# extends parent css definitions
# A → β
define([CSS_RULE_SET], [

	ifdef([$1{}], [

		ROOT_ERROR([class ‘$0($@)’ redefined, first occurrence on:]defn([$1{}]))
	])

	define([$1{}], __line__)

	define([$0], defn([NEXT_RULE_SET]))

	# prvni bude prefix (mohlo by to byt nejake makro prepisujici se na ε)
	#ADD_CSS_RULE_SET([nazev], [suffix], [$2])

	divert(INTERNAL_STYLE_DATA)dnl
<!-- supplemental style sheet -->
<style>dnl
$1{patsubst(patsubst([$2], [[,#]], [[[\&]]]), [
])}dnl
divert(INTERNAL_STYLE_END)dnl
</style>
divert(-1)
])

# A → β
define([NEXT_RULE_SET], [

	ifdef([$1{}], [

		ROOT_ERROR([class ‘$0($@)’ redefined, first occurrence on:]defn([$1{}]))
	])

	define([$1{}], __line__)

	# prvni bude prefix (mohlo by to byt nejake makro prepisujici se na ε)
	#ADD_CSS_RULE_SET([nazev], [suffix], [$2])

	divert(INTERNAL_STYLE_DATA)dnl
$1{patsubst(patsubst([$2], [[,#]], [[[\&]]]), [
])}dnl
divert(-1)
])

# hide problematic characters: [,#]
# the _intentional_ macro-expansion deletes new lines
# A → β
# β
define([ADD_CSS_RULE_SET], [[$1]NSP()$3[]defn([$2$1]){patsubst(patsubst(defn([$1$2]), [[,#]], [[[\&]]]), [
])}popdef([$1$2], [$2$1])ifdef([$1$2], [$0([$1], [$2], [$3])])])

# 2017	W3C Recommendation: HTML5.2
# https://www.w3.org/TR/html52/document-metadata.html#the-style-element
# "… The use of style in the body of the document may cause restyling, trigger layout and/or cause repainting, and hence, should be used with care…"
#      ____________________      __________________
# --->/ ADD_INTERNAL_STYLE \--->/ ADD_CSS_RULE_SET \---.
#     \____________________/    \__________________/<--'
#
# creates embedded style tags, insert first css item, transition to the next node
# A → β
define([ADD_INTERNAL_STYLE], [dnl
<!-- internal style sheet -->define([$0], defn([ADD_CSS_RULE_SET]))
<style>dnl
ADD_CSS_RULE_SET([$1], [$2], [$2])dnl
divert(INTERNAL_STYLE_END)dnl
</style>
])

# A → β
define([ADD_CLASS_ITEMS], [

	# if class has been defined
	ifdef([.$1], [

		divert(INTERNAL_STYLE_DATA)dnl
ADD_INTERNAL_STYLE([.], [$1], [$1])dnl
divert(-1)
	])

	divert(CURRQU)dnl
SPACE_AS_SEPARATOR()NSP()[$1]dnl
divert(-1)

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
define([ADD_CLASS_RULE_SET], [pushdef([CURRQU], divnum)divert(-1)

	# reset automaton
	# A → β
	define([SPACE_AS_SEPARATOR], defn([SPACE_AUTOMATON]))

	# process class values separated by a space
	ADD_CLASS_ITEMS(patsubst([$1], [ +], [,]))

	divert(CURRQU)popdef([CURRQU])dnl
])

# A → β
define([FIND_AND_ADD_ID_RULE_SET], [pushdef([CURRQU], divnum)divert(-1)

	# if ID has been defined
	ifdef([#$1], [

		divert(INTERNAL_STYLE_DATA)dnl
ADD_INTERNAL_STYLE([#], [$1], defn(defn([FILE_PREFIX]).anch.[$1]))dnl
divert(-1)
	])

	divert(CURRQU)NSP()defn(defn([FILE_PREFIX]).anch.[$1])popdef([CURRQU])dnl
])

define([ADD_ID_RULE], [NSP()[$1]])

ifelse([
# A → β
define([ADD_ID_RULE], [pushdef([CURRQU], divnum)divert(-1)

	# if ID has been defined
	ifdef([#$1], [

		divert(INTERNAL_STYLE_DATA)dnl
ADD_INTERNAL_STYLE([#], [$1], [$1])dnl
divert(-1)
	])

	divert(CURRQU)NSP()[$1]popdef([CURRQU])dnl
])
])dnl comment
