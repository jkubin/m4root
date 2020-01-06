__HEADER([Josef Kubin], [2019/12/15], [root_cz])
___DESCR([source files contains M4 keywords and forbidden characters, therefore must be processed])
___POINT([any input files must be processed first])

# processes file and puts result to html
# A → β
define([INSERT_FILE], [

	# ARG1 removes unwanted trailing newline character
	divert(CURRQU)dnl
<pre title="patsubst([$1], [.*/])[$2]">ARG1(esyscmd([sed -f process_src_for_html.sed $1]))</pre>
divert(-1)

	# test return value from sed
	ifelse(sysval, [0], [], [

		ROOT_ERROR([‘$1’])
	])
])

# A → β
define([CONFIGURE_COMMAND_LINE], [

	# pushdef is used to overlay global macros
	# A → β
	pushdef([FOLDER],	[$1])
	pushdef([COMMAND],	[$2])
	pushdef([ROOT_FILE],	[$3])
	pushdef([PREFIX_FILES], [$4])
	pushdef([SOURCES],	[$5])
	pushdef([NB],		[&nbsp;&nbsp;&nbsp;])
])

# A → β
define([ADD_LINKS_TO_INSERTED_FILES], [ifelse([$1], [], [], [NB()AD([$1], defn([SRC_REPO_NAME]), defn([SRC_FILE_PATH], [FOLDER])[$1])$0(shift($@))])])
define([ADD_FILES_TO_COMMAND_LINE], [ifelse([$1], [], [], [ $1[]$0(shift($@))])])

# processes variable number of files, the last file is _ALWAYS_ output.file
# INSERT_LIST_OF_FILES([file1.src], [file2.src], [file3.src], …, [output.file])
# A → β
define([INSERT_LIST_OF_FILES], [

	# end loop condition
	ifelse([$#], [1], [

		divert(CURRQU)dnl
<table class="table"><tbody><tr><th style="width:100%" title="defn([TITLE_INPUT_FILES])">dnl
ifelse(defn([ROOT_FILE]), [], [], [AD(defn([ROOT_FILE]), defn([SRC_REPO_NAME]), defn([SRC_FILE_PATH], [FOLDER_FOR_GENERATED_FILES], [ROOT_FILE]))])[]dnl
ADD_LINKS_TO_INSERTED_FILES(PREFIX_FILES)dnl
undivert(REFERENCES_TO_FILES)dnl
ADD_LINKS_TO_INSERTED_FILES(SOURCES)dnl
</th><th title="defn([TITLE_OUTPUT_FILE])">AD([$1], defn([SRC_REPO_NAME]), defn([SRC_FILE_PATH], [FOLDER])[$1])</th></tr></tbody></table>
divert(-1)

PRE(, defn([WORD_COMMAND]), [
CMD() BO([defn([COMMAND], [ROOT_FILE])ADD_FILES_TO_COMMAND_LINE(PREFIX_FILES)undivert(PROCESSED_FILES)ADD_FILES_TO_COMMAND_LINE(SOURCES) > [$1]])
])

		INSERT_FILE(defn([FOLDER])[$1])

		# forget local macros
		popdef(

			[COMMAND],
			[FOLDER],
			[NB],
			[PREFIX_FILES],
			[ROOT_FILE],
			[SOURCES],

		)
	], [
		INSERT_FILE(defn([FOLDER])[$1])

divert(REFERENCES_TO_FILES)dnl
NB()AD([$1], defn([SRC_REPO_NAME]), defn([SRC_FILE_PATH], [FOLDER])[$1])dnl
divert(PROCESSED_FILES)dnl
 [$1]dnl
divert(-1)

		# recursive loop
		$0(shift($@))
	])
])

# INSERT_FILES_EXAMPLE([folder], [name_without_suffix])
# A → β
define([INSERT_FILES_EXAMPLE], [
	CONFIGURE_COMMAND_LINE(
[$1/],dnl				common sub-folder name (or use absolute paths)
[m4],dnl				command and its options
)
	INSERT_LIST_OF_FILES([$2.m4], [$1.$2])
])

# INSERT_FILES_MACRO([folder], [-DBRANCH=$[$RANDOM % 10]], [b], [branch])
# A → β
define([INSERT_FILES_MACRO], [
	CONFIGURE_COMMAND_LINE(
[$1/],dnl				common sub-folder name (or use absolute paths)
[m4 $2 ],dnl				command and its options
[root$3.m4],dnl				root file
)
	INSERT_LIST_OF_FILES([$4.m4], [$1.$4])
])

# INSERT_FILES_HELLO_WORLD([q], [qnames])
# A → β
define([INSERT_FILES_HELLO_WORLD], [
	CONFIGURE_COMMAND_LINE(
[hello_world/],dnl			common sub-folder name (or use absolute paths)
[m4 -DSYMBOL='Hello, world!' ],dnl	command and its options
[root$1.m4],dnl				root file
)
	INSERT_LIST_OF_FILES([$2.m4], [hello_world.$2])
])

# INSERT_FILES_PREPROC([b], [file.c])
# A → β
define([INSERT_FILES_PREPROC], [
	CONFIGURE_COMMAND_LINE(
[preproc/],dnl				common sub-folder name (or use absolute paths)
[m4 -DSYMBOL='Hello, world!' ],dnl	command and its options
[root$1.m4],dnl				root file
)
	INSERT_LIST_OF_FILES([$2.m4], [$2], [preproc.$2])
])

# INSERT_FILES_MESSAGES([one.m4], [two.m4], [three.m4], …, [output.file])
# A → β
define([INSERT_FILES_MESSAGES], [
	CONFIGURE_COMMAND_LINE(
[messages/],dnl				common sub-folder name (or use absolute paths)
[m4 ],dnl				command and its options
[rootb.m4],dnl				root file
[],dnl					prefix files
[messages.mc],dnl			source file or comma separated source files
)
	INSERT_LIST_OF_FILES($@)
])
