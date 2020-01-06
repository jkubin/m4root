SYMBOL = Hello, world!
TARGETS = intel att
VPATH = ../gfiles/

.SECONDARY:

#:all	create all targets
.PHONY: all
all: $(TARGETS)

%.s: Makefile rootb.m4 all.m4 %.m4 hello.m4 hello.mc
	m4 -DSYMBOL='$(SYMBOL)' $(filter-out Makefile, $^) > $@

%: %.s
	gcc -o $@ $<
	./$@

#:cl/clean	remove generated files
.PHONY: clean cl
clean cl:
	$(RM) $(DEBUG_FILE) $(TARGETS) *.s
