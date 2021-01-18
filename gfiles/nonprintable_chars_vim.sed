# __AUTHOR(⟦Josef Kubin⟧, ⟦2019,10,27⟧)
# ___DESCR(⟦converts vim iabbrev file for square brackets to iabbrev file for nonprintable characters⟧)
# __REASON(⟦keeps consistent 1:1 iabbrev vim file for square brackets with nonprintable characters⟧)

1{z;s/^/" vim:mps+=\\:\n"\n" DO NOT EDIT! This file is generated automatically!/}

s/\[//g
s/]//g
