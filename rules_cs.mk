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

#:subtargets	generate all targets from the file included into Makefile
.PHONY: subtargets
subtargets: $(TARGETS)

#:preview	make html files for preview
.PHONY: preview
preview: $(PREVIEW)

#:spell	make spell checking files
.PHONY: spell
spell: $(SPCHECK)

#:publish	make txt files to publish
.PHONY: publish
publish: $(PUBLISH)

#:validate	make html files for validator
.PHONY: validate
validate: $(VALIDATE)

#:allcs/all_cs	make local targets for the ‘cs’ language
.PHONY: allcs all_cs
allcs all_cs: $(FOLDERS_cs) $(PREVIEW_cs) $(VALIDATE_cs) $(PUBLISH_cs) $(SPCHECK_cs)

#:clcs/cl_cs/clean_cs	delete generated files for the ‘cs’ language
.PHONY: clcs cl_cs clean_cs
clcs cl_cs clean_cs:
	$(RM) -r $(FOLDERS_cs)

#:ice	for the ‘cs’ language is turned off
ice_cs.mk: ;

$(FOLDERS_cs):
	mkdir -p $@

generovani-kodu-v-m4-uvod/%.html: rootb.m4 queues.m4 aux.m4 html_config.m4 html_inline.m4 headings.m4 html_block.m4 html_insert.m4 version.m4 style.m4 lang_cs.m4 css.m4 refs_cs.m4 refs_en.m4 order.m4 lang.m4 include.m4 $(wildcard intro.mc.d/*.m4) %.m4 intro.mc html_navig.m4
	m4 -DLANG_CODE='cs' $^ > $@

generovani-kodu-v-m4-uvod/publish.txt: rootb.m4 queues.m4 aux.m4 html_config.m4 html_inline.m4 headings.m4 html_block.m4 html_insert.m4 version.m4 style.m4 lang_cs.m4 css.m4 refs_cs.m4 refs_en.m4 order.m4 lang.m4 include.m4 $(wildcard intro.mc.d/*.m4) publish.m4 intro.mc html_navig.m4
	m4 -DLANG_CODE='cs' $^ | sed -f publish.sed > $@

generovani-kodu-v-m4-uvod/spell.txt: rootb.m4 include.m4 version.m4 lang_cs.m4 refs_cs.m4 refs_en.m4 order.m4 lang.m4 headings.m4 spell.m4 intro.mc
	m4 -DLANG_CODE='cs' $^ > $@

