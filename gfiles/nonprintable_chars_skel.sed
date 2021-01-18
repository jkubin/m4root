# __AUTHOR(⟦Josef Kubin⟧, ⟦2019,10,27⟧)
# ___DESCR(⟦converts skeleton file for square brackets to skeleton file for nonprintable characters⟧)
# __REASON(⟦skeleton file for nonprintable characters⟧)

1s/^/# vim:mps+=\\:\n\n/

# ⟦	<--- because of doc.m4
/___USAGE/s/b.m4/n.m4/g
# ⟧	<--- because of doc.m4

s/\[//g
s/]//g
