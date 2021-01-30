__AUTHOR(⟦Josef Kubin⟧, ⟦2020,03,29⟧)
___DESCR(⟦generates references from all monolingual macros⟧)
__REASON(⟦no duplicate monolingual references in language-specific files⟧)

# A → β
define(⟦COUNTER_FOR_DATASET⟧, defn(⟦COUNT_UP⟧))

# <html_tag … data-n₁="…" data-n₂="…">…</html_tag>
COUNTER_FOR_DATASET(0)

# A → β
define(⟦PRINT_REF⟧, ⟦

	divert(0)dnl
⟦define(⟦$1⟧, ⟧translit(⟦⟦⟦$2⟧⟧⟧, ⟦./A-Z,⟧, ⟦-_a-z-⟧)⟦)⟧
divert(-1)
⟧)

# A → β
define(⟦TEXTDATA⟧, ⟦

	PROCESS_LAST_ARG(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)

	ifelse(
		⟦$#⟧, ⟦1⟧, ⟦

			ifdef(__file__.defn(⟦PATH_TO_FILE⟧, ⟦#ID⟧), ⟦

				ROOT_ERROR(⟦$0(⟧LL()LL()defn(⟦PATH_TO_FILE⟧, ⟦#ID⟧)RR()⟦,⟧ …RR()⟦) duplicit file name or ID ‘⟧defn(⟦#ID⟧)⟦’ is not unique, see ⟧defn(__file__.defn(⟦PATH_TO_FILE⟧, ⟦#ID⟧)))
			⟧, ⟦

				# the reference to the first occurrence is for the duplicit error message
				define(__file__.defn(⟦PATH_TO_FILE⟧, ⟦#ID⟧), __file__:__line__)
			⟧)

			PRINT_REF(__file__.mono.defn(⟦PATH_TO_FILE⟧, ⟦#ID⟧), defn(⟦NSP⟧, ⟦PATH_TO_FILE⟧, ⟦#ID⟧))
			PRINT_REF(__file__.dset.defn(⟦PATH_TO_FILE⟧, ⟦#ID⟧), COUNTER_FOR_DATASET)
		⟧,
		⟦$1⟧, ⟦⟧, ⟦

			ifdef(__file__.defn(⟦PATH_TO_FILE⟧, ⟦#ID⟧), ⟦

				ROOT_ERROR(⟦$0(⟧LL()LL()defn(⟦PATH_TO_FILE⟧, ⟦#ID⟧)RR()⟦,⟧ …RR()⟦) duplicit file name or ID ‘⟧defn(⟦#ID⟧)⟦’ is not unique, see ⟧defn(__file__.defn(⟦PATH_TO_FILE⟧, ⟦#ID⟧)))
			⟧, ⟦

				# the reference to the first occurrence is for the duplicit error message
				define(__file__.defn(⟦PATH_TO_FILE⟧, ⟦#ID⟧), __file__:__line__)
			⟧)

			PRINT_REF(__file__.mono.defn(⟦PATH_TO_FILE⟧, ⟦#ID⟧), defn(⟦NSP⟧, ⟦PATH_TO_FILE⟧, ⟦#ID⟧))
			PRINT_REF(__file__.dset.defn(⟦PATH_TO_FILE⟧, ⟦#ID⟧), COUNTER_FOR_DATASET)
		⟧, ⟦
			ifdef(__file__.defn(⟦PATH_TO_FILE⟧, ⟦#ID⟧), ⟦

				ROOT_ERROR(⟦$0(⟦⟦$1⟧, …⟧) is duplicit⟧)
			⟧, ⟦

				# the reference to the first occurrence is for the duplicit error message
				define(__file__.defn(⟦PATH_TO_FILE⟧, ⟦#ID⟧), __file__:__line__)
			⟧)

			# tady testovat duplicitni revizi
			PRINT_REF(__file__.mono.⟦$1⟧, defn(⟦NSP⟧)SARG1($1)⟦⟧ifelse(SARG2($1), ⟦⟧, ⟦⟧, ⟦⟦,⟧SARG2($1)⟧))
			PRINT_REF(__file__.dset.⟦$1⟧, COUNTER_FOR_DATASET)
	⟧)
⟧)

# A → β
define(⟦PROCESS_LAST_ARG⟧, ⟦

	define(⟦PATH_TO_FILE⟧, SARG1($1))
	define(⟦#ID⟧, ifelse(SARG2($1), ⟦⟧, ⟦⟧, ⟦⟦,⟧SARG2($1)⟧))

	# tests if the file exists
	esyscmd(⟦test -f '⟧defn(⟦PATH_TO_FILE⟧)⟦'⟧)

	ifelse(sysval, ⟦0⟧, ⟦⟧, ⟦

		ROOT_ERROR(⟦the file ‘⟧defn(⟦PATH_TO_FILE⟧)⟦’ does not exist⟧)
	⟧)
⟧)

# A → β
define(⟦TEXTDATA_MLH⟧, defn(⟦TEXTDATA⟧))

# A → β
define(⟦CREATE_REFERENCE⟧, ⟦

	# test for name collision
	ifdef(⟦$1⟧, ⟦

		ROOT_ERROR(⟦$1 collides with a macro name; use different name⟧)
	⟧)

	# remove permitted characters, remains forbidden char(s)
	ifelse(patsubst(⟦⟦$1⟧⟧, ⟦[0-9A-Za-z_]⟧), ⟦⟧, ⟦⟧, ⟦

		ROOT_ERROR(⟦forbidden character(s) found in $2(⟦$1⟧, …)⟧)
	⟧)

	# translit upper case to lower case, change underscore to dash
	define(⟦STRING⟧, translit(⟦⟦$1⟧⟧, ⟦_A-Z⟧, ⟦-a-z⟧))

	# create an unique string
	# FIXME: tohle je nesmysl, protoze se jedna o monojazycne reference
	define(⟦UNIQ⟧, defn(⟦FILE_PREFIX⟧, ⟦STRING⟧))

	# already has a value?
	ifdef(defn(⟦UNIQ⟧), ⟦

		ROOT_ERROR(⟦html anchor ‘$2(⟧PAYR(defn(⟦STRING⟧))⟦, …)’ is not unique, first occurrence on:⟧defn(defn(⟦UNIQ⟧)))
	⟧)

	# assign value for later error message (file:line)
	define(defn(⟦UNIQ⟧), __file__:__line__)

	# print ordinary reference to an identifier
	PRINT_REF(__file__.mono.⟦$1⟧, defn(⟦NSP⟧)⟦$1⟧)
⟧)

# β
pushdef(⟦PROCESS_ID⟧, ⟦

	# if there is more than 1 parameter, then the 1st parameter is definitely the #ID
	ifelse(
		⟦$#⟧, ⟦1⟧, ⟦⟧,
		⟦$1⟧, ⟦⟧, ⟦⟧, ⟦

		CREATE_REFERENCE(⟦$1⟧, ⟦$0⟧)
	⟧)
⟧)

# A → β
define(⟦CMDSYNOPSIS_ROOT⟧,		defn(⟦PROCESS_ID⟧))
define(⟦CMDSYNOPSIS⟧,			defn(⟦PROCESS_ID⟧))
define(⟦IMAGEDATA⟧,			defn(⟦PROCESS_ID⟧))
define(⟦PROGRAMLISTING⟧,		defn(⟦PROCESS_ID⟧)⟦

	define(⟦SOURCE_FIELD_COUNTER⟧, COUNTER_FOR_DATASET)

	# if more than 1 param, then the $⟦1⟧ is surely #ID
	ifelse(
		⟦$#⟧, ⟦1⟧, ⟦⟧,
		⟦$1⟧, ⟦⟧, ⟦⟧, ⟦

		PRINT_REF(__file__.dset.⟦$1⟧, SOURCE_FIELD_COUNTER)
	⟧)
⟧)

divert(0)dnl
⟦#⟧ DONTE()
⟦
__AUTHOR(⟦Josef Kubin⟧, ⟦2020,04,01⟧)
___DESCR(⟦(generated) an associative memory for linking files⟧)
__REASON(⟦a simple hash database for used files⟧)
⟧
divert(-1)

# no need for further
popdef(⟦PROCESS_ID⟧)
