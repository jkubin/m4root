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

s/\[/`/g
s/]/'/g

# for minimal versions of root.m4
/^define(`LL', `changequote.*$/{N;z;s/^/define(`LL', `changequote([,])`dnl'\nchangequote`'')/}
/^define(`RR', `changequote.*$/{N;z;s/^/define(`RR', `changequote([,])dnl`\n'changequote`'')/}

# for extended versions of root.m4
/^define(`LL', .ifelse.*$/{N;z;s/^/define(`LL', `ifelse(`$#', `0', ``$0'', `changequote([,])`dnl'\nchangequote`'')')/}
/^define(`RR', .ifelse.*$/{N;z;s/^/define(`RR', `ifelse(`$#', `0', ``$0'', `changequote([,])dnl`\n'changequote`'')')/}
