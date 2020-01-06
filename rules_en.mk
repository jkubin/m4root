# DO NOT EDIT! This file is generated automatically!

FOLDERS_en = \
generating-code-in-m4-introduction \

PREVIEW_en  = $(FOLDERS_en:=/preview.html)
VALIDATE_en = $(FOLDERS_en:=/validate.html)
PUBLISH_en  = $(FOLDERS_en:=/publish.txt)
SPCHECK_en  = $(FOLDERS_en:=/spell.txt)
FOLDERS  += $(FOLDERS_en)
PREVIEW  += $(FOLDERS_en) $(PREVIEW_en)
VALIDATE += $(FOLDERS_en) $(VALIDATE_en)
PUBLISH  += $(FOLDERS_en) $(PUBLISH_en)
SPCHECK  += $(FOLDERS_en) $(SPCHECK_en)
TARGETS  += $(FOLDERS_en) $(PREVIEW_en) $(VALIDATE_en) $(PUBLISH_en) $(SPCHECK_en)

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

#:allen/all_en	make local targets for the ‘en’ language
.PHONY: allen all_en
allen all_en: $(FOLDERS_en) $(PREVIEW_en) $(VALIDATE_en) $(PUBLISH_en) $(SPCHECK_en)

#:clen/cl_en/clean_en	delete generated files for the ‘en’ language
.PHONY: clen cl_en clean_en
clen cl_en clean_en:
	$(RM) -r $(FOLDERS_en)

#:ice	for the ‘en’ language is turned off
ice_en.mk: ;

$(FOLDERS_en):
	mkdir -p $@

generating-code-in-m4-introduction/%.html: rootb.m4 queues.m4 aux.m4 html_config.m4 html_inline.m4 headings.m4 html_block.m4 html_insert.m4 version.m4 style.m4 lang_en.m4 css.m4 refs_cs.m4 refs_en.m4 order.m4 lang.m4 include.m4 $(wildcard intro.mc.d/*.m4) %.m4 intro.mc html_navig.m4
	m4 -DLANG_CODE='en' $^ > $@

generating-code-in-m4-introduction/publish.txt: rootb.m4 queues.m4 aux.m4 html_config.m4 html_inline.m4 headings.m4 html_block.m4 html_insert.m4 version.m4 style.m4 lang_en.m4 css.m4 refs_cs.m4 refs_en.m4 order.m4 lang.m4 include.m4 $(wildcard intro.mc.d/*.m4) publish.m4 intro.mc html_navig.m4
	m4 -DLANG_CODE='en' $^ | sed -f publish.sed > $@

generating-code-in-m4-introduction/spell.txt: rootb.m4 include.m4 version.m4 lang_en.m4 refs_cs.m4 refs_en.m4 order.m4 lang.m4 headings.m4 spell.m4 intro.mc
	m4 -DLANG_CODE='en' $^ > $@

