__HEADER(⟦Josef Kubin⟧, ⟦2020/05/19⟧, ⟦mk⟧)
___DESCR(⟦the script generates additional rules extending the handwritten Makefile to generate man files⟧)
__REASON(⟦additional rules by configuration from command line to generate man files⟧)

# A → β
define(⟦MAKE_RULE⟧, ⟦

	ifelse(⟦$1⟧, ⟦⟧, ⟦⟧, ⟦

		# file stem is from an associative array
		define(⟦FILE_STEM⟧, defn(⟦$1⟧.LANG_CODE.anch))

		ifelse(defn(⟦FILE_STEM⟧), ⟦⟧, ⟦

			ROOT_ERROR(⟦reference file ‘refs_xx.m4’ is missing or empty⟧)
		⟧)

		divert(1)dnl
defn(⟦FILE_STEM⟧) \
divert(3)dnl
FILE_STEM.man: rootu.m4 aux.m4 lang.m4 headings.m4 ver.m4 lang_⟦⟧LANG_CODE.m4 git.m4 REFS_FILES incl.m4 init.m4 text/file.m4 text/cmd.m4 text/queues.m4 text/inline.m4 text/text.m4 $1 text/nav.m4
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
define(⟦NAME_STEMS⟧,		⟦TEXT_NAME_STEM_⟧LANG_CODE)
define(⟦SRC_FILES⟧,		⟦TEXT_⟧LANG_CODE)
define(⟦GZIP_FILES⟧,		⟦GZIPPED_TEXT_⟧LANG_CODE)
define(⟦XZ_FILES⟧,		⟦XZIPPED_TEXT_⟧LANG_CODE)
define(⟦SUBTARGETS⟧,		$(SRC_FILES) $(GZIP_FILES) $(XZ_FILES))

# create the final output
divert(0)dnl
⟦#⟧ DONTE()

NAME_STEMS = \
divert(2)
SRC_FILES = $(NAME_STEMS:=.man)
GZIP_FILES = $(NAME_STEMS:=.man.gz)
XZ_FILES = $(NAME_STEMS:=.man.xz)
TEXT    += $(SRC_FILES)
TEXT_GZ += $(GZIP_FILES)
TEXT_XZ += $(XZ_FILES)
TARGETS += $(SRC_FILES)

#:man-sub-targets/sub/su	generates all files from generated rules (default target)
.PHONY: man-sub-targets sub su
dnl man-sub-targets sub su: $(TARGETS)
man-sub-targets sub su: $(SRC_FILES)

#:man	generates man files
.PHONY: man
man: $(SRC_FILES)

#:gzm/gm	generates gzipped files
.PHONY: gzm gm
gzm gm: $(GZIP_FILES)

#:xzm/xm	generates xzipped files
.PHONY: xzm xm
xzm xm: $(XZ_FILES)

ifelse(⟦
⟦#⟧:patsubst(defn(⟦ALL_SUBTARGETS⟧), ⟦ ⟧, ⟦/⟧)	generates all ‘LANG_CODE’ text and compressed files
.PHONY: ALL_SUBTARGETS
ALL_SUBTARGETS: SUBTARGETS

⟦#⟧:patsubst(defn(⟦CLEAN_SUBTARGETS⟧), ⟦ ⟧, ⟦/⟧)	deletes all ‘LANG_CODE’ text and compressed files
.PHONY: CLEAN_SUBTARGETS
CLEAN_SUBTARGETS:
	$(RM) SUBTARGETS
⟧)dnl comment

