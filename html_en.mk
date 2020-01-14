# DO NOT EDIT! This file is generated automatically!

VPATH = gfiles:html

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

#:html-sub-targets/sub/su	creates all files from generated rules
.PHONY: html-sub-targets sub su
html-sub-targets sub su: $(TARGETS)

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

#:all_en/allen/en	creates files in ‘en’ language
.PHONY: all_en allen en
all_en allen en: $(FOLDERS_en) $(PREVIEW_en) $(VALIDATE_en) $(PUBLISH_en) $(SPCHECK_en)

#:clean_en/cl_en/clen/cen	deletes ‘en’ files
.PHONY: clean_en cl_en clen cen
clean_en cl_en clen cen:
	$(RM) -r $(FOLDERS_en)

#:fhtml	disabled for ‘en’
fhtml_en.mk: ;

$(FOLDERS_en):
	mkdir -p $@

generating-code-in-m4-introduction/%.html: rootb.m4 queues.m4 aux.m4 entities.m4 config.m4 inline.m4 headings.m4 block.m4 version.m4 style.m4 lang_en.m4 css.m4 refs_en.m4 refs_cs.m4 order.m4 lang.m4 include.m4 $(wildcard intro.mc.html/*.m4 intro.mc.html/*/*.m4) %.m4 intro.mc navig.m4
	m4 -DLANG_CODE='en' $^ | sed -f brackets.sed > $@

generating-code-in-m4-introduction/publish.txt: rootb.m4 queues.m4 aux.m4 entities.m4 config.m4 inline.m4 headings.m4 block.m4 version.m4 style.m4 lang_en.m4 css.m4 refs_en.m4 refs_cs.m4 order.m4 lang.m4 include.m4 $(wildcard intro.mc.html/*.m4 intro.mc.html/*/*.m4) publish.m4 intro.mc navig.m4
	m4 -DLANG_CODE='en' $^ | sed -f html/publish.sed -f brackets.sed > $@

generating-code-in-m4-introduction/spell.txt: rootb.m4 include.m4 version.m4 lang_en.m4 refs_en.m4 refs_cs.m4 order.m4 lang.m4 headings.m4 spell.m4 intro.mc
	m4 -DLANG_CODE='en' -DSOURCE='intro.mc' $^ > $@

