# __HEADER(⟦Josef Kubin⟧, ⟦2020/05/09⟧)
# ___DESCR(⟦replaces the local long_self_descriptive_funny_variables with single letters⟧)
# __REASON(⟦packs local method variables⟧)

# '<,'>s:./g$:/g:
# '<,'>s:^\(.\)\(.*\)/g:\2\1/g:

# fixes removed space
s/\<counterReset.split('/& /

s/\<all_commands\>/a/g
s/\<all_keywords\>/b/g
s/\<all_sources\>/c/g
s/\<another_class\>/d/g
s/\<colored_stripe\>/e/g
s/\<colored_stripe_classname\>/f/g
s/\<counter_reset\>/g/g
s/\<default_class\>/h/g
s/\<hgl_item\>/k/g
s/\<hgl_keyword\>/l/g
s/\<hgl_range\>/m/g
s/\<highlighting_keywords\>/n/g
s/\<highlighting_lines\>/o/g
s/\<highlighting_sequence\>/p/g
s/\<highlighting_words\>/q/g
s/\<key\>/r/g
s/\<last_line\>/s/g
s/\<lines_of_code\>/t/g
s/\<lines_to_highlight\>/u/g
s/\<namespace_prefix\>/v/g
s/\<node\>/w/g
s/\<parsed_json\>/x/g
s/\<pre_node\>/y/g
s/\<resulting_class\>/z/g
s/\<selected_range\>/_/g
s/\<selected_text\>/A/g
s/\<source_indexes\>/B/g
s/\<source_info\>/C/g
s/\<source_node\>/D/g
s/\<striped_background\>/E/g
s/\<striped_background\>/F/g
s/\<striped_background_classname\>/G/g
s/\<value\>/H/g

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
