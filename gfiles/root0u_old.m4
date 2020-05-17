dnl vim:mps+=⟦\:⟧
dnl
dnl DO NOT EDIT! This file is generated automatically!
dnl
divert(-1)changequote(⟦,⟧)

# LOUD alert for unsuspecting users (donte is not a vocabulary word)
define(⟦DONTE⟧, ⟦DO NOT EDIT! This file is generated automatically!⟧)

# puts a left/right unpaired symbol to skip the non-terminal control
define(⟦LU⟧, ⟦changequote`'format(`%c%c%c', 226, 159, 166)changequote(⟦,⟧)⟧)
define(⟦RU⟧, ⟦changequote`'format(`%c%c%c', 226, 159, 167)changequote(⟦,⟧)⟧)

# number of arguments
define(⟦NAR⟧, ⟦$#⟧)

# expand n-th argument, utilises Vim shortcuts Ctrl-a or Ctrl-x to change ARGn
define(⟦ARG1⟧,	⟦$1⟧)
define(⟦ARG2⟧,	⟦$2⟧)
define(⟦ARG3⟧,	⟦$3⟧)

# puts additional pair (payr is not a vocabulary word) of symbols
define(⟦PAYR⟧, ⟦⟦$@⟧⟧)
define(⟦BRAC⟧, ⟦[$@]⟧)

# print warning to stderr if something will be problematic
define(⟦ROOT_WARNING⟧, ⟦errprint(__file__:__line__⟦: warning: $*
⟧)⟧)

# abort script if something goes wrong, print the reason to stderr
define(⟦ROOT_ERROR⟧, ⟦errprint(__file__:__line__⟦: error: $*
⟧)m4exit(1)⟧)