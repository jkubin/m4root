# __HEADER(⟦Josef Kubin⟧, ⟦2020/03/30⟧, ⟦m4root⟧)
# ___DESCR(⟦converts strings for anchors/files to a plain-text-string format⟧)
# __REASON(⟦generate references at the lightning speed⟧)

# process strings for file names
/^file/{
s///
x
N

# convert uppercase letters to lovercase
s/.*/\L&/

# transliterate lovercase UTF-8 to ASCII
y/áčďéěíňóřšťúůýž/acdeeinorstuuyz/

# change problematic characters to -
s/[–[:space:][:punct:]]/-/g

# shrink duplicit -
s/--\+/-/g

# remove prefix -
s/^-//

bfinish
}

# process strings for anchor names
/^anch/{
s///
x
N

# convert uppercase letters to lovercase
s/.*/\L&/

# transliterate lowercase UTF-8 to ASCII
y/áčďéěíňóřšťúůýž/acdeeinorstuuyz/

# change problematic characters to -
s/[–[:space:][:punct:]]/-/g

# shrink duplicit -
s/--\+/-/g

# remove prefix -
s/^-//

# truncate too long string
s/^\(.\{,32\}\).*$/\1/

:finish

# remove (possible) trailing -
s/-$//

N
H
z
x
s/\n//g
}
