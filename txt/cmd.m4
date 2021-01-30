__AUTHOR(⟦Josef Kubin⟧, ⟦2020,05,19⟧)
___DESCR(⟦processes the command with a possible list of files⟧)
__REASON(⟦converts the command line to plain text to estimate the total number of words and characters⟧)

# CMDFILES(⟦⟦cmd⟧⟧)
# CMDFILES(⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# CMDFILES(⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n,⟦GT()⟧⟧, ⟦file.dst,⟦2GT()AMP()1⟧⟧⟧)
#
# the following macros generate the same code (however they are not the same)
# CMDFILES(⟦⟦cmd -p a⟦,⟧b⟦,⟧c -DMACRO⟧, ⟦file.1,⟦-w x,y,z⟧⟧, ⟦file.2,⟦-DFOO=bar⟧⟧, …, ⟦file.n,⟦2GT()AMP()1⟧⟧⟧)
# CMDFILES(⟦⟦cmd ⟦-p a,b,c -DMACRO⟧⟧, ⟦file.1,⟦-w x,y,z⟧⟧, ⟦file.2,⟦-DFOO=bar⟧⟧, …, ⟦file.n,⟦2GT()AMP()1⟧⟧⟧)
# CMDFILES(⟦⟦⟦cmd -p a,b,c -DMACRO⟧⟧, ⟦file.1,⟦-w x,y,z⟧⟧, ⟦file.2,⟦-DFOO=bar⟧⟧, …, ⟦file.n,⟦2GT()AMP()1⟧⟧⟧)
# CMDFILES(⟦⟦cmd,⟦-p a,b,c -DMACRO⟧⟧, ⟦file.1,⟦-w x,y,z⟧⟧, ⟦file.2,⟦-DFOO=bar⟧⟧, …, ⟦file.n,⟦2GT()AMP()1⟧⟧⟧)
# …
# the root command line:
# CMDFILES_ROOT(⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# …

# A → β
define(⟦CMDFILES⟧, ⟦

	# prints the user prompt
	divert(CURRQU)dnl
PRMT() dnl
divert(-1)

	COMMAND_WITH_LIST_OF_FILES(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)
⟧)

# A → β
define(⟦CMDFILES_ROOT⟧, ⟦

	# prints the root prompt
	divert(CURRQU)dnl
PRMT_ROOT() dnl
divert(-1)

	COMMAND_WITH_LIST_OF_FILES(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)
⟧)

# A → β
define(⟦COMMAND_WITH_LIST_OF_FILES⟧, ⟦

	# prints the command with possible attribute
	divert(CURRQU)dnl
ARG1($1)⟦⟧ifelse(SARG2($1), ⟦⟧, ⟦⟧, ⟦ ARG2($1)⟧)⟦⟧dnl print the first item (a command)
divert(-1)

	ifelse(⟦$#⟧, ⟦1⟧, ⟦

		# if only the command is specified, appends two blank lines
		divert(CURRQU)

divert(-1)
	⟧, ⟦

		LIST_OF_FILES_AFTER_COMMAND(shift($@))
	⟧)
⟧)

# A → β
define(⟦LIST_OF_FILES_AFTER_COMMAND⟧, ⟦

	# lists files with possible attributes, after the last file appends two blank lines
	divert(CURRQU)dnl
 patsubst(SARG1($1), ⟦.*/⟧)⟦⟧ifelse(SARG2($1), ⟦⟧, ⟦⟧, ⟦ ARG2($1)⟧)⟦⟧ifelse(⟦$#⟧, ⟦1⟧, ⟦

⟧)dnl
divert(-1)

	ifelse(⟦$#⟧, ⟦1⟧, ⟦⟧, ⟦

		# right recursive loop
		$0(shift($@))
	⟧)
⟧)
