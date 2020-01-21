# __HEADER([Josef Kubin], [2020/01/09], [m4root])
# ___DESCR([transforms brackets as HTML entities back to ASCII])
# ___POINT([post processing after M4 scripts; simple square brackets allow better reading of the resulting file])

s/&#x5b;/[/g
s/&#x5d;/]/g
