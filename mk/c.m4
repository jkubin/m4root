__AUTHOR(⟦Josef Kubin⟧, ⟦2020,12,29⟧)
___DESCR(⟦generates additional rules extending the handwritten Makefile to generate c files⟧)
__REASON(⟦a simple script to generate Makefile to generate c files⟧)

# A → β
define(⟦MAKE_RULE⟧, ⟦

	ifelse(⟦$1⟧, ⟦⟧, ⟦⟧, ⟦

		# file stem is from an associative array
		define(⟦FILE_STEM⟧, defn(⟦$1⟧.LANG_CODE.anch))

		ifelse(defn(⟦FILE_STEM⟧), ⟦⟧, ⟦

			ROOT_ERROR(⟦‘$1.⟧LANG_CODE⟦.anch’ is not defined⟧)
		⟧)

		divert(1)dnl
defn(⟦FILE_STEM⟧) \
divert(3)dnl
FILE_STEM.c: rootu.m4 config.m4 lang.m4 ver.m4 lang_⟦⟧LANG_CODE.m4 git.m4 REFS_FILES incl.m4 init.m4 c/queues.m4 c/ref.m4 c/link.m4 c/c.m4 $1
	m4 -DLANG_CODE='LANG_CODE' $(FLAGS) $^ > $⟦@⟧

divert(-1)

		# right recursive loop
		$0(shift($@))
	⟧)
⟧)

MAKE_RULE(FILE_LIST)

# define Makefile names
# A → β
define(⟦CLEAN_SUBTARGETS⟧,	⟦clean-c-⟧LANG_CODE)
define(⟦TEXT_STEM⟧,		⟦TEXT_STEM_⟧LANG_CODE)
define(⟦C_FILES⟧,		⟦C_SRC_⟧LANG_CODE)
define(⟦O_FILES⟧,		⟦OBJ_⟧LANG_CODE)
define(⟦SUBTARGETS⟧,		$(C_FILES) $(O_FILES))

# generate the final output
divert(0)dnl
⟦#⟧ DONTE()

TEXT_STEM = \
divert(2)
C_FILES  = $(TEXT_STEM:=.c)
C_SOURCE += $(C_FILES)
TARGETS  += $(C_FILES)

#:sub-targets/sub/su	generates all files from generated rules (default target)
.PHONY: sub-targets sub su
sub-targets sub su: $(TARGETS)

#:c	generates C files
.PHONY: c
c: $(C_FILES)

git_⟦⟧LANG_CODE.m4: $(C_FILES)

⟦#⟧:patsubst(defn(⟦CLEAN_SUBTARGETS⟧), ⟦ ⟧, ⟦/⟧)	deletes all ‘LANG_CODE’ C files
.PHONY: CLEAN_SUBTARGETS
CLEAN_SUBTARGETS:
	$(RM) SUBTARGETS

