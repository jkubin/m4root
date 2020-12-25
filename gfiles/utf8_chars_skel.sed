# __HEADER([Josef Kubin], [2019/10/27], [m4root])
# ___DESCR([converts skeleton file for square brackets to skeleton file for UTF-8 characters])
# __REASON([skeleton file for UTF-8 characters])

1s/^/# vim:mps+=⟦\\:⟧\n\n/

# [	<--- because of M4
/___USAGE/s/\<rootb\>/rootu/
# ]	<--- because of M4

s/\[/⟦/g
s/]/⟧/g

