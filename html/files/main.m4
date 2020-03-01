__HEADER([Josef Kubin], [2019/12/15], [root_cz])
___DESCR([source files contains M4 keywords and forbidden characters, therefore must be processed])
___POINT([any input files must be processed first])

# <pre title="patsubst([$1], [.*/])[$2]">ARG1(esyscmd([sed -f html/process_src.sed $1]))</pre>
# ARG1(esyscmd([git log -1 --format='[%h],' $1])) 
# processes file content and puts result into <pre title="src.file">…</pre>
# INSERT_FILE([path/src.file])
# INSERT_FILE([path/src.file], [ additional comment in title])
# A → β
define([INSERT_FILE], [

debugfile([debug.m4])debugmode([taeq])
	# ARG1 removes unwanted trailing newline character
	divert(CURRQU)dnl
<div class="ADD_CLASS([src])">AH(patsubst([$1], [.*/]), defn([SRC_REPO_NAME]), defn([SRC_FILE_PATH])[$1])<pre[]ifelse([$2], [], [], [ title="[$2]"])>ARG1(esyscmd([sed -f html/process_src.sed $1]))</pre></div>
divert(-1)
debugmode

	# test return value from sed
	ifelse(sysval, [0], [], [

		ROOT_ERROR([‘$0($@)’])
	])
])
