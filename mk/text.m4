__AUTHOR(⟦Josef Kubin⟧, ⟦2020,05,19⟧)
___DESCR(⟦generates additional rules extending the handwritten Makefile to generate txt files⟧)
__REASON(⟦additional rules to generate txt files⟧)

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
FILE_STEM.txt: rootu.m4 config.m4 lang.m4 ver.m4 lang_⟦⟧LANG_CODE.m4 git.m4 REFS_FILES incl.m4 init.m4 text/file.m4 text/cmd.m4 text/queues.m4 text/ref.m4 text/link.m4 text/text.m4 $1
	m4 -DLANG_CODE='LANG_CODE' -DARTICLE_PATH='FILE_STEM' -DFILE_LIST='FILE_LIST' -DLINE_NUMBERS $(FLAGS) $^ | sed -f text/esc_to_txt.sed > $⟦@⟧

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
define(⟦ALL_IN_ONE⟧,		⟦all_⟧LANG_CODE.txt)
define(⟦TEXT_STEM⟧,		⟦TEXT_STEM_⟧LANG_CODE)
define(⟦TXT_FILES⟧,		⟦TEXT_⟧LANG_CODE)
define(⟦CC_NAMES⟧,		⟦CHAR_COUNT_⟧LANG_CODE)
define(⟦WC_NAMES⟧,		⟦WORD_COUNT_⟧LANG_CODE)
define(⟦GZ_FILES⟧,		⟦GZIPPED_TEXT_⟧LANG_CODE)
define(⟦XZ_FILES⟧,		⟦XZIPPED_TEXT_⟧LANG_CODE)
define(⟦SUBTARGETS⟧,		$(TXT_FILES) $(GZ_FILES) $(XZ_FILES))

# generate the final output
divert(0)dnl
⟦#⟧ DONTE()

TEXT_STEM = \
divert(2)
TXT_FILES = $(TEXT_STEM:=.txt)
CC_NAMES = $(TEXT_STEM:=.cc)
WC_NAMES = $(TEXT_STEM:=.wc)
GZ_FILES = $(TEXT_STEM:=.txt.gz)
XZ_FILES = $(TEXT_STEM:=.txt.xz)
TEXT    += $(TXT_FILES)
TEXT_CC += $(CC_NAMES)
TEXT_WC += $(WC_NAMES)
TEXT_GZ += $(GZ_FILES)
TEXT_XZ += $(XZ_FILES)
TARGETS += $(TXT_FILES)

#:sub-targets/sub/su	generates all files from generated rules (default target)
.PHONY: sub-targets sub su
sub-targets sub su: $(TARGETS)
dnl txt-sub-targets sub su: $(TXT_FILES)

#:text/txt/tx	generates plain text to specify the length of the article
.PHONY: text txt tx
text txt tx: $(TXT_FILES)

#:plain/pla/p1	generates plain text in one file
.PHONY: plain pla p1
plain pla p1: ALL_IN_ONE

#:gzt/gt	generates gzipped files
.PHONY: gzt gt
gzt gt: $(GZ_FILES)

#:xzt/xt	generates xzipped files
.PHONY: xzt xt
xzt xt: $(XZ_FILES)

git_⟦⟧LANG_CODE.m4: $(TXT_FILES)

⟦#⟧:patsubst(defn(⟦ALL_SUBTARGETS⟧), ⟦ ⟧, ⟦/⟧)	generates all ‘LANG_CODE’ text and compressed files
.PHONY: ALL_SUBTARGETS
ALL_SUBTARGETS: SUBTARGETS

⟦#⟧:patsubst(defn(⟦CLEAN_SUBTARGETS⟧), ⟦ ⟧, ⟦/⟧)	deletes all ‘LANG_CODE’ text and compressed files
.PHONY: CLEAN_SUBTARGETS
CLEAN_SUBTARGETS:
	$(RM) SUBTARGETS

ALL_IN_ONE: rootu.m4 config.m4 lang.m4 ver.m4 lang_⟦⟧LANG_CODE.m4 git.m4 REFS_FILES incl.m4 text/file.m4 text/cmd.m4 text/queues.m4 text/ref.m4 text/link.m4 text/text.m4 patsubst(defn(⟦FILE_LIST⟧), ⟦,⟧, ⟦ ⟧)
	m4 -DLANG_CODE='LANG_CODE' -DFILE_LIST='FILE_LIST' -DPRINT_HEADER -DLINE_NUMBERS $(FLAGS) $^ | sed -f text/esc_to_txt.sed > $@

