__AUTHOR(⟦Josef Kubin⟧, ⟦2020,05,16⟧)
___DESCR(⟦inserts a source file or just a snippet⟧)
__REASON(⟦inserts a file as a plain text to estimate the total number of words and characters⟧)

# Usage:
# inserts the file as is
# TEXTDATA(⟦⟦path/file.src⟧⟧)
#
# inserts the file as is with a possible ID if inserted multiple times
# TEXTDATA(⟦⟦path/file.src,ID⟧⟧)
# TEXTDATA(⟦⟦path/file.src,1⟧⟧)
# TEXTDATA(⟦⟦path/file.src,2⟧⟧)
# TEXTDATA(⟦⟦path/file.src,foo⟧⟧)
# …
#
# A → β
# β
define(⟦TEXTDATA⟧, ⟦

	TEXTDATA_LAST_ARG(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)

	# prints git hash and the file name
	divert(CURRQU)dnl
SARG3(GIT_CSV) defn(⟦#FILE⟧)
esyscmd(defn(⟦COMMAND_FOR_TEXTDATA⟧))
divert(-1)

	# tests the return value of the command
	ifelse(sysval, ⟦0⟧, ⟦⟧, ⟦

		# displays a complete failed command
		ROOT_ERROR(⟦‘$0($@)’ → $ ⟧defn(⟦COMMAND_FOR_TEXTDATA⟧))
	⟧)

	# prints the resulting command used
	ifdef(⟦DEBUG⟧, ⟦errprint(__file__:__line__: defn(⟦COMMAND_FOR_TEXTDATA⟧)
)⟧)
⟧)

# A → β
define(⟦TEXTDATA_MLH⟧, defn(⟦TEXTDATA⟧))

# A → β
define(⟦TEXTDATA_LAST_ARG⟧, ⟦

	# 1st file name
	# 2nd ID (not used here)
	define(⟦#FILE⟧, SARG1($1))

	# finds a git record from a hash database
	define(⟦GIT_CSV⟧, defn(⟦./⟧defn(⟦#FILE⟧)))

	ifelse(defn(⟦GIT_CSV⟧), ⟦⟧, ⟦

		ROOT_ERROR(⟦git record for ‘⟧defn(⟦#FILE⟧)⟦’ not found, regenerate git database⟧)
	⟧)

	# 1st file name
	# 2nd start line
	# 3rd end line
	TEXTDATA_SET_PARAMS(defn(⟦#FILE⟧), ⟦$3⟧, ⟦$4⟧)
⟧)

# A → β
# β
define(⟦TEXTDATA_SET_PARAMS⟧, ⟦

	TEXTDATA_CREATE_COMMAND(
⟦$1⟧,dnl file name
ifelse(⟦$2⟧, ⟦⟧, ⟦1⟧, ⟦⟦$2⟧⟧),dnl starting file line: ⟦⟧ or ⟦NUM⟧
ifelse(⟦$3⟧, ⟦⟧, ⟦0⟧, ⟦$3⟧, ⟦$⟧, ⟦0⟧, ⟦⟦$3⟧⟧),dnl ending file line: ⟦⟧ or ⟦NUM⟧
ifelse(⟦$2⟧, ⟦⟧, ⟦⟧, ⟦$2⟧, ⟦1⟧, ⟦⟧, ⟦ifdef(⟦LINE_NUMBERS⟧, ⟦    ⟧)⟦…\n⟧⟧),dnl prints starting three dots if the file is not from the beginning
ifelse(⟦$3⟧, ⟦⟧, ⟦⟧, ⟦$3⟧, ⟦$⟧, ⟦⟧, ⟦ifdef(⟦LINE_NUMBERS⟧, ⟦    ⟧)⟦…\n⟧⟧)dnl prints ending three dots if the file is not to the EOF
)

⟧)

# A → β
define(⟦TEXTDATA_CREATE_COMMAND⟧, ⟦

	define(⟦COMMAND_FOR_TEXTDATA⟧,
	⟦awk -e 'NR==$2,NR==$3{' -f txt/chr_to_esc.awk -e '⟧ifdef(⟦LINE_NUMBERS⟧, ⟦⟦printf "%3d ", NR;⟧⟧)⟦print}BEGIN{printf "⟦$4"}END{printf "$5⟧"}' $1⟧)
⟧)
