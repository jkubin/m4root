# __HEADER(⟦Josef Kubin⟧, ⟦2019,10,27⟧)
# ___DESCR(⟦converts skeleton file for square brackets to skeleton file for UTF-8 characters⟧)
# __REASON(⟦skeleton file for UTF-8 characters⟧)

1s/^/# vim:mps+=⟦\\:⟧\n\n/

# ⟦	<--- because of doc.m4
/___USAGE/s/b.m4/u.m4/g
# ⟧	<--- because of doc.m4

s/\[/⟦/g
s/]/⟧/g
