dnl vim:ts=32:sw=32:mps+=⟦\:⟧
dnl
divert(-1)changequote(⟦,⟧)

__AUTHOR(⟦Josef Kubin⟧, ⟦2020,01,20⟧)
___DESCR(⟦extracts headers from the source files and creates a brief documentation⟧)
__REASON(⟦a solution for cryptic short filenames⟧)
___USAGE(⟦m4 doc.m4 file1.m4 file2.sed file3.abc …⟧)

# ---- 8< ---- 8< ---- 8< ---- 8< ----
# this section may be in a separated file for another language
# for example: m4 lang_cs.m4 doc.m4 file1.m4 file2.sed file3.abc …
#
# file headers
define(⟦__AUTHOR_NAME⟧,	⟦Author⟧)
define(⟦__CREATION_DATE⟧,	⟦Started⟧)
define(⟦__FILE_NAME⟧,	⟦File⟧)
define(⟦__AUTHOR_NOTE⟧,	⟦Note⟧)
define(⟦__THANKS_CAPT⟧,	⟦Thanks⟧)
define(⟦___DESCR_CAPT⟧,	⟦Description⟧)
define(⟦__REASON_CAPT⟧,	⟦Reason⟧)
define(⟦___USAGE_CAPT⟧,	⟦Usage⟧)

# numbers to months names
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

# British: day-month-year
define(⟦alias_CONVERT_DATE_TO_ANOTHER_FORMAT⟧, ⟦alias_ifdef(⟦$2⟧, ⟦__CREATION_DATE: alias_format(⟦%d⟧, ⟦$3⟧) alias_indir(⟦$2⟧) $1
⟧)⟧)

# American: month-day-year
#define(⟦alias_CONVERT_DATE_TO_ANOTHER_FORMAT⟧, ⟦alias_ifdef(⟦$2⟧, ⟦__CREATION_DATE: alias_indir(⟦$2⟧) alias_format(⟦%d⟧, ⟦$3⟧)th, $1
#⟧)⟧)

# end of a language specific section
# ---- 8< ---- 8< ---- 8< ---- 8< ----

# counter for input files
# A → β
define(⟦alias_COUNTER_val⟧,	0)
define(⟦alias_COUNTER⟧,	⟦alias_define(⟦alias_COUNTER_val⟧, alias_incr(alias_COUNTER_val))alias_COUNTER_val⟧)

# A → β
define(⟦__AUTHOR⟧, ⟦

	alias_divert(2)alias_dnl
---
__FILE_NAME ⟦#⟧alias_COUNTER: alias___file__
alias_ifelse(⟦$1⟧, ⟦⟧, ⟦⟧, ⟦__AUTHOR_NAME: $1
⟧)alias_dnl
alias_CONVERT_DATE_TO_ANOTHER_FORMAT($2)alias_dnl
alias_ifelse(⟦$3⟧, ⟦⟧, ⟦⟧, ⟦__AUTHOR_NOTE: $3
⟧)alias_dnl
alias_divert(-1)
⟧)

# A → β
# β
define(⟦__THANKS⟧, ⟦

	alias_ifelse(⟦$1⟧, ⟦⟧, ⟦⟧, ⟦
		alias_divert(2)alias_dnl
$0_CAPT: $1
alias_divert(-1)
	⟧)
⟧)

# A → β
define(⟦___DESCR⟧,	defn(⟦__THANKS⟧))
define(⟦__REASON⟧,	defn(⟦__THANKS⟧))
define(⟦___USAGE⟧,	defn(⟦__THANKS⟧))

# aliases for the necessary keywords
# A → β
define(⟦alias___file__⟧,	defn(⟦__file__⟧))
define(⟦alias_define⟧,	defn(⟦define⟧))
define(⟦alias_divert⟧,	defn(⟦divert⟧))
define(⟦alias_dnl⟧,	defn(⟦dnl⟧))
define(⟦alias_format⟧,	defn(⟦format⟧))
define(⟦alias_ifdef⟧,	defn(⟦ifdef⟧))
define(⟦alias_ifelse⟧,	defn(⟦ifelse⟧))
define(⟦alias_incr⟧,	defn(⟦incr⟧))
define(⟦alias_indir⟧,	defn(⟦indir⟧))

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
	alias_divert(1)alias_dnl
⟦#⟧ total number of files: alias_COUNTER_val
⟧)

# disable one-line comments (M4 can process symbols in the comments) and turn off all M4 keywords
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
