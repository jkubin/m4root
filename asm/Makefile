SYMBOL = Hello, world!
TARGETS = intel.s att.s
VPATH = ../gfiles

.SECONDARY:

#:all	create all targets
.PHONY: all
all: $(TARGETS)

%.s: Makefile rootb.m4 all.m4 %.m4 hello.m4 hello.mc
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@

%: %.s
	gcc -o $@ $<
	./$@

#:clean/cl	remove generated files
.PHONY: clean cl
clean cl:
	$(RM) $(DEBUG_FILE) $(TARGETS)


#:help/he/hl/h	print this text
.PHONY: help he hl h
help he hl h:
	@sed -n '/^#:/{s//\x1b[7mmake /;s/\t/\x1b[m /;p}' Makefile | sort	# ]]	<--- square brackets for M4 preprocessor
