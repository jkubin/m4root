dnl vim:mps+=`\:'
dnl
dnl DO NOT EDIT! This file is generated automatically!
dnl
divert(-1)

# LOUD alert for unsuspecting users
define(`DONTE', `DO NOT EDIT! This file is generated automatically!')

# number of arguments
define(`NAR', `$#')

# expand n-th argument, utilises Vim shortcuts Ctrl-a or Ctrl-x to change ARGn
define(`ARG1',	`$1')
define(`ARG2',	`$2')
define(`ARG3',	`$3')

# puts additional pair (payr is not a vocabulary word) of symbols
define(`PAYR', ``$@'')
define(`BRAC', `[$@]')

# puts a left/right unpaired symbol bypassing the non-terminal control
define(`LQ', `changequote([,])format([%c], 96)changequote`'')
define(`RQ', `changequote([,])format([%c], 39)changequote`'')

# 'abort script if something goes wrong, print the reason to stderr
define(`ROOT_ERROR', `errprint(__file__:__line__`: error: $*
')m4exit(1)')