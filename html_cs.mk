# DO NOT EDIT! This file is generated automatically!

VPATH = gfiles:html

FOLDERS_cs = \
generovani-kodu-v-m4-uvod \
generovani-kodu-v-m4-zaklady \

ARTICLE_cs = $(FOLDERS_cs:=/index.html)
PREVIEW_cs = $(FOLDERS_cs:=/preview.html)
PUBLISH_cs = $(FOLDERS_cs:=/publish.txt)
SPCHECK_cs = $(FOLDERS_cs:=/spell.txt)
ARTICLE  += $(FOLDERS_cs) $(ARTICLE_cs)
FOLDERS  += $(FOLDERS_cs)
PREVIEW  += $(FOLDERS_cs) $(PREVIEW_cs)
PUBLISH  += $(FOLDERS_cs) $(PUBLISH_cs)
SPCHECK  += $(FOLDERS_cs) $(SPCHECK_cs)
TARGETS  += $(FOLDERS_cs) $(PREVIEW_cs) $(ARTICLE_cs) $(PUBLISH_cs) $(SPCHECK_cs)

#:html-sub-targets/sub/su	creates all files from generated rules
.PHONY: html-sub-targets sub su
html-sub-targets sub su: $(TARGETS)

#:preview/pre/pr/p	as close as possible in real website
.PHONY: preview pre pr p
preview pre pr p: $(PREVIEW)

#:spell/sp	creates files for checking jargon and typos
.PHONY: spell sp
spell sp: $(SPCHECK)

#:publish/pub/pu	creates files in a format suitable for CMS
.PHONY: publish pub pu
publish pub pu: $(PUBLISH)

#:article/art/a	article development
.PHONY: article art a
article art a: $(ARTICLE)

#:all_cs/allcs/cs	creates files in ‘cs’ language
.PHONY: all_cs allcs cs
all_cs allcs cs: $(FOLDERS_cs) $(PREVIEW_cs) $(ARTICLE_cs) $(PUBLISH_cs) $(SPCHECK_cs)

#:clean_cs/cl_cs/clcs/ccs	deletes ‘cs’ files
.PHONY: clean_cs cl_cs clcs ccs
clean_cs cl_cs clcs ccs:
	$(RM) -r $(FOLDERS_cs)

#:fhtml	disabled for ‘cs’
fhtml_cs.mk: ;

$(FOLDERS_cs):
	mkdir -p $@

generovani-kodu-v-m4-uvod/%.html: rootb.m4 queues.m4 aux.m4 ent.m4 cfg.m4 inline.m4 headings.m4 block.m4 ver.m4 style.m4 lang_cs.m4 css.m4 refs_en.m4 refs_cs.m4 order.m4 lang.m4 incl.m4 $(wildcard intro.mc.html/*.m4 intro.mc.html/*/*.m4) %.m4 intro.mc nav.m4
	m4 -DLANG_CODE='cs' -DOUTPUT_FILE='$*.html' $^ | sed -f brackets.sed > $@
	@tidy -qe $@

generovani-kodu-v-m4-uvod/spell.txt: rootb.m4 aux.m4 order.m4 lang.m4 headings.m4 ver.m4 lang_cs.m4 refs_en.m4 refs_cs.m4 incl.m4 spell.m4 intro.mc
	m4 -DLANG_CODE='cs' -DSOURCE='intro.mc' $^ > $@

generovani-kodu-v-m4-uvod/publish.txt: rootb.m4 queues.m4 aux.m4 ent.m4 cfg.m4 inline.m4 headings.m4 block.m4 ver.m4 style.m4 lang_cs.m4 css.m4 refs_en.m4 refs_cs.m4 order.m4 lang.m4 incl.m4 $(wildcard intro.mc.html/*.m4 intro.mc.html/*/*.m4) publish.m4 intro.mc nav.m4
	m4 -DLANG_CODE='cs' -DSOURCE='intro.mc' $^ | sed -f html/publish.sed -f brackets.sed > $@

generovani-kodu-v-m4-zaklady/%.html: rootb.m4 queues.m4 aux.m4 ent.m4 cfg.m4 inline.m4 headings.m4 block.m4 ver.m4 style.m4 lang_cs.m4 css.m4 refs_en.m4 refs_cs.m4 order.m4 lang.m4 incl.m4 $(wildcard fundamentals.mc.html/*.m4 fundamentals.mc.html/*/*.m4) %.m4 fundamentals.mc nav.m4
	m4 -DLANG_CODE='cs' -DOUTPUT_FILE='$*.html' $^ | sed -f brackets.sed > $@
	@tidy -qe $@

generovani-kodu-v-m4-zaklady/spell.txt: rootb.m4 aux.m4 order.m4 lang.m4 headings.m4 ver.m4 lang_cs.m4 refs_en.m4 refs_cs.m4 incl.m4 spell.m4 fundamentals.mc
	m4 -DLANG_CODE='cs' -DSOURCE='fundamentals.mc' $^ > $@

generovani-kodu-v-m4-zaklady/publish.txt: rootb.m4 queues.m4 aux.m4 ent.m4 cfg.m4 inline.m4 headings.m4 block.m4 ver.m4 style.m4 lang_cs.m4 css.m4 refs_en.m4 refs_cs.m4 order.m4 lang.m4 incl.m4 $(wildcard fundamentals.mc.html/*.m4 fundamentals.mc.html/*/*.m4) publish.m4 fundamentals.mc nav.m4
	m4 -DLANG_CODE='cs' -DSOURCE='fundamentals.mc' $^ | sed -f html/publish.sed -f brackets.sed > $@

