# __HEADER([Josef Kubin], [2019/11/18], [root_cz])
# ___DESCR([generic examples how to use M4 as a preprocessor])
# __REASON([M4 as a preprocessor])
# ___USAGE([make h && make])

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

$(PREFIX).%: root0q.m4 %.m4 %
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@

$(PREFIX).file.css: root0q.m4 file.css.m4 file.css foo.css
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile foo.css, $^) > $@

$(PREFIX).%.sh: root0n.m4 %.sh.m4 %.sh
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@


#:trunc	truncate debug file
.PHONY: trunc
trunc:
	> $(DEBUG_FILE)


#:clean/cl	remove generated files
.PHONY: clean cl
clean cl:
	$(RM) $(DEBUG_FILE) $(TARGETS)


#:help/he/hl/h	print this text
.PHONY: help he hl h
help he hl h:
	@sed -n '/^#:/{s//\x1b[7mmake /;s/\t/\x1b[m /;p}' Makefile | sort	# ]]	<--- square brackets because of M4
