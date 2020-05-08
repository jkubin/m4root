# __HEADER([Josef Kubin], [2020/03/22], [m4root])
# ___DESCR([removes unnecessary data from a JavaScript code; translates long_self_descriptive_funny_variables to single letters])
# ___POINT([one-line JavaScript as small as possible])

# uncomment the following "b" command to disable packer if something behaves strangely
#b

# convert multi-line source code to a long line
# remove // C++ comments and white chars used for indentation
:a
$!{N
s:\s*//.*$::
s:\n\s*::
ba}

# remove /* multi-line C comments */
s:/\*[^*]*\*\+\([^/*][^*]*\*\+\)*/::g

# remove white characters surrounding punctuations
s/\s*\([[:punct:]]\)\s*/\1/g

# remove unnecessary semicolons
s/;}/}/g

# fix JavaScript keywords stuck to an adjacent word
s/\(\<const\|\<else\|\<let\|\<var\)\([[:lower:]]\)/\1 \2/g

# local variables are translated to single letter names (in aphabetical order)

s/\<add_info\>/a/g
s/\<all_keywords\>/b/g
s/\<all_sources\>/c/g
s/\<another_class\>/d/g
s/\<classname_for_striped_bckg\>/e/g
s/\<default_class\>/f/g
s/\<hgl_item\>/g/g
s/\<hgl_keyword\>/h/g
s/\<hgl_range\>/k/g
s/\<highlighting_classes\>/l/g
s/\<highlighting_keywords\>/m/g
s/\<highlighting_lines\>/n/g
s/\<highlighting_sequence\>/o/g
s/\<key\>/p/g
s/\<last_line\>/q/g
s/\<lines_of_code\>/r/g
s/\<lines_to_highlight\>/s/g
s/\<namespace_prefix\>/t/g
s/\<node\>/u/g
s/\<parent_node\>/v/g
s/\<parsed_json\>/w/g
s/\<pre_node\>/x/g
s/\<resulting_class\>/y/g
s/\<selected_range\>/z/g
s/\<selected_text\>/_/g
s/\<source_date\>/A/g
s/\<source_indexes\>/B/g
s/\<source_info\>/C/g
s/\<source_node\>/D/g
s/\<source_path\>/E/g
s/\<striped_background\>/F/g
s/\<value\>/G/g

# the letters below are for regexes above, letters {i, j} are reserved for loops
# use Vim to copy regex below: y$
# '<,'>s:./g$:/g:
# '<,'>s:^\(.\)\(.*\)/g:\2\1/g:

# y^V30j	<--- an example, how to select and copy column of 31 letters to the Vim register " (and paste them to the above regexes)

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
