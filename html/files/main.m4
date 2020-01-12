__HEADER([Josef Kubin], [2019/12/15], [root_cz])
___DESCR([source files contains M4 keywords and forbidden characters, therefore must be processed])
___POINT([any input files must be processed first])

# processes file content and puts result into <pre title="src.file">…</pre>
# INSERT_FILE([path/src.file])
# INSERT_FILE([path/src.file], [ additional comment in title])
# A → β
define([INSERT_FILE], [

	# ARG1 removes unwanted trailing newline character
	divert(CURRQU)dnl
<pre title="patsubst([$1], [.*/])[$2]">ARG1(esyscmd([sed -f html/process_src.sed $1]))</pre>
divert(-1)

	# test return value from sed
	ifelse(sysval, [0], [], [

		ROOT_ERROR([‘$0($@)’])
	])
])
