__HEADER([Josef Kubin], [2020/05/16], [text])
___DESCR([inserts (snippet of ) a file with escaped brackets])
___POINT([text file for total number of words and characters])

# A → β
# β
define([INSERT_FILE], [

	ifelse(eval([$# > 0 && $# < 5]), [1], [], [

		ROOT_ERROR([‘$0($@)’ wrong number of arguments])
	])

	# the first is file name, the second is ID (not used here)
	define([#FILE], ARG1($1))

	# finds a git record from a hash database
	define([GIT_CSV], defn([./]defn([#FILE])))

	ifelse(defn([GIT_CSV]), [], [

		ROOT_ERROR([git record for ‘]defn([#FILE])[’ not found, regenerate git database])
	])

	divert(CURRQU)dnl
ARG2(GIT_CSV) defn([#FILE])
INSERT_FILE_HIDE_SQUARE_BRACKETS(defn([#FILE]), [$3], $4)dnl	prepare command
esyscmd(defn([SED_COMMAND_TO_INSERT_A_FILE])[ | cat -n -])
divert(-1)

	# test return value from sed; show the failed sed command
	ifelse(sysval, [0], [], [

		ROOT_ERROR([‘$0($@)’ → $ ]defn([SED_COMMAND_TO_INSERT_A_FILE]))
	])

	ifdef([DEBUG], [errprint(__file__:__line__: defn([SED_COMMAND_TO_INSERT_A_FILE])
)])
])

# A → β
define([INSERT_FILE_MLH], defn([INSERT_FILE]))

# A → β
# β
define([INSERT_FILE_HIDE_SQUARE_BRACKETS], [dnl
INSERT_FILE_SNIPPET(
	[$1],
	[$2],
	ifelse([$3], [], [1], [[$3]]),
	ifelse([$4], [], [$], [[$4]]),
	ifelse([$4], [], [[s/$/\x5d/]], [$4], [$], [[s/$/\x5d/]], [[s/$/\n…\x5d/]]))dnl
])

# A → β
define([INSERT_FILE_SNIPPET], [dnl
define([SED_COMMAND_TO_INSERT_A_FILE], [sed -ne '$3,$4{' -f text/chr_to_esc.sed -e '$3s/^/\x5b/;$4$5;p}' $1])dnl
])
