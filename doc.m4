dnl vim:ts=32:sw=32
divert(-1)changequote([,])

__HEADER([Josef Kubin], [2020/01/20], [m4root])
___DESCR([extracts headers from source files and creates brief documentation])
___POINT([brief documentation is a solution for cryptic short filenames])
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
__FILE_NAME: doc___file__
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
define([doc___file__], defn([__file__]))
define([doc_divert], defn([divert]))
define([doc_dnl], defn([dnl]))
define([doc_ifelse], defn([ifelse]))

# comment out this paragraph if you do not like it (note the right unpaired bracket)
divert(0)dnl
[#] vim:wrap:spell:spelllang=en
# DO NOT EDIT! This file is generated automatically!

Extracted data from all source files.
To update this file, run the following command:

~]$ make doc

divert(-1)

# disable one-line comments and turn off all M4 keywords
changecom

undefine(

	[__file__],
	[__gnu__],
	[__line__],
	[__os2__],
	[__program__],
	[__unix__],
	[__windows__],
	[builtin],
	[changecom],
	[changequote],
	[changeword],
	[debugfile],
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
