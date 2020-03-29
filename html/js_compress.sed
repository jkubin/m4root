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

# additional new line from sed removed by comma
s/^/[[/
s/$/]],/

# translate my long self_descriptive funny variable names to shorter names

# global variables are in the dedicated namespace: m4_*

s/\<m4_all_pre_tags\>/m4_p/g
s/\<m4_associative_array_of_keywords\>/m4_a/g
s/\<m4_keywords\>/m4_w/g

# local variables are converted to single letter names (in aphabetical order)

s/\<all_highlighting_keywords\>/a/g
s/\<container_element\>/b/g
s/\<highlight_source_code_id\>/c/g
s/\<highlighted_source_code\>/d/g
s/\<keyword\>/e/g
s/\<line\>/f/g
s/\<lines\>/g/g
s/\<lines_of_code_to_highlight\>/h/g
s/\<lines_to_highlight\>/k/g
s/\<list_item\>/l/g
s/\<number_of_lines_of_code\>/m/g
s/\<ordered_list\>/n/g

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
