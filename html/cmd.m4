__HEADER([Josef Kubin], [2020/04/26], [html])
___DESCR([processes a command with a list of input files, the last file is the output file])
___POINT([HTML code from the command line])

# COMMAND_LINE([tool -o a,b,c -DMACRO], [input/file1.src], [input/file2.src], [input/file3.src], …, [output/file.dst])
# A → β
define([COMMAND_LINE], [

	ifelse(eval([$# > 1]), [1], [], [

		ROOT_ERROR([‘$0($@)’ requires at least 2 arguments])
	])

	divert(REFERENCES_TO_FILES)dnl
$1 dnl
divert(-1)

	define([COMMAND_LINE_CLASS], [usc])

	FILES_ON_THE_COMMAND_LINE(shift($@))
])

# COMMAND_LINE_ROOT([tool -o a,b,c -DMACRO], [input/file1.src], [input/file2.src], [input/file3.src], …, [output/file.dst])
# A → β
define([COMMAND_LINE_ROOT], [

	ifelse(eval([$# > 1]), [1], [], [

		ROOT_ERROR([‘$0($@)’ requires at least 2 arguments])
	])

	divert(REFERENCES_TO_FILES)dnl
$1 dnl
divert(-1)

	define([COMMAND_LINE_CLASS], [root])

	FILES_ON_THE_COMMAND_LINE(shift($@))
])

# A → β
define([FILES_ON_THE_COMMAND_LINE], [

	# finds a git record from a hash database
	define([GIT_CSV], defn([./$1]))

	ifelse(defn([GIT_CSV]), [], [

		ROOT_ERROR([git record for the key ‘./$1’ not found, regenerate git database])
	])

	ifelse([$#], [1], [

		# finds a file id record from a hash database
		define([#ID], defn(__file__.mono.[$1]))

		ifelse(defn([#ID]), [], [

			ROOT_ERROR([id record for the key ‘]__file__[.mono.$1’ not found, regenerate file references])
		])

		divert(CURRQU)dnl
<div id="ADD_ID_RULE(defn([#ID])-command)" title="defn([WORD_COMMAND])" class="ADD_CLASS(defn([COMMAND_LINE_CLASS]))"><div>dnl
undivert(REFERENCES_TO_FILES)dnl
GT() <a href="SRC_FILE_PATH[$1]" title="defn([SRC_REPO_NAME])[$1]">patsubst([$1], [.*/])</a></div><a href="[#]defn([#ID])-command" title="⚓"></a></div>
divert(-1)

	], [

		divert(REFERENCES_TO_FILES)dnl
<a href="SRC_FILE_PATH[$1]" title="defn([SRC_REPO_NAME])[$1]">patsubst([$1], [.*/])</a> dnl
divert(-1)

		# right recursive loop
		$0(shift($@))
	])
])
