__HEADER([Josef Kubin], [2020/05/19], [mk])
___DESCR([generates additional rules extending the handwritten Makefile to generate txt files])
___POINT([additional rules to generate txt files])

# A → β
define([TABLE_OF_CONTENT_ITEM], [

	# file stem is from an associative array
	define([FILE_STEM], defn([$1.$2.anch]))

	ifelse(defn([FILE_STEM]), [], [

		ROOT_ERROR([reference file ‘refs_xx.m4’ is missing or empty])
	])

divert(1)dnl
defn([FILE_STEM]) \
divert(2)dnl
FILE_STEM.txt: rootb.m4 cfg.m4 order.m4 lang.m4 headings.m4 ver.m4 lang_$2.m4 git.m4 REFS_FILES incl.m4 text/file.m4 text/cmd.m4 text/queues.m4 text/inline.m4 text/text.m4 $1 text/nav.m4
	m4 -DLANG_CODE='$2' -DSOURCE='$1' -DLINE_NUMBERS $(FLAGS) $^ | sed -f text/esc_to_txt.sed > $[@]

divert(-1)
])

# process table from the common content file
TABLE_OF_CONTENT(LANG_CODE)

# define Makefile names
# A → β
define([ALL_SUBTARGETS],	[all-text-]LANG_CODE [at]LANG_CODE)
define([CLEAN_SUBTARGETS],	[clean-text-]LANG_CODE [clt]LANG_CODE [ct]LANG_CODE)
define([TEXT_STEM],		[TEXT_STEM_]LANG_CODE)
define([SRC_FILES],		[TEXT_]LANG_CODE)
define([CC_NAMES],		[CHAR_COUNT_]LANG_CODE)
define([WC_NAMES],		[WORD_COUNT_]LANG_CODE)
define([GZ_FILES],		[GZIPPED_TEXT_]LANG_CODE)
define([XZ_FILES],		[XZIPPED_TEXT_]LANG_CODE)
define([SUBTARGETS],		$(SRC_FILES) $(GZ_FILES) $(XZ_FILES))

# generate the final output
divert(0)dnl
[#] DONTE()

TEXT_STEM = \
undivert(1)
SRC_FILES = $(TEXT_STEM:=.txt)
CC_NAMES = $(TEXT_STEM:=.cc)
WC_NAMES = $(TEXT_STEM:=.wc)
GZ_FILES = $(TEXT_STEM:=.txt.gz)
XZ_FILES = $(TEXT_STEM:=.txt.xz)
TEXT    += $(SRC_FILES)
TEXT_CC += $(CC_NAMES)
TEXT_WC += $(WC_NAMES)
TEXT_GZ += $(GZ_FILES)
TEXT_XZ += $(XZ_FILES)
TARGETS += $(SRC_FILES)

#:txt-sub-targets/sub/su	generates all files from generated rules (default target)
.PHONY: txt-sub-targets sub su
dnl txt-sub-targets sub su: $(TARGETS)
txt-sub-targets sub su: $(SRC_FILES)

#:txt/tx	generates plain text to specify the length of the article
.PHONY: txt tx
txt tx: $(SRC_FILES)

#:gzt/gt	generates gzipped files
.PHONY: gzt gt
gzt gt: $(GZ_FILES)

#:xzt/xt	generates xzipped files
.PHONY: xzt xt
xzt xt: $(XZ_FILES)

[#]:patsubst(defn([ALL_SUBTARGETS]), [ ], [/])	generates all ‘LANG_CODE’ text and compressed files
.PHONY: ALL_SUBTARGETS
ALL_SUBTARGETS: SUBTARGETS

[#]:patsubst(defn([CLEAN_SUBTARGETS]), [ ], [/])	deletes all ‘LANG_CODE’ text and compressed files
.PHONY: CLEAN_SUBTARGETS
CLEAN_SUBTARGETS:
	$(RM) SUBTARGETS

