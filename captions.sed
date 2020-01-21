# __HEADER([Josef Kubin], [2019/08/25], [m4root])
# ___DESCR([the script converts the caption string to the string used for filenames; resulting string is not truncated])
# ___POINT([full-length lower case ASCII strings for file names])

# multiline items
:a
$!{N;ba}

# convert uppercase letters to lovercase
s/[[:upper:]]/\l&/g

# transliterate lovercase UTF-8 to ASCII
y/áčďéěíňóřšťúůýž/acdeeinorstuuyz/

# change problematic characters to -
s/[–[:space:][:punct:]]/-/g

# shrink duplicit -
s/--\+/-/g

# remove prefix -
s/^-//g

# remove trailing -
s/-$//g

# additional new line from sed removed by comma
s/^/[[/
s/$/]],/
