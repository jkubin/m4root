# __HEADER(⟦Josef Kubin⟧, ⟦2019/10/27⟧)
# ___DESCR(⟦converts skeleton file for square brackets to skeleton file for nonprintable characters⟧)
# __REASON(⟦skeleton file for nonprintable characters⟧)

1s/^/# vim:mps+=\\:\n\n/

# ⟦	<--- because of M4
/___USAGE/s/\<rootb\>/rootn/
# ⟧	<--- because of M4

s/\[//g
s/]//g
