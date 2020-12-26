# __HEADER(⟦Josef Kubin⟧, ⟦2019/11/22⟧, ⟦m4root⟧)
# ___DESCR(⟦converts skeleton file for square brackets to skeleton file for quotation marks⟧)
# __REASON(⟦skeleton file for quotation marks⟧)

1s/^/# vim:mps+=`\\:'\n\n/

# [	<--- because of M4
/___USAGE/s/\<rootb\>/rootq/
# ]	<--- because of M4

s/\[/`/g
s/]/'/g
