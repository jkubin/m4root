__AUTHOR(⟦Josef Kubin⟧, ⟦2020,05,16⟧)
___DESCR(⟦inserts (snippet of) a source file⟧)
__REASON(⟦estimate the total number of words and characters⟧)

# A → β
# β
define(⟦TEXTDATA⟧, ⟦

	ifelse(eval(⟦$# > 0 && $# < 5⟧), ⟦1⟧, ⟦⟧, ⟦

		ROOT_ERROR(⟦‘$0($@)’ wrong number of arguments⟧)
	⟧)

	# the first is file name, the second is ID (not used here)
	define(⟦#FILE⟧, SARG1($1))

	# finds a git record from a hash database
	define(⟦GIT_CSV⟧, defn(⟦./⟧defn(⟦#FILE⟧)))

	ifelse(defn(⟦GIT_CSV⟧), ⟦⟧, ⟦

		ROOT_ERROR(⟦git record for ‘⟧defn(⟦#FILE⟧)⟦’ not found, regenerate git database⟧)
	⟧)

	divert(CURRQU)dnl
SARG3(GIT_CSV) defn(⟦#FILE⟧)
TEXTDATA_PROCESS_RAW_DATA(defn(⟦#FILE⟧), ⟦$3⟧, $4)dnl	prepare command
esyscmd(defn(⟦COMMAND_FOR_TEXTDATA⟧))
divert(-1)

	# test return value from sed; show the failed sed command
	ifelse(sysval, ⟦0⟧, ⟦⟧, ⟦

		ROOT_ERROR(⟦‘$0($@)’ → $ ⟧defn(⟦COMMAND_FOR_TEXTDATA⟧))
	⟧)

	ifdef(⟦DEBUG⟧, ⟦errprint(__file__:__line__: defn(⟦COMMAND_FOR_TEXTDATA⟧)
)⟧)
⟧)

# A → β
define(⟦TEXTDATA_MLH⟧, defn(⟦TEXTDATA⟧))

# A → β
# β
define(⟦TEXTDATA_PROCESS_RAW_DATA⟧, ⟦dnl
TEXTDATA_SET_PARAMETERS(
	⟦$1⟧,
	⟦$2⟧,
	ifelse(⟦$3⟧, ⟦⟧, ⟦1⟧, ⟦⟦$3⟧⟧),
	ifelse(⟦$4⟧, ⟦⟧, ⟦0⟧, ⟦$4⟧, ⟦$⟧, ⟦0⟧, ⟦⟦$4⟧⟧),
	ifelse(⟦$4⟧, ⟦⟧, ⟦⟧, ⟦$4⟧, ⟦$⟧, ⟦⟧, ⟦⟦    …\n⟧⟧))dnl
⟧)

# A → β
define(⟦TEXTDATA_SET_PARAMETERS⟧, ⟦dnl
define(⟦COMMAND_FOR_TEXTDATA⟧, ⟦awk -e 'NR==$3,NR==$4{' -f txt/chr_to_esc.awk -e '⟧ifdef(⟦LINE_NUMBERS⟧, ⟦⟦printf "%3d ", NR;⟧⟧)⟦print}BEGIN{printf "⟦"}END{printf "$5⟧"}' $1⟧)dnl
⟧)
