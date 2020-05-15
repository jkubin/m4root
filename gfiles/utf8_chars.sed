# vim:mps+=⟦\:⟧
#
# __HEADER([Josef Kubin], [2019/09/22], [m4root])
# ___DESCR([converts the root file for square brackets to the root file for UTF-8 characters])
# ___POINT([root file for UTF-8 characters])
#
# some UTF-8 characters can be written as digraphs:
# ⟦	Ctrl-k(I
# ⟧	Ctrl-k)I

# set vim modeline; write LOUD alert for unsuspecting users
1s/^/dnl vim:mps+=⟦\\:⟧\ndnl\ndnl DO NOT EDIT! This file is generated automatically!\ndnl\n/

# change a specific additional pair of characters
/^define(\[\(BRAC\|NPRI\|QUOT\)\], \[/{s//define(⟦\1⟧, ⟦/; s/])$/⟧)/;b}

s/\[/⟦/g
s/]/⟧/g

# necessary changes for unpaired characters
/^define(⟦LB⟧, ⟦ifelse.*$/{N;z;s/^/define(⟦LB⟧, ⟦[⟧)/}
/^define(⟦RB⟧, ⟦ifelse.*$/{N;z;s/^/define(⟦RB⟧, ⟦]⟧)/}

/define(⟦LU⟧, ⟦.*$/s//define(⟦LU⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦changequote⟦dnl⟧\nchangequote(⟦,⟧)⟧)⟧)/
/define(⟦RU⟧, ⟦.*$/s//define(⟦RU⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦changequote`'dnl⟦\n⟧changequote(⟦,⟧)⟧)⟧)/

# for simplified root0b
/^define(⟦LB⟧, ⟦changequote.*$/{N;z;s/^/define(⟦LU⟧, ⟦changequote⟦dnl⟧\nchangequote(⟦,⟧)⟧)/}
/^define(⟦RB⟧, ⟦changequote.*$/{N;z;s/^/define(⟦RU⟧, ⟦changequote`'dnl⟦\n⟧changequote(⟦,⟧)⟧)/}

# set aliases
/define(⟦LL⟧,/s/LB/LU/
/define(⟦RR⟧,/s/RB/RU/
