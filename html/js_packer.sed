# __HEADER([Josef Kubin], [2020/03/22], [m4root])
# ___DESCR([removes unnecessary data from a JavaScript code; translates my long self_descriptive funny variable names to single letter names])
# ___POINT([JavaScript as small as possible])

# uncomment the following commands to skip compression (for JavaScript debugging)
#1s/^/[[/
#$s/$/]],/
#b

# convert multi-line source code to one long line;
# remove // C++ comments and white chars used for indentation
:a
$!{N
s:\s*//.*$::
s:\n\s*::
ba}

# remove multi-line C comments /* … */
s:/\*[^*]*\*\+\([^/*][^*]*\*\+\)*/::g

# remove white characters surrounding punctuations
s/\s*\([[:punct:]]\)\s*/\1/g

# remove unnecessary semicolons
s/;}/}/g

# fix JavaScript keywords stuck to an adjacent word
s/\(\<const\|\<else\|\<let\|\<var\)\([[:lower:]]\)/\1 \2/g

# additional new line from sed is removed by comma:
s/^/[[/
s/$/]],/

# local variables are translated to single letter names (in aphabetical order)

s/\<add_info\>/a/g
s/\<all_keywords\>/b/g
s/\<all_sources\>/c/g
s/\<classname_for_striped_bckg\>/d/g
s/\<default_color\>/e/g
s/\<different_color\>/f/g
s/\<hgl_item\>/g/g
s/\<hgl_keyword\>/h/g
s/\<highlighting_classes\>/k/g
s/\<highlighting_keywords\>/l/g
s/\<highlighting_lines\>/m/g
s/\<highlighting_sequence\>/n/g
s/\<key\>/o/g
s/\<last_line\>/p/g
s/\<line_range\>/q/g
s/\<lines_of_code\>/r/g
s/\<lines_to_highlight\>/s/g
s/\<node\>/t/g
s/\<parent_node\>/u/g
s/\<parsed_json\>/v/g
s/\<pre_node\>/w/g
s/\<resulting_color\>/x/g
s/\<selected_range\>/y/g
s/\<selected_text\>/z/g
s/\<source_date\>/_/g
s/\<source_indexes\>/A/g
s/\<source_info\>/B/g
s/\<source_node\>/C/g
s/\<source_path\>/D/g
s/\<striped_background\>/E/g
s/\<value\>/F/g

# the letters below are for regexes above, letters {i, j} are reserved for loops
# use Vim to copy regex below: y$
# '<,'>s:./g$:/g:
# '<,'>s:^\(.\)\(.*\)/g:\2\1/g:

# y^V31j	<--- copy column of 31 letters to the Vim register "

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
