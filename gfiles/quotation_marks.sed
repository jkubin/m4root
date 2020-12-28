# vim:mps+=`\:'
#
# __HEADER(⟦Josef Kubin⟧, ⟦2019/09/22⟧)
# ___DESCR(⟦converts the root file for square brackets to the root file for original quotation marks⟧)
# __REASON(⟦root file for original quotation marks⟧)

1{
# set vim modeline; write LOUD alert for unsuspecting users
s/^/dnl vim:mps+=`\\:'\ndnl\ndnl DO NOT EDIT! This file is generated automatically!\ndnl\n/
# use implicit quotation marks
s/changequote([^)]*)//
}

# change a specific additional pair of characters
/^define(\[\(BRAC\|NPRI\|UTFP\)\], \[/{s//define(`\1', `/; s/])$/')/;b}

s/\[/`/g
s/]/'/g

# necessary changes for unpaired characters
/^define(`LB', .ifelse.*$/{N;z;s/^/define(`LB', `[')/}
/^define(`RB', .ifelse.*$/{N;z;s/^/define(`RB', `]')/}

/^define(`LQ', .*$/s//define(`LQ', `ifelse(`$#', `0', ``$0'', `changequote([,])`dnl'\nchangequote`'')')/
/^define(`RQ', .*$/s//define(`RQ', `ifelse(`$#', `0', ``$0'', `changequote([,])dnl`\n'changequote`'')')/

# for simplified root0b
/^define(`LB', `changequote.*$/{N;z;s/^/define(`LQ', `changequote([,])`dnl'\nchangequote`'')/}
/^define(`RB', `changequote.*$/{N;z;s/^/define(`RQ', `changequote([,])dnl`\n'changequote`'')/}

# set aliases
/define(`LL',/s/LB/LQ/
/define(`RR',/s/RB/RQ/
