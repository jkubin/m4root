dnl vim:ts=32:sw=32
divert(-1)changequote([,])

__HEADER([Josef Kubin], [2020/01/20], [m4root])
___DESCR([extracts headers from source files and creates very lightweight documentation for a basic source file overview])
___POINT([very lightweight documentation is a solution for cryptic short filenames])
___USAGE([m4 doc.m4 …])

# strings for documentation
define([__AUTHOR_NAME],	[Author])
define([__CREATION_DATE],	[Started])
define([__FILE_NAME],	[File])
define([__HEADER_NOTE],	[Note])
define([__THANKS_CAPT],	[Thanks])
define([__VERSION],	[Version])
define([___DESCR_CAPT],	[Description])
define([___POINT_CAPT],	[Reason])
define([___USAGE_CAPT],	[Usage])

define([__FILE_VERSION],	[__VERSION: $1.$2.$3
])

# A → β
define([__HEADER], [

	doc_divert(0)doc_dnl
---
__FILE_NAME: __file__
__AUTHOR_NAME: $1
__CREATION_DATE: $2
__HEADER_NOTE: $3
doc_ifelse([$4], [], [], [__FILE_VERSION($4)])doc_dnl
doc_divert(-1)
])

# A → β
define([__THANKS], [

	doc_divert(0)doc_dnl
$0_CAPT: $1
doc_divert(-1)
])

# A → β
define([___DESCR], defn([__THANKS]))
define([___POINT], defn([__THANKS]))
define([___USAGE], defn([__THANKS]))

# create aliases for the necessary keywords
# A → β
define([doc_divert], defn([divert]))
define([doc_ifelse], defn([ifelse]))
define([doc_dnl], defn([dnl]))

# comment out this paragraph if you do not like it
divert(0)dnl
[#] vim:wrap:spell:spelllang=en
This is a generated brief documentation from all source files.
It also shows the possibilities of the M4.
divert(-1)

# disable one-line comments and turn off all M4 keywords
changecom

undefine(

	[builtin],
	[changecom],
	[changequote],
	[changeword],
	[debugmode],
	[decr],
	[define],
	[defn],
	[divert],
	[divnum],
	[dnl],
	[dumpdef],
	[errprint],
	[esyscmd],
	[eval],
	[format],
	[ifdef],
	[ifelse],
	[include],
	[incr],
	[index],
	[indir],
	[len],
	[m4exit],
	[m4wrap],
	[maketemp],
	[patsubst],
	[popdef],
	[pushdef],
	[regexp],
	[shift],
	[sinclude],
	[substr],
	[syscmd],
	[sysval],
	[traceoff],
	[traceon],
	[translit],
	[undefine],
	[undivert],

)
