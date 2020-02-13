__HEADER([Josef Kubin], [2019/12/15], [root_cz])
___DESCR([processes one simple macro with files to complex block of html code])
___POINT([converts list of files from command line to html code])

# auxiliary macro to configure command line
# A → β
define([CONFIGURE_COMMAND_LINE], [

	# pushdef is used to overlay global macros
	# A → β
	pushdef([FOLDER],	[$1])
	pushdef([PROGRAM],	[$2])
	pushdef([ROOT_FILE],	[$3])
	pushdef([PREFIX_FILES], [$4])
	pushdef([SOURCES],	[$5])
])

# A → β
define([ADD_LINKS_TO_INSERTED_FILES], [ifelse([$1], [], [], [AH([$1], defn([SRC_REPO_NAME]), defn([SRC_FILE_PATH], [FOLDER])[$1]) $0(shift($@))])])

# processes variable number of files, the last file is _ALWAYS_ output.file
# INSERT_LIST_OF_FILES([input_file1.src], [input_file2.src], [input_file3.src], …, [output.file])
# A → β
define([INSERT_LIST_OF_FILES], [

	# end loop condition
	ifelse([$#], [1], [

		divert(CURRQU)dnl
<div title="defn([WORD_COMMAND])" class="ADD_CLASS([usc])">defn([PROGRAM]) dnl
ifelse(defn([ROOT_FILE]), [], [], [AH(defn([ROOT_FILE]), defn([SRC_REPO_NAME]), defn([SRC_FILE_PATH], [FOLDER_FOR_GENERATED_FILES], [ROOT_FILE])) ])[]dnl
ADD_LINKS_TO_INSERTED_FILES(PREFIX_FILES)dnl
undivert(REFERENCES_TO_FILES)dnl
ADD_LINKS_TO_INSERTED_FILES(SOURCES)dnl
GT() AH([$1], defn([SRC_REPO_NAME]), defn([SRC_FILE_PATH], [FOLDER])[$1])</div>
divert(-1)

		INSERT_FILE(defn([FOLDER])[$1])

		# forget local macros
		popdef(

			[FOLDER],
			[PREFIX_FILES],
			[PROGRAM],
			[ROOT_FILE],
			[SOURCES],

		)
	], [
		INSERT_FILE(defn([FOLDER])[$1])

divert(REFERENCES_TO_FILES)dnl
AH([$1], defn([SRC_REPO_NAME]), defn([SRC_FILE_PATH], [FOLDER])[$1]) dnl
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
