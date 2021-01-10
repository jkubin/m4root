dnl vim:ts=32:sw=32
divert(-1)changequote(⟦,⟧)

__HEADER(⟦Josef Kubin⟧, ⟦2020,01,20⟧)
___DESCR(⟦extracts headers from the source files and creates a brief documentation⟧)
__REASON(⟦a solution for cryptic short filenames⟧)
___USAGE(⟦m4 doc.m4 file1.m4 file2.sed file3.abc …⟧)

# file headers
define(⟦__AUTHOR_NAME⟧,	⟦Author⟧)
define(⟦__CREATION_DATE⟧,	⟦Started⟧)
define(⟦__FILE_NAME⟧,	⟦File⟧)
define(⟦__HEADER_NOTE⟧,	⟦Note⟧)
define(⟦__THANKS_CAPT⟧,	⟦Thanks⟧)
define(⟦__VERSION⟧,	⟦Version⟧)
define(⟦___DESCR_CAPT⟧,	⟦Description⟧)
define(⟦__REASON_CAPT⟧,	⟦Reason⟧)
define(⟦___USAGE_CAPT⟧,	⟦Usage⟧)

define(⟦__FILE_VERSION⟧,	⟦__VERSION: $1.$2.$3
⟧)

# month numbers to months names
define(⟦01⟧, ⟦January⟧)
define(⟦02⟧, ⟦February⟧)
define(⟦03⟧, ⟦March⟧)
define(⟦04⟧, ⟦April⟧)
define(⟦05⟧, ⟦May⟧)
define(⟦06⟧, ⟦June⟧)
define(⟦07⟧, ⟦July⟧)
define(⟦08⟧, ⟦August⟧)
define(⟦09⟧, ⟦September⟧)
define(⟦10⟧, ⟦October⟧)
define(⟦11⟧, ⟦November⟧)
define(⟦12⟧, ⟦December⟧)

define(⟦doc_CONVERT_MONTH_NUMBERS_TO_NAMES⟧, ⟦doc_ifdef(⟦$2⟧, ⟦$3 doc_indir(⟦$2⟧) $1⟧, ⟦-⟧)⟧)

# counter for input files
# A → β
define(⟦file_COUNTER_val⟧,	0)
define(⟦file_COUNTER⟧,	⟦doc_define(⟦file_COUNTER_val⟧, doc_incr(file_COUNTER_val))⟧)

# A → β
define(⟦__HEADER⟧, ⟦

	file_COUNTER
	doc_divert(2)doc_dnl
---
__FILE_NAME file_COUNTER_val: doc___file__
__AUTHOR_NAME: $1
__CREATION_DATE: doc_CONVERT_MONTH_NUMBERS_TO_NAMES($2)
__HEADER_NOTE: $3
doc_ifelse(⟦$4⟧, ⟦⟧, ⟦⟧, ⟦__FILE_VERSION($4)⟧)doc_dnl
doc_divert(-1)
⟧)

# A → β
define(⟦__THANKS⟧, ⟦

	doc_divert(2)doc_dnl
$0_CAPT: $1
doc_divert(-1)
⟧)

# A → β
define(⟦___DESCR⟧,	defn(⟦__THANKS⟧))
define(⟦__REASON⟧,	defn(⟦__THANKS⟧))
define(⟦___USAGE⟧,	defn(⟦__THANKS⟧))

# aliases for the necessary keywords
# A → β
define(⟦doc___file__⟧,	defn(⟦__file__⟧))
define(⟦doc_define⟧,	defn(⟦define⟧))
define(⟦doc_divert⟧,	defn(⟦divert⟧))
define(⟦doc_dnl⟧,	defn(⟦dnl⟧))
define(⟦doc_ifdef⟧,	defn(⟦ifdef⟧))
define(⟦doc_ifelse⟧,	defn(⟦ifelse⟧))
define(⟦doc_incr⟧,	defn(⟦incr⟧))
define(⟦doc_indir⟧,	defn(⟦indir⟧))

# comment out this paragraph if you do not like it (note the right unpaired bracket)
divert(0)dnl
⟦#⟧ vim:wrap:spell:spelllang=en
# DO NOT EDIT! This file is generated automatically!
⟦#⟧ generated: esyscmd(⟦date '+%Y%m%d-%T'⟧)dnl
divert(2)dnl
#
# To update, run:
# ~]$ make doc

divert(-1)

m4wrap(⟦
	doc_divert(1)doc_dnl
⟦#⟧ total number of files: file_COUNTER_val
⟧)

# disable one-line comments and turn off all M4 keywords
changecom

undefine(

	⟦__file__⟧,
	⟦__gnu__⟧,
	⟦__line__⟧,
	⟦__os2__⟧,
	⟦__program__⟧,
	⟦__unix__⟧,
	⟦__windows__⟧,
	⟦builtin⟧,
	⟦changecom⟧,
	⟦changequote⟧,
	⟦changeword⟧,
	⟦debugfile⟧,
	⟦debugmode⟧,
	⟦decr⟧,
	⟦define⟧,
	⟦defn⟧,
	⟦divert⟧,
	⟦divnum⟧,
	⟦dnl⟧,
	⟦dumpdef⟧,
	⟦errprint⟧,
	⟦esyscmd⟧,
	⟦eval⟧,
	⟦format⟧,
	⟦ifdef⟧,
	⟦ifelse⟧,
	⟦include⟧,
	⟦incr⟧,
	⟦index⟧,
	⟦indir⟧,
	⟦len⟧,
	⟦m4exit⟧,
	⟦m4wrap⟧,
	⟦maketemp⟧,
	⟦patsubst⟧,
	⟦popdef⟧,
	⟦pushdef⟧,
	⟦regexp⟧,
	⟦shift⟧,
	⟦sinclude⟧,
	⟦substr⟧,
	⟦syscmd⟧,
	⟦sysval⟧,
	⟦traceoff⟧,
	⟦traceon⟧,
	⟦translit⟧,
	⟦undefine⟧,
	⟦undivert⟧,

)
