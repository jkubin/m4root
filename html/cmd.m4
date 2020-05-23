__HEADER([Josef Kubin], [2020/04/26], [html])
___DESCR([command line with a list of input files, the last file is an output file])
___POINT([generates HTML code from the command line])

# β
pushdef([#$XCOMMAND], [

	ifelse(eval([$# > 1]), [1], [], [

		ROOT_ERROR([‘$0($@)’ requires at least 2 arguments])
	])

	divert(COMMAND_ARGS_QUEUE)dnl
$1 dnl
divert(-1)

	FILES_ON_THE_COMMAND_LINE(shift($@))
])

# XCOMMAND([foo -o a,b,c -DMACRO], [input/file1.src], [input/file2.src], [input/file3.src], …, [output/file.dst])
# A → β
define([XCOMMAND], [

	define([COMMAND_LINE_CLASS], [usc])

]defn([#$XCOMMAND]))

# XCOMMAND_ROOT([foo -o a,b,c -DMACRO], [input/file1.src], [input/file2.src], [input/file3.src], …, [output/file.dst])
# A → β
define([XCOMMAND_ROOT], [

	define([COMMAND_LINE_CLASS], [root])

]defn([#$XCOMMAND]))

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
<div id="ADD_ID_RULE(defn([#ID])-command)" title="defn([WORD_COMMAND])" class="ADD_CLASS(defn([COMMAND_LINE_CLASS]))"><pre>dnl
undivert(COMMAND_ARGS_QUEUE)dnl
GT() <a href="SRC_FILE_PATH/[$1]" title="defn([SRC_REPO_NAME])[$1]">patsubst([$1], [.*/])</a></pre><a href="[#]defn([#ID])-command" title="⚓"></a></div>
divert(-1)

	], [

		divert(COMMAND_ARGS_QUEUE)dnl
<a href="SRC_FILE_PATH/[$1]" title="defn([SRC_REPO_NAME])[$1]">patsubst([$1], [.*/])</a> dnl
divert(-1)

		# right recursive loop
		$0(shift($@))
	])
])

# no need for further
popdef([#$XCOMMAND])
