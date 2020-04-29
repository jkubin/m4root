__HEADER([Josef Kubin], [2019/12/15], [root_cz])
___DESCR([processes input file; converts forbidden characters])
___POINT([inserts (snippet) the source file into HTML])

# insert whole file
# INSERT_FILE([path/file.src])
# INSERT_FILE([path/file.src], [title])
#
# insert whole file; apply (several) RE to specific keywords to color
# INSERT_FILE([path/file.src], [title], [s/\<foo\>/<span class=a>&<\x2fspan>/g;s/\<bar\>/<span class=b>&<\x2fspan>/g])
#
# insert source code snippet from 10 to the EOF
# INSERT_FILE([path/file.src], [title], [RE], [10])
#
# insert source code snippet from 10 to 20
# INSERT_FILE([path/file.src], [title], [RE], [10, 20])
#
# insert source code snippet from 10 to the line that meets END_RE
# INSERT_FILE([path/file.src], [title], [RE], [10, [/END_RE/]])
#
# insert source code snippet from 1 to the line that meets END_RE
# INSERT_FILE([path/file.src], [title], [RE], [, [/END_RE/]])
#
# A → β
define([INSERT_FILE], [

	ifelse(eval([$# > 0 && $# < 5]), [1], [], [

		ROOT_ERROR([‘$0($@)’ wrong number of arguments])
	])

	# finds a git record from a hash database
	define([GIT_CSV], defn([./$1]))

	ifelse(defn([GIT_CSV]), [], [

		ROOT_ERROR([git record for ‘$1’ not found, regenerate git database])
	])

	# finds a file id record from a hash database
	define([#ID], defn(__file__.mono.[$1]))

	ifelse(defn([#ID]), [], [

		# ROOT_WARNING([reference for ‘$1’ not found; run ‘make -B refs …’ to regenerate file references])
		ROOT_ERROR([id record for the key ‘]__file__[.mono.$1’ not found, regenerate file references])
	])

	ADD_JAVASCRIPT_FOR_SOURCE_CODE()

	divert(CURRQU)dnl
<div id="ADD_ID_RULE(defn([#ID]))"ifelse([$2], [], [], [ title="[$2]"]) class="ADD_CLASS([src])"SET_CSS_LINE_COUNTER($4)><pre>INSERT_A_CLIPPED_FILE([$1], [$3], $4)</pre><code><span title="ARG3(GIT_CSV)">ARG2(GIT_CSV)</span><a href="SRC_FILE_PATH[$1]" title="defn([SRC_REPO_NAME])[$1]">patsubst([$1], [.*/])</a><a href="[#]defn([#ID])" title="⚓"></a></code></div>
divert(-1)

	# test return value from sed; show sed command if something failed
	ifelse(sysval, [0], [], [

		ROOT_ERROR([‘$0($@)’ → $ ]defn([RESULTING_SED_COMMAND_FOR_CLIPPING]))
	])
])

# ARG1 after the file processing removes unwanted trailing newline character
# A → β
define([SET_CLIPPING_PARAMETERS], [dnl
define([RESULTING_SED_COMMAND_FOR_CLIPPING], [sed -ne '$3,$4{' -f html/process_src.sed -e '$2' -e '$3s/^/\x5b\x5b/;$4$5;p}' $1])dnl
ARG1(esyscmd(defn([RESULTING_SED_COMMAND_FOR_CLIPPING])))dnl
])

# A → β
define([INSERT_A_CLIPPED_FILE], [SET_CLIPPING_PARAMETERS(
	[$1],
	[$2],
	ifelse([$3], [], [1], [[$3]]),
	ifelse([$4], [], [$], [[$4]]),
	ifelse([$4], [], [[s/$/\x5d\x5d,/]], [$4], [$], [[s/$/\x5d\x5d,/]], [[s/$/\n…\x5d\x5d,/]]))dnl
])

# A → β
define([SET_CSS_LINE_COUNTER], [divert(-1)

	ifelse(patsubst([[$1]], [[0-9]]), [], [], [

		ROOT_ERROR([‘the parameter of $0(…, [$1])’ must be only a number or empty])
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
