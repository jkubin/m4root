# __AUTHOR(⟦Josef Kubin⟧, ⟦2020,03,22⟧)
# ___DESCR(⟦removes unnecessary data from a JavaScript code; replaces long_self_descriptive_funny_variables with single letters⟧)
# __REASON(⟦common code to pack all JavaScript-s⟧)

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
# variable names with the same prefix are prohibited
s/\(\<const\|\<else\|\<let\|\<var\)\([[:lower:]]\)/\1 \2/g

# name of attributes and methods

s/\<method_add_info\>/a/g
s/\<method_select\>/b/g
