# __HEADER([Josef Kubin], [2020/05/09], [m4root])
# ___DESCR([replaces the local long_self_descriptive_funny_variables with single letters])
# ___POINT([packs local method variables])

# '<,'>s:./g$:/g:
# '<,'>s:^\(.\)\(.*\)/g:\2\1/g:

s/\<parent_node\>/a/g
s/\<source_date\>/b/g
s/\<source_info\>/c/g
s/\<source_path\>/d/g

# the letters below are for regexes above, letters {i, j} are reserved for loops

# y30j

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
