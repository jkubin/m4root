__HEADER([Josef Kubin], [2019/12/15], [root_cz])
___DESCR([source files contains M4 keywords and forbidden characters, therefore must be processed])
___POINT([any input files must be processed first])

# processes file content and puts result into <pre title="src.file">…</pre>
# INSERT_FILE([path/src.file])
# INSERT_FILE([path/src.file], [ additional comment in title])
# A → β
define([INSERT_FILE], [

	define([GIT_CSV], defn([./$1]))

	ifelse(defn([GIT_CSV]), [], [

		ROOT_ERROR([git record for ‘$1’ not found, regenerate git database])
	])

	ifdef(__file__.mono.[$1], [], [

		ROOT_WARNING([reference for ‘$1’ not found; run ‘make -B refs …’ to regenerate file references])
	])

	ADD_JAVASCRIPT_FOR_SOURCE_CODE()

	# ARG1 after the file processing removes unwanted trailing newline character
	divert(CURRQU)dnl
<div id="ADD_ID_RULE(defn(__file__.mono.[$1]))"ifelse([$2], [], [], [ title="[$2]"]) class="ADD_CLASS([src])"><pre>ARG1(esyscmd([sed -f html/process_src.sed $1]))</pre><code><span title="ARG3(GIT_CSV)">ARG2(GIT_CSV)</span>AH(patsubst([$1], [.*/]), defn([SRC_REPO_NAME])[$1], SRC_FILE_PATH[$1])<a href="[#]defn(__file__.mono.[$1])" title="⚓"></a></code></div>
divert(-1)

	# test return value from sed
	ifelse(sysval, [0], [], [

		ROOT_ERROR([‘$0($@)’])
	])
])
