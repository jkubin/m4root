__HEADER(⟦Josef Kubin⟧, ⟦2020/05/24⟧)
___DESCR(⟦generates text link⟧)
__REASON(⟦copies captions to text⟧)

# prints a hyperlink or a linked text that dereferences
# A → β
define(⟦LINK⟧, ⟦pushdef(⟦CURRQU⟧, divnum)divert(-1)

	# the more arguments the more link capabilities
	ifelse(
		⟦$#⟧, ⟦2⟧, ⟦
			pushdef(⟦PREF⟧, defn(⟦FILE_PREFIX⟧))
		⟧,
		⟦$#⟧, ⟦3⟧, ⟦
			pushdef(⟦PREF⟧, ⟦$3⟧.LANG_CODE)
		⟧,
		⟦$#⟧, ⟦4⟧, ⟦
			pushdef(⟦PREF⟧, ⟦$3.$4⟧)
		⟧, ⟦

		ROOT_ERROR(⟦$0($@) is not defined⟧)
	⟧)

	# find link in refs (for test)
	pushdef(⟦ANCH⟧, ifdef(__file__.mono.⟦$2⟧, ⟦defn(__file__.mono.⟦$2⟧)⟧, ⟦defn(defn(⟦PREF⟧).anch.⟦$2⟧)⟧))

	ifelse(defn(⟦ANCH⟧), ⟦⟧, ⟦

		ROOT_WARNING(⟦$0(⟦$1⟧, ⟦‘$2’ not found⟧, ⟦$3⟧, ⟦$4⟧); run ‘make -B refs …’ to regenerate⟧)
	⟧)

	# find caption in the associative array
	pushdef(⟦CAPT⟧, defn(defn(⟦PREF⟧).capt.⟦$1⟧))

	ifelse(defn(⟦CAPT⟧), ⟦⟧, ⟦

			# CAPT in refs not found, use the first LINK argument
			define(⟦CAPT⟧, ⟦$1⟧)
		⟧,
		⟦$1⟧, ⟦$2⟧, ⟦⟧, ⟦

			# CAPT in refs was found, but the arg1 and arg2 are different, therefore use the arg1
			define(⟦CAPT⟧, ⟦$1⟧)
	⟧)

	divert(CURRQU)dnl
CAPT⟦⟧popdef(⟦CURRQU⟧, ⟦PREF⟧, ⟦ANCH⟧, ⟦CAPT⟧)dnl
⟧)
