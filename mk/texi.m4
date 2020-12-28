__HEADER(⟦Josef Kubin⟧, ⟦2020/05/19⟧, ⟦mk⟧)
___DESCR(⟦the script generates additional rules extending the handwritten Makefile to generate texi files⟧)
__REASON(⟦additional rules by configuration from command line to generate texi files⟧)

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
FILE_STEM.texi: rootu.m4 aux.m4 lang.m4 headings.m4 ver.m4 lang_⟦⟧LANG_CODE.m4 git.m4 REFS_FILES incl.m4 init.m4 text/file.m4 text/cmd.m4 text/queues.m4 text/inline.m4 text/text.m4 $1
	m4 -DLANG_CODE='LANG_CODE' $(FLAGS) $^ | sed -f text/esc_to_txt.sed > $⟦@⟧

divert(-1)

		# right recursive loop
		$0(shift($@))
	⟧)
⟧)

MAKE_RULE(FILE_LIST)

# define Makefile names
# A → β
define(⟦ALL_SUBTARGETS⟧,	⟦all-text-⟧LANG_CODE ⟦at⟧LANG_CODE)
define(⟦CLEAN_SUBTARGETS⟧,	⟦clean-text-⟧LANG_CODE ⟦clt⟧LANG_CODE ⟦ct⟧LANG_CODE)
define(⟦NAME_STEMS⟧,		⟦TEXI_NAME_STEM_⟧LANG_CODE)
define(⟦SRC_FILES⟧,		⟦TEXI_⟧LANG_CODE)
define(⟦GZIP_FILES⟧,		⟦GZIPPED_TEXI_⟧LANG_CODE)
define(⟦XZ_FILES⟧,		⟦XZIPPED_TEXI_⟧LANG_CODE)
define(⟦SUBTARGETS⟧,		$(SRC_FILES) $(GZIP_FILES) $(XZ_FILES))

# create the final output
divert(0)dnl
⟦#⟧ DONTE()

NAME_STEMS = \
divert(2)
SRC_FILES = $(NAME_STEMS:=.texi)
GZIP_FILES = $(NAME_STEMS:=.texi.gz)
XZ_FILES = $(NAME_STEMS:=.texi.xz)
TEXT    += $(SRC_FILES)
TEXT_GZ += $(GZIP_FILES)
TEXT_XZ += $(XZ_FILES)
TARGETS += $(SRC_FILES)

#:texi-sub-targets/sub/su	generates all files from generated rules (default target)
.PHONY: texi-sub-targets sub su
dnl texi-sub-targets sub su: $(TARGETS)
texi-sub-targets sub su: $(SRC_FILES)

#:texi	generates texi file
.PHONY: texi
texi: $(SRC_FILES)

#:gzi/gi	generates gzipped files
.PHONY: gzi gi
gzi gi: $(GZIP_FILES)

#:xzi/xi	generates xzipped files
.PHONY: xzi xi
xzi xi: $(XZ_FILES)

ifelse(⟦
⟦#⟧:patsubst(defn(⟦ALL_SUBTARGETS⟧), ⟦ ⟧, ⟦/⟧)	generates all ‘LANG_CODE’ + compressed files
.PHONY: ALL_SUBTARGETS
ALL_SUBTARGETS: SUBTARGETS

⟦#⟧:patsubst(defn(⟦CLEAN_SUBTARGETS⟧), ⟦ ⟧, ⟦/⟧)	deletes all ‘LANG_CODE’ + compressed files
.PHONY: CLEAN_SUBTARGETS
CLEAN_SUBTARGETS:
	$(RM) SUBTARGETS

⟧)dnl comment
