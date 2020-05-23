__HEADER([Josef Kubin], [2020/05/16], [text])
___DESCR([inserts (snippet of ) a source file])
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
SARG2(GIT_CSV) defn([#FILE])
INSERT_FILE_HIDE_SQUARE_BRACKETS(defn([#FILE]), [$3], $4)dnl	prepare command
esyscmd(defn([COMMAND_TO_INSERT_A_FILE]))
divert(-1)

	# test return value from sed; show the failed sed command
	ifelse(sysval, [0], [], [

		ROOT_ERROR([‘$0($@)’ → $ ]defn([COMMAND_TO_INSERT_A_FILE]))
	])

	ifdef([DEBUG], [errprint(__file__:__line__: defn([COMMAND_TO_INSERT_A_FILE])
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
	ifelse([$4], [], [0], [$4], [$], [0], [[$4]]),
	ifelse([$4], [], [], [$4], [$], [], [[    …\n]]))dnl
])

# A → β
define([INSERT_FILE_SNIPPET], [dnl
define([COMMAND_TO_INSERT_A_FILE], [awk -e 'NR==$3,NR==$4{' -f text/chr_to_esc.awk -e ']ifdef([LINE_NUMBERS], [[printf "%3d ", NR;]])[print}BEGIN{printf "["}END{printf "$5]"}' $1])dnl
])
