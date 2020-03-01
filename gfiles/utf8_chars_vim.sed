# __HEADER([Josef Kubin], [2019/10/27], [m4root])
# ___DESCR([converts vim iabbrev file for square brackets to iabbrev file for UTF-8 characters])
# ___POINT([keeps consistent 1:1 iabbrev vim file for square brackets with UTF-8 characters])

1{z;s/^/" vim:mps+=⟦\\:⟧\n"\n" DO NOT EDIT! This file is generated automatically!/}

s/\[/⟦/g
s/]/⟧/g
