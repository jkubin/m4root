__AUTHOR(⟦Josef Kubin⟧, ⟦2020,05,19⟧)
___DESCR(⟦processes the command line with a list of files⟧)
__REASON(⟦to estimate the total number of words and characters⟧)

# CMDBARE(⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# CMDBARE(⟦⟦cmd -o a,b,c -DMACRO⟧, ⟦file.1,⟦-o x,y,z⟧⟧, ⟦file.2,⟦-DFOO=bar⟧⟧, …, ⟦file.n,⟦2>&1⟧⟧⟧)
# …
# CMDFILE(⟦⟦cmd⟧, ⟦file1.src⟧, ⟦file2.src⟧, …, ⟦file.dst⟧⟧)
# CMDFILE(⟦⟦cmd -o a,b,c -DMACRO⟧, ⟦file1.src,⟦-o x,y,z⟧⟧, ⟦file2.src,⟦-DFOO=bar⟧⟧, …, ⟦file.dst,⟦2>&1⟧⟧⟧)
# …
# Or the root command line:
# CMDBARE_ROOT(⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# CMDFILE_ROOT(⟦⟦cmd⟧, ⟦file1.src⟧, ⟦file2.src⟧, …, ⟦file.dst⟧⟧)

# A → β
define(⟦CMDFILE⟧, ⟦

	divert(CURRQU)dnl
PRMT() dnl
divert(-1)

	COMMAND_WITH_INPUT_FILES_AND_OUTPUT_FILE(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)
⟧)

# A → β
define(⟦CMDFILE_ROOT⟧, ⟦

	divert(CURRQU)dnl
PRMT_ROOT() dnl
divert(-1)

	COMMAND_WITH_INPUT_FILES_AND_OUTPUT_FILE(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)
⟧)

# A → β
define(⟦COMMAND_WITH_INPUT_FILES_AND_OUTPUT_FILE⟧, ⟦

	ifelse(eval(⟦$# > 2⟧), ⟦1⟧, ⟦⟧, ⟦

		ROOT_ERROR(⟦the command ‘$1’ requires at least 2 files (input and output): ‘$@’⟧)
	⟧)

	divert(CURRQU)dnl
$1 dnl print the first item (a command)
divert(-1)

	INPUT_FILES_AND_OUTPUT_FILE(shift($@))
⟧)

# A → β
define(⟦INPUT_FILES_AND_OUTPUT_FILE⟧, ⟦

	divert(CURRQU)dnl
ifelse(⟦$#⟧, ⟦1⟧, ⟦> ⟧)patsubst(SARG1($1), ⟦.*/⟧)⟦⟧ifelse(SARG2($1), ⟦⟧, ⟦⟧, ⟦ ARG2($1)⟧)⟦⟧ifelse(⟦$#⟧, ⟦1⟧, ⟦

⟧, ⟦ ⟧)⟦⟧dnl
divert(-1)

	ifelse(⟦$#⟧, ⟦1⟧, ⟦⟧, ⟦

		# right recursive loop
		$0(shift($@))
	⟧)
⟧)

# A → β
define(⟦CMDBARE⟧, ⟦

	divert(CURRQU)dnl
PRMT() dnl
divert(-1)

	COMMAND_AND_VARIOUS_FILES(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)
⟧)

# A → β
define(⟦CMDBARE_ROOT⟧, ⟦

	divert(CURRQU)dnl
PRMT_ROOT() dnl
divert(-1)

	COMMAND_AND_VARIOUS_FILES(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)
⟧)

# A → β
define(⟦COMMAND_AND_VARIOUS_FILES⟧, ⟦

	ifelse(eval(⟦$# > 1⟧), ⟦1⟧, ⟦⟧, ⟦

		ROOT_ERROR(⟦the command ‘$1’ requires at least 1 file⟧)
	⟧)

	divert(CURRQU)dnl
$1 dnl print the first item (a command)
divert(-1)

	VARIOUS_FILES_AFTER_COMMAND(shift($@))
⟧)

# A → β
define(⟦VARIOUS_FILES_AFTER_COMMAND⟧, ⟦

	divert(CURRQU)dnl
patsubst(SARG1($1), ⟦.*/⟧)⟦⟧ifelse(SARG2($1), ⟦⟧, ⟦⟧, ⟦ ARG2($1)⟧)⟦⟧ifelse(⟦$#⟧, ⟦1⟧, ⟦

⟧, ⟦ ⟧)⟦⟧dnl
divert(-1)

	ifelse(⟦$#⟧, ⟦1⟧, ⟦⟧, ⟦

		# right recursive loop
		$0(shift($@))
	⟧)
⟧)
