__HEADER([Josef Kubin], [2020/01/09], [plugins])
___DESCR([inserts source file content with a link and a description])
___POINT([use plugins; avoid repetitive, complicated code])

ifdef([SPELLCHECK], [

# A → β
define([LINK_FILE], defn([SPELLCHECK_FILE_TITLE]))

], [

#LINK_FILE([folder/file.m4])
#LINK_FILE([folder/file.m4], [description])
# A → β
define([LINK_FILE], [

	divert(CURRQU)dnl
<table class="table"><tbody><tr><th>AH(BRAC(patsubst([$1], [.*/])), defn([SRC_REPO_NAME]), defn([SRC_FILE_PATH])[$1])</th><th style="width:100%">$2</th></tr></tbody></table>
divert(-1)
])

])dnl !SPELLCHECK
