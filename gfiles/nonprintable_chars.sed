# vim:mps+=\:
#
# __HEADER(⟦Josef Kubin⟧, ⟦2019/09/22⟧)
# ___DESCR(⟦converts the root file for square brackets to the root file for nonprintable characters⟧)
# __REASON(⟦root file for nonprintable characters⟧)
#
# non printable chars  and  can be easily typed from Vim
# 	Ctrl-b	as _b_eginning
# 	Ctrl-f	as _f_inal or _f_inish

# set vim modeline; write LOUD alert for unsuspecting users
1s/^/dnl vim:mps+=\\:\ndnl\ndnl DO NOT EDIT! This file is generated automatically!\ndnl\n/

# change a specific additional pair of characters
/^define(\[\(BRAC\|QUOT\|UTFP\)\], \[/{s//define(\1, /; s/])$/)/;b}

s/\[//g
s/]//g

# necessary changes for unpaired characters
/^define(LB, ifelse.*$/{N;z;s/^/define(LB, [)/}
/^define(RB, ifelse.*$/{N;z;s/^/define(RB, ])/}

/^define(LN, .*$/s//define(LN, ifelse($#, 0, $0, changequotednl\nchangequote(,)))/
/^define(RN, .*$/s//define(RN, ifelse($#, 0, $0, changequotednl\nchangequote(,)))/

# for simplified root0b
/^define(LB, changequote.*$/{N;z;s/^/define(LN, changequotednl\nchangequote(,))/}
/^define(RB, changequote.*$/{N;z;s/^/define(RN, changequotednl\nchangequote(,))/}

# set aliases
/define(LL,/s/LB/LN/
/define(RR,/s/RB/RN/
