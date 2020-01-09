__HEADER([Josef Kubin], [2019/09/01], [root_cz])
___DESCR([the script creates additional rules extending the handwritten Makefile])
___POINT([additional rules by configuration from command line])

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
TARGET_FOLDER/%.html: rootb.m4 queues.m4 aux.m4 html_config.m4 html_inline.m4 headings.m4 html_block.m4 html_insert.m4 version.m4 style.m4 lang_$2.m4 css.m4 REFS_FILES order.m4 lang.m4 include.m4 $(wildcard $1.d/*.m4) %.m4 $1 html_navig.m4
	m4 -DLANG_CODE='$2' $^ > $[@]

TARGET_FOLDER/publish.txt: rootb.m4 queues.m4 aux.m4 html_config.m4 html_inline.m4 headings.m4 html_block.m4 html_insert.m4 version.m4 style.m4 lang_$2.m4 css.m4 REFS_FILES order.m4 lang.m4 include.m4 $(wildcard $1.d/*.m4) publish.m4 $1 html_navig.m4
	m4 -DLANG_CODE='$2' $^ | sed -f publish.sed > $[@]

TARGET_FOLDER/spell.txt: rootb.m4 include.m4 version.m4 lang_$2.m4 REFS_FILES order.m4 lang.m4 headings.m4 spell.m4 $1
	m4 -DLANG_CODE='$2' -DSOURCE='$1' $^ > $[@]

divert(-1)
])

# process table from the common content file
TABLE_OF_CONTENT(LANG_CODE)

# define Makefile names
# A → β
define([ALL_SUBTARGETS],	LANG_CODE [all]LANG_CODE [all_]LANG_CODE)
define([CLEAN_SUBTARGETS],	[c]LANG_CODE [cl]LANG_CODE [cl_]LANG_CODE [clean_]LANG_CODE)
define([PUBLISH_FILES],		[PUBLISH_]LANG_CODE)
define([PREVIEW_FILES],		[PREVIEW_]LANG_CODE)
define([SPCHECK_FILES],		[SPCHECK_]LANG_CODE)
define([VALIDATE_FILES],	[VALIDATE_]LANG_CODE)
define([FOLDER_NAMES],		[FOLDERS_]LANG_CODE)
define([SUBTARGETS],		$(FOLDER_NAMES) $(PREVIEW_FILES) $(VALIDATE_FILES) $(PUBLISH_FILES) $(SPCHECK_FILES))

# create the final output
divert(0)dnl
[#] DONTE()

FOLDER_NAMES = \
undivert(1)
PREVIEW_FILES  = $(FOLDER_NAMES:=/preview.html)
VALIDATE_FILES = $(FOLDER_NAMES:=/validate.html)
PUBLISH_FILES  = $(FOLDER_NAMES:=/publish.txt)
SPCHECK_FILES  = $(FOLDER_NAMES:=/spell.txt)
FOLDERS  += $(FOLDER_NAMES)
PREVIEW  += $(FOLDER_NAMES) $(PREVIEW_FILES)
VALIDATE += $(FOLDER_NAMES) $(VALIDATE_FILES)
PUBLISH  += $(FOLDER_NAMES) $(PUBLISH_FILES)
SPCHECK  += $(FOLDER_NAMES) $(SPCHECK_FILES)
TARGETS  += SUBTARGETS

#:su/sub/subtargets	creates all files from generated rules
.PHONY: subtargets su sub
subtargets su sub: $(TARGETS)

#:p/pr/pre/preview	for off-line article development
.PHONY: p pr pre preview
p pr pre preview: $(PREVIEW)

#:sp/spell	creates files for checking jargon and typos
.PHONY: sp spell
sp spell: $(SPCHECK)

#:pu/pub/publish	creates files in a format suitable for CMS
.PHONY: pu pub publish
pu pub publish: $(PUBLISH)

#:v/va/val/validate	creates files for testing in HTML validator
.PHONY: v va val validate
v va val validate: $(VALIDATE)

[#]:patsubst(defn([ALL_SUBTARGETS]), [ ], [/])	creates files in ‘LANG_CODE’ language
.PHONY: ALL_SUBTARGETS
ALL_SUBTARGETS: SUBTARGETS

[#]:patsubst(defn([CLEAN_SUBTARGETS]), [ ], [/])	deletes ‘LANG_CODE’ files
.PHONY: CLEAN_SUBTARGETS
CLEAN_SUBTARGETS:
	$(RM) -r $(FOLDER_NAMES)

[#]:ice	files in ‘LANG_CODE’ are disabled
ice_[]LANG_CODE.mk: ;

$(FOLDER_NAMES):
	mkdir -p $@

