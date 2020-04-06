__HEADER([Josef Kubin], [2020/03/29], [refs])
___DESCR([references to monolingual macros])
___POINT([breakdown of references])

# A → β
define([ADD_FILE_ITEM], [

		divert(0)dnl
[define([$1], [$2])]
divert(-1)
])

# A → β
define([INSERT_FILE], [

	ADD_FILE_ITEM(__file__.mono.[$1]ifdef([file://$1], [:])defn([file://$1]), translit(NSP()[[$1]], [-/:A-Z], [___a-z])[]ifdef([file://$1], [:])defn([file://$1]))

	ifdef([file://$1], [

		define([file://$1], incr(defn([file://$1])))
	], [
		esyscmd([test -f '$1'])

		ifelse(sysval, [0], [], [

			ROOT_ERROR([file ‘$1’ does not exist])
		])

		define([file://$1], 2)
	])
])

# A → β
define([CREATE_REFERENCE], [

	# test for name collision
	ifdef([$1], [

		ROOT_ERROR([$1 collides with a macro name; use different name])
	])

	# remove permitted characters, remains forbidden char(s)
	ifelse(patsubst([[$1]], [[0-9A-Za-z_]]), [], [], [

		ROOT_ERROR([forbidden character(s) found in $2([$1], …)])
	])

	# translit upper case to lower case, change underscore to dash
	define([STRING], translit([[$1]], [_A-Z], [-a-z]))

	# create a unique string
	define([UNIQ], defn([FILE_PREFIX], [STRING]))

	# already has a value?
	ifdef(defn([UNIQ]), [

		ROOT_ERROR([html anchor ‘$2(]BRAC(defn([STRING]))[, …)’ is not unique, first occurrence on:]defn(defn([UNIQ])))
	])

	# assign value for later error message (file:line)
	define(defn([UNIQ]), __file__:__line__)

	# print ordinary reference to an identifier
	ADD_FILE_ITEM(__file__.mono.[$1], translit(NSP()[[$1]], [-A-Z], [_a-z]))
])

define([PROCESS_ID], [

	# if more than 1 param, then the $[1] is surely #ID
	ifelse(
		[$#], [1], [],
		[$1], [], [], [

		CREATE_REFERENCE([$1], [$0])
	])
])

define([COMMAND_ROOT],			defn([PROCESS_ID]))
define([COMMAND_USR],			defn([PROCESS_ID]))
define([IMAGEDATA],			defn([PROCESS_ID]))
define([PROGRAMLISTING],		defn([PROCESS_ID]))

divert(0)dnl
[#] DONTE()
[
__HEADER([Josef Kubin], [2020/04/01], [m4root])
___DESCR([(this is a generated file) associative memory for linking files])
___POINT([simple hash database for files])
]
divert(-1)
