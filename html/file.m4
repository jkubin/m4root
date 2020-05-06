__HEADER([Josef Kubin], [2019/12/15], [root_cz])
___DESCR([processes an inserted source file; converts forbidden characters; sets string highlighting])
___POINT([source file (possibly snippet) in format for HTML])

# insert whole file (with a possible ID separated by a comma)
# INSERT_FILE([path/file.src])
# INSERT_FILE([path/file.src,ID])
# INSERT_FILE([path/file.src,ID], [title])
#
# insert whole file; apply (several) RE to specific keywords to highlight them in certain color
# INSERT_FILE([path/file.src], [title], [s/\<foo\>/<span class=a>&<\x2fspan>/g;s/\<bar\>/<span class=b>&<\x2fspan>/g])
#
# sometimes it is needed Multi-Line Highlighting
# the whole file is inserted into the sed buffer as a one long string for multi-line regex processing
# INSERT_FILE_MLH([path/file.src], [title], [RE for Multi Line Highlighting])
#
# insert source code snippet from line 10 to the EOF
# INSERT_FILE([path/file.src], [title], [RE], [10])
#
# insert source code snippet from line 10 to 20
# INSERT_FILE([path/file.src], [title], [RE], [10, 20])
#
# insert source code snippet from line 10 to the line that meets END_RE
# INSERT_FILE([path/file.src], [title], [RE], [10, [/END_RE/]])
#
# insert source code snippet from line 1 to the line that meets END_RE
# INSERT_FILE([path/file.src], [title], [RE], [, [/END_RE/]])
#
# A → β
# β
define([INSERT_FILE], [

	ifelse(eval([$# > 0 && $# < 5]), [1], [], [

		ROOT_ERROR([‘$0($@)’ wrong number of arguments])
	])

	# first is file name, the second is ID (not used here)
	define([#FILE], ARG1($1))

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
<div id="ADD_ID_RULE(defn([#ID]))"ifelse([$2], [], [], [ title="[$2]"]) class="ADD_CLASS([src])"SET_CSS_LINE_COUNTER($4)><pre>$0_SET_PARAMETERS(defn([#FILE]),
[$3], $4)</pre><code><span title="ARG3(GIT_CSV)">ARG2(GIT_CSV)</span><a href="SRC_FILE_PATH[]defn([#FILE])" title="defn([SRC_REPO_NAME], [#FILE])">patsubst(defn([#FILE]),
[.*/])</a><a href="[#]defn([#ID])" title="⚓"></a></code></div>
divert(-1)

	# test return value from sed; show the sed command for analysis if something failed
	ifelse(sysval, [0], [], [

		ROOT_ERROR([‘$0($@)’ → $ ]defn([SED_COMMAND_TO_INSERT_A_FILE]))
	])

	# in case of problems with inserting and coloring desired file it prints the final command on stderr
	ifdef([DEBUG], [errprint(__file__:__line__: defn([SED_COMMAND_TO_INSERT_A_FILE])
)])
])

# the whole file is inserted into the sed buffer as a one long string for multi-line regex processing
# otherwise behaves like INSERT_FILE()
# A → β
define([INSERT_FILE_MLH], defn([INSERT_FILE]))

# ARG1 after the file processing removes unwanted trailing LF
# A → β
define([INSERT_FILE_SET_PARAMETERS_REGEX], [dnl
define([SED_COMMAND_TO_INSERT_A_FILE], [sed -ne '$3,$4{' -f html/chars_to_esc.sed -e '$2' -e '$3s/^/\x5b\x5b/;$4$5;p}' $1])dnl
ARG1(esyscmd(defn([SED_COMMAND_TO_INSERT_A_FILE])))dnl
])

# A → β
define([INSERT_FILE_MLH_SET_PARAMETERS_REGEX], [dnl
define([SED_COMMAND_TO_INSERT_A_FILE], [sed -ne '$3{:a;N;$4!ba' -f html/chars_to_esc.sed -e '$2' -e 's/^/\x5b\x5b/;$5;p}' $1])dnl
ARG1(esyscmd(defn([SED_COMMAND_TO_INSERT_A_FILE])))dnl
])

# A → β
# β
define([INSERT_FILE_SET_PARAMETERS], [$0_REGEX(
	[$1],
	[$2],
	ifelse([$3], [], [1], [[$3]]),
	ifelse([$4], [], [$], [[$4]]),
	ifelse([$4], [], [[s/$/\x5d\x5d,/]], [$4], [$], [[s/$/\x5d\x5d,/]], [[s/$/\n…\x5d\x5d,/]]))dnl
])

# A → β
define([INSERT_FILE_MLH_SET_PARAMETERS], defn([INSERT_FILE_SET_PARAMETERS]))

# A → β
define([SET_CSS_LINE_COUNTER], [divert(-1)

	# test input parameter for digits
	ifelse(patsubst([[$1]], [[0-9]]), [], [], [

		ROOT_ERROR([‘the parameter of $0(…, [$1])’ must be only a number or empty string])
	])

	ifelse(
		[$1], [], [],
		[$1], [1], [],
		[$1], [2], [],
		[

		divert(CURRQU)dnl
 style="counter-reset:defn([SRC_CNTR]) decr($1)"dnl
divert(-1)
	])

	divert(CURRQU)dnl
])
