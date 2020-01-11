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

$(PROJECT).sentence: rootb.m4 sentence.m4
	m4 $(filter-out Makefile, $^) > $@ 2> trace.sentence

$(PROJECT).%: rootb.m4 %.m4
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@

$(PROJECT).branch: rootb.m4 branch.m4
	m4 -DBRANCH=$$[$$RANDOM % 10] $(filter-out Makefile, $^) > $@

$(PROJECT).java: rootq.m4 rulerq.m4 java.m4
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@

$(PROJECT).q.c: rootq.m4 q.c.m4
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@

$(PROJECT).line: rootq.m4 line.m4
	m4 $(filter-out Makefile, $^) > $@

$(PROJECT).quot.sh: rootq.m4 quot.sh.m4
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@

$(PROJECT).css: rootq.m4 css.m4
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@

$(PROJECT).ansi_escape_code: rootb.m4 ansi_escape_code.m4
	m4 -DSYMBOL='$(SYMBOL)' -DUSR=$(USER) -DHOSTNAME=$(HOSTNAME) -DDIR=$(PROJECT) $(filter-out Makefile, $^) > $@

$(PROJECT).ansi_escape_code_buggy: rootb.m4 ansi_escape_code_buggy.m4
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) -DUSR=$(USER) -DHOSTNAME=$(HOSTNAME) -DDIR=$(PROJECT) > $@

$(PROJECT).array.c: rootb.m4 array.c.m4
	m4 -DSYMBOL=' !"#$$%&'\''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~' -DUSR=$(USER) -DHOSTNAME=$(HOSTNAME) -DDIR=$(PROJECT) $(filter-out Makefile, $^) > $@

$(PROJECT).ascii.c: rootn.m4 ascii.c.m4
	m4 -DSYMBOL=' !"#$$%&'\''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~' -DUSR=$(USER) -DHOSTNAME=$(HOSTNAME) -DDIR=$(PROJECT) $(filter-out Makefile, $^) > $@


#:trunc	truncate debug file
.PHONY: trunc
trunc:
	> $(DEBUG_FILE)


#:clean/cl	remove generated files
.PHONY: clean cl
clean cl:
	$(RM) $(TARGETS) $(DEBUG_FILE)


#:help/he	prints help for this Makefile
.PHONY: help he
help he:
	@sed -n '/^#:/{s//\x1b[7mmake /;s/\t/\x1b[m /;p}' Makefile $(wildcard *.mk) | sort -u	# ]]	<--- square brackets for M4 preprocessor
