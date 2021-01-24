__AUTHOR(⟦Josef Kubin⟧, ⟦2020,05,19⟧)
___DESCR(⟦command line with a list of input files, the last file is an output file⟧)
__REASON(⟦estimate the total number of words and characters⟧)

# β
pushdef(⟦TEST_NUMBER_OF_ARGS⟧, ⟦

	ifelse(eval(⟦$# > 1⟧), ⟦1⟧, ⟦⟧, ⟦

		ROOT_ERROR(⟦‘$0($@)’ requires at least 2 arguments⟧)
	⟧)
⟧)

# CMDFILE(⟦⟦foo -o a,b,c -DMACRO⟧, ⟦input/file1.src⟧, ⟦input/file2.src⟧, ⟦input/file3.src⟧, …, ⟦output/file.dst⟧⟧)
# CMDFILE(⟦⟦foo -o a,b,c -DMACRO⟧, ⟦input/file1.src,⟦-o x,y,z⟧⟧, ⟦input/file2.src⟧, …, ⟦output/file.dst⟧⟧)
# A → β
define(⟦CMDFILE⟧, defn(⟦TEST_NUMBER_OF_ARGS⟧)⟦

	divert(COMMAND_ARGS_QUEUE)dnl
PRMT() $1 dnl
divert(-1)

	FILES_ON_THE_COMMAND_LINE(shift($@))
⟧)

# CMDFILE_ROOT(…)
# A → β
define(⟦CMDFILE_ROOT⟧, defn(⟦TEST_NUMBER_OF_ARGS⟧)⟦

	divert(COMMAND_ARGS_QUEUE)dnl
PRMT_ROOT() $1 dnl
divert(-1)

	FILES_ON_THE_COMMAND_LINE(shift($@))
⟧)

# A → β
define(⟦FILES_ON_THE_COMMAND_LINE⟧, ⟦

	ifelse(⟦$#⟧, ⟦1⟧, ⟦

		divert(CURRQU)dnl
undivert(COMMAND_ARGS_QUEUE)dnl
> patsubst(⟦$1⟧, ⟦.*/⟧)

divert(-1)

	⟧, ⟦

		divert(COMMAND_ARGS_QUEUE)dnl
patsubst(SARG1($1), ⟦.*/⟧) ifelse(SARG2($1), ⟦⟧, ⟦⟧, ⟦ARG2($1) ⟧)dnl
divert(-1)

		# right recursive loop
		$0(shift($@))
	⟧)
⟧)

# no need for further
popdef(⟦TEST_NUMBER_OF_ARGS⟧)
