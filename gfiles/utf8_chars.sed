# vim:mps+=⟦\:⟧
#
# __HEADER(⟦Josef Kubin⟧, ⟦2019/09/22⟧)
# ___DESCR(⟦converts the root file for square brackets to the root file for UTF-8 characters⟧)
# __REASON(⟦root file for UTF-8 characters⟧)

# set vim modeline; write LOUD alert for unsuspecting users
1s/^/dnl vim:mps+=⟦\\:⟧\ndnl\ndnl DO NOT EDIT! This file is generated automatically!\ndnl\n/

s/\[/⟦/g
s/]/⟧/g
