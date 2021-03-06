# __AUTHOR(⟦Josef Kubin⟧, ⟦2019,10,09⟧)
# ___DESCR(⟦this handwritten Makefile automatically generates additional rules to generate target files⟧)
# __REASON(⟦learning M4 using the examples in this series⟧)
# ___USAGE(⟦make h && make && make⟧)

 # <--- this is the form-feed character for Vim shortcut in normal mode
 #      type: [[ to skip backward, type: ]] to skip forward

# keeps secondary generated files
.SECONDARY:

# prohibits unwanted surprises
MAKEFLAGS += --no-builtin-rules


# here is a list of the source files in the desired order
SOURCE = \
	intro.mc \
	fundamentals.mc \


DOC_FILE   = documentation.txt
DEBUG_FILE = debug.m4
REFS_MONO  = refs_mono.m4
VPATH      = gfiles js
SUBDIRS    = gfiles hello_world preproc messages asm
MONITORED  = \
	messages \
	gfiles/*[bnqu].m4 \
	hello_world \
	asm \
	preproc \

JAVASCRIPT = \
	js/hgl_packed.js \
	js/info_packed.js \
	js/select_packed.js \

EMPTY =
SPACE = $(EMPTY) $(EMPTY)
COMMA = ,

JAVASCRIPT := $(strip $(JAVASCRIPT))
LANG_CODES = $(patsubst lang_%.m4,%,$(wildcard lang_*.m4))
REQ_LANGS  = $(filter-out $(ex)$(exclude), $(LANG_CODES))
MAKE_C     = $(patsubst %,c_%.mk,$(REQ_LANGS))
MAKE_MAN   = $(patsubst %,man_%.mk,$(REQ_LANGS))
MAKE_TEXT  = $(patsubst %,txt_%.mk,$(REQ_LANGS))
MAKE_TEXI  = $(patsubst %,texi_%.mk,$(REQ_LANGS))
MAKE_HTML  = $(patsubst %,html_%.mk,$(REQ_LANGS))
MAKE_FHTML = $(patsubst %,fhtml_%.mk,$(REQ_LANGS))
MAKE_INCLL = $(patsubst %,*_%.mk,$(REQ_LANGS))
REFS_LANG  = $(patsubst %,refs_%.m4,$(REQ_LANGS))
REFS_ALL   = $(patsubst %,refs_%.m4,$(LANG_CODES))
LANGS_ALL  = $(subst $(SPACE),$(COMMA),$(LANG_CODES))
FILE_LIST  = $(subst $(SPACE),$(COMMA),$(strip $(SOURCE)))
CLSUBDIRS  = $(SUBDIRS:%=clean-%)

-include $(wildcard $(MAKE_INCLL))


#:all	generates all files (initial target)
.PHONY: all
all: src html txt mkc $(TARGETS)


#:mkc/c	generates subordinate Makefile to generate c
.PHONY: mkc c
mkc c: $(MAKE_C)


#:man	generates subordinate Makefile to generate man
.PHONY: man
man: $(MAKE_MAN)


#:txt	generates subordinate Makefile to generate text
.PHONY: txt
txt: $(MAKE_TEXT)


#:texi	generates subordinate Makefile to generate texi
.PHONY: texi
texi: $(MAKE_TEXI)


#:html	generates subordinate Makefile to generate html
.PHONY: html
html: $(MAKE_HTML)


#:fhtml	generates subordinate Makefile to generate html from a "frozen" M4 file
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

#:cc	prints the character count of the articles
.PHONY: cc $(TEXT_CC)
cc: $(TEXT_CC)

$(TEXT_CC):
	@wc --chars $(@:.cc=.txt)

#:wc	prints the word count of the articles
.PHONY: wc $(TEXT_WC)
wc: $(TEXT_WC)

$(TEXT_WC):
	@wc --words $(@:.wc=.txt)


#:test/tst/t	tests snippets of code in the scripting sandbox (development of new features or scripts)
.PHONY: test tst t
test tst t: trunc devel

.PHONY: devel
#$(info $(subst $(SPACE),$(COMMA),$(JAVASCRIPT)))
#devel: rootu.m4 config.m4 queues.m4 style.m4 css.m4 inline.m4 devel.m4
#devel: rootu.m4 config.m4 queues.m4 style.m4 css.m4 js.m4 devel.m4
#devel: rootu.m4 config.m4 queues.m4 style.m4 css.m4 devel.m4
#devel:
#devel: rootu.m4 devel.m4
#	m4 gfiles/rootu.m4 --define='. a b c'='[xyz], [LL()], [123]' devel.m4
#	m4 $^ > output.txt
#devel: rootu.m4 config.m4 git.m4 txt/queues.m4 txt/cmd.m4 html/ent.m4 devel.m4
#devel: rootu.m4 git.m4 html/file.m4 tmp/test.mc
#devel: rootu.m4 lang.m4 html/ent.m4 config.m4 devel.m4
#devel: rootu.m4 git.m4 config.m4 refs_mono.m4 lang_cs.m4 html/ent.m4 html/queues.m4 html/cmd.m4 html/style.m4 html/css.m4 devel.m4
#devel: rootu.m4 countu.m4 git.m4 config.m4 refs_mono.m4 lang_cs.m4 html/ent.m4 html/queues.m4 html/style.m4 html/css.m4 html/file.m4 devel.m4
#devel: rootu.m4 countu.m4 config.m4 refs/mono.m4 devel.m4
#devel: rootu.m4 countu.m4 config.m4 lang_cs.m4 git.m4 refs_cs.m4 txt/file.m4 txt/queues.m4 devel.m4
#devel: rootu.m4 countu.m4 config.m4 refs/mono.m4 devel.m4
#devel: rootu.m4 git.m4 config.m4 refs_mono.m4 lang_cs.m4 txt/queues.m4 txt/cmd.m4 devel.m4
devel:  rootu.m4 config.m4 lang.m4 ver.m4 lang_cs.m4 refs_cs.m4 refs_mono.m4 incl.m4 spell.m4 devel.m4
	m4 -DLANG_CODE='en' $^ > output.txt

#:new/n	removes the date at the top of the page (usage: $ make new art)
.PHONY: new n
new n:
	$(eval FLAGS += -DNEW_ARTICLE)
	@:

#:debug/dbg/d	if something does not work, prints debuging information (for example: $ make dbg art)
.PHONY: debug dbg d
debug dbg d:
	$(eval FLAGS += -DDEBUG)
	@:


#:clean/cle/del/cl	deletes all generated files
.PHONY: clean cle del cl
clean cle del cl:
	$(RM) -r $(DEBUG_FILE) $(DOC_FILE) $(JAVASCRIPT) $(REFS_MONO) $(REFS_ALL) $(FOLDERS) $(TEXT) $(TEXT_GZ) $(TEXT_XZ) $(C_SOURCE) $^ *.{mk,m4f}

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

$(DOC_FILE): doc.m4 $(wildcard gfiles/*b.m4 js/*_src.js) $(shell find -name 'git.sh' -o -name '*.sed' -o -name 'Makefile' -o -name '*.m4' ! -path './messages/*' ! -path './gfiles/*' ! -path './hello_world/*' ! -path './preproc/*' ! -path './asm/*')
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

$(REFS_MONO): rootu.m4 countu.m4 config.m4 refs/mono.m4
	m4 $^ $(SOURCE) > $@

refs_%.m4: rootu.m4 countu.m4 config.m4 lang_%.m4 lang.m4 refs.m4
	m4 -DLANG_CODE='$*' -DFILE_LIST='$(FILE_LIST)' $^ $(SOURCE) | sed -f refs.sed > $@

c_%.mk: rootu.m4 countu.m4 refs_%.m4 lang.m4 mk/c.m4
	m4 -DLANG_CODE='$*' -DFILE_LIST='$(FILE_LIST)' -DREFS_FILES='$(REFS_LANG) $(REFS_MONO)' $^ > $@

man_%.mk: rootu.m4 countu.m4 refs_%.m4 lang.m4 mk/man.m4
	m4 -DLANG_CODE='$*' -DFILE_LIST='$(FILE_LIST)' -DREFS_FILES='$(REFS_LANG) $(REFS_MONO)' $^ > $@

tex_%.mk: rootu.m4 countu.m4 refs_%.m4 lang.m4 mk/tex.m4
	m4 -DLANG_CODE='$*' -DFILE_LIST='$(FILE_LIST)' -DREFS_FILES='$(REFS_LANG) $(REFS_MONO)' $^ > $@

texi_%.mk: rootu.m4 countu.m4 refs_%.m4 lang.m4 mk/texi.m4
	m4 -DLANG_CODE='$*' -DFILE_LIST='$(FILE_LIST)' -DREFS_FILES='$(REFS_LANG) $(REFS_MONO)' $^ > $@

txt_%.mk: rootu.m4 countu.m4 refs_%.m4 lang.m4 mk/txt.m4
	m4 -DLANG_CODE='$*' -DFILE_LIST='$(FILE_LIST)' -DREFS_FILES='$(REFS_LANG) $(REFS_MONO)' $^ > $@

html_%.mk: rootu.m4 countu.m4 refs_%.m4 lang.m4 mk/html.m4
	m4 -DLANG_CODE='$*' -DFILE_LIST='$(FILE_LIST)' -DREFS_FILES='$(REFS_LANG) $(REFS_MONO)' -DJAVASCRIPT='$(JAVASCRIPT)' $^ > $@

fhtml_%.mk: rootu.m4 countu.m4 refs_%.m4 lang.m4 mk/fhtml.m4
	m4 -DLANG_CODE='$*' -DFILE_LIST='$(FILE_LIST)' -DREFS_FILES='$(REFS_LANG) $(REFS_MONO)' -DJAVASCRIPT='$(JAVASCRIPT)' $^ > $@

git.m4: $(shell git ls-tree -r --name-only HEAD $(MONITORED))
	@git status --porcelain $^
	./git.sh $^ > $@

git_mc.m4: $(SOURCE)
	@if ! git diff --exit-code --quiet $?; \
	then \
		echo "error: add sources to repository: git add $? && git ci -m 'a comment'" >&2; false; \
	fi
	./git.sh $^ > $@

# tests if there are uncommitted (forgotten) files
# commits generated files to git repository
# generates an associative database to generate publish.txt
git_%.m4:
	git diff-index --cached --quiet HEAD
	git add $?
	git ci -m 'generated file'
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
	@sed -n '/^#:/{s//\x1b[7mmake /;s/\t/\x1b[m /;p}' Makefile $(wildcard *.mk) | sort -u
