# __HEADER([Josef Kubin], [2020/03/22], [m4root])
# ___DESCR([removes unnecessary data from a JavaScript code])
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

# fix keywords stuck to adjacent word
s/\(\<const\|\<else\|\<let\|\<var\)\([[:lower:]]\)/\1 \2/g

# additional new line from sed removed by comma
s/^/[[/
s/$/]],/

# translate my long self_descriptive funny variable names to shorter names

# global variables are in the dedicated namespace: m4_*

s/\<m4_add_info\>/m4_i/g
s/\<m4_keywords\>/m4_k/g
s/\<m4_sources\>/m4_s/g

# local variables are converted to single letter names (in aphabetical order)

s/\<color_item\>/a/g
s/\<color_json\>/b/g
s/\<color_names\>/c/g
s/\<color_resulting\>/d/g
s/\<end_line\>/e/g
s/\<hgl_keyword\>/f/g
s/\<highlight_lines\>/g/g
s/\<highlighting_keywords\>/h/g
s/\<item\>/k/g
s/\<line\>/l/g
s/\<lines_of_code\>/m/g
s/\<lines_to_highlight\>/n/g
s/\<node\>/o/g
s/\<num_range\>/p/g
s/\<parent_node\>/q/g
s/\<pre_node\>/r/g
s/\<selected_range\>/s/g
s/\<selected_text\>/t/g
s/\<source_date\>/u/g
s/\<source_indexes\>/v/g
s/\<source_info\>/w/g
s/\<source_node\>/x/g
s/\<source_path\>/y/g
s/\<striped_background\>/z/g
s/\<value\>/_/g

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
