dnl vim:mps+=\:
dnl
dnl DO NOT EDIT! This file is generated automatically!
dnl
divert(-1)changequote(,)

__HEADER(Josef Kubin, 2020/02/18, gfiles)
___DESCR(minimal root script for simple projects)
___POINT(root script as small as possible)
___USAGE(m4 mroot.m4 stem.m4 branch.m4 sub_branch.m4 leaf.m4 data.mc > output.file)

# LOUD alert for unsuspecting users
define(DONTE, ifelse($#, 0, $0,
DO NOT EDIT! This file is generated automatically!))

# number of arguments
define(NAR, $#)

# expand n-th argument
# A($1, $2, …, $n) → $1 | $2 | $3 | $4 → β
define(FST, ifelse($#, 0, $0, $1))
define(SND, ifelse($#, 0, $0, $2))
define(TRD, ifelse($#, 0, $0, $3))

# same as previous, but utilises Vim shortcuts Ctrl-a or Ctrl-x to change ARGn
define(ARG1,	$1)
define(ARG2,	$2)
define(ARG3,	$3)

# additional pair (payr is not a vocabulary word) of symbols against unwanted expansion
define(PAYR, $@)
define(BRAC, [$@])
define(NPRI, $@)

# puts a left/right unpaired symbol bypassing the non-terminal control
define(LB, [)
define(RB, ])
define(LQ, `)
define(RQ, ')
define(LN, ifelse($#, 0, $0, changequotednl
changequote(,)))
define(RN, ifelse($#, 0, $0, changequotednl
changequote(,)))
define(LU, ⟦)
define(RU, ⟧)

# 'print warning to stderr if something will be problematic
define(ROOT_WARNING, errprint(__file__:__line__: warning: $*
))

# 'abort script if something goes wrong, print the reason to stderr
define(ROOT_ERROR, errprint(__file__:__line__: error: $*
)m4exit(1))
