# stem for generated files
FILES = root ruler

# suffix letter for previously generated files
TYPES = q n u

TARGETS = $(foreach fil,$(FILES),$(foreach suf,$(TYPES),$(fil)$(suf).m4))

# generated iabbreviations for vim
VIM_SED = $(wildcard *_vim.sed)
IABBREV = $(VIM_SED:_vim.sed=.vim)

# generated skeletons
SKEL_SED  = $(wildcard *_skel.sed)
SKELETON  = $(SKEL_SED:_skel.sed=_skel.m4)
SKELETON += $(SKEL_SED:_skel.sed=_skel.mc)
TARGETS  += $(IABBREV) $(SKELETON)


#:all	create all targets
.PHONY: all
all: $(TARGETS)

%q.m4: quotation_marks.sed %b.m4
	sed -f $^ > $@

%u.m4: utf8_chars.sed %b.m4
	sed -f $^ > $@

%n.m4: nonprintable_chars.sed %b.m4
	sed -f $^ > $@

%.vim: %_vim.sed square_brackets.vim
	sed -f $^ > $@

%_skel.m4: %_skel.sed square_brackets_skel.m4
	sed -f $^ > $@

%_skel.mc: %_skel.sed square_brackets_skel.mc
	sed -f $^ > $@


#:cl/clean	remove generated files
.PHONY: clean cl
clean cl:
	$(RM) $(TARGETS)


#:help/he/hl/h	print this text
.PHONY: help he hl h
help he hl h:
	@sed -n '/^#:/{s//\x1b[7mmake /;s/\t/\x1b[m /;p}' Makefile | sort	# ]]	<--- square brackets for M4 preprocessor
