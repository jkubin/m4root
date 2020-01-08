# For help with this Makefile, type:
# $ make h

 # <--- this is the form-feed character for Vim abbreviations, type: [[ to skip backward; type: ]] to skip forward

# The following paragraph is for the M4 preprocessor:
define m4
__HEADER([Josef Kubin], [2019/10/09], [root_cz])
___DESCR([this handwritten Makefile automatically creates additional rules for creating target files])
___POINT([learning M4 using the examples in this series])
___USAGE([make h && make && make])
endef

# keep secondary generated files
.SECONDARY:


SOURCE     = $(wildcard *.mc)
DEBUG_FILE = debug.m4
ORDER_FILE = order.m4
VPATH      = gfiles
SUBDIRS    = gfiles hello_world preproc messages asm

EMPTY =
SPACE = $(EMPTY) $(EMPTY)
COMMA = ,

LANG_CODES = $(patsubst lang_%.m4,%,$(wildcard lang_*.m4))
MAKE_CODES = $(filter-out $(ex)$(exclude), $(LANG_CODES))
RULES_MAKE = $(patsubst %,rules_%.mk,$(MAKE_CODES))
MAKE_ICE   = $(patsubst %,ice_%.mk,$(MAKE_CODES))
REFS_MAKE  = $(patsubst %,refs_%.m4,$(MAKE_CODES))
REFS_ALL   = $(patsubst %,refs_%.m4,$(LANG_CODES))
LANGS_ALL  = $(subst $(SPACE),$(COMMA),$(LANG_CODES))
FILE_LIST  = $(subst $(SPACE),$(COMMA),$(SOURCE))
CLSUBDIRS  = $(SUBDIRS:%=clean-%)

-include $(wildcard *.mk)


#:all	creates all files
.PHONY: all
all: src rules $(TARGETS)


#:r/ru/rules	creates ordinary Makefile rules
.PHONY: r ru rules
r ru rules: $(RULES_MAKE)


#:i/ice	experimentally creates Makefile rules for frozen M4 files
.PHONY: i ice
i ice: $(MAKE_ICE)


#:sr/src	generates files in all example folders
.PHONY: sr src
sr src: $(SUBDIRS)


#:d/dbg/debug/trunc	truncates the debug file for M4 script development
.PHONY: d dbg debug trunc
d dbg debug trunc:
	> $(DEBUG_FILE)


#:t/te/test	this target is for M4 script development
.PHONY: t te test
t te test: debug dev


#:dev/devel	this target is for M4 script development
.PHONY: dev devel
dev devel: rootb.m4
	m4 $< test.m4

$(ORDER_FILE): rootb.m4 toc.m4 toc_list.m4
	m4 -DALL_LANGS='$(LANGS_ALL)' -DFILE_LIST='$(FILE_LIST)' $^ > $@

refs_%.m4: rootb.m4 lang_%.m4 toc.m4 $(ORDER_FILE) lang.m4 headings.m4 include.m4 refs.m4
	m4 -DLANG_CODE='$*' $^ $(SOURCE) > $@

rules_%.mk: rootb.m4 $(ORDER_FILE) refs_%.m4 lang.m4 headings.m4 rules.m4
	m4 -DREFS_FILES='$(REFS_MAKE)' -DLANG_CODE='$*' $^ > $@

ice_%.mk: rootb.m4 $(ORDER_FILE) refs_%.m4 lang.m4 headings.m4 ice.m4
	m4 -DREFS_FILES='$(REFS_MAKE)' -DLANG_CODE='$*' $^ > $@

.PHONY: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: $(CLSUBDIRS)
$(CLSUBDIRS):
	$(MAKE) -C $(@:clean-%=%) clean


#:cl/clean	deletes all generated files
.PHONY: cl clean
cl clean:
	$(RM) -r $(DEBUG_FILE) $(ORDER_FILE) $(REFS_ALL) $(FOLDERS) *.{mk,m4f}

#:dc/cld/dcl/distclean	also deletes generated files also in all example folders
.PHONY: dc cld dcl distclean
dc cld dcl distclean: clean $(CLSUBDIRS)

#:c/cll/clm/mc/mcl/mostlyclean	deletes only a subset of the generated files
.PHONY: c cll clm mc mcl mostlyclean
c cll clm mc mcl mostlyclean:
	$(RM) -r $(FOLDERS)


#:h/help	prints help for this Makefile
.PHONY: h help
h help:
	@sed -n '/^#:/{s//\x1b[7mmake /;s/\t/\x1b[m /;p}' Makefile $(wildcard *.mk) | sort -u	# ]]	<--- square brackets for M4 preprocessor
