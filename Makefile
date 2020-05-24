# __HEADER([Josef Kubin], [2019/10/09], [m4root])
# ___DESCR([this handwritten Makefile automatically generates additional rules to generate target files])
# ___POINT([learning M4 using the examples in this series])
# ___USAGE([make h && make && make])

 # <--- this is the form-feed character for Vim, type: [[ to skip backward, type: ]] to skip forward

# keep secondary generated files
.SECONDARY:

# prohibits unwanted surprises
MAKEFLAGS += --no-builtin-rules


SOURCE     = $(wildcard *.mc)
DOC_FILE   = brief_documentation.txt
DEBUG_FILE = debug.m4
ORDER_FILE = order.m4
REFS_MONO  = refs_mono.m4
JAVASCRIPT = js/hgl_packed.js js/info_packed.js
VPATH      = gfiles:js
SUBDIRS    = gfiles hello_world preproc messages asm
MONITORED  = messages gfiles/*[bnqu].m4 hello_world asm preproc

EMPTY =
SPACE = $(EMPTY) $(EMPTY)
COMMA = ,

LANG_CODES = $(patsubst lang_%.m4,%,$(wildcard lang_*.m4))
REQ_LANGS  = $(filter-out $(ex)$(exclude), $(LANG_CODES))
MAKE_MAN   = $(patsubst %,man_%.mk,$(REQ_LANGS))
MAKE_TEXT  = $(patsubst %,text_%.mk,$(REQ_LANGS))
MAKE_TEXI  = $(patsubst %,texi_%.mk,$(REQ_LANGS))
MAKE_HTML  = $(patsubst %,html_%.mk,$(REQ_LANGS))
MAKE_FHTML = $(patsubst %,fhtml_%.mk,$(REQ_LANGS))
MAKE_INCLL = $(patsubst %,*_%.mk,$(REQ_LANGS))
REFS_LANG  = $(patsubst %,refs_%.m4,$(REQ_LANGS))
REFS_ALL   = $(patsubst %,refs_%.m4,$(LANG_CODES))
LANGS_ALL  = $(subst $(SPACE),$(COMMA),$(LANG_CODES))
FILE_LIST  = $(subst $(SPACE),$(COMMA),$(SOURCE))
CLSUBDIRS  = $(SUBDIRS:%=clean-%)

-include $(wildcard $(MAKE_INCLL))


#:all	generates all files (initial target)
.PHONY: all
all: src html text $(TARGETS)


#:man	generates a child file for the Makefile to generate man
.PHONY: man
man: $(MAKE_MAN)


#:text	generates a child file for the Makefile to generate text
.PHONY: text
text: $(MAKE_TEXT)


#:texi	generates a child file for the Makefile to generate texi
.PHONY: texi
texi: $(MAKE_TEXI)


#:html	generates a child file for the Makefile to generate html
.PHONY: html
html: $(MAKE_HTML)


#:fhtml	generates a child file for the Makefile to generate html from a "frozen" M4 file
.PHONY: fhtml
fhtml: $(MAKE_FHTML)


#:src	generates files in all example folders
.PHONY: src
src: $(SUBDIRS) git.m4


#:trunc/trc	truncates the debug.m4 file
.PHONY: trunc trc
trunc trc:
	> $(DEBUG_FILE)


#:refs	regenerates links (as an auxiliary hash database) to paragraphs, captions, source code, … (usage: $ make -B refs)
.PHONY: refs
refs: $(REFS_MONO) $(REFS_LANG)

#:cc	determines the number of characters to be printed (article length)
.PHONY: cc $(TEXT_CC)
cc: $(TEXT_CC)

$(TEXT_CC):
	@wc --chars $(@:.cc=.txt)

#:wc	determines the number of words to be printed (article length)
.PHONY: wc $(TEXT_WC)
wc: $(TEXT_WC)

$(TEXT_WC):
	@wc --words $(@:.wc=.txt)


#:test/tst/t	tests snippets of code in the scripting sandbox (development of new features or scripts)
.PHONY: test tst t
test tst t: trunc devel

.PHONY: devel
#$(info $(subst $(SPACE),$(COMMA),$(JAVASCRIPT)))
#devel: rootb.m4 cfg.m4 queues.m4 style.m4 css.m4 inline.m4 test.m4
#devel: rootb.m4 cfg.m4 queues.m4 style.m4 css.m4 js.m4 test.m4
#devel: rootb.m4 cfg.m4 queues.m4 style.m4 css.m4 test.m4
devel: rootb.m4 cfg.m4 git.m4 text/queues.m4 text/cmd.m4 html/ent.m4 test.m4
	m4 $^

#:new/n	removes the date at the top of the page (usage: $ make new art)
.PHONY: new n
new n:
	$(eval FLAGS += -DNEW_ARTICLE)
	@:

#:debug/dbg/db/d	prints certain debug information that is usually hidden (usage: $ make dbg art)
.PHONY: debug dbg db d
debug dbg db d:
	$(eval FLAGS += -DDEBUG)
	@:


#:clean/cle/del/cl	deletes all generated files
.PHONY: clean cle del cl
clean cle del cl:
	$(RM) -r $(DEBUG_FILE) $(DOC_FILE) $(JAVASCRIPT) $(REFS_MONO) $(ORDER_FILE) $(REFS_ALL) $(FOLDERS) $(TEXT) $(TEXT_GZ) $(TEXT_XZ) *.{mk,m4f}

#:distclean/dcl/cld/dc	also deletes generated files in all example folders
.PHONY: distclean dcl cld dc
distclean dcl cld dc: clean $(CLSUBDIRS) git.m4

#:mostlyclean/mcl/clm/cll/mc	deletes only a subset of the generated files
.PHONY: mostlyclean mcl clm cll mc
mostlyclean mcl clm cll mc:
	$(RM) -r $(FOLDERS) *.{mk,m4f}

#:doc	extracts headers from the source files and generates a brief documentation for a basic source file overview
.PHONY: doc
doc: $(DOC_FILE)

$(DOC_FILE): doc.m4 $(wildcard gfiles/*b.m4 html/*_src.js) $(shell find -name 'git.sh' -o -name '*.sed' -o -name 'Makefile' -o -name '*.m4' ! -path './messages/*' ! -path './gfiles/*' ! -path './hello_world/*' ! -path './preproc/*' ! -path './asm/*')
	m4 $+ > $@

#:test-uncommitted-git-changes/changes/gch	tests uncommitted git changes in monitored directories with source files
.PHONY: test-uncommitted-git-changes changes gch
test-uncommitted-git-changes changes gch:
	git diff-files --name-status --exit-code $(MONITORED)

#:pkjs/pjs/js/j	converts human readable JavaScript(s) to packed one-line form (see js/packer.sed for details)
.PHONY: pkjs pjs js j
pkjs pjs js j: $(JAVASCRIPT)

# note: trailing LF after packing is removed by "head" command
%_packed.js: packer.sed %_packer.sed %_src.js
	sed -f $< -f $(word 2, $^) $(lastword $^) | head -c -1 > $@

$(ORDER_FILE): rootb.m4 toc.m4 toc_list.m4
	m4 -DALL_LANGS='$(LANGS_ALL)' -DFILE_LIST='$(FILE_LIST)' $^ > $@

$(REFS_MONO): rootb.m4 cfg.m4 refs/mono.m4
	m4 $^ $(SOURCE) > $@

refs_%.m4: rootb.m4 cfg.m4 lang_%.m4 toc.m4 $(ORDER_FILE) lang.m4 headings.m4 refs.m4
	m4 -DLANG_CODE='$*' $^ $(SOURCE) | sed -f refs.sed > $@

man_%.mk: rootb.m4 $(ORDER_FILE) refs_%.m4 lang.m4 headings.m4 mk/man.m4
	m4 -DLANG_CODE='$*' -DREFS_FILES='$(REFS_LANG) $(REFS_MONO)' $^ > $@

tex_%.mk: rootb.m4 $(ORDER_FILE) refs_%.m4 lang.m4 headings.m4 mk/tex.m4
	m4 -DLANG_CODE='$*' -DREFS_FILES='$(REFS_LANG) $(REFS_MONO)' $^ > $@

texi_%.mk: rootb.m4 $(ORDER_FILE) refs_%.m4 lang.m4 headings.m4 mk/texi.m4
	m4 -DLANG_CODE='$*' -DREFS_FILES='$(REFS_LANG) $(REFS_MONO)' $^ > $@

text_%.mk: rootb.m4 $(ORDER_FILE) refs_%.m4 lang.m4 headings.m4 mk/text.m4
	m4 -DLANG_CODE='$*' -DREFS_FILES='$(REFS_LANG) $(REFS_MONO)' $^ > $@

html_%.mk: rootb.m4 $(ORDER_FILE) refs_%.m4 lang.m4 headings.m4 mk/html.m4
	m4 -DLANG_CODE='$*' -DREFS_FILES='$(REFS_LANG) $(REFS_MONO)' $^ > $@

fhtml_%.mk: rootb.m4 $(ORDER_FILE) refs_%.m4 lang.m4 headings.m4 mk/fhtml.m4
	m4 -DLANG_CODE='$*' -DREFS_FILES='$(REFS_LANG) $(REFS_MONO)' $^ > $@

git.m4: $(shell git ls-tree -r --name-only HEAD $(MONITORED))
	./git.sh $^ > $@

%.txt.gz: %.txt
	gzip -c $< > $@

%.txt.xz: %.txt
	xz -c $< > $@

.PHONY: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: $(CLSUBDIRS)
$(CLSUBDIRS):
	$(MAKE) -C $(@:clean-%=%) clean


#:help/he/hl/h	prints help for this Makefile and generated mk files
.PHONY: help he hl h
help he hl h:
	@sed -n '/^#:/{s//\x1b[7mmake /;s/\t/\x1b[m /;p}' Makefile $(wildcard *.mk) | sort -u	# ]]	<--- square brackets because of M4
