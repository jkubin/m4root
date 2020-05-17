dnl vim:mps+=`\:'
dnl
dnl DO NOT EDIT! This file is generated automatically!
dnl
divert(-1)

# adds LOUD alert for unsuspecting users
# (`donte' is not a word from the dictionary)
define(`DONTE', `DO NOT EDIT! This file is generated automatically!')

# adds a left/right unpaired symbol bypassing the non-terminal control
define(`LQ', `changequote([,])`dnl'
changequote`'')
define(`RQ', `changequote([,])dnl`
'changequote`'')

# adds number of arguments (used for loops)
define(`NAR', `$#')

# expands n-th argument (use Vim shortcuts Ctrl-a or Ctrl-x to change ARGn)
define(`ARG1',	`$1')
define(`ARG2',	`$2')
define(`ARG3',	`$3')

# selects n-th argument
define(`SARG1',	``$1'')
define(`SARG2',	``$2'')
define(`SARG3',	``$3'')

# adds another universal pair of symbols that protects unwanted expansion
# (`payr' is not a word from the dictionary)
define(`PAYR', ``$@'')

# adds another layer of paired symbols
# (`brac', `npri', `quot' and `utfp' are not words from the dictionary)
define(`BRAC', `[$@]')
define(`NPRI', `$@')
define(`QUOT', ``$@'')
define(`UTFP', `⟦$@⟧')

# prints warning to stderr if something will be problematic
define(`ROOT_WARNING', `errprint(__file__:__line__`: warning: $1
')')

# aborts script if something goes wrong and prints the reason to stderr
define(`ROOT_ERROR', `errprint(__file__:__line__`: error: $1
')m4exit(1)')
