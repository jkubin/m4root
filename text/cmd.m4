__HEADER([Josef Kubin], [2020/05/19], [text])
___DESCR([command line with a list of input files, the last file is an output file])
___POINT([generates plain text output])

# β
pushdef([TEST_NUMBER_OF_ARGS], [

	ifelse(eval([$# > 1]), [1], [], [

		ROOT_ERROR([‘$0($@)’ requires at least 2 arguments])
	])
])

# COMMAND_LINE([foo -o a,b,c -DMACRO], [input/file1.src], [input/file2.src], [input/file3.src], …, [output/file.dst])
# A → β
define([COMMAND_LINE], defn([TEST_NUMBER_OF_ARGS])[

	divert(COMMAND_LINE_ARGS)dnl
PROMPT() $1 dnl
divert(-1)

	FILES_ON_THE_COMMAND_LINE(shift($@))
])

# COMMAND_LINE_ROOT([foo -o a,b,c -DMACRO], [input/file1.src], [input/file2.src], [input/file3.src], …, [output/file.dst])
# A → β
define([COMMAND_LINE_ROOT], defn([TEST_NUMBER_OF_ARGS])[

	divert(COMMAND_LINE_ARGS)dnl
PROMPT_ROOT() $1 dnl
divert(-1)

	FILES_ON_THE_COMMAND_LINE(shift($@))
])

# A → β
define([FILES_ON_THE_COMMAND_LINE], [

	ifelse([$#], [1], [

		divert(CURRQU)dnl
undivert(COMMAND_LINE_ARGS)dnl
dnl > patsubst([$ 1], [.*/])
> $1

divert(-1)

	], [

		divert(COMMAND_LINE_ARGS)dnl
[$1] dnl
divert(-1)

		# right recursive loop
		$0(shift($@))
	])
])

# no need for further
popdef([TEST_NUMBER_OF_ARGS])
