dnl vim:mps+=⟦\:⟧
dnl
dnl DO NOT EDIT! This file is generated automatically!
dnl
divert(-1)changequote(⟦,⟧)

__AUTHOR(⟦Josef Kubin⟧, ⟦2020,02,18⟧)
___DESCR(⟦minimal root script for simple projects⟧)
__REASON(⟦root script as small as possible⟧)
___USAGE(⟦m4 rootu.m4 stem.m4 branch.m4 sub_branch.m4 leaf.m4 data.mc > output.file⟧)

# LOUD alert for unsuspecting users
define(⟦DONTE⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧,
⟦DO NOT EDIT! This file is generated automatically!⟧)⟧)

# adds a single Left/Right unpaired control symbol:
# LL() → ⟦
# RR() → ⟧
#
define(⟦LL⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦changequote⟦dnl⟧
changequote(⟦,⟧)⟧)⟧)
define(⟦RR⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦changequote`'dnl⟦
⟧changequote(⟦,⟧)⟧)⟧)

# adds number of arguments (used for loops)
define(⟦NAR⟧, ⟦$#⟧)

# expands n-th argument (use Vim shortcuts Ctrl-a or Ctrl-x to change ARGn)
define(⟦ARG1⟧,	⟦$1⟧)
define(⟦ARG2⟧,	⟦$2⟧)
define(⟦ARG3⟧,	⟦$3⟧)

# selects n-th argument
define(⟦SARG1⟧,	⟦⟦$1⟧⟧)
define(⟦SARG2⟧,	⟦⟦$2⟧⟧)
define(⟦SARG3⟧,	⟦⟦$3⟧⟧)

# adds another universal pair of symbols that protects unwanted expansion
# (`paYr' is not a word from the dictionary)
define(⟦PAYR⟧, ⟦⟦$@⟧⟧)

# 'prints a warning to stderr if something will be problematic
define(⟦ROOT_WARNING⟧, ⟦errprint(__file__:__line__⟦: warning: $1
⟧)⟧)

# aborts a script if something goes wrong and prints the reason to stderr
define(⟦ROOT_ERROR⟧, ⟦errprint(__file__:__line__⟦: error: $1
⟧)m4exit(1)⟧)
