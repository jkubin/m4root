dnl vim:mps+=⟦\:⟧
dnl
dnl DO NOT EDIT! This file is generated automatically!
dnl
divert(-1)changequote(⟦,⟧)

__HEADER(⟦Josef Kubin⟧, ⟦2020/02/18⟧, ⟦gfiles⟧)
___DESCR(⟦minimal root script for simple projects⟧)
___POINT(⟦root script as small as possible⟧)
___USAGE(⟦m4 mroot.m4 stem.m4 branch.m4 sub_branch.m4 leaf.m4 data.mc > output.file⟧)

# LOUD alert for unsuspecting users
define(⟦DONTE⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧,
⟦DO NOT EDIT! This file is generated automatically!⟧)⟧)

# utilises Vim shortcuts Ctrl-a or Ctrl-x to change ARGn
define(⟦ARG1⟧,	⟦$1⟧)
define(⟦ARG2⟧,	⟦$2⟧)
define(⟦ARG3⟧,	⟦$3⟧)

# additional pair (payr is not a vocabulary word) of symbols against unwanted expansion
define(⟦PAYR⟧, ⟦⟦$@⟧⟧)
define(⟦BRAC⟧, ⟦[$@]⟧)
define(⟦NPRI⟧, ⟦$@⟧)

# puts a left/right unpaired angular bracket, quotation mark, nonprintable or UTF-8 char
define(⟦LB⟧, ⟦[⟧)
define(⟦RB⟧, ⟦]⟧)
define(⟦LQ⟧, ⟦`⟧)
define(⟦RQ⟧, ⟦'⟧)
define(⟦LN⟧, ⟦⟧)
define(⟦RN⟧, ⟦⟧)
define(⟦LU⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦changequote`'format(`%c%c%c', 226, 159, 166)changequote(⟦,⟧)⟧)⟧)
define(⟦RU⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦changequote`'format(`%c%c%c', 226, 159, 167)changequote(⟦,⟧)⟧)⟧)

# 'abort script if something goes wrong, print the reason to stderr
define(⟦ROOT_ERROR⟧, ⟦errprint(__file__:__line__⟦: error: $*
⟧)m4exit(1)⟧)
