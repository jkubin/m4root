# __HEADER([Josef Kubin], [2019/10/09], [m4root])
# ___DESCR([this handwritten Makefile automatically creates additional rules for creating target files])
# ___POINT([learning M4 using the examples in this series])
# ___USAGE([make h && make && make])

 # <--- this is the form-feed character for Vim abbreviations, type: [[ to skip backward; type: ]] to skip forward

# keep secondary generated files
.SECONDARY:


SOURCE     = $(wildcard *.mc)
DOC_FILE   = brief_documentation.txt
DEBUG_FILE = debug.m4
ORDER_FILE = order.m4
VPATH      = gfiles
SUBDIRS    = gfiles hello_world preproc messages asm
MONIT_DIRS = messages gfiles hello_world asm preproc

EMPTY =
SPACE = $(EMPTY) $(EMPTY)
COMMA = ,

LANG_CODES = $(patsubst lang_%.m4,%,$(wildcard lang_*.m4))
REQ_LANGS  = $(filter-out $(ex)$(exclude), $(LANG_CODES))
MAKE_HTML  = $(patsubst %,html_%.mk,$(REQ_LANGS))
MAKE_FHTML = $(patsubst %,fhtml_%.mk,$(REQ_LANGS))
MAKE_REFS  = $(patsubst %,refs_%.m4,$(REQ_LANGS))
REFS_ALL   = $(patsubst %,refs_%.m4,$(LANG_CODES))
LANGS_ALL  = $(subst $(SPACE),$(COMMA),$(LANG_CODES))
FILE_LIST  = $(subst $(SPACE),$(COMMA),$(SOURCE))
CLSUBDIRS  = $(SUBDIRS:%=clean-%)

-include $(wildcard *.mk)


#:all	creates all files
.PHONY: all
all: src html $(TARGETS)


#:html	creates rules to generate html
.PHONY: html
html: $(MAKE_HTML)


#:fhtml	creates rules to generate html from frozen M4 files
.PHONY: fhtml
fhtml: $(MAKE_FHTML)


#:src	generates files in all example folders
.PHONY: src
src: $(SUBDIRS) git.m4


#:debug/dbg/trunc/d	truncates the debug file for M4 script development
.PHONY: debug dbg trunc d
debug dbg trunc d:
	> $(DEBUG_FILE)


#:refs	regenerate references
.PHONY: refs
refs: $(MAKE_REFS)


#:test/t	this target is for M4 script development
.PHONY: test t
test t: debug dev


#:devel/dev	this target is for M4 script development
.PHONY: devel dev
#devel dev: rootb.m4 git.m4 test.m4
#devel dev: rootb.m4 cfg.m4 queues.m4 style.m4 css.m4 inline.m4 test.m4
#devel dev: rootb.m4 test.m4
#devel dev: rootb.m4 cfg.m4 queues.m4 style.m4 css.m4 js.m4 test.m4
devel dev: rootb.m4 cfg.m4 queues.m4 style.m4 test.m4
	m4 $^


#:clean/cle/del/cl	deletes all generated files
.PHONY: clean cle del cl
clean cle del cl:
	$(RM) -r $(DEBUG_FILE) $(DOC_FILE) $(ORDER_FILE) $(REFS_ALL) $(FOLDERS) *.{mk,m4f}

#:distclean/dcl/cld/dc	also deletes generated files also in all example folders
.PHONY: distclean dcl cld dc
distclean dcl cld dc: clean $(CLSUBDIRS) git.m4

#:mostlyclean/mcl/clm/cll/mc	deletes only a subset of the generated files
.PHONY: mostlyclean mcl clm cll mc
mostlyclean mcl clm cll mc:
	$(RM) -r $(FOLDERS) *.{mk,m4f}

#:doc	extracts headers from the source files and creates a brief documentation for a basic source file overview
.PHONY: doc
doc: $(DOC_FILE)

#:test-uncommitted-git-changes/changes/gch	test for uncommitted git changes in monitored directories with source files
.PHONY: test-uncommitted-git-changes changes gch
test-uncommitted-git-changes changes gch:
	git diff-files --name-status --exit-code $(MONIT_DIRS)

$(DOC_FILE): doc.m4 $(wildcard gfiles/*b.m4) $(shell find -name 'git.sh' -o -name '*.sed' -o -name 'Makefile' -o -name '*.m4' ! -path './messages/*' ! -path './gfiles/*' ! -path './hello_world/*' ! -path './preproc/*' ! -path './asm/*')
	m4 $+ > $@

$(ORDER_FILE): rootb.m4 toc.m4 toc_list.m4
	m4 -DALL_LANGS='$(LANGS_ALL)' -DFILE_LIST='$(FILE_LIST)' $^ > $@

refs_%.m4: rootb.m4 lang_%.m4 toc.m4 $(ORDER_FILE) lang.m4 headings.m4 refs.m4
	m4 -DLANG_CODE='$*' $^ $(SOURCE) > $@

html_%.mk: rootb.m4 $(ORDER_FILE) refs_%.m4 lang.m4 headings.m4 mk/html.m4
	m4 -DREFS_FILES='$(MAKE_REFS)' -DLANG_CODE='$*' $^ > $@

fhtml_%.mk: rootb.m4 $(ORDER_FILE) refs_%.m4 lang.m4 headings.m4 mk/fhtml.m4
	m4 -DREFS_FILES='$(MAKE_REFS)' -DLANG_CODE='$*' $^ > $@

git.m4: $(shell git ls-tree -r --name-only HEAD $(MONIT_DIRS))
	./git.sh $^ > $@

.PHONY: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: $(CLSUBDIRS)
$(CLSUBDIRS):
	$(MAKE) -C $(@:clean-%=%) clean


#:help/he/hl/h	prints help for this Makefile
.PHONY: help he hl h
help he hl h:
	@sed -n '/^#:/{s//\x1b[7mmake /;s/\t/\x1b[m /;p}' Makefile $(wildcard *.mk) | sort -u	# ]]	<--- square brackets because of M4
