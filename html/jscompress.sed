# __HEADER([Josef Kubin], [2020/03/22], [m4root])
# ___DESCR([removes unnecessary data from a JavaScript code])
# ___POINT([embedded JavaScript as small as possible])

# convert multi-line source code to one long line; remove C++ comments; indentation
:a
$!{N
s://.*$::
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
