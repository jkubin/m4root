# __HEADER([Josef Kubin], [2020/01/09], [m4root])
# ___DESCR([transforms esc sequences to HTML entities or to ASCII])
# ___POINT([post processing after M4 scripts])

s/\\x26;/\&amp;/g
s/\\x3c;/\&lt;/g
s/\\x3e;/\&gt;/g
s/\\x5b;/[/g
s/\\x5d;/]/g
