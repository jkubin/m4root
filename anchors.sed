# __HEADER([Josef Kubin], [2019/08/25], [m4root])
# ___DESCR([the script converts a caption string in UTF-8 to HTML anchors; the resulting string is truncated to 32 characters])
# ___POINT([truncated lower case ASCII strings for anchors])

# multiline items
:a
$!{N;ba}

# convert uppercase letters to lovercase
s/[[:upper:]]/\l&/g

# transliterate lowercase UTF-8 to ASCII
y/áčďéěíňóřšťúůýž/acdeeinorstuuyz/

# change problematic characters to -
s/[–[:space:][:punct:]]/-/g

# shrink duplicit -
s/--\+/-/g

# remove prefix -
s/^-//

# truncate too long strings
s/^\(.\{,32\}\).*$/\1/

# remove trailing -
s/-$//g

# additional new line from sed removed by comma
s/^/[[/
s/$/]],/
