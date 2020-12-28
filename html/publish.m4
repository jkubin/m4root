__HEADER(⟦Josef Kubin⟧, ⟦2019/12/12⟧, ⟦root_cz⟧)
___DESCR(⟦creates the final file for Content Management System (copy and paste)⟧)
__REASON(⟦template for Content Management System⟧)

# A → β
define(⟦IMG_SRC⟧, ⟦$2⟧)

# relative path to other language during development
# A → β
define(⟦OTHER_LANGUAGE⟧, defn(⟦OTHER_LANG_PATH⟧))

# path for generated files
define(⟦SRC_FILE_PATH⟧, ⟦⟦https://raw.githubusercontent.com/jkubin/m4root/⟧define(⟦GIT_CSV⟧, defn(⟦./$1⟧))SARG1(GIT_CSV)⟦/$1⟧⟧)

# name for repository
#define(⟦SRC_REPO_NAME⟧, defn(⟦WORD_SRC⟧)⟦GitHub
#⟧)

#      ___________      __________
# --->/ PARTIMAGE \--->/ img path \
#     \___________/    \__________/
#
# A → β
define(⟦PARTIMAGE⟧, defn(⟦TEST_ATM⟧)⟦

	# transition to the next node (redefine itself to path)
	define(⟦$0⟧, ⟦$2⟧)
⟧)

# all parts of the data are available, so the resulting skeleton is created
# A → β
define(⟦PARTINTRO⟧, ⟦

	divert(0)dnl
⟦#⟧ DONTE()

PART_val

defn(defn(⟦FILE_PREFIX⟧).anch)

PARTIMAGE

# shortcut for perex: "+yip

EXPAND_LANG_WITHOUT_TRAILING_LF(⟧defn(⟦EXPAND_LAST⟧)⟦)

# shortcut for article: "+yG

divert(BEGIN_OF_ARTICLE)dnl
<!-- "PART_val" __SOURCE(PAYR(__file__), SARG1(esyscmd(⟦date '+⟦⟦%Y%m%d-%R:%S⟧⟧,'⟧)), SARG1(esyscmd(⟦git log -1 --format='⟦⟦%h⟧⟧,' ⟧__file__)), SARG1(esyscmd(⟦git log -1 --format='⟦⟦%h⟧⟧,'⟧))) -->
divert(END_OF_ARTICLE)dnl
<!-- end of html generated by M4 -->
divert(-1)
⟧)
