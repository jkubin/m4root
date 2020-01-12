__HEADER([Josef Kubin], [2020/01/09], [plugins])
___DESCR([inserts source file content with a link and a description])
___POINT([use plugins; avoid repetitive, complicated code])

# <table class="table"><tbody><tr><th>AH(BRAC(patsubst([$1], [.*/])), defn([SRC_REPO_NAME]), defn([SRC_FILE_PATH])[$1])</th><th style="width:100%">$2</th></tr></tbody></table>

#LINK_FILE([folder/file.m4])
#LINK_FILE([folder/file.m4], [description])
# A → β
define([LINK_FILE], [

	divert(CURRQU)dnl
<p><code>AH(BRAC(patsubst([$1], [.*/])), defn([SRC_REPO_NAME]), defn([SRC_FILE_PATH])[$1])</code>ifelse([$2], [], [], [ – $2])</p>
divert(-1)

	INSERT_FILE([$1])
])
