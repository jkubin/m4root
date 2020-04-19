# __HEADER([Josef Kubin], [2020/03/22], [m4root])
# ___DESCR([removes unnecessary data from a JavaScript code; translates my long self_descriptive funny variable names to single letter names])
# ___POINT([embedded JavaScript as small as possible])

# uncomment the following commands to skip compression (for JavaScript debugging)
#1s/^/[[/
#$s/$/]],/
#b

# convert multi-line source code to one long line;
# removes C++ comments, white chars for indentation
:a
$!{N
s:\s*//.*$::
s:\n\s*::
ba}

# remove multi-line JavaScript code in C comments /* … */
s:/\*[^*]*\*\+\([^/*][^*]*\*\+\)*/::g

# remove white characters surrounding punctuations
s/\s*\([[:punct:]]\)\s*/\1/g

# remove unnecessary semicolons
s/;}/}/g

# fix JavaScript keywords stuck to an adjacent word
s/\(\<const\|\<else\|\<let\|\<var\)\([[:lower:]]\)/\1 \2/g

# additional new line from sed removed by comma
s/^/[[/
s/$/]],/

# local variables are translated to single letter names (in aphabetical order)

s/\<add_info\>/a/g
s/\<all_keywords\>/b/g
s/\<all_sources\>/c/g
s/\<color_name\>/d/g
s/\<hgl_item\>/e/g
s/\<hgl_keyword\>/f/g
s/\<highlighting_classes\>/g/g
s/\<highlighting_lines\>/h/g
s/\<highlighting_sequence\>/k/g
s/\<highlighting_keywords\>/m/g
s/\<key\>/n/g
s/\<last_line\>/o/g
s/\<line_range\>/p/g
s/\<lines_of_code\>/q/g
s/\<lines_to_highlight\>/r/g
s/\<node\>/s/g
s/\<parent_node\>/t/g
s/\<parsed_json\>/u/g
s/\<pre_node\>/v/g
s/\<resulting_color\>/w/g
s/\<selected_range\>/x/g
s/\<selected_text\>/y/g
s/\<source_date\>/z/g
s/\<source_indexes\>/_/g
s/\<source_info\>/A/g
s/\<source_node\>/B/g
s/\<source_path\>/C/g
s/\<striped_background\>/D/g
s/\<value\>/E/g

# the letters below are for regexes above, letters {i, j} are reserved for loops
# use Vim:
# '<,'>s:./g$:/g:
# '<,'>s:^\(.\)\(.*\)/g:\2\1/g:

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
