# __HEADER(⟦Josef Kubin⟧, ⟦2019/11/22⟧)
# ___DESCR(⟦converts skeleton file for square brackets to skeleton file for quotation marks⟧)
# __REASON(⟦skeleton file for quotation marks⟧)

1s/^/# vim:mps+=`\\:'\n\n/

# ⟦	<--- because of doc.m4
/___USAGE/s/b.m4/q.m4/g
# ⟧	<--- because of doc.m4

s/\[/`/g
s/]/'/g
