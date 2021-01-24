__AUTHOR(⟦Josef Kubin⟧, ⟦2019,12,12⟧)
___DESCR(⟦creates the final file for Content Management System (copy and paste)⟧)
__REASON(⟦template for Content Management System⟧)

# A → β
define(⟦IMG_SRC⟧, ⟦$2⟧)

# relative path to other language during development
# A → β
define(⟦OTHER_LANGUAGE⟧, defn(⟦OTHER_LANG_PATH⟧))

# path for generated files
define(⟦SRC_FILE_PATH⟧, ⟦⟦https://raw.githubusercontent.com/jkubin/m4root/⟧define(⟦GIT_CSV⟧, defn(⟦./$1⟧))SARG1(GIT_CSV)⟦/$1⟧⟧)

# creates the resulting skeleton
# A → β
define(⟦PART⟧, defn(⟦PART⟧)⟦

	# displays an error if this macro occurs multiple times
	define(⟦$0⟧, ⟦

		ROOT_ERROR(⟦only one source file is allowed⟧)
	⟧)

	divert(0)dnl
⟦#⟧ DONTE()

PART_val

defn(defn(⟦FILE_PREFIX⟧).anch)

divert(BLOCK_FOR_PUBLISH)dnl

# shortcut for article: "+yG

<!-- "PART_val" __SOURCE(PAYR(__file__), SARG1(esyscmd(⟦date '+⟦⟦%Y%m%d-%R:%S⟧⟧,'⟧)), SARG1(esyscmd(⟦git log -1 --format='⟦⟦%h⟧⟧,' ⟧__file__)), SARG1(esyscmd(⟦git log -1 --format='⟦⟦%h⟧⟧,'⟧))) -->
divert(END_OF_DOCUMENT)dnl
<!-- end of html generated by M4 -->
divert(-1)
⟧)

# A → β
define(⟦PARTIMAGE⟧, ⟦

	divert(0)dnl
⟦$2⟧
divert(-1)
⟧)

# A → β
define(⟦PARTINTRO⟧, ⟦

	divert(BEGIN_OF_DOCUMENT)dnl

# shortcut for perex: "+yip

EXPAND_REQUIRED_ITEM(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)
divert(-1)
⟧)
