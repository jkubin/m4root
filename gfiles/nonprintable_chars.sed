# vim:mps+=\:
#
# ___TITLE(⟦Josef Kubin⟧, ⟦2019,09,22⟧)
# ___DESCR(⟦converts the root file for square brackets to the root file for nonprintable characters⟧)
# __REASON(⟦root file for nonprintable characters⟧)
#
# non-printable characters  and  were chosen because can be easily typed from Vim
# 	Ctrl-b	as _b_eginning
# 	Ctrl-f	as _f_inal or _f_inish

# set vim modeline; write LOUD alert for unsuspecting users
1s/^/dnl vim:mps+=\\:\ndnl\ndnl DO NOT EDIT! This file is generated automatically!\ndnl\n/

# ⟦	<--- because of doc.m4
/___USAGE/s/b.m4/n.m4/g
# ⟧	<--- because of doc.m4

s/\[//g
s/]//g
