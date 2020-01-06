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
MAKE_CODES = $(filter-out $(exclude), $(LANG_CODES))
RULES_MAKE = $(patsubst %,rules_%.mk,$(MAKE_CODES))
MAKE_ICE   = $(patsubst %,ice_%.mk,$(MAKE_CODES))
REFS_MAKE  = $(patsubst %,refs_%.m4,$(MAKE_CODES))
REFS_ALL   = $(patsubst %,refs_%.m4,$(LANG_CODES))
LANGS_ALL  = $(subst $(SPACE),$(COMMA),$(LANG_CODES))
FILE_LIST  = $(subst $(SPACE),$(COMMA),$(SOURCE))
CLSUBDIRS  = $(SUBDIRS:%=clean-%)

-include $(wildcard *.mk)


#:all	make all files
.PHONY: all
all: src rules $(TARGETS)


#:rules	this is target which makes additional Makefile rules
.PHONY: rules
rules: $(RULES_MAKE)


#:ice	this is an experimental target which makes additional Makefile rules for M4 frozen files
.PHONY: ice
ice: $(MAKE_ICE)


#:src	make source files in folders with examples
.PHONY: src
src: $(SUBDIRS)


#:debug	truncate debug file for M4 script development
.PHONY: debug
debug:
	> $(DEBUG_FILE)


#:test	this target is for M4 script development
.PHONY: test
test: debug dev


#:dev	this target is for M4 script development
.PHONY: dev
dev: rootb.m4
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


#:cl/clean	delete generated files
.PHONY: cl clean
cl clean:
	$(RM) -r $(DEBUG_FILE) $(ORDER_FILE) $(REFS_ALL) $(FOLDERS) *.{mk,m4f}

#:cld/dcl/distclean	delete generated files also in sub-directories
.PHONY: cld dcl distclean
cld dcl distclean: clean $(CLSUBDIRS)

#:cll/clm/mcl/mostlyclean	delete subset of generated files
.PHONY: cll clm mcl mostlyclean
cll clm mcl mostlyclean:
	$(RM) -r $(FOLDERS)


#:h/help	prints help for this Makefile
.PHONY: h help
h help:
	@sed -n '/^#:/{s//\x1b[7mmake /;s/\t/\x1b[m /;p}' Makefile $(wildcard *.mk) | sort -u	# ]]	<--- square brackets for M4 preprocessor
