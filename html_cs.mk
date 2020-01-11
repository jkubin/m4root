# DO NOT EDIT! This file is generated automatically!

VPATH = gfiles:html

FOLDERS_cs = \
generovani-kodu-v-m4-uvod \

PREVIEW_cs  = $(FOLDERS_cs:=/preview.html)
VALIDATE_cs = $(FOLDERS_cs:=/validate.html)
PUBLISH_cs  = $(FOLDERS_cs:=/publish.txt)
SPCHECK_cs  = $(FOLDERS_cs:=/spell.txt)
FOLDERS  += $(FOLDERS_cs)
PREVIEW  += $(FOLDERS_cs) $(PREVIEW_cs)
VALIDATE += $(FOLDERS_cs) $(VALIDATE_cs)
PUBLISH  += $(FOLDERS_cs) $(PUBLISH_cs)
SPCHECK  += $(FOLDERS_cs) $(SPCHECK_cs)
TARGETS  += $(FOLDERS_cs) $(PREVIEW_cs) $(VALIDATE_cs) $(PUBLISH_cs) $(SPCHECK_cs)

#:sub-targets/sub/su	creates all files from generated rules
.PHONY: sub-targets sub su
sub-targets sub su: $(TARGETS)

#:preview/pre/pr/p	for off-line article development
.PHONY: preview pre pr p
preview pre pr p: $(PREVIEW)

#:spell/sp	creates files for checking jargon and typos
.PHONY: spell sp
spell sp: $(SPCHECK)

#:publish/pub/pu	creates files in a format suitable for CMS
.PHONY: publish pub pu
publish pub pu: $(PUBLISH)

#:validate/val/va/v	creates files for testing in HTML validator
.PHONY: validate val va v
validate val va v: $(VALIDATE)

#:all_cs/allcs/cs	creates files in ‘cs’ language
.PHONY: all_cs allcs cs
all_cs allcs cs: $(FOLDERS_cs) $(PREVIEW_cs) $(VALIDATE_cs) $(PUBLISH_cs) $(SPCHECK_cs)

#:clean_cs/cl_cs/clcs/ccs	deletes ‘cs’ files
.PHONY: clean_cs cl_cs clcs ccs
clean_cs cl_cs clcs ccs:
	$(RM) -r $(FOLDERS_cs)

#:ice	disabled for ‘cs’
ice_cs.mk: ;

$(FOLDERS_cs):
	mkdir -p $@

generovani-kodu-v-m4-uvod/%.html: rootb.m4 queues.m4 aux.m4 config.m4 inline.m4 headings.m4 block.m4 insert.m4 version.m4 style.m4 lang_cs.m4 css.m4 refs_en.m4 refs_cs.m4 order.m4 lang.m4 include.m4 $(wildcard intro.mc.html/*.m4 intro.mc.d/*/*.m4) %.m4 intro.mc navig.m4
	m4 -DLANG_CODE='cs' $^ | sed -f brackets.sed > $@

generovani-kodu-v-m4-uvod/publish.txt: rootb.m4 queues.m4 aux.m4 config.m4 inline.m4 headings.m4 block.m4 insert.m4 version.m4 style.m4 lang_cs.m4 css.m4 refs_en.m4 refs_cs.m4 order.m4 lang.m4 include.m4 $(wildcard intro.mc.html/*.m4 intro.mc.html/*/*.m4) publish.m4 intro.mc navig.m4
	m4 -DLANG_CODE='cs' $^ | sed -f html/publish.sed -f brackets.sed > $@

generovani-kodu-v-m4-uvod/spell.txt: rootb.m4 include.m4 version.m4 lang_cs.m4 refs_en.m4 refs_cs.m4 order.m4 lang.m4 headings.m4 spell.m4 intro.mc
	m4 -DLANG_CODE='cs' -DSOURCE='intro.mc' $^ > $@

