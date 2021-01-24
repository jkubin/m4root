# __AUTHOR(⟦Josef Kubin⟧, ⟦2020,05,09⟧)
# ___DESCR(⟦replaces the local long_self_descriptive_funny_variables with single letters⟧)
# __REASON(⟦the script packs local method variables⟧)

# '<,'>s:./g$:/g:
# '<,'>s:^\(.\)\(.*\)/g:\2\1/g:

s/\<parent_node\>/a/g
s/\<source_info\>/b/g
s/\<source_item\>/c/g
s/\<text_item\>/d/g
s/\<title_data\>/e/g

# the letters below are for the regexes above (copy&paste), the letters {i, j} are reserved for loops

# for example: y30j

#a
#b
#c
#d
#e
#f
#g
#h
#k
#l
#m
#n
#o
#p
#q
#r
#s
#t
#u
#v
#w
#x
#y
#z
#_
#A
#B
#C
#D
#E
#F
#G
#H
#I
#J
#K
#L
#M
#N
#O
#P
#Q
#R
#S
#T
#U
#V
#W
#X
#Y
#Z
