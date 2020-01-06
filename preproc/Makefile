SYMBOL = Hello, world!

PREFIX  = preproc
SOURCES = self.m4 file.c file.css file.html file.sh
TARGETS = $(foreach prefix,$(SOURCES),$(PREFIX).$(prefix))
DEBUG_FILE = debug.m4
VPATH = ../gfiles

.SUFFIXES:
MAKEFLAGS += --no-builtin-rules


#:all	create all targets
.PHONY: all
all: trunc $(TARGETS)

$(TARGETS): Makefile

$(PREFIX).%: rootq.m4 %.m4 %
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@

$(PREFIX).%.sh: rootn.m4 %.sh.m4 %.sh
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@


#:trunc	truncate debug file
.PHONY: trunc
trunc:
	> $(DEBUG_FILE)


#:cl/clean	remove generated files
.PHONY: clean cl
clean cl:
	$(RM) $(DEBUG_FILE) $(TARGETS)


#:h/help	print this text
.PHONY: help h
help h:
	@sed -n '/^#:/{s//\x1b[1;40;38;5;82mmk /;s/\t/\x1b[m /;p}' Makefile | sort
