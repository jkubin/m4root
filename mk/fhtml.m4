# vim:ft=m4

__HEADER([Josef Kubin], [2020/01/05], [root_cz])
___DESCR([the script creates experimental additional rules extending the handwritten Makefile to generate HTML files])
___POINT([additional rules by configuration from command line; the rules utilise M4 frozen files to generate HTML files])

# A → β
define([TABLE_OF_CONTENT_ITEM], [

	# find the folder name from the associative memory
	define([TARGET_FOLDER], defn([$1.$2.anch]))

	ifelse(defn([TARGET_FOLDER]), [], [

		ROOT_ERROR([reference file ‘refs_xx.m4’ is missing or empty])
	])

divert(1)dnl
defn([TARGET_FOLDER]) \
divert(2)dnl
TARGET_FOLDER/%.html: html_$2.m4f $(wildcard $1.html/*.m4 $1.html/*/*.m4) %.m4 $1 nav.m4
	m4 -DOUTPUT_FILE='$[@]' -R $^ | sed -f brackets.sed > $[@]
	@tidy -qe $[@]

TARGET_FOLDER/publish.txt: html_$2.m4f $(wildcard $1.html/*.m4 $1.html/*/*.m4) publish.m4 $1 nav.m4
	m4 -DSOURCE='$1' -R $^ | sed -f html/publish.sed -f brackets.sed > $[@]

TARGET_FOLDER/spell.txt: rootb.m4 order.m4 aux.m4 lang.m4 headings.m4 ver.m4 lang_$2.m4 REFS_FILES incl.m4 spell.m4 $1
	m4 -DLANG_CODE='$2' -DSOURCE='$1' $^ > $[@]

divert(-1)
])

# process table from the common content file
TABLE_OF_CONTENT(LANG_CODE)

# define Makefile names
# A → β
define([ALL_SUBTARGETS],	[all_]LANG_CODE [all]LANG_CODE LANG_CODE)
define([CLEAN_SUBTARGETS],	[clean_]LANG_CODE [cl_]LANG_CODE [cl]LANG_CODE [c]LANG_CODE)
define([PUBLISH_FILES],		[PUBLISH_]LANG_CODE)
define([PREVIEW_FILES],		[PREVIEW_]LANG_CODE)
define([SPCHECK_FILES],		[SPCHECK_]LANG_CODE)
define([ARTICLE_FILES],		[ARTICLE_]LANG_CODE)
define([FOLDER_NAMES],		[FOLDERS_]LANG_CODE)
define([FROZEN_FILE],		[html_]LANG_CODE.m4f)
define([SUBTARGETS],		$(FOLDER_NAMES) $(ARTICLE_FILES) $(PREVIEW_FILES) $(PUBLISH_FILES) $(SPCHECK_FILES))

# create the final output
divert(0)dnl
[#] DONTE()

VPATH = gfiles:html

FOLDER_NAMES = \
undivert(1)
ARTICLE_FILES = $(FOLDER_NAMES:=/index.html)
PREVIEW_FILES = $(FOLDER_NAMES:=/preview.html)
PUBLISH_FILES = $(FOLDER_NAMES:=/publish.txt)
SPCHECK_FILES = $(FOLDER_NAMES:=/spell.txt)
ARTICLE  += $(FOLDER_NAMES) $(ARTICLE_FILES)
FOLDERS  += $(FOLDER_NAMES)
PREVIEW  += $(FOLDER_NAMES) $(PREVIEW_FILES)
PUBLISH  += $(FOLDER_NAMES) $(PUBLISH_FILES)
SPCHECK  += $(FOLDER_NAMES) $(SPCHECK_FILES)
TARGETS  += SUBTARGETS

#:fhtml-sub-targets/sub/su	creates all files from generated rules
.PHONY: fhtml-sub-targets sub su
fhtml-sub-targets sub su: $(TARGETS)

#:preview/pre/pr/p	as close as possible for real website
.PHONY: preview pre pr p
preview pre pr p: $(PREVIEW)

#:spell/sp	creates files for checking jargon and typos
.PHONY: spell sp
spell sp: $(SPCHECK)

#:publish/pub/pu	creates files in a format suitable for CMS
.PHONY: publish pub pu
publish pub pu: $(PUBLISH)

#:article/art/a	article development
.PHONY: article art a
article art a: $(ARTICLE)

[#]:patsubst(defn([ALL_SUBTARGETS]), [ ], [/])	creates files in ‘LANG_CODE’ language
.PHONY: ALL_SUBTARGETS
ALL_SUBTARGETS: SUBTARGETS

[#]:patsubst(defn([CLEAN_SUBTARGETS]), [ ], [/])	deletes ‘LANG_CODE’ files
.PHONY: CLEAN_SUBTARGETS
CLEAN_SUBTARGETS:
	$(RM) -r $(FOLDER_NAMES) FROZEN_FILE

[#]:html	disabled for ‘LANG_CODE’
html_[]LANG_CODE.mk: ;

$(FOLDER_NAMES):
	mkdir -p $@

FROZEN_FILE: rootb.m4 queues.m4 aux.m4 ent.m4 cfg.m4 inline.m4 headings.m4 block.m4 ver.m4 style.m4 lang_[]LANG_CODE.m4 css.m4 js.m4 git.m4 REFS_FILES order.m4 lang.m4 incl.m4
	m4 -F $@ -DLANG_CODE='LANG_CODE' $^

