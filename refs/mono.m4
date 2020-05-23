__HEADER([Josef Kubin], [2020/03/29], [refs])
___DESCR([references to monolingual macros])
___POINT([breakdown of references])

# A → β
define([COUNTER], defn([COUNT_UP]))

# counter is an index for dataset in a <tag … data-n₁="…" data-n₂="…">…</tag>
COUNTER(0)

# A → β
define([ADD_FILE_ITEM], [

		divert(0)dnl
[define([$1], [$2])]
divert(-1)
])

# A → β
# β
define([TEXTDATA], [

	define([PATH_TO_FILE], SARG1($1))
	define([DISCRIMINATOR], SARG2($1))

	ifdef(__file__.defn([PATH_TO_FILE]), [

		ifdef(__file__.defn([PATH_TO_FILE], [DISCRIMINATOR]), [

			ROOT_ERROR([$0([$1], …) is duplicit (first: ]defn(__file__.defn([PATH_TO_FILE], [DISCRIMINATOR]))[). Append an ID [_a-z0-9]: $0([path/file,id]) to make it unique.])
		])

		define(__file__.defn([PATH_TO_FILE], [DISCRIMINATOR]), __file__:__line__)
	], [
		esyscmd([test -f ']defn([PATH_TO_FILE])['])

		ifelse(sysval, [0], [], [

			ROOT_ERROR([the file ‘]defn([PATH_TO_FILE])[’ does not exist])
		])

		define(__file__.defn([PATH_TO_FILE]), __file__:__line__)
	])

	ADD_FILE_ITEM(__file__.mono.defn([PATH_TO_FILE])[]ifelse(defn([DISCRIMINATOR]), [], [], [[,]]defn([DISCRIMINATOR])),
	translit(NSP()defn([PATH_TO_FILE]), [./A-Z], [-_a-z])[]ifelse(defn([DISCRIMINATOR]), [], [], -defn([DISCRIMINATOR])))

	ADD_FILE_ITEM(__file__.dset.defn([PATH_TO_FILE])[]ifelse(defn([DISCRIMINATOR]), [], [], [[,]]defn([DISCRIMINATOR])),
	COUNTER)
])

# A → β
define([TEXTDATA_MLH], defn([TEXTDATA]))

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
	ADD_FILE_ITEM(__file__.mono.[$1], translit(NSP()[[$1]], [_A-Z], [-a-z]))
])

# β
pushdef([PROCESS_ID], [

	# if more than 1 param, then the $[1] is surely #ID
	ifelse(
		[$#], [1], [],
		[$1], [], [], [

		CREATE_REFERENCE([$1], [$0])
	])
])

# A → β
define([CMDSYNOPSIS_ROOT],		defn([PROCESS_ID]))
define([CMDSYNOPSIS],			defn([PROCESS_ID]))
define([IMAGEDATA],			defn([PROCESS_ID]))
define([PROGRAMLISTING],		defn([PROCESS_ID])[

	define([SOURCE_FIELD_COUNTER], COUNTER)

	# if more than 1 param, then the $[1] is surely #ID
	ifelse(
		[$#], [1], [],
		[$1], [], [], [

		ADD_FILE_ITEM(__file__.dset.[$1], SOURCE_FIELD_COUNTER)
	])
])

divert(0)dnl
[#] DONTE()
[
__HEADER([Josef Kubin], [2020/04/01], [m4root])
___DESCR([(this is a generated file) associative memory for linking files])
___POINT([simple hash database for files])
]
divert(-1)

# no need for further
popdef([PROCESS_ID])
