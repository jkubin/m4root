__HEADER([Josef Kubin], [2020/01/09], [html])
___DESCR([inserts source file content with a link and an optional description])
___POINT([source file, link and description])

#INSERT_FILE_AND_LINK([folder/file.m4])
#INSERT_FILE_AND_LINK([folder/file.m4], [description])
# A → β
define([INSERT_FILE_AND_LINK], [

	divert(CURRQU)dnl
<p><code>AH(BRAC(patsubst([$1], [.*/])), defn([SRC_REPO_NAME]), defn([SRC_FILE_PATH])[$1])</code>ifelse([$2], [], [], [ – $2])</p>
divert(-1)

	INSERT_FILE([$1])
])
