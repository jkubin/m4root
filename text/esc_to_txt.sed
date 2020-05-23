# __HEADER([Josef Kubin], [2020/05/19], [m4root])
# ___DESCR([transforms C esc sequences to ASCII])
# ___POINT([post processing after M4 scripts])

s/\\x5b;/[/g
s/\\x5d;/]/g
