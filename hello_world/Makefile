# __HEADER([Josef Kubin], [2019/08/24], [root_cz])
# ___DESCR([examples generate several hello world source files])
# ___POINT([how to generate files for different computer languages])
# ___USAGE([make h && make])

SYMBOL = Hello, world!
#SYMBOL = Hello world [1]!
#SYMBOL = Hello world [[1]]!
#SYMBOL = Hello world LB()1!

IGNORE   = debug.m4 hello_world.gnr.m4
PROJECT  = $(notdir $(shell pwd))
M4_FILES = $(filter-out $(IGNORE), $(wildcard *.m4))
SUFFIXES = $(M4_FILES:.m4=)
TARGETS  = $(foreach suf,$(SUFFIXES),$(PROJECT).$(suf))

HOSTNAME = demon
DEBUG_FILE = debug.m4
VPATH = ../gfiles


#:all	create all targets
.PHONY: all
all: trunc $(TARGETS)

$(TARGETS): Makefile

$(PROJECT).sentence: root0b.m4 countb.m4 sentence.m4
	m4 $(filter-out Makefile, $^) > $@ 2> trace.sentence

$(PROJECT).awk: root1b.m4 countb.m4 awk.m4
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@

$(PROJECT).%: root0b.m4 countb.m4 %.m4
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@

$(PROJECT).branch: root0b.m4 countb.m4 branch.m4
	m4 -DBRANCH=$$[$$RANDOM % 10] $(filter-out Makefile, $^) > $@

$(PROJECT).java: root0q.m4 countq.m4 rulerq.m4 java.m4
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@

$(PROJECT).q.c: root0q.m4 countq.m4 q.c.m4
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@

$(PROJECT).line: root0q.m4 countq.m4 line.m4
	m4 $(filter-out Makefile, $^) > $@

$(PROJECT).quot.sh: root0q.m4 countq.m4 quot.sh.m4
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@

$(PROJECT).css: root0q.m4 countq.m4 css.m4
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@

$(PROJECT).ansi_escape_code: root0b.m4 countb.m4 ansi_escape_code.m4
	m4 -DSYMBOL='$(SYMBOL)' -DUSR=$(USER) -DHOSTNAME=$(HOSTNAME) -DDIR=$(PROJECT) $(filter-out Makefile, $^) > $@

$(PROJECT).ansi_escape_code_buggy: root0b.m4 countb.m4 ansi_escape_code_buggy.m4
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) -DUSR=$(USER) -DHOSTNAME=$(HOSTNAME) -DDIR=$(PROJECT) > $@

$(PROJECT).array.c: root1b.m4 countb.m4 array.c.m4
	m4 -DSYMBOL=' !"#$$%&'\''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~' -DUSR=$(USER) -DHOSTNAME=$(HOSTNAME) -DDIR=$(PROJECT) $(filter-out Makefile, $^) > $@

$(PROJECT).ascii.c: root1n.m4 countn.m4 ascii.c.m4
	m4 -DSYMBOL=' !"#$$%&'\''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~' -DUSR=$(USER) -DHOSTNAME=$(HOSTNAME) -DDIR=$(PROJECT) $(filter-out Makefile, $^) > $@


#:trunc	truncate debug file
.PHONY: trunc
trunc:
	> $(DEBUG_FILE)


#:clean/cl	remove generated files
.PHONY: clean cl
clean cl:
	$(RM) $(TARGETS) $(DEBUG_FILE)


#:help/he/hl/h	prints help for this Makefile
.PHONY: help he hl h
help he hl h:
	@sed -n '/^#:/{s//\x1b[7mmake /;s/\t/\x1b[m /;p}' Makefile | sort	# ]]	<--- square brackets because of M4
