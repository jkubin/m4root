# __HEADER([Josef Kubin], [2020/05/09], [m4root])
# ___DESCR([replaces the local long_self_descriptive_funny_variables with single letters])
# ___POINT([packs local method variables])

# '<,'>s:./g$:/g:
# '<,'>s:^\(.\)\(.*\)/g:\2\1/g:

# fixes removed space
s/\<counterReset.split('/& /

s/\<all_keywords\>/a/g
s/\<all_sources\>/b/g
s/\<another_class\>/c/g
s/\<colored_stripe\>/d/g
s/\<colored_stripe_classname\>/e/g
s/\<default_class\>/f/g
s/\<hgl_item\>/g/g
s/\<hgl_keyword\>/h/g
s/\<hgl_range\>/k/g
s/\<highlighting_keywords\>/l/g
s/\<highlighting_lines\>/m/g
s/\<highlighting_sequence\>/n/g
s/\<highlighting_words\>/o/g
s/\<key\>/p/g
s/\<last_line\>/q/g
s/\<lines_of_code\>/r/g
s/\<lines_to_highlight\>/s/g
s/\<namespace_prefix\>/t/g
s/\<node\>/u/g
s/\<parsed_json\>/v/g
s/\<pre_node\>/w/g
s/\<resulting_class\>/x/g
s/\<selected_range\>/y/g
s/\<selected_text\>/z/g
s/\<source_indexes\>/_/g
s/\<source_info\>/A/g
s/\<source_node\>/B/g
s/\<striped_background\>/C/g
s/\<striped_background\>/D/g
s/\<striped_background_classname\>/E/g
s/\<value\>/F/g
s/\<counter_reset\>/G/g

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
