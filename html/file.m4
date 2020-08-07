__HEADER([Josef Kubin], [2019/12/15], [root_cz])
___DESCR([processes a source file inserted to HTML; converts forbidden characters; sets string highlighting])
___POINT([source file (possibly snippet) suitable for HTML])

# insert the entire file with a possible comma-separated ID to distinguish the same file
# TEXTDATA([path/file.src])
# TEXTDATA([path/file.src,ID])
# TEXTDATA([path/file.src,ID], [title])
#
# insert the entire file, apply (maybe several) RE to specific keywords, and highlight them in a specific color
# TEXTDATA([path/file.src], [title], [s/\<foo\>/MM(a)/g;s/\<bar\>/MM(b)/g])
#
# sometimes it is needed to highlight something over a few lines (as Multi-Line Highlighting)
# the whole file is inserted into the sed buffer as a one long string for multi-line regex processing
# TEXTDATA_MLH([path/file.src], [title], [RE for Multi Line Highlighting])
#
# insert source code snippet from line 10 to the EOF
# TEXTDATA([path/file.src], [title], [RE], [10])
#
# insert source code snippet from line 10 to 20
# TEXTDATA([path/file.src], [title], [RE], [10, 20])
#
# Note:
# MM(b) is a Marking Macro for coloring RE with an argument for class "b"
# MM(b) → <span class=NSP()b>&<\x2fspan> → <span class=m4-b>&<\x2fspan>
# NSP() expands to an user defined Name SPace prefix, for example m4-
# quotation marks in class are intentionally omitted
#
# A → β
# β
define([TEXTDATA], [

	ifelse(eval([$# > 0 && $# < 5]), [1], [], [

		ROOT_ERROR([‘$0($@)’ wrong number of arguments])
	])

	# the first is file name, the second is ID (not used here)
	define([#FILE], SARG1($1))

	# finds a git record from a hash database
	define([GIT_CSV], defn([./]defn([#FILE])))

	ifelse(defn([GIT_CSV]), [], [

		ROOT_ERROR([git record for ‘]defn([#FILE])[’ not found, regenerate git database])
	])

	# finds a file id record from a hash database
	define([#ID], defn(__file__.mono.defn([#FILE])))

	ifelse(defn([#ID]), [], [

		# ROOT_WARNING([reference for ‘$1’ not found; run ‘make -B refs …’ to regenerate file references])
		ROOT_ERROR([id record for the key ‘]__file__.mono.defn([#FILE])[’ not found, regenerate file references])
	])

	ADD_JAVASCRIPT_FOR_SOURCE_CODE()

	divert(CURRQU)dnl
<div id="ADD_ID_RULE(defn([#ID]))" class="ADD_CLASS([src])"SET_CSS_LINE_COUNTER($4)><pre[]ifelse([$2], [], [], [ title="[$2]"])>$0_SET_PARAMETERS(defn([#FILE]), [$3], $4)dnl
SARG1(esyscmd(defn([COMMAND_FOR_TEXTDATA])))dnl
</pre><code><span>SARG2(GIT_CSV)</span><a href="SRC_FILE_PATH(defn([#FILE]))" title="defn([#FILE])
date: SARG3(GIT_CSV)
sha1sum: SARG4(GIT_CSV)
size: SARG5(GIT_CSV) B">patsubst(defn([#FILE]),
[.*/])</a><a href="[#]defn([#ID])" title="⚓"></a></code></div>
divert(-1)

	# test return value from sed; show the failed sed command
	ifelse(sysval, [0], [], [

		ROOT_ERROR([‘$0($@)’ → $ ]defn([COMMAND_FOR_TEXTDATA]))
	])

	# in case of problems with inserting and coloring desired file it prints the final command on stderr
	ifdef([DEBUG], [errprint(__file__:__line__: defn([COMMAND_FOR_TEXTDATA])
)])
])

# the whole file is inserted into the sed buffer as one long string for multi-line regex processing
# otherwise behaves like TEXTDATA()
# A → β
define([TEXTDATA_MLH], defn([TEXTDATA]))

# Marking Macro MM(my_class_name) saves a lot of typing (<span class="m4-my_class_name">&<\x2fspan>), concatenates user defined prefix to my_class_name
#
# SARG1 after the file processing removes unwanted trailing LF
# A → β
define([TEXTDATA_SET_PARAMETERS_REGEX], [dnl
define([COMMAND_FOR_TEXTDATA], [sed -ne '$3,$4{' -f html/chr_to_esc.sed -e ']patsubst(patsubst([[[$2]]], [\<MM(\([^)]+\))], [<span class="NSP()\1">&<\\x2fspan>]), [NSP()], defn([NSP]))[' -e '$3s/^/\x5b/;$4$5;p}' $1])dnl
])

# loads the file into the sed buffer
# A → β
define([TEXTDATA_MLH_SET_PARAMETERS_REGEX], [dnl
define([COMMAND_FOR_TEXTDATA], [sed -ne '$3{:a;N;$4!ba' -f html/chr_to_esc.sed -e ']patsubst(patsubst([[[$2]]], [\<MM(\([^)]+\))], [<span class="NSP()\1">&<\\x2fspan>]), [NSP()], defn([NSP]))[' -e 's/^/\x5b/;$5;p}' $1])dnl
])

# A → β
# β
define([TEXTDATA_SET_PARAMETERS], [dnl
$0_REGEX(
	[$1],
	[$2],
	ifelse([$3], [], [1], [[$3]]),
	ifelse([$4], [], [$], [[$4]]),
	ifelse([$4], [], [[s/$/\x5d,/]], [$4], [$], [[s/$/\x5d,/]], [[s/$/\n…\x5d,/]]))dnl
])

# A → β
define([TEXTDATA_MLH_SET_PARAMETERS], defn([TEXTDATA_SET_PARAMETERS]))

# A → β
define([SET_CSS_LINE_COUNTER], [divert(-1)

	# test input parameter for digits
	ifelse(patsubst([[$1]], [[0-9]]), [], [], [

		ROOT_ERROR([‘the parameter of $0(…, [$1])’ must be only a number or empty string])
	])

	ifelse(
		[$1], [], [],
		[$1], [1], [],
		[

		divert(CURRQU)dnl
 style="counter-reset:defn([SOURCE_COUNTER]) decr($1)"dnl
divert(-1)
	])

	divert(CURRQU)dnl
])
