# DO NOT EDIT! This file is generated automatically!

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

#:su/sub/subtargets	creates all files from generated rules
.PHONY: subtargets su sub
subtargets su sub: $(TARGETS)

#:p/pr/pre/preview	for off-line article development
.PHONY: p pr pre preview
p pr pre preview: $(PREVIEW)

#:sp/spell	creates files for checking jargon and typos
.PHONY: sp spell
sp spell: $(SPCHECK)

#:pu/pub/publish	creates files in a format suitable for CMS
.PHONY: pu pub publish
pu pub publish: $(PUBLISH)

#:v/va/val/validate	creates files for testing in HTML validator
.PHONY: v va val validate
v va val validate: $(VALIDATE)

#:cs/allcs/all_cs	creates files in ‘cs’ language
.PHONY: cs allcs all_cs
cs allcs all_cs: $(FOLDERS_cs) $(PREVIEW_cs) $(VALIDATE_cs) $(PUBLISH_cs) $(SPCHECK_cs)

#:ccs/clcs/cl_cs/clean_cs	deletes ‘cs’ files
.PHONY: ccs clcs cl_cs clean_cs
ccs clcs cl_cs clean_cs:
	$(RM) -r $(FOLDERS_cs)

#:ice	is disabled for ‘cs’ language
ice_cs.mk: ;

$(FOLDERS_cs):
	mkdir -p $@

generovani-kodu-v-m4-uvod/%.html: rootb.m4 queues.m4 aux.m4 html_config.m4 html_inline.m4 headings.m4 html_block.m4 html_insert.m4 version.m4 style.m4 lang_cs.m4 css.m4 refs_cs.m4 refs_en.m4 order.m4 lang.m4 include.m4 $(wildcard intro.mc.d/*.m4 intro.mc.d/*/*.m4) %.m4 intro.mc html_navig.m4
	m4 -DLANG_CODE='cs' $^ | sed -f brackets.sed > $@

generovani-kodu-v-m4-uvod/publish.txt: rootb.m4 queues.m4 aux.m4 html_config.m4 html_inline.m4 headings.m4 html_block.m4 html_insert.m4 version.m4 style.m4 lang_cs.m4 css.m4 refs_cs.m4 refs_en.m4 order.m4 lang.m4 include.m4 $(wildcard intro.mc.d/*.m4 intro.mc.d/*/*.m4) publish.m4 intro.mc html_navig.m4
	m4 -DLANG_CODE='cs' $^ | sed -f publish.sed -f brackets.sed > $@

generovani-kodu-v-m4-uvod/spell.txt: rootb.m4 include.m4 version.m4 lang_cs.m4 refs_cs.m4 refs_en.m4 order.m4 lang.m4 headings.m4 spell.m4 $(wildcard intro.mc.d/*.m4 intro.mc.d/*/*.m4) intro.mc
	m4 -DLANG_CODE='cs' -DSOURCE='intro.mc' -DSPELLCHECK $^ > $@

